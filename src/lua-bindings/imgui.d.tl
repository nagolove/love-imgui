global type imgui = record


-- enums
  enum ImGuiWindowFlags
      "None"
      "DockNodeHost"
      "NavFlattened"
      "ChildMenu"
      "Modal"
      "NoResize"
      "AlwaysVerticalScrollbar"
      "MenuBar"
      "Popup"
      "HorizontalScrollbar"
      "NoNavFocus"
      "ChildWindow"
      "NoTitleBar"
      "NoInputs"
      "NoCollapse"
      "NoBackground"
      "NoDecoration"
      "AlwaysAutoResize"
      "AlwaysHorizontalScrollbar"
      "NoBringToFrontOnFocus"
      "NoMove"
      "NoDocking"
      "UnsavedDocument"
      "AlwaysUseWindowPadding"
      "Tooltip"
      "NoSavedSettings"
      "NoNavInputs"
      "NoScrollWithMouse"
      "NoNav"
      "NoFocusOnAppearing"
      "NoScrollbar"
      "NoMouseInputs"
  end

  enum ImGuiInputTextFlags
      "None"
      "AlwaysInsertMode"
      "NoHorizontalScroll"
      "NoMarkEdited"
      "CallbackHistory"
      "CallbackAlways"
      "ReadOnly"
      "CallbackResize"
      "CallbackCompletion"
      "AutoSelectAll"
      "CallbackCharFilter"
      "CharsUppercase"
      "CharsHexadecimal"
      "Multiline"
      "CallbackEdit"
      "CharsScientific"
      "CharsDecimal"
      "CharsNoBlank"
      "Password"
      "CtrlEnterForNewLine"
      "AllowTabInput"
      "NoUndoRedo"
      "EnterReturnsTrue"
  end

  enum ImGuiTreeNodeFlags
      "None"
      "OpenOnArrow"
      "SpanFullWidth"
      "SpanAvailWidth"
      "NavLeftJumpsBackHere"
      "DefaultOpen"
      "FramePadding"
      "Selected"
      "OpenOnDoubleClick"
      "AllowItemOverlap"
      "Framed"
      "CollapsingHeader"
      "NoAutoOpenOnLog"
      "Bullet"
      "NoTreePushOnOpen"
      "Leaf"
  end

  enum ImGuiPopupFlags
      "None"
      "MouseButtonRight"
      "NoOpenOverItems"
      "AnyPopupId"
      "MouseButtonDefault_"
      "MouseButtonMiddle"
      "MouseButtonLeft"
      "NoOpenOverExistingPopup"
      "MouseButtonMask_"
      "AnyPopup"
      "AnyPopupLevel"
  end

  enum ImGuiSelectableFlags
      "None"
      "AllowItemOverlap"
      "DontClosePopups"
      "SpanAllColumns"
      "AllowDoubleClick"
      "Disabled"
  end

  enum ImGuiComboFlags
      "None"
      "HeightRegular"
      "HeightSmall"
      "NoArrowButton"
      "HeightMask_"
      "HeightLargest"
      "NoPreview"
      "HeightLarge"
      "PopupAlignLeft"
  end

  enum ImGuiTabBarFlags
      "None"
      "NoTooltip"
      "TabListPopupButton"
      "FittingPolicyResizeDown"
      "NoTabListScrollingButtons"
      "Reorderable"
      "FittingPolicyMask_"
      "AutoSelectNewTabs"
      "FittingPolicyDefault_"
      "NoCloseWithMiddleMouseButton"
      "FittingPolicyScroll"
  end

  enum ImGuiTabItemFlags
      "None"
      "NoTooltip"
      "NoPushId"
      "Trailing"
      "Leading"
      "NoReorder"
      "SetSelected"
      "NoCloseWithMiddleMouseButton"
      "UnsavedDocument"
  end

  enum ImGuiTableFlags
      "NoClip"
      "SizingFixedSame"
      "BordersOuterV"
      "Borders"
      "BordersInnerV"
      "SizingStretchProp"
      "SortMulti"
      "NoPadInnerX"
      "ScrollY"
      "BordersInnerH"
      "NoPadOuterX"
      "BordersH"
      "NoHostExtendX"
      "NoBordersInBodyUntilResize"
      "SortTristate"
      "PreciseWidths"
      "None"
      "NoBordersInBody"
      "ContextMenuInBody"
      "Sortable"
      "BordersInner"
      "SizingMask_"
      "NoSavedSettings"
      "Resizable"
      "BordersOuter"
      "SizingStretchSame"
      "NoHostExtendY"
      "BordersV"
      "Reorderable"
      "SizingFixedFit"
      "BordersOuterH"
      "NoKeepColumnsVisible"
      "ScrollX"
      "RowBg"
      "Hideable"
      "PadOuterX"
  end

  enum ImGuiTableColumnFlags
      "None"
      "NoSort"
      "IndentMask_"
      "NoResize"
      "IndentEnable"
      "NoSortDescending"
      "IndentDisable"
      "PreferSortDescending"
      "WidthMask_"
      "NoHide"
      "NoDirectResize_"
      "StatusMask_"
      "DefaultSort"
      "IsHovered"
      "NoSortAscending"
      "IsVisible"
      "NoReorder"
      "NoHeaderWidth"
      "IsEnabled"
      "DefaultHide"
      "WidthFixed"
      "WidthStretch"
      "NoClip"
      "IsSorted"
      "PreferSortAscending"
  end

  enum ImGuiTableRowFlags
      "None"
      "Headers"
  end

  enum ImGuiTableBgTarget
      "None"
      "CellBg"
      "RowBg1"
      "RowBg0"
  end

  enum ImGuiFocusedFlags
      "None"
      "RootWindow"
      "AnyWindow"
      "ChildWindows"
      "RootAndChildWindows"
  end

  enum ImGuiHoveredFlags
      "None"
      "RootAndChildWindows"
      "AllowWhenDisabled"
      "RootWindow"
      "AnyWindow"
      "RectOnly"
      "AllowWhenBlockedByPopup"
      "AllowWhenOverlapped"
      "ChildWindows"
      "AllowWhenBlockedByActiveItem"
  end

  enum ImGuiDockNodeFlags
      "None"
      "NoSplit"
      "AutoHideTabBar"
      "KeepAliveOnly"
      "NoResize"
      "PassthruCentralNode"
      "NoDockingInCentralNode"
  end

  enum ImGuiDragDropFlags
      "None"
      "SourceExtern"
      "SourceAutoExpirePayload"
      "AcceptPeekOnly"
      "SourceAllowNullID"
      "SourceNoDisableHover"
      "SourceNoHoldToOpenOthers"
      "AcceptBeforeDelivery"
      "AcceptNoDrawDefaultRect"
      "SourceNoPreviewTooltip"
      "AcceptNoPreviewTooltip"
  end

  enum ImGuiDataType
      "U8"
      "U32"
      "Double"
      "S8"
      "U64"
      "S64"
      "S32"
      "Float"
      "S16"
      "U16"
  end

  enum ImGuiDir
      "None"
      "Left"
      "Right"
      "Up"
      "Down"
  end

  enum ImGuiSortDirection
      "None"
      "Descending"
      "Ascending"
  end

  enum ImGuiKey
      "Tab"
      "Space"
      "PageUp"
      "Z"
      "Delete"
      "LeftArrow"
      "RightArrow"
      "Insert"
      "Home"
      "DownArrow"
      "Escape"
      "UpArrow"
      "A"
      "V"
      "C"
      "X"
      "Enter"
      "Backspace"
      "Y"
      "KeyPadEnter"
      "End"
      "PageDown"
  end

  enum ImGuiKeyModFlags
      "None"
      "Shift"
      "Super"
      "Ctrl"
      "Alt"
  end

  enum ImGuiNavInput
      "Menu"
      "TweakSlow"
      "DpadRight"
      "LStickDown"
      "TweakFast"
      "Cancel"
      "DpadDown"
      "FocusPrev"
      "DpadUp"
      "LStickUp"
      "KeyMenu_"
      "LStickRight"
      "DpadLeft"
      "InternalStart_"
      "KeyLeft_"
      "KeyUp_"
      "KeyRight_"
      "Activate"
      "KeyDown_"
      "FocusNext"
      "Input"
      "LStickLeft"
  end

  enum ImGuiConfigFlags
      "None"
      "NavNoCaptureKeyboard"
      "NavEnableGamepad"
      "IsSRGB"
      "NavEnableKeyboard"
      "NavEnableSetMousePos"
      "DpiEnableScaleFonts"
      "DpiEnableScaleViewports"
      "DockingEnable"
      "IsTouchScreen"
      "NoMouse"
      "NoMouseCursorChange"
      "ViewportsEnable"
  end

  enum ImGuiBackendFlags
      "None"
      "HasGamepad"
      "HasMouseCursors"
      "RendererHasViewports"
      "HasMouseHoveredViewport"
      "RendererHasVtxOffset"
      "PlatformHasViewports"
      "HasSetMousePos"
  end

  enum ImGuiCol
      "ScrollbarGrab"
      "TabActive"
      "TabHovered"
      "FrameBgActive"
      "ButtonHovered"
      "ChildBg"
      "PlotHistogram"
      "SliderGrabActive"
      "ResizeGripActive"
      "ModalWindowDimBg"
      "FrameBg"
      "TextDisabled"
      "ResizeGripHovered"
      "PlotHistogramHovered"
      "PlotLines"
      "SliderGrab"
      "ButtonActive"
      "TextSelectedBg"
      "TabUnfocused"
      "TableRowBg"
      "TitleBgCollapsed"
      "TitleBg"
      "NavWindowingHighlight"
      "NavHighlight"
      "SeparatorHovered"
      "DragDropTarget"
      "TableRowBgAlt"
      "ResizeGrip"
      "TableBorderLight"
      "SeparatorActive"
      "TableBorderStrong"
      "Border"
      "TableHeaderBg"
      "PlotLinesHovered"
      "Separator"
      "FrameBgHovered"
      "DockingEmptyBg"
      "DockingPreview"
      "TabUnfocusedActive"
      "Tab"
      "CheckMark"
      "ScrollbarGrabHovered"
      "HeaderHovered"
      "HeaderActive"
      "Button"
      "ScrollbarGrabActive"
      "NavWindowingDimBg"
      "PopupBg"
      "WindowBg"
      "MenuBarBg"
      "TitleBgActive"
      "Header"
      "BorderShadow"
      "ScrollbarBg"
      "Text"
  end

  enum ImGuiStyleVar
      "FrameBorderSize"
      "FrameRounding"
      "FramePadding"
      "ChildBorderSize"
      "Alpha"
      "IndentSpacing"
      "PopupBorderSize"
      "WindowTitleAlign"
      "SelectableTextAlign"
      "ChildRounding"
      "GrabRounding"
      "WindowBorderSize"
      "WindowMinSize"
      "ScrollbarSize"
      "ButtonTextAlign"
      "TabRounding"
      "GrabMinSize"
      "WindowPadding"
      "ItemInnerSpacing"
      "ScrollbarRounding"
      "CellPadding"
      "PopupRounding"
      "ItemSpacing"
      "WindowRounding"
  end

  enum ImGuiButtonFlags
      "None"
      "MouseButtonDefault_"
      "MouseButtonRight"
      "MouseButtonLeft"
      "MouseButtonMask_"
      "MouseButtonMiddle"
  end

  enum ImGuiColorEditFlags
      "None"
      "NoTooltip"
      "_OptionsDefault"
      "NoDragDrop"
      "_DataTypeMask"
      "_InputMask"
      "NoLabel"
      "_PickerMask"
      "_DisplayMask"
      "AlphaPreviewHalf"
      "NoOptions"
      "NoAlpha"
      "NoPicker"
      "DisplayHSV"
      "HDR"
      "Float"
      "NoSidePreview"
      "AlphaPreview"
      "PickerHueWheel"
      "AlphaBar"
      "NoInputs"
      "Uint8"
      "InputHSV"
      "NoSmallPreview"
      "PickerHueBar"
      "NoBorder"
      "DisplayHex"
      "DisplayRGB"
      "InputRGB"
  end

  enum ImGuiSliderFlags
      "None"
      "NoInput"
      "InvalidMask_"
      "AlwaysClamp"
      "NoRoundToFormat"
      "Logarithmic"
  end

  enum ImGuiMouseButton
      "Right"
      "Middle"
      "Left"
  end

  enum ImGuiMouseCursor
      "None"
      "ResizeEW"
      "ResizeNESW"
      "ResizeNWSE"
      "TextInput"
      "ResizeAll"
      "ResizeNS"
      "NotAllowed"
      "Hand"
      "Arrow"
  end

  enum ImGuiCond
      "None"
      "Once"
      "Always"
      "Appearing"
      "FirstUseEver"
  end

  enum ImDrawCornerFlags
      "None"
      "TopLeft"
      "BotLeft"
      "Bot"
      "All"
      "TopRight"
      "Right"
      "BotRight"
      "Top"
      "Left"
  end

  enum ImDrawListFlags
      "None"
      "AntiAliasedFill"
      "AntiAliasedLinesUseTex"
      "AllowVtxOffset"
      "AntiAliasedLines"
  end

  enum ImFontAtlasFlags
      "None"
      "NoBakedLines"
      "NoPowerOfTwoHeight"
      "NoMouseCursors"
  end

  enum ImGuiViewportFlags
      "None"
      "NoFocusOnClick"
      "NoRendererClear"
      "TopMost"
      "NoTaskBarIcon"
      "CanHostOtherWindows"
      "Minimized"
      "NoAutoMerge"
      "NoInputs"
      "NoFocusOnAppearing"
      "NoDecoration"
  end



-- aliased types
  type ImGuiStyleVar_ = string
  type ImGuiDir_ = string
  type ImGuiTableBgTarget_ = string
  type ImGuiMouseButton_ = string
  type ImGuiCol_ = string
  type ImGuiKey_ = string
  type ImGuiCond_ = string
  type ImGuiMouseCursor_ = string


-- functions
  AlignTextToFramePadding: function()
  ArrowButton: function(str_id: string,dir: ImGuiDir_): boolean
  Begin: function(name: string,p_open: boolean,flags: flags): boolean,boolean
  BeginChild: function(id: number,size_x: number,size_y: number,border: boolean,flags: flags): boolean
  BeginChildFrame: function(id: number,size_x: number,size_y: number,flags: flags): boolean
  BeginCombo: function(label: string,preview_value: string,flags: flags): boolean
  BeginDragDropSource: function(flags: flags): boolean
  BeginDragDropTarget: function(): boolean
  BeginGroup: function()
  BeginMainMenuBar: function(): boolean
  BeginMenu: function(label: string,enabled: boolean): boolean
  BeginMenuBar: function(): boolean
  BeginPopup: function(str_id: string,flags: flags): boolean
  BeginPopupContextItem: function(str_id: string,popup_flags: flags): boolean
  BeginPopupContextVoid: function(str_id: string,popup_flags: flags): boolean
  BeginPopupContextWindow: function(str_id: string,popup_flags: flags): boolean
  BeginPopupModal: function(name: string,p_open: boolean,flags: flags): boolean,boolean
  BeginTabBar: function(str_id: string,flags: flags): boolean
  BeginTabItem: function(label: string,p_open: boolean,flags: flags): boolean,boolean
  BeginTable: function(str_id: string,column: number,flags: flags,outer_size_x: number,outer_size_y: number,inner_width: number): boolean
  BeginTooltip: function()
  Bullet: function()
  BulletText: function(fmt: string)
  Button: function(label: string,size_x: number,size_y: number): boolean
  CalcItemWidth: function(): number
  CalcListClipping: function(items_count: number,items_height: number,out_items_display_start: number,out_items_display_end: number): number,number
  CalcTextSize: function(text: string,text_end: string,hide_text_after_double_hash: boolean,wrap_width: number): number,number
  CaptureKeyboardFromApp: function(want_capture_keyboard_value: boolean)
  CaptureMouseFromApp: function(want_capture_mouse_value: boolean)
  Checkbox: function(label: string,v: boolean): boolean,boolean
  CheckboxFlags: function(label: string,flags: number,flags_value: number): number,boolean
  CloseCurrentPopup: function()
  CollapsingHeader: function(label: string,p_visible: boolean,flags: flags): boolean,boolean
  ColorButton: function(desc_id: string,col_x: number,col_y: number,col_z: number,col_w: number,flags: flags,size_x: number,size_y: number): boolean
  ColorConvertU32ToFloat4: function(in: number): number,number,number,number
  ColorEdit3: function(label: string,col: table,flags: flags): number,number,number,boolean
  ColorEdit4: function(label: string,col: table,flags: flags): number,number,number,number,boolean
  ColorPicker3: function(label: string,col: table,flags: flags): number,number,number,boolean
  ColorPicker4: function()
  Columns: function(count: number,id: string,border: boolean)
  Combo: function(label: string,current_item: number,items_separated_by_zeros: string,popup_max_height_in_items: number): number,boolean
  CreateContext: function(): lightuserdata
  DestroyContext: function(ctx: unknown)
  DestroyPlatformWindows: function()
  DockSpace: function(id: number,size_x: number,size_y: number,flags: flags)
  DockSpaceOverViewport: function(flags: flags): number
  DragFloat: function(label: string,v: number,v_speed: number,v_min: number,v_max: number,format: string,flags: flags): number,boolean
  DragFloat2: function(label: string,v: table,v_speed: number,v_min: number,v_max: number,format: string,flags: flags): number,number,boolean
  DragFloat3: function(label: string,v: table,v_speed: number,v_min: number,v_max: number,format: string,flags: flags): number,number,number,boolean
  DragFloat4: function(label: string,v: table,v_speed: number,v_min: number,v_max: number,format: string,flags: flags): number,number,number,number,boolean
  DragFloatRange2: function(label: string,v_current_min: number,v_current_max: number,v_speed: number,v_min: number,v_max: number,format: string,format_max: string,flags: flags): number,number,boolean
  DragInt: function(label: string,v: number,v_speed: number,v_min: number,v_max: number,format: string,flags: flags): number,boolean
  DragInt2: function(label: string,v: table,v_speed: number,v_min: number,v_max: number,format: string,flags: flags): number,number,boolean
  DragInt3: function(label: string,v: table,v_speed: number,v_min: number,v_max: number,format: string,flags: flags): number,number,number,boolean
  DragInt4: function(label: string,v: table,v_speed: number,v_min: number,v_max: number,format: string,flags: flags): number,number,number,number,boolean
  DragIntRange2: function(label: string,v_current_min: number,v_current_max: number,v_speed: number,v_min: number,v_max: number,format: string,format_max: string,flags: flags): number,number,boolean
  Dummy: function(size_x: number,size_y: number)
  End: function()
  EndChild: function()
  EndChildFrame: function()
  EndCombo: function()
  EndDragDropSource: function()
  EndDragDropTarget: function()
  EndFrame: function()
  EndGroup: function()
  EndMainMenuBar: function()
  EndMenu: function()
  EndMenuBar: function()
  EndPopup: function()
  EndTabBar: function()
  EndTabItem: function()
  EndTable: function()
  EndTooltip: function()
  GetBackgroundDrawList: function(): userdata
  GetClipboardText: function(): number
  GetColumnIndex: function(): number
  GetColumnOffset: function(column_index: number): number
  GetColumnWidth: function(column_index: number): number
  GetColumnsCount: function(): number
  GetContentRegionAvail: function(): number,number
  GetContentRegionMax: function(): number,number
  GetCurrentContext: function(): lightuserdata
  GetCursorPos: function(): number,number
  GetCursorPosX: function(): number
  GetCursorPosY: function(): number
  GetCursorScreenPos: function(): number,number
  GetCursorStartPos: function(): number,number
  GetFontSize: function(): number
  GetFontTexUvWhitePixel: function(): number,number
  GetForegroundDrawList: function(): userdata
  GetFrameCount: function(): number
  GetFrameHeight: function(): number
  GetFrameHeightWithSpacing: function(): number
  GetID: function(str_id_begin: string,str_id_end: string): number
  GetItemRectMax: function(): number,number
  GetItemRectMin: function(): number,number
  GetItemRectSize: function(): number,number
  GetKeyIndex: function(imgui_key: ImGuiKey_): number
  GetKeyPressedAmount: function(key_index: number,repeat_delay: number,rate: number): number
  GetMouseCursor: function(): string
  GetMouseDragDelta: function(button: ImGuiMouseButton_,lock_threshold: number): number,number
  GetMousePos: function(): number,number
  GetMousePosOnOpeningCurrentPopup: function(): number,number
  GetScrollMaxX: function(): number
  GetScrollMaxY: function(): number
  GetScrollX: function(): number
  GetScrollY: function(): number
  GetStyle: function(): lightuserdata
  GetStyleColorName: function(idx: ImGuiCol_): number
  GetStyleColorVec4: function(idx: ImGuiCol_): number,number,number,number
  GetTextLineHeight: function(): number
  GetTextLineHeightWithSpacing: function(): number
  GetTime: function(): number
  GetTreeNodeToLabelSpacing: function(): number
  GetVersion: function(): number
  GetWindowContentRegionMax: function(): number,number
  GetWindowContentRegionMin: function(): number,number
  GetWindowContentRegionWidth: function(): number
  GetWindowDockID: function(): number
  GetWindowDpiScale: function(): number
  GetWindowDrawList: function(): userdata
  GetWindowHeight: function(): number
  GetWindowPos: function(): number,number
  GetWindowSize: function(): number,number
  GetWindowWidth: function(): number
  Image: function(user_texture_id: Image,size_x: number,size_y: number,uv0_x: number,uv0_y: number,uv1_x: number,uv1_y: number,tint_col_x: number,tint_col_y: number,tint_col_z: number,tint_col_w: number,border_col_x: number,border_col_y: number,border_col_z: number,border_col_w: number)
  ImageButton: function(user_texture_id: Image,size_x: number,size_y: number,uv0_x: number,uv0_y: number,uv1_x: number,uv1_y: number,frame_padding: number,bg_col_x: number,bg_col_y: number,bg_col_z: number,bg_col_w: number,tint_col_x: number,tint_col_y: number,tint_col_z: number,tint_col_w: number): boolean
  Indent: function(indent_w: number)
  InputDouble: function(label: string,v: number,step: number,step_fast: number,format: string,flags: flags): number,boolean
  InputFloat: function(label: string,v: number,step: number,step_fast: number,format: string,flags: flags): number,boolean
  InputFloat2: function(label: string,v: table,format: string,flags: flags): number,number,boolean
  InputFloat3: function(label: string,v: table,format: string,flags: flags): number,number,number,boolean
  InputFloat4: function(label: string,v: table,format: string,flags: flags): number,number,number,number,boolean
  InputInt: function(label: string,v: number,step: number,step_fast: number,flags: flags): number,boolean
  InputInt2: function(label: string,v: table,flags: flags): number,number,boolean
  InputInt3: function(label: string,v: table,flags: flags): number,number,number,boolean
  InputInt4: function(label: string,v: table,flags: flags): number,number,number,number,boolean
  InputText: function(label: string,str: string,flags: flags,callback: function): string,boolean
  InputTextMultiline: function(label: string,str: string,size_x: number,size_y: number,flags: flags,callback: function): string,boolean
  InputTextWithHint: function(label: string,hint: string,str: string,flags: flags,callback: function): string,boolean
  InvisibleButton: function(str_id: string,size_x: number,size_y: number,flags: flags): boolean
  IsAnyItemActive: function(): boolean
  IsAnyItemFocused: function(): boolean
  IsAnyItemHovered: function(): boolean
  IsAnyMouseDown: function(): boolean
  IsItemActivated: function(): boolean
  IsItemActive: function(): boolean
  IsItemClicked: function(mouse_button: ImGuiMouseButton_): boolean
  IsItemDeactivated: function(): boolean
  IsItemDeactivatedAfterEdit: function(): boolean
  IsItemEdited: function(): boolean
  IsItemFocused: function(): boolean
  IsItemHovered: function(flags: flags): boolean
  IsItemToggledOpen: function(): boolean
  IsItemVisible: function(): boolean
  IsKeyDown: function(user_key_index: number): boolean
  IsKeyPressed: function(user_key_index: number,repeat: boolean): boolean
  IsKeyReleased: function(user_key_index: number): boolean
  IsMouseClicked: function(button: ImGuiMouseButton_,repeat: boolean): boolean
  IsMouseDoubleClicked: function(button: ImGuiMouseButton_): boolean
  IsMouseDown: function(button: ImGuiMouseButton_): boolean
  IsMouseDragging: function(button: ImGuiMouseButton_,lock_threshold: number): boolean
  IsMouseHoveringRect: function(r_min_x: number,r_min_y: number,r_max_x: number,r_max_y: number,clip: boolean): boolean
  IsMousePosValid: function(mouse_pos_x: number,mouse_pos_y: number): boolean
  IsMouseReleased: function(button: ImGuiMouseButton_): boolean
  IsPopupOpen: function(str_id: string,flags: flags): boolean
  IsRectVisible: function(rect_min_x: number,rect_min_y: number,rect_max_x: number,rect_max_y: number): boolean
  IsWindowAppearing: function(): boolean
  IsWindowCollapsed: function(): boolean
  IsWindowDocked: function(): boolean
  IsWindowFocused: function(flags: flags): boolean
  IsWindowHovered: function(flags: flags): boolean
  LabelText: function(label: string,fmt: string)
  ListBoxFooter: function()
  ListBoxHeaderItems: function(label: string,items_count: number,height_in_items: number): boolean
  ListBoxHeaderXY: function(label: string,size_x: number,size_y: number): boolean
  LoadIniSettingsFromDisk: function(ini_filename: string)
  LogButtons: function()
  LogFinish: function()
  LogText: function(fmt: string)
  LogToClipboard: function(auto_open_depth: number)
  LogToFile: function(auto_open_depth: number,filename: string)
  LogToTTY: function(auto_open_depth: number)
  MenuItem: function(label: string,shortcut: string,p_selected: boolean,enabled: boolean): boolean,boolean
  NewFrame: function()
  NewLine: function()
  NextColumn: function()
  OpenPopup: function(str_id: string,popup_flags: flags)
  OpenPopupOnItemClick: function(str_id: string,popup_flags: flags)
  PopAllowKeyboardFocus: function()
  PopButtonRepeat: function()
  PopClipRect: function()
  PopFont: function()
  PopID: function()
  PopItemWidth: function()
  PopStyleColor: function(count: number)
  PopStyleVar: function(count: number)
  PopTextWrapPos: function()
  ProgressBar: function(fraction: number,size_arg_x: number,size_arg_y: number,overlay: string)
  PushAllowKeyboardFocus: function(allow_keyboard_focus: boolean)
  PushButtonRepeat: function(repeat: boolean)
  PushClipRect: function(clip_rect_min_x: number,clip_rect_min_y: number,clip_rect_max_x: number,clip_rect_max_y: number,intersect_with_current_clip_rect: boolean)
  PushID: function(int_id: number)
  PushItemWidth: function(item_width: number)
  PushStyleColor: function(idx: ImGuiCol_,col_x: number,col_y: number,col_z: number,col_w: number)
  PushStyleVar: function(idx: ImGuiStyleVar_,val_x: number,val_y: number)
  PushTextWrapPos: function(wrap_local_pos_x: number)
  RadioButton: function(label: string,v: number,v_button: number): number,boolean
  Render: function()
  ResetMouseDragDelta: function(button: ImGuiMouseButton_)
  SameLine: function(offset_from_start_x: number,spacing: number)
  SaveIniSettingsToDisk: function(ini_filename: string)
  Selectable: function(label: string,p_selected: boolean,flags: flags,size_x: number,size_y: number): boolean,boolean
  Separator: function()
  SetClipboardText: function(text: string)
  SetColorEditOptions: function(flags: flags)
  SetColumnOffset: function(column_index: number,offset_x: number)
  SetColumnWidth: function(column_index: number,width: number)
  SetCurrentContext: function(ctx: unknown)
  SetCursorPos: function(local_pos_x: number,local_pos_y: number)
  SetCursorPosX: function(local_x: number)
  SetCursorPosY: function(local_y: number)
  SetCursorScreenPos: function(pos_x: number,pos_y: number)
  SetItemAllowOverlap: function()
  SetItemDefaultFocus: function()
  SetKeyboardFocusHere: function(offset: number)
  SetMouseCursor: function(cursor_type: ImGuiMouseCursor_)
  SetNextItemOpen: function(is_open: boolean,cond: ImGuiCond_)
  SetNextItemWidth: function(item_width: number)
  SetNextWindowBgAlpha: function(alpha: number)
  SetNextWindowCollapsed: function(collapsed: boolean,cond: ImGuiCond_)
  SetNextWindowContentSize: function(size_x: number,size_y: number)
  SetNextWindowDockID: function(dock_id: number,cond: ImGuiCond_)
  SetNextWindowFocus: function()
  SetNextWindowPos: function(pos_x: number,pos_y: number,cond: ImGuiCond_,pivot_x: number,pivot_y: number)
  SetNextWindowSize: function(size_x: number,size_y: number,cond: ImGuiCond_)
  SetNextWindowViewport: function(viewport_id: number)
  SetScrollFromPosX: function(local_x: number,center_x_ratio: number)
  SetScrollFromPosY: function(local_y: number,center_y_ratio: number)
  SetScrollHereX: function(center_x_ratio: number)
  SetScrollHereY: function(center_y_ratio: number)
  SetScrollX: function(scroll_x: number)
  SetScrollY: function(scroll_y: number)
  SetTabItemClosed: function(tab_or_docked_window_label: string)
  SetTooltip: function(fmt: string)
  SetWindowCollapsed: function(name: string,collapsed: boolean,cond: ImGuiCond_)
  SetWindowFocus: function(name: string)
  SetWindowFontScale: function(scale: number)
  SetWindowPos: function(name: string,pos_x: number,pos_y: number,cond: ImGuiCond_)
  SetWindowSize: function(name: string,size_x: number,size_y: number,cond: ImGuiCond_)
  ShowAboutWindow: function(p_open: boolean): boolean
  ShowDemoWindow: function(p_open: boolean): boolean
  ShowFontSelector: function(label: string)
  ShowMetricsWindow: function(p_open: boolean): boolean
  ShowStyleEditor: function(ref: unknown)
  ShowStyleSelector: function(label: string): boolean
  ShowUserGuide: function()
  SliderAngle: function(label: string,v_rad: number,v_degrees_min: number,v_degrees_max: number,format: string,flags: flags): number,boolean
  SliderFloat: function(label: string,v: number,v_min: number,v_max: number,format: string,flags: flags): number,boolean
  SliderFloat2: function(label: string,v: table,v_min: number,v_max: number,format: string,flags: flags): number,number,boolean
  SliderFloat3: function(label: string,v: table,v_min: number,v_max: number,format: string,flags: flags): number,number,number,boolean
  SliderFloat4: function(label: string,v: table,v_min: number,v_max: number,format: string,flags: flags): number,number,number,number,boolean
  SliderInt: function(label: string,v: number,v_min: number,v_max: number,format: string,flags: flags): number,boolean
  SliderInt2: function(label: string,v: table,v_min: number,v_max: number,format: string,flags: flags): number,number,boolean
  SliderInt3: function(label: string,v: table,v_min: number,v_max: number,format: string,flags: flags): number,number,number,boolean
  SliderInt4: function(label: string,v: table,v_min: number,v_max: number,format: string,flags: flags): number,number,number,number,boolean
  SmallButton: function(label: string): boolean
  Spacing: function()
  StyleColorsClassic: function(dst: unknown)
  StyleColorsDark: function(dst: unknown)
  StyleColorsLight: function(dst: unknown)
  TabItemButton: function(label: string,flags: flags): boolean
  TableGetColumnCount: function(): number
  TableGetColumnIndex: function(): number
  TableGetColumnName: function(column_n: number): number
  TableGetRowIndex: function(): number
  TableHeader: function(label: string)
  TableHeadersRow: function()
  TableNextColumn: function(): boolean
  TableNextRow: function(row_flags: flags,min_row_height: number)
  TableSetBgColor: function(target: ImGuiTableBgTarget_,color: number,column_n: number)
  TableSetColumnIndex: function(column_n: number): boolean
  TableSetupColumn: function(label: string,flags: flags,init_width_or_weight: number,user_id: number)
  TableSetupScrollFreeze: function(cols: number,rows: number)
  Text: function(fmt: string)
  TextColored: function(col_x: number,col_y: number,col_z: number,col_w: number,fmt: string)
  TextDisabled: function(fmt: string)
  TextUnformatted: function(text: string,text_end: string)
  TextWrapped: function(fmt: string)
  TreeNode: function(str_id: string,fmt: string): boolean
  TreeNodeEx: function(str_id: string,flags: flags,fmt: string): boolean
  TreePop: function()
  TreePush: function(str_id: string)
  Unindent: function(indent_w: number)
  UpdatePlatformWindows: function()
  VSliderFloat: function(label: string,size_x: number,size_y: number,v: number,v_min: number,v_max: number,format: string,flags: flags): number,boolean
  VSliderInt: function(label: string,size_x: number,size_y: number,v: number,v_min: number,v_max: number,format: string,flags: flags): number,boolean
  Value: function(prefix: string,v: number,float_format: string)
--------------
  AddBezierCubic: function(p1_x: number,p1_y: number,p2_x: number,p2_y: number,p3_x: number,p3_y: number,p4_x: number,p4_y: number,col: number,thickness: number,num_segments: number)
  AddBezierQuadratic: function(p1_x: number,p1_y: number,p2_x: number,p2_y: number,p3_x: number,p3_y: number,col: number,thickness: number,num_segments: number)
  AddCircle: function(center_x: number,center_y: number,radius: number,col: number,num_segments: number,thickness: number)
  AddCircleFilled: function(center_x: number,center_y: number,radius: number,col: number,num_segments: number)
  AddDrawCmd: function()
  AddImage: function(user_texture_id: Image,p_min_x: number,p_min_y: number,p_max_x: number,p_max_y: number,uv_min_x: number,uv_min_y: number,uv_max_x: number,uv_max_y: number,col: number)
  AddImageQuad: function(user_texture_id: Image,p1_x: number,p1_y: number,p2_x: number,p2_y: number,p3_x: number,p3_y: number,p4_x: number,p4_y: number,uv1_x: number,uv1_y: number,uv2_x: number,uv2_y: number,uv3_x: number,uv3_y: number,uv4_x: number,uv4_y: number,col: number)
  AddImageRounded: function(user_texture_id: Image,p_min_x: number,p_min_y: number,p_max_x: number,p_max_y: number,uv_min_x: number,uv_min_y: number,uv_max_x: number,uv_max_y: number,col: number,rounding: number,rounding_corners: flags)
  AddLine: function(p1_x: number,p1_y: number,p2_x: number,p2_y: number,col: number,thickness: number)
  AddNgon: function(center_x: number,center_y: number,radius: number,col: number,num_segments: number,thickness: number)
  AddNgonFilled: function(center_x: number,center_y: number,radius: number,col: number,num_segments: number)
  AddQuad: function(p1_x: number,p1_y: number,p2_x: number,p2_y: number,p3_x: number,p3_y: number,p4_x: number,p4_y: number,col: number,thickness: number)
  AddQuadFilled: function(p1_x: number,p1_y: number,p2_x: number,p2_y: number,p3_x: number,p3_y: number,p4_x: number,p4_y: number,col: number)
  AddRect: function(p_min_x: number,p_min_y: number,p_max_x: number,p_max_y: number,col: number,rounding: number,rounding_corners: flags,thickness: number)
  AddRectFilled: function(p_min_x: number,p_min_y: number,p_max_x: number,p_max_y: number,col: number,rounding: number,rounding_corners: flags)
  AddRectFilledMultiColor: function(p_min_x: number,p_min_y: number,p_max_x: number,p_max_y: number,col_upr_left: number,col_upr_right: number,col_bot_right: number,col_bot_left: number)
  AddText: function(pos_x: number,pos_y: number,col: number,text_begin: string,text_end: string)
  AddTriangle: function(p1_x: number,p1_y: number,p2_x: number,p2_y: number,p3_x: number,p3_y: number,col: number,thickness: number)
  AddTriangleFilled: function(p1_x: number,p1_y: number,p2_x: number,p2_y: number,p3_x: number,p3_y: number,col: number)
  CloneOutput: function(): userdata
  PathArcTo: function(center_x: number,center_y: number,radius: number,a_min: number,a_max: number,num_segments: number)
  PathArcToFast: function(center_x: number,center_y: number,radius: number,a_min_of_12: number,a_max_of_12: number)
  PathBezierCubicCurveTo: function(p2_x: number,p2_y: number,p3_x: number,p3_y: number,p4_x: number,p4_y: number,num_segments: number)
  PathBezierQuadraticCurveTo: function(p2_x: number,p2_y: number,p3_x: number,p3_y: number,num_segments: number)
  PathRect: function(rect_min_x: number,rect_min_y: number,rect_max_x: number,rect_max_y: number,rounding: number,rounding_corners: flags)
  PopClipRect: function()
  PopTextureID: function()
  PrimRect: function(a_x: number,a_y: number,b_x: number,b_y: number,col: number)
  PrimReserve: function(idx_count: number,vtx_count: number)
  PrimUnreserve: function(idx_count: number,vtx_count: number)
  PushClipRect: function(clip_rect_min_x: number,clip_rect_min_y: number,clip_rect_max_x: number,clip_rect_max_y: number,intersect_with_current_clip_rect: boolean)
  PushClipRectFullScreen: function()
  PushTextureID: function(texture_id: Image)
  _ClearFreeMemory: function()
  _OnChangedClipRect: function()
  _OnChangedTextureID: function()
  _OnChangedVtxOffset: function()
  _PopUnusedDrawCmd: function()
  _ResetForNewFrame: function()
--------------


end

return imgui
