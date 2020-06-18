local util = require 'bindings2.util'

local Types = {}

do
	-- Check argument types
	local function simple_arg(getter, defaultGetter)
		return function(buf, arg, i)
			if arg.default then
				buf:addf("auto %s = %s(vm, %d, %s);", arg.name, defaultGetter, i, arg.default)
			else
				buf:addf("auto %s = %s(vm, %d);", arg.name, getter, i)
			end
			return i + 1
		end
	end

	local function static_cast_arg(ctype, getter, defaultGetter)
		return function(buf, arg, i)
			if arg.default then
				buf:addf("auto %s = static_cast<%s>(%s(vm, %d, %s));", arg.name, ctype, defaultGetter, i, arg.default)
			else
				buf:addf("auto %s = static_cast<%s>(%s(vm, %d));", arg.name, ctype, getter, i)
			end
			return i + 1
		end
	end

	local function enum_arg(ctype, fromstring)
		return function(buf, arg, i)
			if arg.default then
				buf:addf("auto %s = wrenExGetSlotEnumsDefault<%s>(%s, vm, %d, %s);", arg.name, ctype, fromstring, i, arg.default)
			else
				buf:addf("auto %s = wrenExGetSlotEnum<%s>(%s, vm, %d);", arg.name, ctype, fromstring, i)
			end
			return i + 1
		end
	end

	local function flags_arg(ctype, fromstring)
		return function(buf, arg, i)
			if arg.default then
				buf:addf("auto %s = wrenExGetSlotFlagsDefault<%s>(%s, vm, %d, %s);", arg.name, ctype, fromstring, i, arg.default)
			else
				buf:addf("auto %s = wrenExGetSlotFlags<%s>(%s, vm, %d);", arg.name, ctype, fromstring, i)
			end
			return i + 1
		end
	end

	local function skip_arg()
		return function(buf, arg, i)
			if arg.default then
				buf:addf("%s %s = %s; // skipping", arg.type, arg.name, arg.default)
			else
				-- unimplemented required param
				return i, "stop"
			end
			return i
		end
	end

	local function box_arg(argType, storageType)
		return function(buf, arg, i, outLines)
			buf:addf("auto %s = static_cast<%s>(Box::getCPP<%s>(vm, %d));", arg.name, argType, storageType, i)
			arg.isOutParam = true
			table.insert(outLines, ("Box::setCPP<%s>(vm, %d, %s);"):format(storageType, i, arg.name))
			return i + 1
		end
	end

	local typeCheckers = {
		-- static input
		["const char*"] = simple_arg("wrenGetSlotString", "wrenExGetSlotStringDefault"),
		["bool"] = simple_arg("wrenGetSlotBool", "wrenExGetSlotBoolDefault"),
		["int"] = simple_arg("wrenExGetSlotInt", "wrenExGetSlotIntDefault"),
		["double"] = simple_arg("wrenGetSlotDouble", "wrenExGetSlotDoubleDefault"),
		--["ImTextureID"] = simple_arg("luax_checkTextureID", "luax_checkTextureID"),
		--["ImGuiContext*"] = static_cast_arg("ImGuiContext*", "luax_checklightuserdata", "luax_optlightuserdata"),
		--["ImGuiStyle*"] = static_cast_arg("ImGuiStyle*", "luax_checklightuserdata", "luax_optlightuserdata"),
		["unsigned int"] = simple_arg("wrenExGetSlotUInt", "wrenExGetSlotUIntDefault"),
		["float"] = simple_arg("wrenExGetSlotFloat", "wrenExGetSlotFloatDefault"),
		["ImU32"] = static_cast_arg("ImU32", "wrenExGetSlotUInt", "wrenExGetSlotUIntDefault"),
		["ImGuiID"] = static_cast_arg("ImGuiID", "wrenExGetSlotInt", "wrenExGetSlotIntDefault"),
		["const ImVec2&"] = simple_arg("WrapImVec2::getSlot", "WrapImVec2::getSlotDefault"),
		["const ImVec4&"] = simple_arg("WrapImVec4::getSlot", "WrapImVec4::getSlotDefault"),
		--[[
		["const ImVec2*"] = function(buf, arg, i, _)
			local name = arg.name
			if arg.default then
				buf:addf("ImVec2* %s = %s;", name, arg.default)
				buf:addf("ImVec2 %s_buf;", name)
				buf:addf("if(!lua_isnoneornil(vm, %d)) {", i+1) buf:indent()
					buf:addf("%s_buf.x = luax_checkfloat(vm, %d);", name, i)
					buf:addf("%s_buf.y = luax_checkfloat(vm, %d);", name, i+1)
				buf:unindent() buf:add("}")
				return i + 2
			else
				return i, "stop"
			end
		end,
		["const std::vector<const char*>&"] = function(buf, arg, i, _)
			buf:addf("auto %s = luax_checkstringvector(vm, %d);", arg.name, i)
			return i + 1
		end,
		["const std::vector<float>&"] = function(buf, arg, i, _)
			buf:addf("std::vector<float> %s = luax_checkfloatvector(vm, %d);", arg.name, i)
			return i+1
		end,
		--]]
		["ImGuiInputTextCallback"] = function(buf, arg, i, _)
			local name = arg.name
			buf:addf("ImGuiInputTextCallback %s = nullptr; // TODO", name);
			buf:add("void* user_data = nullptr;")
			--buf:addf("ImGuiInputTextCallback %s = callLuaInputTextCallback;", name)
			--buf:addf("void* user_data = luax_getImguiInputTextCallback(vm, %d);", i)
			--buf:addf("if (!user_data) { %s = nullptr; }", name)
		end,

		["ImGuiDir"] = enum_arg("ImGuiDir", "getImGuiDirFromString"),
		["ImGuiCol"] = enum_arg("ImGuiCol", "getImGuiColFromString"),
		["ImGuiMouseCursor"] = enum_arg("ImGuiMouseCursor", "getImGuiMouseCursorFromString"),
		["ImGuiMouseButton"] = enum_arg("ImGuiMouseButton", "getImGuiMouseButtonFromString"),
		["ImGuiCond"] = enum_arg("ImGuiCond", "getImGuiCondFromString"),
		["ImGuiStyleVar"] = enum_arg("ImGuiStyleVar", "getImGuiStyleVarFromString"),
		["ImGuiKey"] = enum_arg("ImGuiKey", "getImGuiKeyFromString"),
		["ImDrawCornerFlags"] = enum_arg("ImDrawCornerFlags", "getImDrawCornerFlagsFromString"),

		["ImGuiWindowFlags"] = flags_arg("ImGuiWindowFlags", "getImGuiWindowFlagsFromString"),
		["ImGuiFocusedFlags"] = flags_arg("ImGuiFocusedFlags", "getImGuiFocusedFlagsFromString"),
		["ImGuiHoveredFlags"] = flags_arg("ImGuiFocusedFlags", "getImGuiFocusedFlagsFromString"),
		["ImGuiComboFlags"] = flags_arg("ImGuiComboFlags", "getImGuiComboFlagsFromString"),
		["ImGuiInputTextFlags"] = flags_arg("ImGuiInputTextFlags", "getImGuiInputTextFlagsFromString"),
		["ImGuiColorEditFlags"] = flags_arg("ImGuiColorEditFlags", "getImGuiColorEditFlagsFromString"),
		["ImGuiTreeNodeFlags"] = flags_arg("ImGuiTreeNodeFlags", "getImGuiTreeNodeFlagsFromString"),
		["ImGuiSelectableFlags"] = flags_arg("ImGuiSelectableFlags", "getImGuiSelectableFlagsFromString"),
		["ImGuiTabBarFlags"] = flags_arg("ImGuiTabBarFlags", "getImGuiTabBarFlagsFromString"),
		["ImGuiTabItemFlags"] = flags_arg("ImGuiTabItemFlags", "getImGuiTabItemFlagsFromString"),
		["ImGuiDragDropFlags"] = flags_arg("ImGuiDragDropFlags", "getImGuiDragDropFlagsFromString"),
		["ImGuiDockNodeFlags"] = flags_arg("ImGuiDockNodeFlags", "getImGuiDockNodeFlagsFromString"),

		-- TODO
		["ImFontAtlas*"] = skip_arg(),
		["ImGuiViewport*"] = skip_arg(),
		["const ImGuiWindowClass*"] = skip_arg(),
		["noop"] = function(_, _, i)
			return i
		end,

		-- edit input
		["bool*"] = box_arg("bool", "bool"),
		["int*"] = box_arg("int", "double"),
		["unsigned int*"] = box_arg("unsigned int", "double"),
		["float*"] = box_arg("float", "double"),
		["double*"] = box_arg("double", "double"),
		["std::string*"] = box_arg("std::string", "std::string"),
		--["int[2]"] = array_out_arg(2, "int", "wrenExGetSlotInt"),
		--["int[3]"] = array_out_arg(3, "int", "wrenExGetSlotInt"),
		--["int[4]"] = array_out_arg(4, "int", "wrenExGetSlotInt"),
		--["float[2]"] = array_out_arg(2, "float", "wrenExGetSlotFloat"),
		--["float[3]"] = array_out_arg(3, "float", "wrenExGetSlotFloat"),
		--["float[4]"] = array_out_arg(4, "float", "wrenExGetSlotFloat"),
	}
	typeCheckers["ImVec2"] = typeCheckers["const ImVec2&"]
	local unrecognizedCheckType = {}
	function Types.check(buf, arg, i, outLines)
		local ctype = arg.type
		if typeCheckers[ctype] then
			return typeCheckers[ctype](buf, arg, i, outLines)
		end

		-- failure
		if not unrecognizedCheckType[ctype] then
			util.logf("unrecognized type: %s", ctype)
			unrecognizedCheckType[ctype] = true
		end
		return i, "stop"
	end
end

do
	-- Push return types
	local function simple_return(pusher)
		return function(buf, name, i)
			buf:addf("%s(vm, 0, %s);", pusher, name)
			return i + 1
		end
	end
	local function enum_return(stringFromEnum)
		return function(buf, name, i)
			buf:addf("wrenSetSlotString(vm, 0, %s(%s));", stringFromEnum, name)
			return i + 1
		end
	end
	local typePushers = {
		["bool"] = simple_return("wrenSetSlotBool"),
		["int"] = simple_return("wrenSetSlotDouble"),
		["unsigned int"] = simple_return("wrenSetSlotDouble"),
		["ImU32"] = simple_return("wrenSetSlotDouble"),
		["ImGuiID"] = simple_return("wrenSetSlotDouble"),
		["float"] = simple_return("wrenSetSlotDouble"),
		["double"] = simple_return("wrenSetSlotDouble"),
		["const char*"] = simple_return("wrenSetSlotString"),
		--[[
		["ImGuiContext*"] = simple_return("lua_pushlightuserdata"),
		["ImDrawList*"] = udata_return("WrapImDrawList", "ImDrawList"),
		["ImGuiStyle&"] = function(buf, name, i)
			buf:addf("lua_pushlightuserdata(vm, &%s);", name)
			return i + 1
		end,
		--]]
		["ImGuiMouseCursor"] = enum_return("getStringFromImGuiMouseCursor"),
		-- custom
		["std::string"] = function(buf, name, i)
			buf:addf("wrenSetSlotBytes(vm, %s.c_str(), %s.size());", name, name)
			return i + 1
		end,
		["ImVec2"] = simple_return("WrapImVec2::setSlot"),
		["ImVec4"] = simple_return("WrapImVec4::setSlot"),
		["const ImVec4&"] = simple_return("WrapImVec4::setSlot"),
	}
	local unrecognizedReturnType = {}
	function Types.push(buf, name, ctype, i)
		if typePushers[ctype] then
			return typePushers[ctype](buf, name, i)
		else
			if not unrecognizedReturnType[ctype] then
				util.logf("unrecognized return type: %s", ctype)
				unrecognizedReturnType[ctype] = true
			end
			return i, "stop"
		end
	end
end

return Types