local MAJOR, MINOR = "SansLibs-1.0", 0
local SansLibs = LibStub:NewLibrary(MAJOR, MINOR)

if _G.WOW_PROJECT_ID == _G.WOW_PROJECT_MAINLINE then
    return -- Don't load for Retail
end

if not SansLibs then
    return -- already loaded and no upgrade necessary
end

function SansLibs:firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function SansLibs:split(str, pat, limit)
	local t = {}
	local fpat = "(.-)" .. pat
	local last_end = 1
	local s, e, cap = str:find(fpat, 1)
	while s do
		if s ~= 1 or cap ~= "" then
			table.insert(t, cap)
		end
		last_end = e+1
		s, e, cap = str:find(fpat, last_end)
		if limit ~= nil and limit <= #t then
			break
		end
	end
	if last_end <= #str then
		cap = str:sub(last_end)
		table.insert(t, cap)
	end
	return t
end

function SansLibs:round(num, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function SansLibs:GetLinkID(itemlink)
	local type,id = string.match(itemlink, "H(%w*):(%d*)")
	type=(type and type or "no type match")
	id=(id and id or "no id match")
	return type, tonumber(id)
end

SansLibs.ColorfyColors = {
	white	= "FFFFFF",
	red = "FF0000",
	darkred = "F00000",
	green = "00FF00",
	felGreen = "D6EB00",			-- Burning Crusade Fel Green
	orange = "FF7F00",
	yellow = "FFFF00",
	gold = "FFD700",
	teal = "00FF9A",
	cyan = "1CFAFE",
	lightBlue = "B0B0FF",
	battleNetBlue = "82c5ff",
	grey = "909090",

	-- classes
	classMage = "69CCF0",
	classHunter = "ABD473",

	-- recipes
	recipeGrey = "808080",
	recipeGreen = "40C040",
	recipeOrange = "FF8040",

	-- rarity : http://wow.gamepedia.com/Quality
	common = "FFFFFF",
	uncommon = "1EFF00",
	rare = "0070DD",
	epic = "A335EE",
	legendary = "FF8000",
	heirloom = "E6CC80",

	Alliance = "2459FF",
	Horde = "FF0000",
}

function SansLibs:GetMaxLevel()
	-- 0 = Classic
	-- 1 = TBC
	-- 2 = WotLK
	-- 3 = Cata
	local MAX_PLAYER_LEVEL_TABLE = {60,70,80,85};
	return MAX_PLAYER_LEVEL_TABLE[GetExpansionLevel()]
end

function SansLibs:Colorfy(msg,color)
	color = (color and color or SansLibs.ColorfyColors.white)
	return "|cff"..color..msg.."|r"
end

function SansLibs:Msg(msg,addon_title)
	DEFAULT_CHAT_FRAME:AddMessage((addon_title and addon_title.." " or "")..msg)
end

function SansLibs:SafeText(text, default)
	return (text and text or (default and default or ''))
end

function SansLibs:ucfirst(str)
    return (string.lower(str):gsub("^%l", string.upper))
end