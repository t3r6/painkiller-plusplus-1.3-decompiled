VideoOptions =
{
	bgStartFrame = { 120, 243, 268 },
	bgEndFrame   = { 180, 267, 291 },
	
	textColor	= R3D.RGBA( 255, 255, 255, 255 ),
	disabledColor = R3D.RGBA( 155, 155, 155, 255 ),
	
	fontBigTex  = "font_texturka_alpha",
	fontSmallTex  = "font_texturka_alpha",
	descColor	= R3D.RGB( 255, 255, 255 ),
	
	fontBigSize = 30,

	backAction = "PainMenu:ApplySettings(false); PainMenu:SetWarpEffects(); PainMenu:SetBloom(); Cfg:Save(); PainMenu:ActivateScreen(OptionsMenu)",
	applyAction = "PainMenu:ApplySettings(true); PainMenu:ReloadWeaponsTextures(); PainMenu:SetWaterQuality(); PainMenu:SetWarpEffects(); PainMenu:SetBloom(); PainMenu:SetShadowsQuality(); PainMenu:ApplyVideoSettings(); PMENU.SetItemVisibility('ApplyButton',false)",
	
--	sliderWidth = 180,

	items =
	{
		GeneralTab =
		{
			type = MenuItemTypes.TabGroup,
			x = 122,
			y = 70,
			width = 776,
			height = 560,
			visible = true,
			align = MenuAlign.Left,
			
			items =
			{
				Resolution =
				{
					type = MenuItemTypes.TextButtonEx,
					text = TXT.Menu.Resolution,
					desc = TXT.MenuDesc.Resolution,
					option = "Resolution",
					values = { "640X480", "800X600", "1024X768", "1152X864", "1280X960", "1600X1200", "1920X1440", "2048X1536" },
					visible = { "640x480", "800x600", "1024x768", "1152x864", "1280x960", "1600x1200", "1920x1440", "2048x1536" },
					x	 = -1,
					y	 = 150,
					action = "",
					applyRequired = true,
--					align = MenuAlign.Left,
				},
--[[				
				Fullscreen =
				{
					type = MenuItemTypes.Checkbox,
					text = TXT.Menu.Fullscreen,
					desc = TXT.MenuDesc.Fullscreen,
					option = "Fullscreen",
					valueOn = true,
					valueOff = false,
					x	 = -1,
					y	 = 152,
					action = "",
					applyRequired = true,
					disabled = 1,
					align = MenuAlign.Right,
				},
]]--
				GraphicsQuality =
				{
					type = MenuItemTypes.TextButtonEx,
					text = TXT.Menu.GraphicsQuality,
					desc = TXT.MenuDesc.GraphicsQuality,
					option = "GraphicsQuality",
					values = { 0, 1, 2, 3, 4, 5, 6 },
					visible = { TXT.Menu.Custom, TXT.Menu.Fastest, TXT.Menu.Fast, TXT.Menu.Standard, TXT.Menu.High, TXT.Menu.VeryHigh, TXT.Menu.Insane },
					x	 = -1,
					y	 = 200,
					action = "",
					applyRequired = true,
				},
				
				TextureQuality =
				{
					type = MenuItemTypes.StaticText,
		--			type = MenuItemTypes.TextButtonEx,
					text = TXT.Menu.TextureQualityBig..":",
		--			desc = TXT.MenuDesc.TextureQuality,
		--			option = "TextureQuality",
		--			values = { 3, 2, 1, 0 },
		--			visible = { TXT.Menu.VeryLow, TXT.Menu.Low, TXT.Menu.Medium, TXT.Menu.High },
					x	 = -1,
					y	 = 260,
					action = "",
					applyRequired = true,
		--			disabled = 1,
		--			align = MenuAlign.Left,
				},
				
				TextureQualityWeapons =
				{
					type = MenuItemTypes.TextButtonEx,
					text = TXT.Menu.Weapons,
					desc = TXT.MenuDesc.Weapons,
					option = "TextureQualityWeapons",
					values = { 3, 2, 1, 0 },
					visible = { TXT.Menu.VeryLow, TXT.Menu.Low, TXT.Menu.Medium, TXT.Menu.High },
					x	 = -1,
					y	 = 320,
					action = "",
					applyRequired = true,
		--			disabled = 1,
					align = MenuAlign.Left,
				},
				
				TextureQualityArchitecture =
				{
					type = MenuItemTypes.TextButtonEx,
					text = TXT.Menu.Architecture,
					desc = TXT.MenuDesc.Architecture,
					option = "TextureQualityArchitecture",
					values = { 3, 2, 1, 0 },
					visible = { TXT.Menu.VeryLow, TXT.Menu.Low, TXT.Menu.Medium, TXT.Menu.High },
					x	 = -1,
					y	 = 370,
					action = "",
					applyRequired = true,
		--			disabled = 1,
					align = MenuAlign.Left,
				},
				
				TextureQualityCharacters =
				{
					type = MenuItemTypes.TextButtonEx,
					text = TXT.Menu.Characters,
					desc = TXT.MenuDesc.Characters,
					option = "TextureQualityCharacters",
					values = { 3, 2, 1, 0 },
					visible = { TXT.Menu.VeryLow, TXT.Menu.Low, TXT.Menu.Medium, TXT.Menu.High },
					x	 = -1,
					y	 = 310,
					action = "",
					applyRequired = true,
		--			disabled = 1,
					align = MenuAlign.Right,
				},
				
				TextureQualitySkies =
				{
					type = MenuItemTypes.TextButtonEx,
					text = TXT.Menu.Skies,
					desc = TXT.MenuDesc.Skies,
					option = "TextureQualitySkies",
					values = { 3, 2, 1, 0 },
					visible = { TXT.Menu.VeryLow, TXT.Menu.Low, TXT.Menu.Medium, TXT.Menu.High },
					x	 = -1,
					y	 = 370,
					action = "",
					applyRequired = true,
		--			disabled = 1,
					align = MenuAlign.Right,
				},

				Gamma =
				{
					type = MenuItemTypes.Slider,
					text = TXT.Menu.Gamma,
					desc = TXT.MenuDesc.Gamma,
					option = "Gamma",
					minValue = 0,
					maxValue = 5,
					isFloat = true,
					x	 = 160,
					y	 = 430,
					action = "PainMenu:VideoChangeGamma()",
		--			align = MenuAlign.Right,
		--			fullWidth = true,
				},

				Brightness =
				{
					type = MenuItemTypes.Slider,
					text = TXT.Menu.Brightness,
					desc = TXT.MenuDesc.Brightness,
					option = "Brightness",
					minValue = 0,
					maxValue = 1,
					isFloat = true,
					x	 = 160,
					y	 = 480,
					action = "PainMenu:VideoChangeGamma()",
		--			align = MenuAlign.Right,
		--			fullWidth = true,
				},

				Contrast =
				{
					type = MenuItemTypes.Slider,
					text = TXT.Menu.Contrast,
					desc = TXT.MenuDesc.Contrast,
					option = "Contrast",
					minValue = 0,
					maxValue = 1,
					isFloat = true,
					x	 = 160,
					y	 = 530,
					action = "PainMenu:VideoChangeGamma()",
		--			align = MenuAlign.Right,
		--			fullWidth = true,
				},
				maxfps =
				{
					type = MenuItemTypes.Slider,
					text = "Max FPS",
					desc = "Set the maximum framerate in game",
					option = "MaxFpsMP",
					minValue = 0,
					maxValue = 125, --maxValue = 250,
					x	 = 160,
					y	 = 580,
					action = "",
					applyRequired = false,
				},
			},
		},
		
		AdvancedTab =
		{
			type = MenuItemTypes.TabGroup,
			x = 122,
			y = 70,
			width = 776,
			height = 560,
			visible = false,
			align = MenuAlign.Right,

			items = 
			{
				Shadows =
				{
					type = MenuItemTypes.Checkbox,
					text = TXT.Menu.Shadows,
					desc = TXT.MenuDesc.Shadows,
					option = "Shadows",
					valueOn = 1,
					valueOff = 0,
					x	 = -1,
					y	 = 142,
					action = "",
					applyRequired = true,
					align = MenuAlign.Left,
					warning = true,
					descColor	= R3D.RGB( 255, 0, 0 ),
				},
				
				WeatherEffects =
				{
					type = MenuItemTypes.Checkbox,
					text = TXT.Menu.WeatherEffects,
					desc = TXT.MenuDesc.WeatherEffects,
					option = "WeatherEffects",
					valueOn = true,
					valueOff = false,
					x	 = -1,
					y	 = 192,
					action = "",
					align = MenuAlign.Left,
					applyRequired = true,
				},
				
				RenderSky =
				{
					type = MenuItemTypes.TextButtonEx,
					text = TXT.Menu.Sky,
					desc = TXT.MenuDesc.Sky,
					option = "RenderSky",
					values = { 0, 1, 2, 3 },
					visible = { "Ultralow", TXT.Menu.Low2, TXT.Menu.High2, "Black" },
					x	 = -1,
					y	 = 352,
					action = "",
					align = MenuAlign.Right,
					applyRequired = true,
				},

				ViewWeaponModel =
				{
					type = MenuItemTypes.Checkbox,
					text = TXT.Menu.ViewWeapon,
					desc = TXT.MenuDesc.ViewWeapon,
					option = "ViewWeaponModel",
					valueOn = true,
					valueOff = false,
					x	 = -1,
					y	 = 292,
					action = "",
					align = MenuAlign.Left,
					applyRequired = true,
					warning = true,
					descColor	= R3D.RGB( 255, 0, 0 ),
				},
--[[
				WeaponSpecular =
				{
					type = MenuItemTypes.Checkbox,
					text = TXT.Menu.WeaponSpecular,
					desc = TXT.MenuDesc.WeaponSpecular,
					option = "WeaponSpecular",
					valueOn = true,
					valueOff = false,
					x	 = -1,
					y	 = 392,
					action = "",
					applyRequired = true,
					align = MenuAlign.Left,
					warning = true,
				},
]]--
				HiResWeapon =
				{
					type = MenuItemTypes.Checkbox,
					text = TXT.Menu.HiResWeapon,
					desc = TXT.MenuDesc.HiResWeapon,
					option = "WeaponNormalMap",
					valueOn = true,
					valueOff = false,
					x	 = -1,
					y	 = 392,
					action = "",
					applyRequired = true,
					align = MenuAlign.Left,
					warning = true,
				},

				Bloom =
				{
					type = MenuItemTypes.Checkbox,
					text = TXT.Menu.Bloom,
					desc = TXT.MenuDesc.Bloom,
					option = "Bloom",
					valueOn = true,
					valueOff = false,
					x	 = -1,
					y	 = 442,
					action = "",
					align = MenuAlign.Left,
					applyRequired = false,
					warning = false,
--					descColor	= R3D.RGB( 255, 0, 0 ),
				},
--[[
				WeaponNormalMap =
				{
					type = MenuItemTypes.Checkbox,
					text = TXT.Menu.WeaponNormalMap,
					desc = TXT.MenuDesc.WeaponNormalMap,
					option = "WeaponNormalMap",
					valueOn = true,
					valueOff = false,
					x	 = -1,
					y	 = 492,
					action = "PainMenu:CheckWeaponSpecular()",
					applyRequired = true,
					align = MenuAlign.Left,
					warning = true,
				},
]]--

				WaterFX =
				{
					type = MenuItemTypes.TextButtonEx,
					text = TXT.Menu.WaterFX,
					desc = TXT.MenuDesc.WaterFX,
					option = "WaterFX",
					values = { 0, 1 },
					visible = { TXT.Menu.Low2, TXT.Menu.High2 },
					x	 = -1,
					y	 = 204,
					action = "",
					align = MenuAlign.Right,
					applyRequired = true,
				},

				WarpEffects =
				{
					type = MenuItemTypes.Checkbox,
					text = TXT.Menu.WarpEffects,
					desc = TXT.MenuDesc.WarpEffects,
					option = "WarpEffects",
					valueOn = true,
					valueOff = false,
					x	 = -1,
					y	 = 492,
					action = "",
					align = MenuAlign.Right,
					applyRequired = false,
					warning = false,
--					descColor	= R3D.RGB( 255, 0, 0 ),
				},

				TexFiltering =
				{
					type = MenuItemTypes.TextButtonEx,
					text = TXT.Menu.TextureFiltering,
					desc = TXT.MenuDesc.TextureFiltering,
					option = "TextureFiltering",
					values = { "Bilinear", "Trilinear", "Anisotropic" },
					visible = { TXT.Menu.Bilinear, TXT.Menu.Trilinear, TXT.Menu.Anisotropic },
--					values = { "Bilinear", "Trilinear" },
--					visible = { TXT.Menu.Bilinear, TXT.Menu.Trilinear },
					x	 = -1,
					y	 = 454,
					action = "",
					align = MenuAlign.Right,
					applyRequired = true,
--					disabled = 1,
				},
				
				LowQualityMultiplayerSFX =
				{
					type = MenuItemTypes.Checkbox,
					text = TXT.Menu.LowQualityMultiplayerSFX,
					desc = TXT.MenuDesc.LowQualityMultiplayerSFX,
					option = "LowQualityMultiplayerSFX",
					valueOn = true,
					valueOff = false,
					x	 = -1,
					y	 = 342,
					action = "",
					align = MenuAlign.Left,
				},
				
				Multisample =
				{
					type = MenuItemTypes.TextButtonEx,
					text = TXT.Menu.Multisample,
					desc = TXT.MenuDesc.Multisample,
					option = "Multisample",
					values = { "x0", "x2", "x4", "x6" },
					visible = { TXT.None, "x2", "x4", "x6" },
					x	 = -1,
					y	 = 404,
					action = "",
					applyRequired = true,
					align = MenuAlign.Right,
				},
				
				DynLights =
				{
					type = MenuItemTypes.TextButtonEx,
					text = TXT.Menu.DynamicLights,
					desc = TXT.MenuDesc.DynamicLights,
					option = "DynamicLights",
					values = { 0, 1, 2 },
					visible = { TXT.Off, TXT.Menu.Normal, TXT.Menu.Ultra },
					x	 = -1,
					y	 = 154,
					action = "",
					align = MenuAlign.Right,
					applyRequired = true,
					warning = true,
					descColor	= R3D.RGB( 255, 0, 0 ),
				},
--[[
				DynLights =
				{
					type = MenuItemTypes.Checkbox,
					text = TXT.Menu.DynamicLights,
					desc = TXT.MenuDesc.DynamicLights,
					option = "DynamicLights",
					valueOn = true,
					valueOff = false,
					x	 = -1,
					y	 = 142,
					action = "",
					align = MenuAlign.Right,
					applyRequired = true,
					warning = true,
					descColor	= R3D.RGB( 255, 0, 0 ),
				},
]]--				
				Particles =
				{
					type = MenuItemTypes.TextButtonEx,
					text = TXT.Menu.Particles,
					desc = TXT.MenuDesc.Particles,
					option = "ParticlesDetail",
					values = { 1, 2 },
					visible = { TXT.Menu.Low2, TXT.Menu.High2 },
					x	 = -1,
					y	 = 254,
					action = "",
					align = MenuAlign.Right,
					applyRequired = true,
					warning = true,
					descColor	= R3D.RGB( 255, 0, 0 ),
				},
				
				DecalsStay =
				{
					type = MenuItemTypes.TextButtonEx,
					text = TXT.Menu.DecalsStay,
					desc = TXT.MenuDesc.DecalsStay,
					option = "DecalsStayTime",
					values = { 1000, 2.0, 1.0, 0.6, 0.4, 0.2 },
					visible = { "Off", "x1", "x2", "x3", "x4", "x5" },
					x	 = -1,
					y	 = 304,
					action = "",
					align = MenuAlign.Right,
					applyRequired = true,
				},

				Coronas =
				{
					type = MenuItemTypes.Checkbox,
					text = TXT.Menu.Coronas,
					desc = TXT.MenuDesc.Coronas,
					option = "Coronas",
					valueOn = true,
					valueOff = false,
					x	 = -1,
					y	 = 492,
					action = "",
					align = MenuAlign.Left,
					applyRequired = true,
				},

				DetailTextures =
				{
					type = MenuItemTypes.Checkbox,
					text = TXT.Menu.DetailTextures,
					desc = TXT.MenuDesc.DetailTextures,
					option = "DetailTextures",
					valueOn = true,
					valueOff = false,
					x	 = -1,
					y	 = 242,
					action = "",
					align = MenuAlign.Left,
					applyRequired = true,
--					disabled = 1,
				},
				
				ClipPlane =
				{
					type = MenuItemTypes.Slider,
					text = TXT.Menu.ClipPlane,
					desc = TXT.MenuDesc.ClipPlane,
					option = "ClipPlane",
					minValue = 0,
					maxValue = 100,
					x	 = 160,
					y	 = 570,
					action = "",
					applyRequired = true,
				},
			},
		},

		GeneralSettings =
		{
			text = TXT.Menu.General,
			desc = TXT.MenuDesc.General,
			x	 = 212,
			y	 = 96,
			align = MenuAlign.Center,
			action = "PainMenu:HideTabGroup(PainMenu.currScreen.items.AdvancedTab, 'AdvancedTab'); PainMenu:ShowTabGroup(PainMenu.currScreen.items.GeneralTab, 'GeneralTab')",
			sndAccept   = "menu/magicboard/card-take",
			fontBigSize = 26,
		},
		
		AdvancedSettings =
		{
			text = TXT.Menu.Advanced,
			desc = TXT.MenuDesc.Advanced,
			x	 = 392,
			y	 = 96,
			align = MenuAlign.Center,
			action = "PainMenu:HideTabGroup(PainMenu.currScreen.items.GeneralTab, 'GeneralTab'); PainMenu:ShowTabGroup(PainMenu.currScreen.items.AdvancedTab, 'AdvancedTab')",
			sndAccept   = "menu/magicboard/card-take",
			fontBigSize = 26,
		},
--OriOn_Modification=########################################################################
		PrOSettings =
		{
			text = "FX",
			desc = "",
			x	 = 540,
			y	 = 96,
			align = MenuAlign.Center,
			action = "PainMenu:ApplySettings(); PainMenu:ActivateScreen(ProSettings)",
			sndAccept   = "menu/magicboard/card-take",
			fontBigSize = 26,
		},	
		ProdBorder =
		{
			type = MenuItemTypes.Border,
			x = 477,
			y = 80,
			width = 120,
			height = 44,
		},
		EmptyBorder =
		{
			type = MenuItemTypes.Border,
			x = 122,
			y = 120,
			width = 776,
			height = 513,
		},
	}
}
ProSettings = 
{

	bgStartFrame = { 120, 243, 268 },
	bgEndFrame   = { 180, 267, 291 },

	fontBigSize = 26,

	backAction = "PainMenu:ApplySettings(); PainMenu:AdjustFov(); PainMenu:ActivateScreen(OptionsMenu)",
	applyAction = "PainMenu:WeaponsIcons(); PainMenu:ApplySettings(true); PMENU.SetItemVisibility('ApplyButton',false)",

--Favorites HUD
	items =
	{
		ProItemsBorder =
		{
			type = MenuItemTypes.Border,
			x = 122,
			y = 120,
			width = 776,
			height = 523,
		},	
		--[[fov =
		{
			type = MenuItemTypes.Slider,
			text = "Fov",
			desc = "Set the field of view",
			option = "FOV",
			minValue = 95,
			maxValue = 150,
			x	 = 160,
			y	 = 182,
			action = "",
			applyRequired = false,
		},]]--
		
		blood =
		{
			type = MenuItemTypes.Checkbox,
			text = "NoBlood",
			desc = "Sets the blood",
			option = "NoBlood",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 142,
			action = "",
			align = MenuAlign.Left,
			applyRequired = false,
		},
		NoExplosions =
		{
			type = MenuItemTypes.Checkbox,
			text = "NoExplosions",
			desc = "Sets explosions",
			option = "NoExplosions",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 182,
			action = "",
			align = MenuAlign.Left,
			applyRequired = false,
		},
		Noflames =
		{
			type = MenuItemTypes.Checkbox,
			text = "NoFlames",
			desc = "Sets flames",
			option = "NoFlames",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 222,
			action = "",
			align = MenuAlign.Left,
			applyRequired = false,
		},
		gibs =
		{
			type = MenuItemTypes.Checkbox,
			text = "NoGibs",
			desc = "Sets the gibs",
			option = "NoGibs",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 262,
			action = "",
			align = MenuAlign.Left,
			applyRequired = false,
		},
		NoSmoke =
		{
			type = MenuItemTypes.Checkbox,
			text = "NoSmoke",
			desc = "Sets the smoke",
			option = "NoSmoke",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 302,
			action = "",
			align = MenuAlign.Left,
			applyRequired = false,
		},
		Respawn =
		{
			type = MenuItemTypes.Checkbox,
			text = "No Respawn FX",
			desc = "Sets the respawn effect",
			option = "NoSpawnEffects",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 342,
			action = "",
			align = MenuAlign.Left,
			applyRequired = false,
		},
		NoPickupFX =
		{
			type = MenuItemTypes.Checkbox,
			text = "No Pickup FX",
			desc = "Sets the pickup effect",
			option = "NoPickupFX",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 382,
			action = "",
			align = MenuAlign.Left,
			applyRequired = false,
		},
		NoDamageFX =
		{
			type = MenuItemTypes.Checkbox,
			text = "No Dammage FX",
			desc = "Sets the dammage effect",
			option = "NoDamageFX",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 422,
			action = "",
			align = MenuAlign.Left,
			applyRequired = false,
		},
		NoMuzzleFlash =
		{
			type = MenuItemTypes.Checkbox,
			text = "No MuzzleFlash FX",
			desc = "Sets the MuzzleFlash effect",
			option = "NoMuzzleFlashFX",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 462,
			action = "",
			align = MenuAlign.Left,
			applyRequired = false,
		},
		NoImpact =
		{
			type = MenuItemTypes.Checkbox,
			text = "No Impact FX",
			desc = "Sets the Impact effect",
			option = "NoImpactFX",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 502,
			action = "",
			align = MenuAlign.Left,
			applyRequired = false,
		},
		coloreditems =
		{
			type = MenuItemTypes.Checkbox,
			text = "Brightskins Ammo",
			desc = "Sets a colored brightskins for ammunition",
			option = "BrightAmmo",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 542,
			action = "PainMenu:ApplySettings(); PainMenu:NeedRestartGame('ProSettings')",
			align = MenuAlign.Left,
			applyRequired = false,
		},
		coloredarmors =
		{
			type = MenuItemTypes.Checkbox,
			text = "Brightskins Armors",
			desc = "Sets a colored brightskins for armors",
			option = "BrightSkinsArmors",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 582,
			action = "PainMenu:ApplySettings(); PainMenu:NeedRestartGame('ProSettings')",
			align = MenuAlign.Left,
			applyRequired = false,
		},
		
		--[[TeammateIcon =
		{
			type = MenuItemTypes.Checkbox,
			text = "Teammate's icon",
			desc = "Show a icon above the teammate's head",
			option = "TeammateIcon",
			valueOn = true,
			valueOff = false,
			x	 = 160,
			y	 = 582,
			action = "",
			align = MenuAlign.None,
			applyRequired = false,
		},]]
		
		notrailstake =
		{
			type = MenuItemTypes.Checkbox,
			text = "NoTrailStake",
			desc = "Sets the trail stake",
			option = "NoTrailStake",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 142,
			action = "",
			align = MenuAlign.Right,
			applyRequired = false,
		},
		notrailfreezer =
		{
			type = MenuItemTypes.Checkbox,
			text = "NoTrailFreezer",
			desc = "Sets the trail freezer",
			option = "NoTrailFreezer",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 182,
			action = "",
			align = MenuAlign.Right,
			applyRequired = false,
		},
		notrailgrenade =
		{
			type = MenuItemTypes.Checkbox,
			text = "NoTrailGrenade",
			desc = "Sets the trail grenade",
			option = "NoTrailGrenade",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 222,
			action = "",
			align = MenuAlign.Right,
			applyRequired = false,
		},
		notrailrocket =
		{
			type = MenuItemTypes.Checkbox,
			text = "NoTrailRocket",
			desc = "Sets the trail rocket",
			option = "NoTrailRocket",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 262,
			action = "",
			align = MenuAlign.Right,
			applyRequired = false,
		},
		notrailshuriken =
		{
			type = MenuItemTypes.Checkbox,
			text = "NoTrailShuriken",
			desc = "Sets the trail shuriken",
			option = "NoTrailShuriken",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 302,
			action = "",
			align = MenuAlign.Right,
			applyRequired = false,
		},
		notrailbolt =
		{
			type = MenuItemTypes.Checkbox,
			text = "NoTrailBolt",
			desc = "Sets the trail bolt",
			option = "NoTrailBolt",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 342,
			action = "",
			align = MenuAlign.Right,
			applyRequired = false,
		},
		notrailheater =
		{
			type = MenuItemTypes.Checkbox,
			text = "NoTrailHeater",
			desc = "Sets the trail heater",
			option = "NoTrailHeater",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 382,
			action = "",
			align = MenuAlign.Right,
			applyRequired = false,
		},
		ThinShaft =
		{
			type = MenuItemTypes.Checkbox,
			text = "ThinShaft",
			desc = "",
			option = "ThinShaft",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 422,
			action = "",
			align = MenuAlign.Right,
			applyRequired = false,
		},
		PicmipFX =
		{
			type = MenuItemTypes.Checkbox,
			text = "Picmip Textures",
			desc = "Picmip Textures",
			option = "PicmipFX",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 462,
			action = "PainMenu:ApplySettings(); PainMenu:NeedRestartGame('ProSettings')",
			align = MenuAlign.Right,
			applyRequired = false,
		},
		SimpleItems =
		{
			type = MenuItemTypes.Checkbox,
			text = "SimpleItems",
			desc = "Maps items showed in 2D (performance boost)",
			option = "SimpleItems",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 502,
			action = "PainMenu:ApplySettings(); PainMenu:NeedReconnection(0)",
			align = MenuAlign.Right,
			applyRequired = false,
		},
		weaponsicons =
		{
			type = MenuItemTypes.TextButtonEx,
			text = "Weapons icon",
			desc = "Sets a icon above the weapons (Need reconnection)",
			option = "WeaponsIcons",
			values = { 0, 1, 2 },
			visible = { "None", "Classic", "Pro" },
			x	 = -1,
			y	 = 552,
			action = "",
			align = MenuAlign.Right,
			applyRequired = true,
		},
		TeammateIcon =
		{
			type = MenuItemTypes.TextButtonEx,
			text = "Teammate's icon",
			desc = "Show a icon above the teammate's head",
			option = "TeammateIcon",
			values = { 0, 1, 2 },
			visible = { "None", "Classic", "Pro" },
			x	 = -1,
			y	 = 592,
			action = "",
			align = MenuAlign.Right,
			applyRequired = false,
		},
		GeneralSettingsBorder =
		{
			type = MenuItemTypes.Border,
			x = 122,
			y = 80,
			width = 180,
			height = 44,
		},	
		AdvancedSettingsBorder =
		{
			type = MenuItemTypes.Border,
			x = 297,
			y = 80,
			width = 185,
			height = 44,
		},
		
		PrOSettings =
		{
			text = "FX",
			desc = "",
			x	 = 540,
			y	 = 88,
			align = MenuAlign.Center,
			action = "",
			sndAccept   = "menu/magicboard/card-take",
			fontBigSize = 26,
		},
		Border =
		{
			type = MenuItemTypes.Border,
			x = 477,
			y = 70,
			width = 120,
			height = 54,
			dark = true,
		},
		GeneralSettings =
		{
			text = TXT.Menu.General,
			desc = TXT.MenuDesc.General,
			x	 = 212,
			y	 = 96,
			align = MenuAlign.Center,
			action = "PainMenu:ApplySettings(); PainMenu:ActivateScreen(VideoOptions); PainMenu:HideTabGroup(PainMenu.currScreen.items.AdvancedTab, 'AdvancedTab'); PainMenu:ShowTabGroup(PainMenu.currScreen.items.GeneralTab, 'GeneralTab')",
			sndAccept   = "menu/magicboard/card-take",
			fontBigSize = 26,
		},
		
		AdvancedSettings =
		{
			text = TXT.Menu.Advanced,
			desc = TXT.MenuDesc.Advanced,
			x	 = 392,
			y	 = 96,
			align = MenuAlign.Center,
			action = "PainMenu:ApplySettings(); PainMenu:ActivateScreen(VideoOptions); PainMenu:HideTabGroup(PainMenu.currScreen.items.GeneralTab, 'GeneralTab'); PainMenu:ShowTabGroup(PainMenu.currScreen.items.AdvancedTab, 'AdvancedTab')",
			sndAccept   = "menu/magicboard/card-take",
			fontBigSize = 26,
		},
		EmptyBorder =
		{
			type = MenuItemTypes.Border,
			x = 122,
			y = 120,
			width = 776,
			height = 523,
		},
	},	
}
--OriOn_Modification=end=########################################################################