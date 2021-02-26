global type imgui = record

    -- attention : not use it
    type Image_ = number

    SetGlobalFontFromFileTTF: function(fname: string, pixSize: number)
    AddFontFromFileTTF: function(fname: string, pixSize: number)
    SetGlobalFontFromArchiveTTF: function(fname: string, pixSize: number)
    ShutDown: function()
    Init: function()
    Render: function()
    NewFrame: function()
    MouseMoved: function(number, number)
    MousePressed: function(number)
    MouseReleased: function(number)
    WheelMoved: function(number)
    KeyPressed: function(string)
    KeyReleased: function(string)
    TextInput: function(string)
    GetWantCaptureKeyboard: function()
    GetWantCaptureMouse: function()
    GetWantTextInput: function()


<%- helpers.prepare(imgui) %>

-- enums
<%- helpers.generateEnums(imgui) %>

-- aliased types
<%- helpers.generateAliases(imgui) %>

-- functions
<%- helpers.generateFunctions(imgui) %>

end

return imgui
