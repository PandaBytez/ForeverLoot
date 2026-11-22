AtlasLoot.AtlasLootDBDefaults = {
	profile = {
		-- tooltip
		showTooltipInfoGlobal = false,
		showIDsInTT = false,
		showItemLvlInTT = true,
		showCompanionLearnedInfo = true,
		showLvlRange = true,
		enableBossLevel = false,
		showMinEnterLvl = false,
		enableWoWHeadIntegration = true,
		useEnglishWoWHead = false,
		enableAutoSelect = true,
		enableAutoSelectBoss = true,
		showDropRate = true,
		enableAtlasMapIntegration = true,
		enableColorsInNames = true,
		ContentPhase = {
			enableOnLootTable = false,
			enableOnItems = false,
			enableOnCrafting = false,
			enableOnSets = false,
			enableTT = false,
		},
		Tooltip = {	-- Core\Tooltip.lua
			tooltip = "AtlasLootTooltip",
			useGameTooltip = true,
		},
		GUI = {		-- GUI\GUI.lua
			point = {"CENTER"},
			DefaultFrameLocked = false,
			selected = {"ForeverLoot_DungeonsAndRaids", "Deadmines", 1, 0},
			selectedGameVersion = AtlasLoot:GetGameVersion(),
			classFilter = false,
			autoselect = true,
			ExpansionIcon = true,
			mainFrame = {
				bgColor = {r = 0.10, g = 0.08, b = 0.06, a = 0.68},
				scale = 1,
				title = {
					bgColor = { r = 0.16, g = 0.12, b = 0.08, a = 0.85 },
					textColor = {r = 1, g = 0.82, b = 0, a = 1},
					size = 12,
					font = "Friz Quadrata TT",
				},
			},
			contentTopBar = {
				bgColor = {r = 0.14, g = 0.11, b = 0.08, a = 0.70},
				useContentColor = true,
				font = {
					color = {r = 1, g = 0.82, b = 0, a = 1},
					size = 16,
					font = "Friz Quadrata TT",
				},
			},
			content = {
				showBgImage = false,
				bgColor = {r = 0.08, g = 0.06, b = 0.04, a = 0.35},
			},
			contentBottomBar = {
				bgColor = {r = 0.12, g = 0.09, b = 0.07, a = 0.60},
				useContentColor = false,
			},
		},
		OptionsFrame = {
			point = { "CENTER", nil, "CENTER", 0, 0 },
		},
		Map = {		-- Map\
			point = {"CENTER"},
			locked = false,
		},
		WorldMap = {
			showbutton = true,
			buttonOnTitleBar = true,
		},
		minimap = {
			shown = true,
			locked = false,
			minimapPos = 218,
		},
		Button = {	-- Button / ClickHandler
			["*"] = {
				types = {
					["*"] = false
				}
			}
		},
		Addons = {},
	},
	global = {
		Addons = {},
		VendorPrice = {}
	}
}