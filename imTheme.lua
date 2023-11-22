local imgui = require("ImGui")
local imTheme = {}
local themeFile = "themes"

function imTheme.new(themeName, themeFunction)
   local themeColors = {}

   local success, loadedThemes = pcall(require, themeFile)
   if success and type(loadedThemes) == "table" then
      local selectedTheme = loadedThemes[themeName]
      if selectedTheme then
         themeColors = selectedTheme
      else
         printf("\ay[imTheme]\ax Theme \aw%s\ax not found in the theme file. Attempting to use default theme.", themeName)
      end
   else
      print("\ay[imTheme]\ax Theme file \aw%s\ax not found or invalid format. Using System theme.")
   end

   return function()
      local numThemeColors = 0
      for col, values in pairs(themeColors) do
         if ImGuiCol[col] then
            imgui.PushStyleColor(ImGuiCol[col], unpack(values))
            numThemeColors = numThemeColors + 1
         end
      end
      themeFunction()
      imgui.PopStyleColor(numThemeColors)
   end
end

function imTheme.getThemeNames(themeFile)
   local themeNames = {}
   local success, loadedThemes = pcall(require, themeFile)
   if success and type(loadedThemes) == "table" then
      for themeName, _ in pairs(loadedThemes) do
         table.insert(themeNames, themeName)
      end
   else
      error("Error loading theme file or invalid format.")
   end
   return themeNames
end

return imTheme