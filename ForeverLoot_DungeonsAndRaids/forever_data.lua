-- WoW Forever (1.60.1) Dungeons & Raids loot tables
-- Data sourced from Pirson-s-Addons/DungeonQuestAtlas
local _G = getfenv(0)
local addonname = ...
local AtlasLoot = _G.AtlasLoot
local data = AtlasLoot.ItemDB:Get(addonname)
if not data then return end

local NORMAL_DIFF = 1
local RAID20_DIFF = 2
local DUNGEON_CONTENT = 1
local RAID20_CONTENT = 2

local function ZoneName(instanceID, fallback)
	local name = instanceID and GetRealZoneText and GetRealZoneText(instanceID)
	if name and name ~= "" then return name end
	return fallback
end

data["AlcazPrison"] = {
	name = ZoneName(2994, "Alcaz Prison"),
	InstanceID = 2994,
	ContentType = DUNGEON_CONTENT,
	LoadDifficulty = NORMAL_DIFF,
	LevelRange = {48, 48, 53},
	items = {
		{
			name = "Overseer Wrex",
			npcID = 255391,
			Level = 50,
			[NORMAL_DIFF] = {
				{ 1, 276733 },
				{ 2, 276734 },
				{ 3, 276732 },
			},
		},
		{
			name = "The Questioner",
			npcID = 256236,
			Level = 51,
			DisplayIDs = {{140092}},
			[NORMAL_DIFF] = {
				{ 1, 276742 },
				{ 2, 276743 },
				{ 3, 276741 },
				{ 4, 274029 },
			},
		},
		{
			name = "Tidemistress Ca'zass",
			npcID = 255997,
			Level = 50,
			DisplayIDs = {{4973}},
			[NORMAL_DIFF] = {
				{ 1, 276735 },
				{ 2, 276736 },
				{ 3, 276737 },
				{ 4, 273883 },
			},
		},
		{
			name = "Katerina the Cleaner",
			npcID = 257016,
			Level = 52,
			DisplayIDs = {{2317}},
			[NORMAL_DIFF] = {
				{ 1, 276739 },
				{ 2, 276738 },
				{ 3, 276740 },
			},
		},
		{
			name = "Blazeroar",
			npcID = 255702,
			Level = 53,
			DisplayIDs = {{6374}},
			[NORMAL_DIFF] = {
				{ 1, 276890 },
				{ 2, 276744 },
				{ 3, 276745 },
				{ 4, 276746 },
			},
		},
		{
			name = "Trash mobs",
			[NORMAL_DIFF] = {
				{ 1, 287021 },
				{ 2, 287019 },
				{ 3, 287020 },
				{ 4, 287018 },
				{ 5, 287017 },
				{ 6, 287022 },
				{ 7, 287023 },
				{ 8, 287024 },
				{ 9, 287025 },
			},
		},
	},
}

data["BlackmawHold"] = {
	name = ZoneName(2974, "Blackmaw Hold"),
	InstanceID = 2974,
	ContentType = DUNGEON_CONTENT,
	LoadDifficulty = NORMAL_DIFF,
	LevelRange = {55, 55, 60},
	items = {
		{
			name = "Impaan the Imprisoner",
			npcID = 247206,
			Level = 57,
			DisplayIDs = {{130432}},
			[NORMAL_DIFF] = {
				{ 1, 280056 },
				{ 2, 280058 },
				{ 3, 280057 },
			},
		},
		{
			name = "Bonesnout the Unbroken",
			npcID = 247198,
			Level = 58,
			DisplayIDs = {{130427}},
			[NORMAL_DIFF] = {
				{ 1, 280060 },
				{ 2, 280059 },
				{ 3, 280061 },
				{ 4, 249696 },
			},
		},
		{
			name = "Moontouched Wanderer (Rare)",
			npcID = 269104,
			Level = 55,
			DisplayIDs = {{12235}},
			[NORMAL_DIFF] = {
				{ 1, 280080 },
				{ 2, 280079 },
			},
		},
		{
			name = "Gortek the Apprentice (Rare)",
			npcID = 269111,
			Level = 55,
			DisplayIDs = {{145808}},
			[NORMAL_DIFF] = {
				{ 1, 280077 },
				{ 2, 280078 },
			},
		},
		{
			name = "Tunnelweb Matriarch (Rare)",
			npcID = 250034,
			Level = 55,
			[NORMAL_DIFF] = {
				{ 1, 280085 },
				{ 2, 280086 },
			},
		},
		{
			name = "Withermaw",
			npcID = 247195,
			Level = 58,
			DisplayIDs = {{140708}},
			[NORMAL_DIFF] = {
				{ 1, 280064 },
				{ 2, 280062 },
				{ 3, 280063 },
				{ 4, 249697 },
			},
		},
		{
			name = "Elder Shaman Bloodmane",
			npcID = 247209,
			Level = 59,
			DisplayIDs = {{130440}},
			[NORMAL_DIFF] = {
				{ 1, 280068 },
				{ 2, 280069 },
				{ 3, 280070 },
				{ 4, 276893 },
				{ 5, 286415 },
			},
		},
		{
			name = "Blackmaw Behemoth",
			npcID = 247207,
			Level = 59,
			DisplayIDs = {{130436}},
			[NORMAL_DIFF] = {
				{ 1, 280065 },
				{ 2, 280066 },
				{ 3, 280067 },
			},
		},
		{
			name = "Unbound Spirit",
			npcID = 247231,
			Level = 59,
			DisplayIDs = {{131644}},
			[NORMAL_DIFF] = {
				{ 1, 280071 },
				{ 2, 280073 },
				{ 3, 280072 },
			},
		},
		{
			name = "Varrox Bleakhoof",
			npcID = 247234,
			Level = 60,
			DisplayIDs = {{130447}},
			[NORMAL_DIFF] = {
				{ 1, 280074 },
				{ 2, 280075 },
				{ 3, 280076 },
			},
		},
		{
			name = "Trash mobs",
			[NORMAL_DIFF] = {
				{ 1, 287036 },
				{ 2, 287032 },
				{ 3, 287034 },
				{ 4, 287028 },
				{ 5, 251453 },
				{ 6, 287029 },
				{ 7, 287030 },
				{ 8, 287033 },
				{ 9, 252893 },
				{ 10, 287031 },
				{ 11, 287035 },
			},
		},
		{
			name = "Sabella No-Eyes (Rare)",
			npcID = 269151,
			[NORMAL_DIFF] = {
				{ 1, 280083 },
				{ 2, 280084 },
			},
		},
		{
			name = "Recipes & Patterns",
			[NORMAL_DIFF] = {
				{ 1, 252893 },
				{ 2, 11 },
				{ 3, 251453 },
				{ 4, 11 },
			},
		},
	},
}

data["CityofDalaran"] = {
	name = ZoneName(2959, "City of Dalaran"),
	InstanceID = 2959,
	ContentType = DUNGEON_CONTENT,
	LoadDifficulty = NORMAL_DIFF,
	LevelRange = {28, 28, 35},
	items = {
		{
			name = "Atrexis the Grave Knight",
			npcID = 247126,
			Level = 29,
			DisplayIDs = {{145787}},
			[NORMAL_DIFF] = {
				{ 1, 273032 },
				{ 2, 273036 },
				{ 3, 273033 },
			},
		},
		{
			name = "Arcane Anomaly",
			npcID = 245999,
			Level = 30,
			DisplayIDs = {{129891}},
			[NORMAL_DIFF] = {
				{ 1, 273034 },
				{ 2, 273031 },
				{ 3, 273035 },
			},
		},
		{
			name = "Arcanic Enigma",
			npcID = 246016,
			Level = 30,
			DisplayIDs = {{129900}},
			[NORMAL_DIFF] = {
				{ 1, 273045 },
				{ 2, 273044 },
				{ 3, 273043 },
			},
		},
		{
			name = "Unstable Sentinel",
			npcID = 246017,
			Level = 31,
			DisplayIDs = {{129954}},
			[NORMAL_DIFF] = {
				{ 1, 273046 },
				{ 2, 273047 },
				{ 3, 273048 },
				{ 4, 273099 },
			},
		},
		{
			name = "Mana Devourer",
			npcID = 246008,
			Level = 31,
			DisplayIDs = {{129895}},
			[NORMAL_DIFF] = {
				{ 1, 273041 },
				{ 2, 273040 },
				{ 3, 273042 },
			},
		},
		{
			name = "Fel Ancient",
			npcID = 246003,
			Level = 32,
			DisplayIDs = {{129894}},
			[NORMAL_DIFF] = {
				{ 1, 273037 },
				{ 2, 273039 },
				{ 3, 273038 },
			},
		},
		{
			name = "Lyn the Ignored (Rare)",
			npcID = 247032,
			DisplayIDs = {{130235}},
			[NORMAL_DIFF] = {
				{ 1, 273055 },
				{ 2, 273054 },
				{ 3, 273053 },
			},
		},
		{
			name = "Shade of the Archmage",
			npcID = 246020,
			Level = 33,
			DisplayIDs = {{130061}},
			[NORMAL_DIFF] = {
				{ 1, 273103 },
				{ 2, 273052 },
				{ 3, 273049 },
				{ 4, 273051 },
			},
		},
		{
			name = "Trash mobs",
			[NORMAL_DIFF] = {
				{ 1, 286987 },
				{ 2, 286988 },
				{ 3, 286989 },
				{ 4, 286991 },
				{ 5, 286992 },
				{ 6, 286994 },
				{ 7, 286995 },
				{ 8, 286990 },
				{ 9, 286993 },
				{ 10, 286996 },
			},
		},
	},
}

data["ExcavationSite"] = {
	name = ZoneName(2998, "Excavation Site"),
	InstanceID = 2998,
	ContentType = DUNGEON_CONTENT,
	LoadDifficulty = NORMAL_DIFF,
	LevelRange = {26, 26, 33},
	items = {
		{
			name = "Saltspine",
			npcID = 260322,
			Level = 28,
			DisplayIDs = {{144209}},
			[NORMAL_DIFF] = {
				{ 1, 273024 },
				{ 2, 273022 },
				{ 3, 273023 },
			},
		},
		{
			name = "Shadetooth",
			npcID = 260325,
			Level = 29,
			DisplayIDs = {{144210}},
			[NORMAL_DIFF] = {
				{ 1, 273025 },
				{ 2, 273027 },
				{ 3, 273026 },
				{ 4, 273106 },
			},
		},
		{
			name = "Relic Guardian",
			npcID = 260326,
			Level = 31,
			DisplayIDs = {{144224}},
			[NORMAL_DIFF] = {
				{ 1, 273028 },
				{ 2, 273029 },
				{ 3, 273030 },
				{ 4, 270866 },
				{ 5, 273097 },
				{ 6, 270865 },
			},
		},
		{
			name = "Trash mobs",
			[NORMAL_DIFF] = {
				{ 1, 287068 },
				{ 2, 286983 },
				{ 3, 286982 },
				{ 4, 286984 },
				{ 5, 286985 },
				{ 6, 286986 },
			},
		},
	},
}

data["HallofThanes"] = {
	name = ZoneName(3065, "Hall of Thanes"),
	InstanceID = 3065,
	ContentType = DUNGEON_CONTENT,
	LoadDifficulty = NORMAL_DIFF,
	LevelRange = {13, 13, 20},
	items = {
		{
			name = "Faldrim Anvilmar",
			npcID = 261306,
			Level = 16,
			DisplayIDs = {{142826}},
			[NORMAL_DIFF] = {
				{ 1, 270227 },
				{ 2, 271096 },
				{ 3, 271097 },
			},
		},
		{
			name = "Magmatus",
			npcID = 261316,
			Level = 16,
			DisplayIDs = {{1070}},
			[NORMAL_DIFF] = {
				{ 1, 270230 },
				{ 2, 270231 },
				{ 3, 271095 },
			},
		},
		{
			name = "Plunder",
			npcID = 261311,
			Level = 16,
			DisplayIDs = {{142840}},
			[NORMAL_DIFF] = {
				{ 1, 270228 },
				{ 2, 270229 },
				{ 3, 271098 },
			},
		},
		{
			name = "Durgen Dirgehammer",
			npcID = 261319,
			Level = 16,
			DisplayIDs = {{142837}},
			[NORMAL_DIFF] = {
				{ 1, 270256 },
				{ 2, 270260 },
				{ 3, 270261 },
				{ 4, 274286 },
			},
		},
	},
}

data["KroldokStronghold"] = {
	name = ZoneName(3039, "Krol'dok Stronghold"),
	InstanceID = 3039,
	ContentType = DUNGEON_CONTENT,
	LoadDifficulty = NORMAL_DIFF,
	LevelRange = {40, 40, 45},
	items = {
		{
			name = "Slavecrusher Grox",
			npcID = 258966,
			Level = 42,
			DisplayIDs = {{141217}},
			[NORMAL_DIFF] = {
				{ 1, 274996 },
				{ 2, 274997 },
				{ 3, 274995 },
				{ 4, 273101 },
			},
		},
		{
			name = "Twilight Commander Zarmok",
			npcID = 258972,
			Level = 43,
			DisplayIDs = {{141219}},
			[NORMAL_DIFF] = {
				{ 1, 275000 },
				{ 2, 274998 },
				{ 3, 274999 },
			},
		},
		{
			name = "War Handler Ashka",
			npcID = 259281,
			Level = 43,
			DisplayIDs = {{141443}},
			[NORMAL_DIFF] = {
				{ 1, 275001 },
				{ 2, 275002 },
				{ 3, 275003 },
			},
		},
		{
			name = "Nar'gurk",
			npcID = 258964,
			Level = 44,
			DisplayIDs = {{141215}},
			[NORMAL_DIFF] = {
				{ 1, 275005 },
				{ 2, 275004 },
				{ 3, 275006 },
				{ 4, 267104 },
			},
		},
		{
			name = "Bossman Toof",
			npcID = 264773,
			Level = 42,
			DisplayIDs = {{14424}},
			[NORMAL_DIFF] = {
				{ 1, 286430 },
				{ 2, 286429 },
				{ 3, 286428 },
			},
		},
		{
			name = "Overlord Mugg",
			npcID = 258968,
			Level = 45,
			DisplayIDs = {{141218}},
			[NORMAL_DIFF] = {
				{ 1, 275009 },
				{ 2, 275007 },
				{ 3, 275010 },
				{ 4, 275008 },
				{ 5, 267086 },
			},
		},
		{
			name = "Kroog (Rare)",
			npcID = 262716,
			Level = 41,
			[NORMAL_DIFF] = {
				{ 1, 279863 },
				{ 2, 279857 },
			},
		},
		{
			name = "Trash mobs",
			[NORMAL_DIFF] = {
				{ 1, 287014 },
				{ 2, 287012 },
				{ 3, 287013 },
				{ 4, 287008 },
				{ 5, 287010 },
				{ 6, 287007 },
				{ 7, 287009 },
				{ 8, 287011 },
				{ 9, 287015 },
				{ 10, 287016 },
			},
		},
	},
}

data["RuinsofLordaeron"] = {
	name = ZoneName(2999, "Ruins of Lordaeron"),
	InstanceID = 2999,
	ContentType = DUNGEON_CONTENT,
	LoadDifficulty = NORMAL_DIFF,
	LevelRange = {15, 15, 22},
	items = {
		{
			name = "The Baron",
			npcID = 250660,
			Level = 17,
			DisplayIDs = {{144188}},
			[NORMAL_DIFF] = {
				{ 1, 271204 },
				{ 2, 271205 },
				{ 3, 271206 },
			},
		},
		{
			name = "Witherfang",
			npcID = 250483,
			Level = 17,
			DisplayIDs = {{144189}},
			[NORMAL_DIFF] = {
				{ 1, 271201 },
				{ 2, 271202 },
				{ 3, 271203 },
			},
		},
		{
			name = "The Abandoned",
			npcID = 250631,
			Level = 18,
			DisplayIDs = {{138667}},
			[NORMAL_DIFF] = {
				{ 1, 271207 },
				{ 2, 271208 },
				{ 3, 271216 },
			},
		},
		{
			name = "Bjork",
			npcID = 256097,
			Level = 19,
			DisplayIDs = {{144170}},
			[NORMAL_DIFF] = {
				{ 1, 271209 },
				{ 2, 271210 },
				{ 3, 271217 },
			},
		},
		{
			name = "Rath'mael",
			npcID = 250657,
			Level = 20,
			DisplayIDs = {{144175}},
			[NORMAL_DIFF] = {
				{ 1, 271213 },
				{ 2, 271214 },
				{ 3, 271215 },
				{ 4, 273085 },
				{ 5, 273103 },
			},
		},
		{
			name = "Viktor the Vile",
			npcID = 256035,
			Level = 19,
			DisplayIDs = {{139455}},
			[NORMAL_DIFF] = {
				{ 1, 271211 },
				{ 2, 271212 },
				{ 3, 271218 },
			},
		},
		{
			name = "Lordaeron Captain (Rare)",
			npcID = 255699,
			Level = 19,
			DisplayIDs = {{139050}},
			[NORMAL_DIFF] = {
				{ 1, 6641 },
				{ 2, 6642 },
			},
		},
		{
			name = "Trash mobs",
			[NORMAL_DIFF] = {
				{ 1, 286981 },
				{ 2, 286977 },
				{ 3, 286980 },
				{ 4, 286979 },
				{ 5, 286978 },
			},
		},
	},
}

data["ShapersTerrace"] = {
	name = ZoneName(3001, "Shaper's Terrace"),
	InstanceID = 3001,
	ContentType = DUNGEON_CONTENT,
	LoadDifficulty = NORMAL_DIFF,
	LevelRange = {58, 58, 60},
	items = {
		{
			name = "Titanosaur",
			npcID = 253201,
			Level = 61,
			DisplayIDs = {{142989}},
			[NORMAL_DIFF] = {
				{ 1, 280009 },
				{ 2, 280011 },
				{ 3, 280010 },
			},
		},
		{
			name = "Venomridge",
			npcID = 261813,
			Level = 61,
			DisplayIDs = {{144511}},
			[NORMAL_DIFF] = {
				{ 1, 280015 },
				{ 2, 280017 },
				{ 3, 280016 },
			},
		},
		{
			name = "Thunderhoof",
			npcID = 261812,
			Level = 61,
			DisplayIDs = {{144514}},
			[NORMAL_DIFF] = {
				{ 1, 280018 },
				{ 2, 280020 },
				{ 3, 280019 },
			},
		},
		{
			name = "Direhorn Matriarch",
			npcID = 262127,
			Level = 61,
			DisplayIDs = {{144515}},
			[NORMAL_DIFF] = {
				{ 1, 280045 },
				{ 2, 280022 },
				{ 3, 280021 },
			},
		},
		{
			name = "Cinder",
			npcID = 261974,
			Level = 61,
			[NORMAL_DIFF] = {
				{ 1, 280029 },
				{ 2, 280028 },
			},
		},
		{
			name = "Bolt",
			npcID = 262081,
			Level = 62,
			DisplayIDs = {{143063}},
			[NORMAL_DIFF] = {
				{ 1, 280031 },
				{ 2, 280032 },
			},
		},
		{
			name = "Snowtalon",
			npcID = 262297,
			Level = 62,
			[NORMAL_DIFF] = {
				{ 1, 280026 },
			},
		},
		{
			name = "Vitrix",
			npcID = 272561,
			Level = 62,
			DisplayIDs = {{147098}},
			[NORMAL_DIFF] = {
				{ 1, 280031 },
				{ 2, 280027 },
				{ 3, 280028 },
				{ 4, 280026 },
				{ 5, 280029 },
			},
		},
		{
			name = "Izha'Rel and Tor'Rel",
			npcID = 253218,
			Level = 61,
			DisplayIDs = {{143040}},
			[NORMAL_DIFF] = {
				{ 1, 280014 },
				{ 2, 280013 },
				{ 3, 280012 },
			},
		},
		{
			name = "Nanaya",
			npcID = 261809,
			Level = 62,
			DisplayIDs = {{143832}},
			[NORMAL_DIFF] = {
				{ 1, 280023 },
				{ 2, 280025 },
				{ 3, 280024 },
				{ 4, 273128 },
				{ 5, 273116 },
			},
		},
		{
			name = "Trash mobs",
			[NORMAL_DIFF] = {
				{ 1, 287037 },
				{ 2, 287044 },
				{ 3, 287045 },
				{ 4, 287038 },
				{ 5, 287039 },
				{ 6, 287040 },
				{ 7, 287041 },
				{ 8, 287042 },
				{ 9, 287043 },
				{ 10, 287046 },
				{ 11, 252938 },
			},
		},
		{
			name = "Recipes & Patterns",
			[NORMAL_DIFF] = {
				{ 1, 273116 },
				{ 2, 10 },
				{ 3, 273128 },
				{ 4, 10 },
			},
		},
	},
}

data["TheDrownedCity"] = {
	name = ZoneName(2970, "The Drowned City"),
	InstanceID = 2970,
	ContentType = DUNGEON_CONTENT,
	LoadDifficulty = NORMAL_DIFF,
	LevelRange = {35, 35, 40},
	items = {
		{
			name = "Zul'Alai",
			npcID = 258905,
			Level = 37,
			DisplayIDs = {{144475}},
			[NORMAL_DIFF] = {
				{ 1, 274600 },
				{ 2, 274599 },
				{ 3, 274598 },
			},
		},
		{
			name = "Var'Taka",
			npcID = 258924,
			Level = 38,
			DisplayIDs = {{144487}},
			[NORMAL_DIFF] = {
				{ 1, 274602 },
				{ 2, 274601 },
				{ 3, 274613 },
			},
		},
		{
			name = "Captain Dreadrise",
			npcID = 260042,
			Level = 38,
			DisplayIDs = {{142144}},
			[NORMAL_DIFF] = {
				{ 1, 274604 },
				{ 2, 274605 },
				{ 3, 274603 },
			},
		},
		{
			name = "Deathless Marrow",
			npcID = 269586,
			Level = 39,
			DisplayIDs = {{142245}},
			[NORMAL_DIFF] = {
				{ 1, 274606 },
				{ 2, 274614 },
				{ 3, 274607 },
			},
		},
		{
			name = "Primeval Elemental",
			npcID = 273738,
			Level = 38,
			DisplayIDs = {{129945}},
			[NORMAL_DIFF] = {
				{ 1, 274612 },
				{ 2, 274611 },
				{ 3, 274615 },
			},
		},
		{
			name = "Gill (Rare)",
			npcID = 264177,
			Level = 38,
			DisplayIDs = {{144023}},
			[NORMAL_DIFF] = {
				{ 1, 286646 },
				{ 2, 286649 },
			},
		},
		{
			name = "Umbra (Rare)",
			npcID = 264172,
			Level = 38,
			[NORMAL_DIFF] = {
				{ 1, 286662 },
				{ 2, 286658 },
			},
		},
		{
			name = "\"Pyromancer\" Braxton (Rare)",
			npcID = 260468,
			Level = 38,
			DisplayIDs = {{142457}},
			[NORMAL_DIFF] = {
				{ 1, 286650 },
				{ 2, 286651 },
			},
		},
		{
			name = "Min'loth the Serpent",
			npcID = 260274,
			Level = 40,
			DisplayIDs = {{142322}},
			[NORMAL_DIFF] = {
				{ 1, 274610 },
				{ 2, 274608 },
				{ 3, 274609 },
			},
		},
		{
			name = "Trash mobs",
			[NORMAL_DIFF] = {
				{ 1, 287002 },
				{ 2, 286997 },
				{ 3, 287005 },
				{ 4, 286998 },
				{ 5, 286999 },
				{ 6, 287000 },
				{ 7, 287001 },
				{ 8, 287003 },
				{ 9, 287004 },
				{ 10, 287006 },
			},
		},
	},
}

data["TheBarrowDeeps"] = {
	name = "The Barrow Deeps",
	ContentType = RAID20_CONTENT,
	LoadDifficulty = RAID20_DIFF,
	LevelRange = {60, 60, 60},
	items = {
		{
			name = "Deepscar Matriarch",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "Elder Tangleclaw",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "Khalith the Dreadspinner",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "Well of Sorrow",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "Amethrax",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "Del'lynar Songwood",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "Ravus and Darlissa",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "Sonya Darkhallow",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
	},
}

data["HyjalSummit"] = {
	name = "Hyjal Summit",
	ContentType = RAID20_CONTENT,
	LoadDifficulty = RAID20_DIFF,
	LevelRange = {60, 60, 60},
	items = {
		{
			name = "Bandalar",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "Time-Lost Battalion",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "Old Gloomlurker",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "Kathris the Haunted",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "Elder Minderel",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "Council of Thorns",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "The Wild King",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "Ancient of Decay",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "Sylvesteris Dusksong",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "Gharalis the Abyssal",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "Anara Chillwind",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "Tracker Stillwind",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
		{
			name = "Nythus the Dreambound",
			[RAID20_DIFF] = {
				{ 1, "INV_Box_01", nil, "Loot not yet available", nil },
			},
		},
	},
}
