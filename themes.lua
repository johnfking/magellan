--[[
   Valid theme colors are:
      Text
      TextDisabled
      WindowBg
      ChildBg
      PopupBg
      Border
      BorderShadow
      FrameBg
      FrameBgHovered
      FrameBgActive
      TitleBg
      TitleBgActive
      TitleBgCollapsed
      MenuBarBg
      ScrollbarBg
      ScrollbarGrab
      ScrollbarGrabHovered
      ScrollbarGrabActive
      CheckMark
      SliderGrab
      SliderGrabActive
      Button
      ButtonHovered
      ButtonActive
      Header
      HeaderHovered
      HeaderActive
      Separator
      SeparatorHovered
      SeparatorActive
      ResizeGrip
      ResizeGripHovered
      ResizeGripActive
      Tab
      TabHovered
      TabActive
      TabUnfocused
      TabUnfocusedActive
      TableHeaderBg
      TableBorderStrong
      TableBorderLight
      TableRowBg
      TableRowBgAlt
      TextSelectedBg
      DragDropTarget
      NavHighlight
      NavWindowingHighlight
      NavWindowingDimBg
      ModalWindowDimBg
      ModalWindowDarkening

      Value theme values are in the format of {r, g, b, a}
      where r, g, b, and a are numbers between 0 and 1.
      a is optional and defaults to 1.
]]

return {
   Default = {
      WindowBg = {0.23, 0.035, 0.42, 1},
      TitleBgActive = {0.14, 0.00, 0.27, 1},
      FrameBg = {0.87, 0.66, 1, 1},
      Button = {0.61, 0.30, 0.86, 0.75},
      ButtonHovered = {0.61, 0.30, 0.86, 1},
      Tab = {0.61, 0.30, 0.86, 0.75},
      TabActive = {0.61, 0.30, 0.86, 0.50},
      TabHovered = {0.61, 0.30, 0.86, 1},
      ChildBg = {0.48, 0.17, 0.74, 1},
      Header = {0.23, 0.035, 0.42, 0.45},
      HeaderHovered = {0.25, 0.065, 0.52, 0.45},
      HeaderActive = {0.23, 0.035, 0.42, 0.45}
   },

   sonic = {
      Text = {1.00, 1.00, 1.00, 1.00},
      TextDisabled = {0.73, 0.75, 0.74, 1.00},
      WindowBg = {0.22, 0.22, 0.22, 0.94},
      ChildBg = {0.00, 0.00, 0.00, 0.00},
      PopupBg = {0.20, 0.20, 0.20, 0.94},
      Border = {0.20, 0.20, 0.20, 0.50},
      BorderShadow = {0.00, 0.00, 0.00, 0.00},
      FrameBg = {0.71, 0.39, 0.39, 0.54},
      FrameBgHovered = {0.84, 0.66, 0.66, 0.40},
      FrameBgActive = {0.84, 0.66, 0.66, 0.67},
      TitleBg = {0.47, 0.22, 0.22, 0.67},
      TitleBgActive = {0.47, 0.22, 0.22, 1.00},
      TitleBgCollapsed = {0.47, 0.22, 0.22, 0.67},
      MenuBarBg = {0.34, 0.16, 0.16, 1.00},
      ScrollbarBg = {0.02, 0.02, 0.02, 0.53},
      ScrollbarGrab = {0.31, 0.31, 0.31, 1.00},
      ScrollbarGrabHovered = {0.41, 0.41, 0.41, 1.00},
      ScrollbarGrabActive = {0.51, 0.51, 0.51, 1.00},
      CheckMark = {1.00, 1.00, 1.00, 1.00},
      SliderGrab = {0.71, 0.39, 0.39, 1.00},
      SliderGrabActive = {0.84, 0.66, 0.66, 1.00},
      Button = {0.47, 0.22, 0.22, 0.65},
      ButtonHovered = {0.71, 0.39, 0.39, 0.65},
      ButtonActive = {0.20, 0.20, 0.20, 0.50},
      Header = {0.71, 0.39, 0.39, 0.54},
      HeaderHovered = {0.84, 0.66, 0.66, 0.65},
      HeaderActive = {0.84, 0.66, 0.66, 0.00},
      Separator = {0.43, 0.43, 0.50, 0.50},
      SeparatorHovered = {0.71, 0.39, 0.39, 0.54},
      SeparatorActive = {0.71, 0.39, 0.39, 0.54},
      ResizeGrip = {0.71, 0.39, 0.39, 0.54},
      ResizeGripHovered = {0.84, 0.66, 0.66, 0.66},
      ResizeGripActive = {0.84, 0.66, 0.66, 0.66},
      Tab = {0.71, 0.39, 0.39, 0.54},
      TabHovered = {0.84, 0.66, 0.66, 0.66},
      TabActive = {0.84, 0.66, 0.66, 0.66},
      TabUnfocused = {0.07, 0.10, 0.15, 0.97},
      TabUnfocusedActive = {0.14, 0.26, 0.42, 1.00},
      PlotLines = {0.61, 0.61, 0.61, 1.00},
      PlotLinesHovered = {1.00, 0.43, 0.35, 1.00},
      PlotHistogram = {0.90, 0.70, 0.00, 1.00},
      PlotHistogramHovered = {1.00, 0.60, 0.00, 1.00},
      TableHeaderBg = {0.19, 0.19, 0.20, 1.00},
      TableBorderStrong = {0.31, 0.31, 0.35, 1.00},
      TableBorderLight = {0.23, 0.23, 0.25, 1.00},
      TableRowBg = {0.00, 0.00, 0.00, 0.00},
      TableRowBgAlt = {1.00, 1.00, 1.00, 0.06},
      TextSelectedBg = {0.26, 0.59, 0.98, 0.35},
      DragDropTarget = {1.00, 1.00, 0.00, 0.90},
      NavHighlight = {0.41, 0.41, 0.41, 1.00},
      NavWindowingHighlight = {1.00, 1.00, 1.00, 0.70},
      NavWindowingDimBg = {0.80, 0.80, 0.80, 0.20},
      ModalWindowDimBg = {0.80, 0.80, 0.80, 0.35}
   },

   BlackDevil = {
      Text = {0.78, 0.78, 0.78, 1.00},
      TextDisabled = {0.44, 0.41, 0.31, 1.00},
      WindowBg = {0.06, 0.12, 0.06, 0.39},
      ChildBg = {0.06, 0.12, 0.16, 0.78},
      PopupBg = {0.08, 0.08, 0.08, 0.78},
      Border = {0.39, 0.00, 0.00, 0.78},
      BorderShadow = {0.00, 0.00, 0.00, 0.00},
      FrameBg = {0.06, 0.12, 0.16, 0.78},
      FrameBgHovered = {0.12, 0.24, 0.35, 0.78},
      FrameBgActive = {0.35, 0.35, 0.12, 0.78},
      TitleBg = {0.06, 0.12, 0.16, 0.78},
      TitleBgActive = {0.06, 0.12, 0.16, 0.78},
      TitleBgCollapsed = {0.06, 0.12, 0.16, 0.20},
      MenuBarBg = {0.08, 0.08, 0.08, 0.78},
      ScrollbarBg = {0.06, 0.12, 0.16, 0.78},
      ScrollbarGrab = {0.12, 0.35, 0.24, 0.78},
      ScrollbarGrabHovered = {0.12, 0.35, 0.35, 0.78},
      ScrollbarGrabActive = {0.12, 0.59, 0.24, 0.78},
      CheckMark = {0.12, 0.59, 0.24, 0.78},
      SliderGrab = {0.12, 0.35, 0.24, 0.78},
      SliderGrabActive = {0.12, 0.59, 0.24, 0.78},
      Button = {0.35, 0.35, 0.12, 0.78},
      ButtonHovered = {0.35, 0.47, 0.24, 0.78},
      ButtonActive = {0.59, 0.35, 0.24, 0.78},
      Header = {0.06, 0.12, 0.16, 0.78},
      HeaderHovered = {0.12, 0.35, 0.35, 0.78},
      HeaderActive = {0.12, 0.59, 0.24, 0.78},
      Separator = {0.35, 0.35, 0.24, 0.78},
      SeparatorHovered = {0.12, 0.35, 0.35, 0.78},
      SeparatorActive = {0.59, 0.35, 0.24, 0.78},
      ResizeGrip = {0.06, 0.12, 0.16, 0.78},
      ResizeGripHovered = {0.59, 0.35, 0.35, 0.78},
      ResizeGripActive = {0.59, 0.24, 0.24, 0.78},
      Tab = {0.35, 0.35, 0.12, 0.78},
      TabHovered = {0.35, 0.47, 0.24, 0.78},
      TabActive = {0.59, 0.35, 0.24, 0.78},
      TabUnfocused = {0.06, 0.12, 0.16, 0.78},
      TabUnfocusedActive = {0.59, 0.35, 0.35, 0.78},
      PlotLines = {0.39, 0.78, 0.39, 0.78},
      PlotLinesHovered = {1.00, 0.43, 0.35, 0.78},
      PlotHistogram = {0.00, 0.35, 0.39, 0.78},
      PlotHistogramHovered = {0.20, 0.59, 0.59, 0.78},
      TableHeaderBg = {0.19, 0.19, 0.20, 0.78},
      TableBorderStrong = {0.31, 0.31, 0.35, 0.78},
      TableBorderLight = {0.23, 0.23, 0.25, 0.78},
      TableRowBg = {0.00, 0.00, 0.00, 0.78},
      TableRowBgAlt = {1.00, 1.00, 1.00, 0.06},
      TextSelectedBg = {0.39, 0.35, 0.39, 0.39},
      DragDropTarget = {1.00, 1.00, 0.00, 0.90},
      NavHighlight = {0.26, 0.59, 0.98, 1.00},
      NavWindowingHighlight = {1.00, 1.00, 1.00, 0.70},
      NavWindowingDimBg = {0.80, 0.80, 0.80, 0.20},
      ModalWindowDimBg = {0.80, 0.80, 0.80, 0.35}
   },

   Moonlight = {
      Text = {1.00, 1.00, 1.00, 1.00},
      TextDisabled = {0.27, 0.32, 0.45, 1.00},
      WindowBg = {0.08, 0.09, 0.10, 1.00},
      ChildBg = {0.09, 0.10, 0.12, 1.00},
      PopupBg = {0.08, 0.09, 0.10, 1.00},
      Border = {0.16, 0.17, 0.19, 1.00},
      BorderShadow = {0.08, 0.09, 0.10, 1.00},
      FrameBg = {0.11, 0.13, 0.15, 1.00},
      FrameBgHovered = {0.16, 0.17, 0.19, 1.00},
      FrameBgActive = {0.16, 0.17, 0.19, 1.00},
      TitleBg = {0.05, 0.06, 0.07, 1.00},
      TitleBgActive = {0.05, 0.06, 0.07, 1.00},
      TitleBgCollapsed = {0.08, 0.09, 0.10, 1.00},
      MenuBarBg = {0.10, 0.11, 0.12, 1.00},
      ScrollbarBg = {0.05, 0.06, 0.07, 1.00},
      ScrollbarGrab = {0.12, 0.13, 0.15, 1.00},
      ScrollbarGrabHovered = {0.16, 0.17, 0.19, 1.00},
      ScrollbarGrabActive = {0.12, 0.14, 0.15, 1.00},
      CheckMark = {0.97, 1.00, 0.50, 1.00},
      SliderGrab = {0.97, 1.00, 0.50, 1.00},
      SliderGrabActive = {1.00, 0.80, 0.50, 1.00},
      Button = {0.12, 0.13, 0.15, 1.00},
      ButtonHovered = {0.18, 0.19, 0.20, 1.00},
      ButtonActive = {0.15, 0.15, 0.15, 1.00},
      Header = {0.14, 0.16, 0.21, 1.00},
      HeaderHovered = {0.11, 0.11, 0.11, 1.00},
      HeaderActive = {0.08, 0.09, 0.10, 1.00},
      Separator = {0.13, 0.15, 0.19, 1.00},
      SeparatorHovered = {0.16, 0.18, 0.25, 1.00},
      SeparatorActive = {0.16, 0.18, 0.25, 1.00},
      ResizeGrip = {0.15, 0.15, 0.15, 1.00},
      ResizeGripHovered = {0.97, 1.00, 0.50, 1.00},
      ResizeGripActive = {1.00, 1.00, 1.00, 1.00},
      Tab = {0.08, 0.09, 0.10, 1.00},
      TabHovered = {0.12, 0.13, 0.15, 1.00},
      TabActive = {0.12, 0.13, 0.15, 1.00},
      TabUnfocused = {0.08, 0.09, 0.10, 1.00},
      TabUnfocusedActive = {0.13, 0.27, 0.57, 1.00},
      PlotLines = {0.52, 0.60, 0.70, 1.00},
      PlotLinesHovered = {0.04, 0.98, 0.98, 1.00},
      PlotHistogram = {0.88, 0.80, 0.56, 1.00},
      PlotHistogramHovered = {0.96, 0.96, 0.96, 1.00},
      TableHeaderBg = {0.05, 0.06, 0.07, 1.00},
      TableBorderStrong = {0.05, 0.06, 0.07, 1.00},
      TableBorderLight = {0.00, 0.00, 0.00, 1.00},
      TableRowBg = {0.12, 0.13, 0.15, 1.00},
      TableRowBgAlt = {0.10, 0.11, 0.12, 1.00},
      TextSelectedBg = {0.94, 0.94, 0.94, 1.00},
      DragDropTarget = {0.50, 0.51, 1.00, 1.00},
      NavHighlight = {0.27, 0.29, 1.00, 1.00},
      NavWindowingHighlight = {0.50, 0.51, 1.00, 1.00},
      NavWindowingDimBg = {0.20, 0.18, 0.55, 0.50},
      ModalWindowDimBg = {0.20, 0.18, 0.55, 0.50}
   },

   Steam = {
      Text = {1.00, 1.00, 1.00, 1.00},
      TextDisabled = {0.50, 0.50, 0.50, 1.00},
      WindowBg = {0.29, 0.34, 0.26, 1.00},
      ChildBg = {0.29, 0.34, 0.26, 1.00},
      PopupBg = {0.24, 0.27, 0.20, 1.00},
      Border = {0.54, 0.57, 0.51, 0.50},
      BorderShadow = {0.14, 0.16, 0.11, 0.52},
      FrameBg = {0.24, 0.27, 0.20, 1.00},
      FrameBgHovered = {0.27, 0.30, 0.23, 1.00},
      FrameBgActive = {0.30, 0.34, 0.26, 1.00},
      TitleBg = {0.24, 0.27, 0.20, 1.00},
      TitleBgActive = {0.29, 0.34, 0.26, 1.00},
      TitleBgCollapsed = {0.00, 0.00, 0.00, 0.51},
      MenuBarBg = {0.24, 0.27, 0.20, 1.00},
      ScrollbarBg = {0.35, 0.42, 0.31, 1.00},
      ScrollbarGrab = {0.28, 0.32, 0.24, 1.00},
      ScrollbarGrabHovered = {0.25, 0.30, 0.22, 1.00},
      ScrollbarGrabActive = {0.23, 0.27, 0.21, 1.00},
      CheckMark = {0.59, 0.54, 0.18, 1.00},
      SliderGrab = {0.35, 0.42, 0.31, 1.00},
      SliderGrabActive = {0.54, 0.57, 0.51, 0.50},
      Button = {0.29, 0.34, 0.26, 0.40},
      ButtonHovered = {0.35, 0.42, 0.31, 1.00},
      ButtonActive = {0.54, 0.57, 0.51, 0.50},
      Header = {0.35, 0.42, 0.31, 1.00},
      HeaderHovered = {0.35, 0.42, 0.31, 0.60},
      HeaderActive = {0.54, 0.57, 0.51, 0.50},
      Separator = {0.14, 0.16, 0.11, 1.00},
      SeparatorHovered = {0.54, 0.57, 0.51, 1.00},
      SeparatorActive = {0.59, 0.54, 0.18, 1.00},
      ResizeGrip = {0.19, 0.23, 0.18, 0.00},
      ResizeGripHovered = {0.54, 0.57, 0.51, 1.00},
      ResizeGripActive = {0.59, 0.54, 0.18, 1.00},
      Tab = {0.35, 0.42, 0.31, 1.00},
      TabHovered = {0.54, 0.57, 0.51, 0.78},
      TabActive = {0.59, 0.54, 0.18, 1.00},
      TabUnfocused = {0.24, 0.27, 0.20, 1.00},
      TabUnfocusedActive = {0.35, 0.42, 0.31, 1.00},
      PlotLines = {0.61, 0.60, 0.69, 1.00},
      PlotLinesHovered = {0.59, 0.54, 0.18, 1.00},
      PlotHistogram = {1.00, 0.78, 0.28, 1.00},
      PlotHistogramHovered = {1.00, 0.60, 0.00, 1.00},
      TableHeaderBg = {0.19, 0.19, 0.20, 1.00},
      TableBorderStrong = {0.31, 0.31, 0.35, 1.00},
      TableBorderLight = {0.23, 0.23, 0.25, 1.00},
      TableRowBg = {0.00, 0.00, 0.00, 0.00},
      TableRowBgAlt = {1.00, 1.00, 1.00, 0.06},
      TextSelectedBg = {0.59, 0.54, 0.18, 1.00},
      DragDropTarget = {0.73, 0.67, 0.24, 1.00},
      NavHighlight = {0.59, 0.54, 0.18, 1.00},
      NavWindowingHighlight = {1.00, 1.00, 1.00, 0.70},
      NavWindowingDimBg = {0.80, 0.71, 0.54, 0.20},
      ModalWindowDimBg = {0.80, 0.71, 0.54, 0.35}
   },

   EnemyMouse = {
      Text = {0.00, 1.00, 1.00, 1.00},
      TextDisabled = {0.00, 0.40, 0.41, 1.00},
      WindowBg = {0.00, 0.00, 0.00, 0.83},
      ChildBg = {0.00, 0.00, 0.00, 0.00},
      PopupBg = {0.16, 0.24, 0.22, 0.60},
      Border = {0.00, 1.00, 1.00, 0.65},
      BorderShadow = {0.00, 0.00, 0.00, 0.00},
      FrameBg = {0.44, 0.80, 0.80, 0.18},
      FrameBgHovered = {0.44, 0.80, 0.80, 0.27},
      FrameBgActive = {0.44, 0.81, 0.86, 0.66},
      TitleBg = {0.14, 0.18, 0.21, 0.73},
      TitleBgActive = {0.00, 1.00, 1.00, 0.27},
      TitleBgCollapsed = {0.00, 0.00, 0.00, 0.54},
      MenuBarBg = {0.00, 0.00, 0.00, 0.20},
      ScrollbarBg = {0.22, 0.29, 0.30, 0.71},
      ScrollbarGrab = {0.00, 1.00, 1.00, 0.44},
      ScrollbarGrabHovered = {0.00, 1.00, 1.00, 0.74},
      ScrollbarGrabActive = {0.00, 1.00, 1.00, 1.00},
      CheckMark = {0.00, 1.00, 1.00, 0.68},
      SliderGrab = {0.00, 1.00, 1.00, 0.36},
      SliderGrabActive = {0.00, 1.00, 1.00, 0.76},
      Button = {0.00, 0.65, 0.65, 0.46},
      ButtonHovered = {0.00, 1.00, 1.00, 0.43},
      ButtonActive = {0.00, 1.00, 1.00, 0.62},
      Header = {0.00, 1.00, 1.00, 0.33},
      HeaderHovered = {0.00, 1.00, 1.00, 0.42},
      HeaderActive = {0.00, 1.00, 1.00, 0.54},
      Separator = {0.00, 0.50, 0.50, 0.33},
      SeparatorHovered = {0.00, 0.50, 0.50, 0.47},
      SeparatorActive = {0.00, 0.70, 0.70, 1.00},
      ResizeGrip = {0.00, 1.00, 1.00, 0.54},
      ResizeGripHovered = {0.00, 1.00, 1.00, 0.74},
      ResizeGripActive = {0.00, 1.00, 1.00, 1.00},
      Tab = {0.18, 0.35, 0.57, 0.86},
      TabHovered = {0.26, 0.59, 0.98, 0.80},
      TabActive = {0.20, 0.41, 0.68, 1.00},
      TabUnfocused = {0.07, 0.10, 0.15, 0.97},
      TabUnfocusedActive = {0.13, 0.26, 0.42, 1.00},
      PlotLines = {0.00, 1.00, 1.00, 1.00},
      PlotLinesHovered = {0.00, 1.00, 1.00, 1.00},
      PlotHistogram = {0.00, 1.00, 1.00, 1.00},
      PlotHistogramHovered = {0.00, 1.00, 1.00, 1.00},
      TableHeaderBg = {0.19, 0.19, 0.20, 1.00},
      TableBorderStrong = {0.31, 0.31, 0.35, 1.00},
      TableBorderLight = {0.23, 0.23, 0.25, 1.00},
      TableRowBg = {0.00, 0.00, 0.00, 0.00},
      TableRowBgAlt = {1.00, 1.00, 1.00, 0.06},
      TextSelectedBg = {0.00, 1.00, 1.00, 0.22},
      DragDropTarget = {1.00, 1.00, 0.00, 0.90},
      NavHighlight = {0.26, 0.59, 0.98, 1.00},
      NavWindowingHighlight = {1.00, 1.00, 1.00, 0.70},
      NavWindowingDimBg = {0.80, 0.71, 0.54, 0.20},
      ModalWindowDimBg = {0.04, 0.10, 0.09, 0.51}
   }
}