global type imgui = record
<%- helpers.prepare(imgui) %>

-- enums
<%- helpers.generateEnums(imgui) %>

-- aliased types
<%- helpers.generateAliases(imgui) %>

-- functions
<%- helpers.generateFunctions(imgui) %>

end

return imgui
