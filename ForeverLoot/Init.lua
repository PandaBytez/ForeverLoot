-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)
local tonumber = _G.tonumber
local ipairs = _G.ipairs

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local addonname = ...

local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or _G.GetAddOnMetadata
local addonVersion = GetAddOnMetadata(addonname, "Version")
if addonVersion == string.format("@%s@", "project-version") then addonVersion = "v99.99.9999-dev" end
local versionT = { string.match(addonVersion or "", "v?(%d+)%.(%d+)%.(%d+)%-?(%a*)(%d*)") }
local addonRevision = ""
for k,v in ipairs(versionT) do
	if k < 4 then
		local it = k == 3 and (4 - #v) or (2 - #v)
		for i = 1, it do
			versionT[k] = "0"..versionT[k]
		end
		addonRevision = addonRevision..versionT[k]
	end
end

_G.AtlasLoot = {
	__addonrevision = tonumber(addonRevision) or 0,
	__addonversion = versionT[4] == "dev" and "dev-"..(GetServerTime() or 0) or addonVersion,
	IsDevVersion = versionT[4] == "dev" and true or nil,
	IsTestVersion = (versionT[4] == "beta" or versionT[4] == "alpha") and true or nil,
}

local AddonNameVersion = string.format("%s-%d", addonname, _G.AtlasLoot.__addonrevision)
local MainMT = {
	__tostring = function(self)
		return AddonNameVersion
	end,
}
setmetatable(_G.AtlasLoot, MainMT)

-- DB
ForeverLootDB = {}

-- Translations
_G.AtlasLoot.Locale = {}

-- Init functions
_G.AtlasLoot.Init = {}

-- Data table
_G.AtlasLoot.Data = {}

-- Version
local WOW_PROJECT_ID = _G.WOW_PROJECT_ID or 99
local WOW_PROJECT_MAINLINE = _G.WOW_PROJECT_MAINLINE or 99
local WOW_PROJECT_CLASSIC = _G.WOW_PROJECT_CLASSIC or 1
local WOW_PROJECT_BURNING_CRUSADE_CLASSIC = _G.WOW_PROJECT_BURNING_CRUSADE_CLASSIC or 2
local WOW_PROJECT_WRATH_CLASSIC = _G.WOW_PROJECT_WRATH_CLASSIC or 11

AtlasLoot.RETAIL_VERSION_NUM 	= 99
AtlasLoot.CLASSIC_VERSION_NUM 	= 1
AtlasLoot.BC_VERSION_NUM 		= 2
AtlasLoot.WRATH_VERSION_NUM 	= 3

AtlasLoot.GAME_VERSION_TEXTURES = {
	[AtlasLoot.CLASSIC_VERSION_NUM] = 538639,
	[AtlasLoot.BC_VERSION_NUM] = 131194,
	[AtlasLoot.WRATH_VERSION_NUM] = 235509,
}

AtlasLoot.IS_CLASSIC = false
AtlasLoot.IS_BC = false
AtlasLoot.IS_WRATH = false
AtlasLoot.IS_RETAIL = false

local CurrentGameVersion = AtlasLoot.CLASSIC_VERSION_NUM
if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
	CurrentGameVersion = AtlasLoot.RETAIL_VERSION_NUM
	AtlasLoot.IS_RETAIL = true
elseif WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC then
	if LE_EXPANSION_LEVEL_CURRENT == LE_EXPANSION_WRATH_OF_THE_LICH_KING then
		CurrentGameVersion = AtlasLoot.WRATH_VERSION_NUM
		AtlasLoot.IS_WRATH = true
	elseif LE_EXPANSION_LEVEL_CURRENT == LE_EXPANSION_BURNING_CRUSADE then
		CurrentGameVersion = AtlasLoot.BC_VERSION_NUM
		AtlasLoot.IS_BC = true
	end
elseif WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC then
	CurrentGameVersion = AtlasLoot.WRATH_VERSION_NUM
	AtlasLoot.IS_WRATH = true
else
	CurrentGameVersion = AtlasLoot.CLASSIC_VERSION_NUM
	AtlasLoot.IS_CLASSIC = true
end

AtlasLoot.CURRENT_VERSION_NUM = CurrentGameVersion

-- Compat shims for 12.0-based Forever client where legacy globals were moved to C_* namespaces
if not _G.GetSpellInfo and _G.C_Spell and _G.C_Spell.GetSpellInfo then
	_G.GetSpellInfo = function(spellID)
		local info = spellID and _G.C_Spell.GetSpellInfo(spellID)
		if info then
			return info.name, nil, info.iconID, info.castTime, info.minRange, info.maxRange, info.spellID
		end
	end
end
if not _G.GetSpellTexture and _G.C_Spell and _G.C_Spell.GetSpellTexture then _G.GetSpellTexture = _G.C_Spell.GetSpellTexture end
if not _G.GetSpellDescription and _G.C_Spell and _G.C_Spell.GetSpellDescription then _G.GetSpellDescription = _G.C_Spell.GetSpellDescription end
if not _G.GetSpellLink and _G.C_Spell and _G.C_Spell.GetSpellLink then _G.GetSpellLink = _G.C_Spell.GetSpellLink end
if not _G.Model_Reset then
	_G.Model_Reset = function(model)
		if model and model.SetPosition then
			model:SetPosition(0, 0, 0)
		end
	end
end
if _G.C_Item then
	if not _G.GetItemClassInfo and _G.C_Item.GetItemClassInfo then _G.GetItemClassInfo = _G.C_Item.GetItemClassInfo end
	if not _G.GetItemSubClassInfo and _G.C_Item.GetItemSubClassInfo then _G.GetItemSubClassInfo = _G.C_Item.GetItemSubClassInfo end
	if not _G.GetItemInfo and _G.C_Item.GetItemInfo then _G.GetItemInfo = _G.C_Item.GetItemInfo end
	if not _G.GetItemInfoInstant and _G.C_Item.GetItemInfoInstant then _G.GetItemInfoInstant = _G.C_Item.GetItemInfoInstant end
	if not _G.GetItemIcon and _G.C_Item.GetItemIconByID then _G.GetItemIcon = _G.C_Item.GetItemIconByID end
	if not _G.GetItemCount and _G.C_Item.GetItemCount then _G.GetItemCount = _G.C_Item.GetItemCount end
	if not _G.IsEquippableItem and _G.C_Item.IsEquippableItem then _G.IsEquippableItem = _G.C_Item.IsEquippableItem end
	if not _G.GetItemStats and _G.C_Item.GetItemStats then _G.GetItemStats = _G.C_Item.GetItemStats end
	if not _G.GetItemQualityColor and _G.C_Item.GetItemQualityColor then _G.GetItemQualityColor = _G.C_Item.GetItemQualityColor end
	if not _G.GetItemSetInfo and _G.C_Item.GetItemSetInfo then _G.GetItemSetInfo = _G.C_Item.GetItemSetInfo end
end
if not _G.GetFactionInfoByID and _G.C_Reputation and _G.C_Reputation.GetFactionDataByID then
	_G.GetFactionInfoByID = function(factionID)
		local d = factionID and _G.C_Reputation.GetFactionDataByID(factionID)
		if d then
			return d.name, d.description, d.reaction, d.currentReactionThreshold, d.nextReactionThreshold, d.currentStanding, d.atWarWith, d.canToggleAtWar, d.isHeader, d.isCollapsed, d.hasRep, d.isWatched, d.isChild, d.factionID
		end
	end
end
for k, v in pairs({
	LE_ITEM_QUALITY_UNCOMMON = 2,
	LE_ITEM_CLASS_CONSUMABLE = 0, LE_ITEM_CLASS_CONTAINER = 1, LE_ITEM_CLASS_WEAPON = 2,
	LE_ITEM_CLASS_GEM = 3, LE_ITEM_CLASS_ARMOR = 4, LE_ITEM_CLASS_REAGENT = 5,
	LE_ITEM_CLASS_PROJECTILE = 6, LE_ITEM_CLASS_TRADEGOODS = 7, LE_ITEM_CLASS_ITEM_ENHANCEMENT = 8,
	LE_ITEM_CLASS_RECIPE = 9, LE_ITEM_CLASS_QUIVER = 11, LE_ITEM_CLASS_QUESTITEM = 12,
	LE_ITEM_CLASS_KEY = 13, LE_ITEM_CLASS_MISCELLANEOUS = 15,
	LE_ITEM_WEAPON_AXE1H = 0, LE_ITEM_WEAPON_AXE2H = 1, LE_ITEM_WEAPON_BOWS = 2,
	LE_ITEM_WEAPON_GUNS = 3, LE_ITEM_WEAPON_MACE1H = 4, LE_ITEM_WEAPON_MACE2H = 5,
	LE_ITEM_WEAPON_POLEARM = 6, LE_ITEM_WEAPON_SWORD1H = 7, LE_ITEM_WEAPON_SWORD2H = 8,
	LE_ITEM_WEAPON_WARGLAIVE = 9, LE_ITEM_WEAPON_STAFF = 10, LE_ITEM_WEAPON_UNARMED = 13,
	LE_ITEM_WEAPON_GENERIC = 14, LE_ITEM_WEAPON_DAGGER = 15, LE_ITEM_WEAPON_THROWN = 16,
	LE_ITEM_WEAPON_CROSSBOW = 18, LE_ITEM_WEAPON_WAND = 19, LE_ITEM_WEAPON_FISHINGPOLE = 20,
	LE_ITEM_ARMOR_GENERIC = 0, LE_ITEM_ARMOR_CLOTH = 1, LE_ITEM_ARMOR_LEATHER = 2,
	LE_ITEM_ARMOR_MAIL = 3, LE_ITEM_ARMOR_PLATE = 4, LE_ITEM_ARMOR_COSMETIC = 5,
	LE_ITEM_ARMOR_SHIELD = 6, LE_ITEM_ARMOR_LIBRAM = 7, LE_ITEM_ARMOR_IDOL = 8,
	LE_ITEM_ARMOR_TOTEM = 9, LE_ITEM_ARMOR_RELIC = 11,
	LE_ITEM_RECIPE_BOOK = 0, LE_ITEM_RECIPE_LEATHERWORKING = 1, LE_ITEM_RECIPE_TAILORING = 2,
	LE_ITEM_RECIPE_ENGINEERING = 3, LE_ITEM_RECIPE_BLACKSMITHING = 4, LE_ITEM_RECIPE_COOKING = 5,
	LE_ITEM_RECIPE_ALCHEMY = 6, LE_ITEM_RECIPE_FIRST_AID = 7, LE_ITEM_RECIPE_ENCHANTING = 8,
	LE_ITEM_RECIPE_FISHING = 9, LE_ITEM_RECIPE_JEWELCRAFTING = 10, LE_ITEM_RECIPE_INSCRIPTION = 11,
	LE_ITEM_MISCELLANEOUS_JUNK = 0, LE_ITEM_MISCELLANEOUS_REAGENT = 1, LE_ITEM_MISCELLANEOUS_COMPANION_PET = 2,
	LE_ITEM_MISCELLANEOUS_HOLIDAY = 3, LE_ITEM_MISCELLANEOUS_OTHER = 4, LE_ITEM_MISCELLANEOUS_MOUNT = 5,
}) do
	if _G[k] == nil then _G[k] = v end
end

function AtlasLoot:GetGameVersion()
	return CurrentGameVersion
end

-- equal
function AtlasLoot:GameVersion_EQ(gameVersion, ret, retFalse)
	if CurrentGameVersion == gameVersion then
		return ret or true
	else
		return retFalse
	end
end

-- not equal
function AtlasLoot:GameVersion_NE(gameVersion, ret, retFalse)
	if CurrentGameVersion ~= gameVersion then
		return ret or true
	else
		return retFalse
	end
end

-- not greater then
function AtlasLoot:GameVersion_GT(gameVersion, ret, retFalse)
	if CurrentGameVersion > gameVersion then
		return ret or true
	else
		return retFalse
	end
end

-- not lesser then
function AtlasLoot:GameVersion_LT(gameVersion, ret, retFalse)
	if CurrentGameVersion < gameVersion then
		return ret or true
	else
		return retFalse
	end
end

-- not greater equal
function AtlasLoot:GameVersion_GE(gameVersion, ret, retFalse)
	if CurrentGameVersion >= gameVersion then
		return ret or true
	else
		return retFalse
	end
end

-- not lesser equal
function AtlasLoot:GameVersion_LE(gameVersion, ret, retFalse)
	if CurrentGameVersion <= gameVersion then
		return ret or true
	else
		return retFalse
	end
end
