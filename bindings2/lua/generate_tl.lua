local json = require 'bindings2.dkjson'
local util = require 'bindings2.util'
local inspect = require 'inspect'

local function jsonObject(t)
	return setmetatable(t or {}, {__jsontype = "object"})
end

local function createTableType()
	return { type = 'table', fields = jsonObject() }
end

local function createFunctionType()
	return {type = 'function'}
end

local g_usedRefs = {}
local function createDataRefType(name)
	g_usedRefs[name] = createTableType()
	return {type = 'ref', name = name}
end

local function createEnumRefType(name)
	g_usedRefs[name] = { type = "string" }
	return {type = 'ref', name = name}
end

local function addFunctions(tableType, imguiFunctions)
	for name, fnData in util.sortedPairs(imguiFunctions.validNames) do
		local fn = createFunctionType()

		fn.args = {}
		fn.argTypes = {}
		if fnData.class then
			local arg = {name = "self"}
			table.insert(fn.args, arg)
			table.insert(fn.argTypes, createDataRefType(fnData.class))
		end

		if fnData.luaArgumentTypes and fnData.luaArgumentTypes[1] then
			for _, argData in ipairs(fnData.luaArgumentTypes) do
				if argData.type == 'userdata' or argData.type == 'lightuserdata' then
					table.insert(fn.argTypes, createDataRefType(argData.class))
				elseif argData.type == 'enum' or argData.type == 'flags' then
					table.insert(fn.argTypes, createEnumRefType(argData.enum))
				else
					table.insert(fn.argTypes, {type = argData.type})
				end
				local arg = {name = argData.name}
				if argData.default then
					arg.displayName = string.format("%s = %s", argData.name, argData.default)
				end
				table.insert(fn.args, arg)
			end
		end

		if fnData.isVarArgs then
			table.insert(fn.args, {name = "", displayName = "..."})
			table.insert(fn.argTypes, {type = "unknown"})
		end

		if fnData.luaReturnTypes and fnData.luaReturnTypes[1] then
			fn.returnTypes = {}
			for _, returnData in ipairs(fnData.luaReturnTypes) do
				if returnData.type == 'userdata' or returnData.type == 'lightuserdata' then
					table.insert(fn.returnTypes, createDataRefType(returnData.class))
				else
					table.insert(fn.returnTypes, {type = returnData.type})
				end
			end
		end

		if fnData.comment then
			fn.descriptionPlain = fnData.comment
		end

		if fnData.sourceFileLine then
			fn.link = util.createGithubLink(fnData.sourceFilePath, fnData.sourceFileLine)
		end

		tableType.fields[name] = fn
	end
end

local function generate(imgui)
	local data = {}
	data.global = createTableType()
	data.global.fields.ImGui = createTableType()
	addFunctions(data.global.fields.ImGui, imgui.functions.ImGui)

	data.namedTypes = {}
	data.namedTypes["ImDrawList"] = createTableType()
	addFunctions(data.namedTypes["ImDrawList"], imgui.functions.ImDrawList, "ImDrawList")

	for refName, refData in pairs(g_usedRefs) do
		if not data.namedTypes[refName] then
			data.namedTypes[refName] = refData
		end
	end

	return data
end

local helpers = {}

local aliases = {}
local functions = ''

local function printFuncs(t)
    local dict = {}

    for k, v in pairs(t) do
        print('-------', k, tostring(v))
    end
    local file = io.open('dump-2.txt', 'w+')
    file:write(inspect(t))
    file:close()

    -- TODO добавить не только validNames
    for k, v in pairs(t.validNames) do
        --ret = ret .. k .. ' ' .. tostring(v) .. '\n'
        local params = ''
        local comma = ','
        local rets = ''
        if v.luaArgumentTypes then
            for i, argtype in pairs(v.luaArgumentTypes) do
                if i == #v.luaArgumentTypes then
                    comma = ''
                end
                if argtype.type == 'enum' then
                    params = params .. argtype.name .. ': ' .. argtype.enum .. '_' .. comma
                    --table.insert(aliases, argtype.enum)
                    aliases[argtype.enum] = true
                else
                    params = params .. argtype.name .. ': ' .. argtype.type .. comma
                end
            end
        end
        if v.luaReturnTypes and #v.luaReturnTypes >= 1 then
            comma = ','
            rets = rets .. ': '
            for i, rettype in pairs(v.luaReturnTypes) do
                if i == #v.luaReturnTypes then
                    comma = ''
                end
                rets = rets .. rettype.type .. comma
            end
        end
        local proto = string.format(': function(%s)%s', params, rets)
        --ret = ret .. '  ' .. k .. proto
        dict[k] = proto
    end
    --print(inspect(t.fnData))
    --print(inspect(t.validNames))
    return dict
end

function helpers.generateAliases(imgui)
    local ret = ''
    for k, v in pairs(aliases) do
        ret = ret .. '  type ' .. k .. '_ = string\n'
    end
    return ret
end

function helpers.prepare(imgui)
    local file = io.open('dump-1.txt', 'w+')
    file:write(inspect(imgui))
    file:close()

    functions = helpers.generateFunctionsInternal(imgui)
    return ''
end

function helpers.generateEnums(imgui)
    local ret = ''
    print('#imgui.enums', #imgui.enums)
    for k, enum in pairs(imgui.enums) do
        --print(inspect(enum))
        local enumName = enum.name
        if enumName:sub(-1) == '_' then
            enumName = enumName:sub(1, enumName:len() - 1)
        end
        --print(enumName, name)
        ret = ret .. '  enum ' .. enumName .. '\n'
        for k1, v1 in pairs(enum.values) do
            ret = ret .. '      "' .. k1 .. '"\n'
        end
        ret = ret .. '  end\n\n'
    end

    return ret
end

function helpers.generateFunctions(imgui)
    return functions
end

function helpers.generateFunctionsInternal(imgui)
    local ret = ''
    for k, v in pairs(imgui.functions) do
        local funcDict = printFuncs(v)
        local funcArr = {}
        for k1, v1 in pairs(funcDict) do
            table.insert(funcArr, k1)
        end
        table.sort(funcArr)
        for k1, v1 in ipairs(funcArr) do
            ret = ret .. '  ' .. v1 .. funcDict[v1] .. '\n'
        end
        ret = ret .. '--------------\n'
    end
    return ret
end

--function helpers.generateAutocomplete(imgui)
	--local keyOrder = {
		--'luaVersion',
		--'packagePath',
		--'global',
		--'namedTypes',
		--'type',
		--'description',
		--'descriptionPlain',
		--'link',
		--'fields',
		--'args',
		--'argTypes',
		--'returnTypes',
		--'variants',
	--}

	--local api = generate(imgui)
	--return json.encode(api, {indent=true, keyOrder = keyOrder})
--end

return helpers
