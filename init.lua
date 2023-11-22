local mq = require('mq')
local imgui = require('ImGui')
local imTheme = require('imTheme')

-- Import our zones file
local zones = require('zones')

-- Import special Ladon zone file
local ladon_zones = require('ladonzones')

-- Libaray used to read/write ini files
local lip = require('LIP')

-- Define some icons
local icons = {
   FA_PLAY = '\xef\x81\x8b',
   FA_PAUSE = '\xef\x81\x8c',
   FA_STOP = '\xef\x81\x8d',
   FA_HEART = '\xef\x80\x84'
}

local is_open = true
local is_drawn = true
local is_group = false
local was_group_selected = false
local window_title = 'Magellan'
local application_name = 'Magellan'
local search_term = ''
local dest = ''
local dest_name = ''
local window_height = nil
local collapsed_window_height = 110

local waypoint_name = ''
local waypoints = {}

local ladon_selected = false
local current_sort_specs = nil
local ColumnID_ID = 0
local ColumnID_Name = 1
local ColumnID_Shortname = 2

local args = {...}

if args[1] == 'help' then
   print('\am[Magellan]\ax Usage: /lua run magellan [theme]')
   print('\am[Magellan]\ax Available Themes:')
   for _, theme in ipairs(imTheme.getThemeNames('themes')) do
      print(string.format('\am[Magellan]\ax %s', theme))
   end
   print('\am[Magellan]\ax System')
   return
end

local themeName = args[1] or 'Default'

local function CompareWithSortSpecs(a, b)
   for n = 1, current_sort_specs.SpecsCount, 1 do
      -- Here we identify columns using the ColumnUserID value that we ourselves passed to TableSetupColumn()
      -- We could also choose to identify columns based on their index (sort_spec.ColumnIndex), which is simpler!
      local sort_spec = current_sort_specs:Specs(n)
      local delta = 0

      if sort_spec.ColumnUserID == ColumnID_ID then
         delta = a[1] - b[1]
      elseif sort_spec.ColumnUserID == ColumnID_Name then
         if a[2] < b[2] then
            delta = -1
         elseif b[2] < a[2] then
            delta = 1
         else
            delta = 0
         end
      elseif sort_spec.ColumnUserID == ColumnID_Shortname then
         if a[3] < b[3] then
            delta = -1
         elseif b[3] < a[3] then
            delta = 1
         else
            delta = 0
         end
      end

      if delta ~= 0 then
         if sort_spec.SortDirection == ImGuiSortDirection.Ascending then return delta < 0 end
         return delta > 0
      end
   end
end

local function file_exists(path)
   local f = io.open(path, 'r')
   if f ~= nil then
      io.close(f)
      return true
   else
      return false
   end
end

local function reload_waypoints()
   local config_dir = mq.configDir:gsub('\\', '/') .. '/'
   print('\am[Magellan]\ax Reloading MQ2Nav Waypoints')
   local waypoints_file = 'mq2nav.ini'
   local waypoints_path = config_dir .. waypoints_file

   if file_exists(waypoints_path) then
      waypoints = lip.load(waypoints_path)
   else
      waypoints = {}
   end
end

local function load_settings()
   local config_dir = mq.configDir:gsub('\\', '/') .. '/'

   print('\am[Magellan]\ax Loading MQ2Nav Waypoints')
   local waypoints_file = 'mq2nav.ini'
   local waypoints_path = config_dir .. waypoints_file

   if file_exists(waypoints_path) then
      waypoints = lip.load(waypoints_path)
   else
      waypoints = {}
   end

   print('\am[Magellan]\ax Loading Group Settings')
   local settings_file = string.format('%s.ini', application_name)
   Settings_path = config_dir .. settings_file

   if file_exists(Settings_path) then
      Settings = lip.load(Settings_path)
      is_group = Settings.Magellan.group
      if not Settings.Favorites then
         Settings.Favorites = { 'Plane of Knowledge' }
         lip.save(Settings_path, Settings)
      end
   else
      Settings = {
         Magellan = {
            group = false
         },
         Favorites = {}
      }
      lip.save(Settings_path, Settings)
   end
end

local function save_settings()
   print('\am[Magellan]\ax Saving Settings')
   lip.save(Settings_path, Settings)
end

-- Flattens and sorts the hierachtical list into a simple list of tables holding zone information
local function flatten(t, favs)
   local r = {}
   for ex, ex_zones in pairs(t) do
      for sname, lname in pairs(ex_zones) do
         local favorite = false
         if lname then
            local long_name = lname[1] or lname
            for _, fav in ipairs(favs) do
               if lname == fav then
                  favorite = true
               end
            end
            table.insert(r, {
               expansion = ex,
               shortname = sname,
               name = long_name,
               favorite = favorite
            })
         end
      end
   end
   table.sort(r, function(a, b) return a.name < b.name end)
   return r
end

local function structured(t)
   local r = {}
   for k, v in pairs(t) do r[k] = v end
   table.sort(r, function(a, b)
      if a.expansion < b.expansion then return true end
      if a.expansion > b.expansion then return false end
      return a.name < b.name
   end)
   return r
end

-- Go ahead and create/load settings file
load_settings()

--- Create a nice alphabetical listing of zones
local ordered_zones = flatten(zones, Settings.Favorites)

--- Order the Hierachtical listing of zones by expansion/name
local structured_zones = structured(ordered_zones)

--- Correctly makes the call to /travelto based on action desired and group settings
---@param s string destination/action (e.g. zone or stop/pause)
---@param b boolean in_group?
local function travel(s, b)
   if b and mq.TLO.Group.Leader.ID() then
      if s == 'stop' then
         mq.cmdf('/dgae /travelto %s', s)
      else
         mq.cmdf('/travelto group %s', s)
      end
   else
      mq.cmdf('/travelto %s', s)
   end
end

local function createSelectable(index, zone)
   imgui.Selectable('\t' .. zone.name)
   if imgui.IsItemClicked(ImGuiMouseButton.Left) then
      dest = zone.shortname
      dest_name = zone.name
      travel(dest, is_group)
   end
   if imgui.IsItemClicked(ImGuiMouseButton.Right) then
      zone.favorite = not zone.favorite
      structured_zones[index] = zone
      if zone.favorite then
         table.insert(Settings.Favorites, zone.name)
      else
         for index, value in ipairs(Settings.Favorites) do
            if value == zone.name then
               table.remove(Settings.Favorites, index)
               break
            end
         end
      end
      save_settings()
   end
   return zone
end

-- As the function name implies, this is the main function that draws our window
local function draw_main_window()
   if is_open then
      imgui.SetWindowSize(800, 500, ImGuiCond.Once)
      if imgui.GetWindowHeight() > collapsed_window_height then window_height = imgui.GetWindowHeight() end

      is_open, is_drawn = imgui.Begin(window_title, is_open)
      if is_drawn then
         if dest_name == '' then dest_name = 'None Selected' end
         imgui.Text(string.format('Destination: %s', dest_name))

         if imgui.Button(string.format('%s Pause', icons.FA_PAUSE)) then travel('stop', is_group) end

         imgui.SameLine()
         if imgui.Button(string.format('%s Continue', icons.FA_PLAY)) then travel(dest, is_group) end

         imgui.SameLine()
         if imgui.Button(string.format('%s Stop', icons.FA_STOP)) then
            travel('stop', is_group)
            dest, dest_name, search_term = '', '', ''
         end

         imgui.SameLine()
         if mq.TLO.Group() then
            is_group, was_group_selected = imgui.Checkbox('Group Travel', is_group)
            if was_group_selected then
               Settings.Magellan.group = is_group
               save_settings()
            end
         else
            imgui.TextDisabled('Not in Group')
         end

         if imgui.CollapsingHeader('Zone List (click to toggle)') then
            imgui.SetWindowSize(imgui.GetWindowWidth(), window_height or collapsed_window_height)

            search_term = imgui.InputText('Filter', search_term)
            imgui.SameLine()
            if imgui.Button('Clear') then search_term = '' end
            imgui.Separator()

            local prev_zone = ''
            local curr_expansion = ''

            imgui.BeginTabBar('ZoneLists', ImGuiTabBarFlags.Reorderable)

            if imgui.BeginTabItem('Favorites') then
               imgui.BeginChild('Favorites')
               imgui.Text('Right-Click on a zone to select/deselect Favorite status.')
               for index, zone in ipairs(structured_zones) do
                  if ((#search_term > 2 and string.find(zone.name:lower(), search_term:lower())) and zone.favorite) or
                      #search_term < 1 and zone.favorite then
                     if zone.expansion ~= curr_expansion then
                        imgui.TextColored(1, .89, .25, 1, zone.expansion)
                     end
                     zone = createSelectable(index, zone)
                     if zone.favorite then
                        imgui.SameLine()
                        imgui.Text(icons.FA_HEART)
                     end
                     curr_expansion = zone.expansion
                  end
               end
               imgui.EndChild()
               imgui.EndTabItem()
            end

            if imgui.BeginTabItem('By Expansion') then
               imgui.BeginChild('ZonesByExpansion')
               imgui.Text('Right-Click on a zone to select/deselect Favorite status.')
               for index, zone in ipairs(structured_zones) do
                  if (#search_term > 1 and string.find(zone.name:lower(), search_term:lower())) or #search_term < 2 then
                     if zone.expansion ~= curr_expansion then
                        imgui.TextColored(1, .89, .25, 1, zone.expansion)
                     end
                     zone = createSelectable(index, zone)
                     if zone.favorite then
                        imgui.SameLine()
                        imgui.Text(icons.FA_HEART)
                     end
                     curr_expansion = zone.expansion
                  end
               end
               imgui.EndChild()
               imgui.EndTabItem()
            end

            if imgui.BeginTabItem('Waypoints') then
               imgui.BeginChild('Waypoints')
               imgui.Dummy(0, 5)
               imgui.Indent(5.0)
               waypoint_name = imgui.InputTextWithHint('##waypoint_name', 'Enter new waypoint name', waypoint_name)
               imgui.SameLine()
               if imgui.Button('New') then
                  if #waypoint_name > 1 then
                     mq.cmd.nav('rwp "' .. waypoint_name .. '"')
                     waypoint_name = ''
                  end
               end
               imgui.Separator()
               imgui.TextColored(1, .89, .25, 1, string.format('Waypoints for %s', mq.TLO.Zone.Name()))
               imgui.Separator()
               for zone, zone_waypoints in pairs(waypoints) do
                  if string.lower(mq.TLO.Zone.ShortName()) == zone then
                     for desc, _ in pairs(zone_waypoints) do
                        if imgui.Selectable(desc .. '##' .. desc) then
                           mq.cmd.nav('wp "' .. desc .. '"')
                        end
                     end
                  end
               end
               imgui.Unindent()
               imgui.EndChild()
               imgui.EndTabItem()
            end

            if imgui.BeginTabItem('Ladon View') then
               imgui.BeginChild('LadonZones')
               if imgui.BeginTable('ladon', 3,
                      ImGuiTableFlags.Sortable + ImGuiTableFlags.Resizable + ImGuiTableFlags.Borders) then
                  imgui.TableSetupColumn('ZoneID', (ImGuiTableColumnFlags.DefaultSort + ImGuiTableColumnFlags.WidthFixed
                     ),
                     20.0, ColumnID_ID)
                  imgui.TableSetupColumn('Name', ImGuiTableColumnFlags.DefaultSort, 0.0, ColumnID_Name)
                  imgui.TableSetupColumn('Shortname', ImGuiTableColumnFlags.DefaultSort, 0.0, ColumnID_Shortname)
                  imgui.TableHeadersRow()

                  local sort_specs = imgui.TableGetSortSpecs()
                  if sort_specs then
                     if sort_specs.SpecsDirty then
                        for n = 1, sort_specs.SpecsCount, 1 do sort_specs:Specs(n) end

                        if #ladon_zones > 1 then
                           current_sort_specs = sort_specs
                           table.sort(ladon_zones, CompareWithSortSpecs)
                           current_sort_specs = nil
                        end
                        sort_specs.SpecsDirty = false
                     end
                  end

                  for _, zone in ipairs(ladon_zones) do
                     if (#search_term > 1 and string.find(zone[2]:lower(), search_term:lower())) or #search_term < 2 then
                        imgui.TableNextRow()
                        imgui.TableNextColumn()
                        imgui.Text(tostring(zone[1]))
                        imgui.TableNextColumn()
                        if imgui.Selectable(zone[2], ladon_selected, ImGuiSelectableFlags.SpanAllColumns) then
                           travel(zone[3], is_group)
                        end
                        imgui.TableNextColumn()
                        imgui.Text(zone[3])
                     end
                  end

                  imgui.EndTable()
               end
               imgui.EndChild()
               imgui.EndTabItem()
            end

            imgui.EndTabBar()
         else
            imgui.SetWindowSize(imgui.GetWindowWidth(), collapsed_window_height)
         end
      end
   else
      return
   end
   imgui.End()
end

mq.imgui.init(application_name, imTheme.new(themeName, draw_main_window))

-- Inialize the event for Nav recording waypoints
mq.event('MQNav Waypoint Recorded', '#*#Recorded waypoint:#*#', reload_waypoints)

while is_open do
   mq.doevents()
   mq.delay(1000)
end