local ALName, ALPrivate = ...

local _G = _G
local AtlasLoot = _G.AtlasLoot
local Tooltip = {}
AtlasLoot.Tooltip = Tooltip
local AL = AtlasLoot.Locales

-- lua
local pairs = _G.pairs
local type = _G.type

-- WoW
local UnitGUID = _G.UnitGUID
local issecretvalue = _G.issecretvalue

local STANDART_TOOLTIP = "AtlasLootTooltip"
local COLOR = "|cFF00ccff%s|r"
local GOLD, SILVER, COPPER = "|T"..ALPrivate.COIN_TEXTURE.GOLD.texture..":0|t "..COLOR, "|T"..ALPrivate.COIN_TEXTURE.SILVER.texture..":0|t "..COLOR, "|T"..ALPrivate.COIN_TEXTURE.COPPER.texture..":0|t "..COLOR

local AtlasLootTooltip = CreateFrame("GameTooltip", "AtlasLootTooltip", UIParent, "GameTooltipTemplate")
AtlasLootTooltip:Hide()
AtlasLootTooltip.shoppingTooltips = {ShoppingTooltip1, ShoppingTooltip2}

function Tooltip.GetTooltip()
	return AtlasLoot.db.Tooltip.useGameTooltip and _G["GameTooltip"] or ( _G[AtlasLoot.db.Tooltip.tooltip or STANDART_TOOLTIP] or AtlasLootTooltip )
end

-- Hook
local HookInitDone = false
local HookTooltipList = {
    "AtlasLootTooltip",
    "GameTooltip",
    "ItemRefTooltip",
    "ShoppingTooltip1",
    "ShoppingTooltip2"
}
local HookedTooltipRegister = {}
local HookedDataProcessor = {}
local HookedDataProcessorTooltips = {}
local FunctionRegister = {}

local function RefreshHooks()
	for i = 1, #HookTooltipList do
		local tt = HookTooltipList[i]
		if not HookedTooltipRegister[tt] then
			HookedTooltipRegister[tt] = {}
		end
		local register = HookedTooltipRegister[tt]
		for script, scriptFunc in pairs(FunctionRegister) do
			if not register[script] then
				register[script] = {}
			end
			for func, state in pairs(scriptFunc) do
				if state and not register[script][func] then
					local hookTT = type(tt) == "string" and _G[tt] or tt
					if hookTT and hookTT.HookScript then
						if hookTT.HasScript and hookTT:HasScript(script) then
							hookTT:HookScript(script, func)
							register[script][func] = true
						elseif _G.TooltipDataProcessor and _G.Enum and _G.Enum.TooltipDataType then
							local dataType = script == "OnTooltipSetItem" and _G.Enum.TooltipDataType.Item
								or script == "OnTooltipSetUnit" and _G.Enum.TooltipDataType.Unit
							if dataType then
								HookedDataProcessorTooltips[script] = HookedDataProcessorTooltips[script] or {}
								HookedDataProcessorTooltips[script][func] = HookedDataProcessorTooltips[script][func] or {}
								HookedDataProcessorTooltips[script][func][hookTT] = true
								HookedDataProcessor[script] = HookedDataProcessor[script] or {}
								if not HookedDataProcessor[script][func] then
									HookedDataProcessor[script][func] = true
									local allowedTooltips = HookedDataProcessorTooltips[script][func]
									_G.TooltipDataProcessor.AddTooltipPostCall(dataType, function(tooltip)
										if allowedTooltips[tooltip] then
											func(tooltip)
										end
									end)
								end
								register[script][func] = true
							end
						end
					end
				end
			end
		end
	end
end

-- tt = "GameTooltip" or { "tt1", "tt2", myLocalTT }
function Tooltip:AddTooltipSource(tt, notRefresh)
	if not tt then return end
	if type(tt) == "table" then
		for i = 1, #tt do
			self:AddTooltipSource(tt[i], true)
		end
		if not notRefresh then
			RefreshHooks()
		end
	else
		local count = #HookTooltipList
		for i = 1, #HookTooltipList do
			if HookTooltipList[i] == tt then return end
		end
		HookTooltipList[count + 1] = tt
		if not notRefresh then
			RefreshHooks()
		end
	end
end

function Tooltip:AddHookFunction(script, func)
	if type(func) ~= "function" or not script then return end
	if not FunctionRegister[script] then
		FunctionRegister[script] = {}
	end
	if not FunctionRegister[script][func] then
		FunctionRegister[script][func] = true
		if HookInitDone then
			RefreshHooks()
		end
	end
end

local function HookInit()
	RefreshHooks()
	HookInitDone = true
end
AtlasLoot:AddInitFunc(HookInit)

-- #############################
-- Item ToolTip adds
-- #############################
local WHITE_TEXT = "|cffffffff%s|r"
local TooltipCache = setmetatable({}, {__mode = "k"})

function Tooltip.GetItemID(tooltip)
    local _, item
    if tooltip.GetItem then
        _, item = tooltip:GetItem()
    elseif _G.TooltipUtil and _G.TooltipUtil.GetDisplayedItem then
        _, item = _G.TooltipUtil.GetDisplayedItem(tooltip)
    end
    if not item then return end
    if not TooltipCache[item] then
        TooltipCache[item] = tonumber(strmatch(item, "item:(%d+)"))
    end
    return TooltipCache[item]
end

local function OnTooltipSetItem_Hook(self)
    if self:IsForbidden() or not AtlasLoot.db.showTooltipInfoGlobal then return end
    local item = Tooltip.GetItemID(self)

    if item then
		if AtlasLoot.db.showCompanionLearnedInfo and AtlasLoot.Data.Companion.IsCompanion(item) then
			self:AddDoubleLine(AtlasLoot.Data.Companion.GetTypeName(item), AtlasLoot.Data.Companion.GetCollectedString(item))
		end
		if AtlasLoot.db.showIDsInTT then
			self:AddDoubleLine(AL["ItemID:"], format(WHITE_TEXT, item))
		end
		if AtlasLoot.db.showItemLvlInTT then
			local itemName, itemLink, itemQuality, itemLevel = GetItemInfo(item)
			if itemLevel and itemLevel > 0 then
				self:AddDoubleLine(AL["Item level:"], format(WHITE_TEXT, itemLevel))
			end
		end
    end
end
Tooltip:AddHookFunction("OnTooltipSetItem", OnTooltipSetItem_Hook)

-- #############################
-- Own things
-- #############################
local PLAYER_GUID_REGISTER = {
	--["Player-4463-003F795C"] = format(GOLD, "AtlasLoot Author"),
	--["Player-4466-015209F9"] = format(GOLD, "AtlasLoot Author"),
	--["Player-4455-0309734D"] = format(GOLD, "AtlasLoot Author"),
	["Player-4440-026C16A5"] = format(GOLD, "AtlasLoot Author"), -- EU
	["Player-4811-036EFBE9"] = format(GOLD, "AtlasLoot Author"), -- EU-Giant
	--["Player-4455-00D28DDC"] = format(SILVER, "AtlasLoot Friend"),
	--["Player-4463-00A5D43D"] = format(SILVER, "AtlasLoot Friend"),
	--["Player-4476-0054EED9"] = format(COPPER, "aka god of shadow"),
	--["Player-4476-0166DB51"] = format(COPPER, "god of shadow"),
	--["Player-4466-00B9FEDF"] = format(SILVER, "AtlasLoot Friend"), --K
	--["player-4466-00BB4DD8"] = format(SILVER, "AtlasLoot Friend"), --D
	--holz
	--["Player-4463-00784DB2"] = format("|T132800:0|t "..COLOR, "AtlasLoot Friend"),
	--["Player-4749-01CB4830"] = format("|T132800:0|t "..COLOR, "AtlasLoot Friend"),
	-- oob
	--["Player-4749-020C714C"] = format("|T135349:0|t "..COLOR, "AtlasLoot Friend"), --mage
	--["Player-4749-020BE873"] = format("|T135349:0|t "..COLOR, "AtlasLoot Friend"), --war
	--
	--["Player-4463-00C0F307"] = format("|T135349:0|t "..COLOR, "AtlasLoot Friend"),-
	["Player-4440-025D610F"] = format("|T135349:0|t "..COLOR, "AtlasLoot Friend"), -- Tassy
	["Player-4811-036E6228"] = format("|T135349:0|t "..COLOR, "AtlasLoot Friend"), -- Bal / Turana
	["Player-4811-036A6EAE"] = format("|T135349:0|t "..COLOR, "AtlasLoot Friend"), -- Ref / Sinon
	["Player-4453-045E4E4D"] = format("|T135349:0|t "..COLOR, "AtlasLoot Friend"), -- Max
	["Player-4440-0376FFAC"] = format("|T135349:0|t "..COLOR, "AtlasLoot Friend"), -- Balendil / Nekarra
}

local function AddText(self)
	if self:IsForbidden() then return end
	local name, target = self:GetUnit()
	if not target or (issecretvalue and issecretvalue(target)) then return end
	local guid = UnitGUID(target)
	if guid and (not issecretvalue or not issecretvalue(guid)) and PLAYER_GUID_REGISTER[guid] then
		self:AddLine(PLAYER_GUID_REGISTER[guid])
	end
end
Tooltip:AddHookFunction("OnTooltipSetUnit", AddText)