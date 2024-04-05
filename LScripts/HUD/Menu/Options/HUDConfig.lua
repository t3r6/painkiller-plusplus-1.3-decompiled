HUDConfig =
{
	bgStartFrame = { 120, 243, 268 },
	bgEndFrame   = { 180, 267, 291 },

	fontBigSize = 26,
	--fontBig		= "timesbd",
	--fontSmall	= "timesbd",
	textColor	= R3D.RGBA( 255, 255, 255, 255 ),
	disabledColor = R3D.RGBA( 155, 155, 155, 255 ),
	
	fontBigTex  = "font_texturka_alpha",
	fontSmallTex  = "font_texturka_alpha",
	descColor	= R3D.RGB( 255, 255, 255 ),

	backAction = "PainMenu:ApplySettings(); PainMenu:AdjustFov(); HUD.SetTransparency(Cfg.HUDTransparency); PainMenu:ActivateScreen(OptionsMenu)", --PainMenu:ApplySettings(true)
	applyAction = "",
--OriOn_Modification=########################################################################
	--[[items =
	{
		HUDBorder =
		{
			type = MenuItemTypes.Border,
			x = 120,
			y = 80,
			width = 784,
			height = 180,
		},
		
		
	}]]--

	items =
	{
		GeneralTab =
		{
			type = MenuItemTypes.TabGroup,
			x = 122,
			y = 70,
			width = 776,
			height = 460,
			visible = true,
			align = MenuAlign.Left,
			
			items =
			{
				
				fov =
				{
					type = MenuItemTypes.Slider,
					text = "Fov",
					desc = "Set the field of view of zoom",
					option = "FOV",
					minValue = 95,
					maxValue = 150,
					x	 = 160,
					y	 = 152,
					action = "",
					applyRequired = false,
				},
				zoomfov =
				{
					type = MenuItemTypes.Slider,
					text = "Zoom Fov",
					desc = "Set the field of view for zoom",
					option = "ZoomFOV",
					minValue = 0,
					maxValue = 95,
					x	 = 160,
					y	 = 192,
					action = "",
					applyRequired = false,
					disabled = 1,
				},	
				HeadBob =
				{
					type = MenuItemTypes.Slider,
					text = TXT.Menu.HeadBob,
					desc = TXT.MenuDesc.HeadBob,
					option = "HeadBob",
					minValue = 0,
					maxValue = 100,
					x	 = 160,
					y	 = 232,
					action = "",
				},
				
				HUDTransparency =
				{
					type = MenuItemTypes.Slider,
					text = TXT.Menu.HUDTransparency,
					desc = TXT.MenuDesc.HUDTransparency,
					option = "HUDTransparency",
					minValue = 0,
					maxValue = 100,
					x	 = 160,
					y	 = 282,
					action = "",
				},
				HUDSize =
				{
					type = MenuItemTypes.TextButtonEx,
					text = TXT.Menu.HUDSize,
					desc = TXT.MenuDesc.HUDSize,
					option = "HUDSize",
					values = { 0.6, 1.0, 1.5 },
					visible = { TXT.Menu.Small, TXT.Menu.Normal, TXT.Menu.Large },
					x	 = 160,
					y	 = 352,
					action = "",
					align = MenuAlign.None,
				},
				showtimer =
				{
					type = MenuItemTypes.TextButtonEx,
					text = "Timer",
					desc = "Set the timer on screen",
					option = "HUD_Show_Timer",
					values = { 0, 1, 2 },
					visible = { "None", "CountDown", "CountUp" },
					x	 = 160,
					y	 = 392,
					action = "",
					align = MenuAlign.None,
					applyRequired = false,
				},
				--[[positioningsystem =
				{
					type = MenuItemTypes.TextButtonEx,
					text = "SuperHUD",
					desc = "Customises yours HUD elements",
					option = "PositioningSystem",
					values = { 0, 1, 2, 3, 4, 5},
					visible = { "Weapons", "Scores", "AmmoList", "HUD", "Infos", "Misc"},
					x	 = 160,
					y	 = 432,
					action = "",
					align = MenuAlign.None,
					applyRequired = false,
				},]]
				
				speedmeter =
				{
					type = MenuItemTypes.TextButtonEx,
					text = "Speedmeter",
					desc = "Set the Speedmeter to the screen",
					option = "HUD_Show_Speedmeter",
					values = { 0, 1, 2, 3, 4 },
					visible = { "None", "Bar", "Text", "Text+Bar", "Classic" },
					x	 = 160,
					y	 = 432,
					action = "",
					align = MenuAlign.None,
					applyRequired = false,
				},	
				msgconsole =
				{
					type = MenuItemTypes.TextButtonEx,
					text = "Message Console",
					desc = "Set the Messages Console position",
					option = "HUD_ConsolePosition",
					values = { 0, 565 },
					visible = { "Up", "Down"},
					x	 = -1,
					y	 = 352,
					action = "",
					align = MenuAlign.Right,
					applyRequired = false,
				},			
				
				SwitchHudBar =
				{
					type = MenuItemTypes.TextButtonEx,
					text = "HUD bar",
					desc = "Switch the HUD bar items",
					option = "HUD_Switch_HudBar",
					values = { 0, 1},
					visible = {"Health|Armor", "Armor|Health",},
					x	 = -1,
					y	 = 392,
					action = "",
					align = MenuAlign.Right,
					applyRequired = false,
				},
				ammolist =
				{
					type = MenuItemTypes.TextButtonEx,
					text = "AmmoList",
					desc = "Set the Ammolist position",
					option = "HUD_AmmoList",
					values = { 0, 1, 2, 3 },
					visible = { "None", "Right", "Left", "Center" },
					x	 = -1,
					y	 = 432,
					action = "",
					align = MenuAlign.Right,
					applyRequired = false,
				},
				--[[HudStyle =
				{
					type = MenuItemTypes.TextButtonEx,
					text = "HUD Style",
					desc = "Choose a HUD style",
					option = "HUD_HudStyle",
					values = { 0, 1, 2, 3},
					visible = {"Normal", "Pro", "Pro 3D", "HudBar"},
					x	 = 160,
					y	 = 362,
					action = "",
					align = MenuAlign.None,
					applyRequired = false,
				},]]
				
				
				--[[CrosshairBorder =
				{
					type = MenuItemTypes.Border,
					x = 120,
					y = 290,
					width = 784,
					height = 336,
				},]]--

				
			},
		},
		
		AdvancedTab =
		{
			type = MenuItemTypes.TabGroup,
			x = 122,
			y = 70,
			width = 776,
			height = 460,
			visible = false,
			align = MenuAlign.Right,

			items = 
			{
				
				SetCrossPerW =
				{
					type = MenuItemTypes.TextButtonEx,
					text = "Weapon",
					desc = "Choose a weapon and set your crosshair preferences",
					option = "SetCrossPerWeapons",
					values = { 1, 2, 3, 4, 5, 6, 7, 8 },
					--visible = { "PainKiller","Shotgun/Freezer","Stakegun/Grenade launcher","Rocket launcher/Chaingun","Electrodriver/Shuriken launcher","Submachine gun/Flamethrower","Boltgun/Heater", "All" },    
					visible = { "PainKiller","Shotgun/Freezer","Stakegun/Grenade launcher","Rocket launcher/Chaingun","Electrodriver/Shuriken launcher","Rifle","Boltgun/Heater", "All" },    
					--visible = { "Weapon 1","Weapon 2","Weapon 3","Weapon 4","Weapon 5","Weapon 6","Weapon 7", "All weapons" },
					x	 = 160,
					y	 = 152,
					action = "",
					align = MenuAlign.None,
					applyRequired = false,
				},
				
				CrossImage =
				{
					type = MenuItemTypes.SliderImage,
					text = "Style",     
					desc = TXT.MenuDesc.Crosshair,
					option = "Crosshair_PK",
					minValue = 1,
					maxValue = 35,
					x	 = 160,
					y	 = 212,
					action = "",
					images =
					{
						"HUD/crosshair", "HUD/crossy/cross1", "HUD/crossy/cross2", "HUD/crossy/cross3",
						"HUD/crossy/cross4", "HUD/crossy/cross5", "HUD/crossy/cross6", "HUD/crossy/cross7",
						"HUD/crossy/cross8", "HUD/crossy/cross9", "HUD/crossy/cross91", "HUD/crossy/cross92",
						"HUD/crossy/cross93", "HUD/crossy/cross94", "HUD/crossy/cross95", "HUD/crossy/cross96",
						"HUD/crossy/cross97", "HUD/crossy/cross98", "HUD/crossy/cross99", "HUD/crossy/cross991",
						"HUD/crossy/cross992", "HUD/crossy/cross993", "HUD/crossy/cross994", "HUD/crossy/cross995",
						"HUD/crossy/cross996", "HUD/crossy/cross997", "HUD/crossy/cross998", "HUD/crossy/cross999",
						"HUD/crossy/cross9991", "HUD/crossy/cross9992", "HUD/crossy/cross9993", "HUD/crossy/cross9994",
						"Crosshairs/crosshairc", "Crosshairs/crosshairb" 
					}
				},
				CrosshairSise =
				{
					type = MenuItemTypes.Slider,
					text = "Size %",
					desc = "Choose your crosshair's size",
					option = "CrosshairSize_PK",
					minValue = 30,
					maxValue = 200,
					--isFloat = true,
					x	 = 160,
					y	 = 252,
					action = "",
				},
				CrosshairTrans =
				{
					type = MenuItemTypes.Slider,
					text = TXT.Menu.CrosshairTrans,
					desc = TXT.MenuDesc.CrosshairTrans,
					option = "CrosshairTrans_PK",
					minValue = 0,
					maxValue = 100,
--			isFloat = true,
					x	 = 160,
					y	 = 292,
					action = "",
				},
			
				
				CrosshairR =
				{
					type = MenuItemTypes.Slider,
					text = TXT.Menu.CrosshairR,
					desc = TXT.MenuDesc.CrosshairR,
					option = "CrosshairR_PK",
					minValue = 0,
					maxValue = 255,
					x	 = 160,
					y	 = 332,
					action = "",
				},
			
						
				CrosshairG =
				{
					type = MenuItemTypes.Slider,
					text = TXT.Menu.CrosshairG,
					desc = TXT.MenuDesc.CrosshairG,
					option = "CrosshairG_PK",
					minValue = 0,
					maxValue = 255,
					x	 = 160,
					y	 = 372,
					action = "",
				},
				
				
				CrosshairB =
				{
					type = MenuItemTypes.Slider,
					text = TXT.Menu.CrosshairB,
					desc = TXT.MenuDesc.CrosshairB,
					option = "CrosshairB_PK",
					minValue = 0,
					maxValue = 255,
					x	 = 160,
					y	 = 412,
					action = "",
				},
				
				
				
				CrosshairNamesT =
				{
					type = MenuItemTypes.TextButtonEx,
					text = "Names Team",
					desc = "Choose a color name for the Teammates",
					option = "CrosshairNamesT",
					values = { "None", "White", "Red", "Blue", "Green", "Cyan", "Magenta", "Yellow", "Orange", "Pink" },
					visible = { "None", "White", "Red", "Blue", "Green", "Cyan", "Magenta", "Yellow", "Orange", "Pink" },
					x	 = 160,
					y	 = 472,
					action = "",
					fontBigSize = 24,
					align = MenuAlign.None,
					applyRequired = false,
				},
				CrosshairNamesE =
				{
					type = MenuItemTypes.TextButtonEx,
					text = "Names Enemy",
					desc = "Choose a color name for the Enemies",
					option = "CrosshairNamesE",
					values = { "None", "White", "Red", "Blue", "Green", "Cyan", "Magenta", "Yellow", "Orange", "Pink" },
					visible = { "None", "White", "Red", "Blue", "Green", "Cyan", "Magenta", "Yellow", "Orange", "Pink" },
					x	 = 860,
					y	 = 472,
					action = "",
					fontBigSize = 24,
					align = MenuAlign.Right,
					applyRequired = false,
				},
				CrosshairTeamStatus = 
				{
					type = MenuItemTypes.Checkbox,
					text = "Team Status",
					desc = "Set a Status bar for yours Teammates (Health/Armor)",
					option = "CrosshairTeamStatus",
					valueOn = true,
					valueOff = false,
					x	 = 683,
					y	 = 142,
					action = "",
					fontBigSize = 24,
					align = MenuAlign.Right,
					applyRequired = false,
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
			text = TXT.Menu.Crosshair,
			desc = "Crosshair Setting",
			x	 = 392,
			y	 = 96,
			align = MenuAlign.Center,
			action = "PainMenu:HideTabGroup(PainMenu.currScreen.items.GeneralTab, 'GeneralTab'); PainMenu:ShowTabGroup(PainMenu.currScreen.items.AdvancedTab, 'AdvancedTab'); PainMenu:CheckItemsCrosshair()",
			sndAccept   = "menu/magicboard/card-take",
			fontBigSize = 26,
		},
		CrosshairopSettings =
		{
			text = TXT.Menu.Advanced,
			desc = TXT.MenuDesc.Advanced,
			x	 = 572,
			y	 = 96,
			align = MenuAlign.Center,
			action = "PainMenu:ApplySettings();PainMenu:ActivateScreen(crosshairoptions);PainMenu:CheckItems()",
			sndAccept   = "menu/magicboard/card-take",
			fontBigSize = 26,
		},
		CrossdBorder =
		{
			type = MenuItemTypes.Border,
			x = 478,
			y = 80,
			width = 180,
			height = 44,
		},
		FavHudSettings =
		{
			text = "Presets",
			desc = "Loading yours favorites HUDs",
			x	 = 727,
			y	 = 96,
			align = MenuAlign.Center,
			--action = "PainMenu:ApplySettings(); PainMenu:IfDefFavHudExist(); PainMenu:ActivateScreen(FavoriteHud); PainMenu:CheckBackbutton()",
			action = "PainMenu:ApplySettings(); PainMenu:IfDefFavHudExist(); PainMenu:ActivateScreen(FavoriteHud);",
			sndAccept   = "menu/magicboard/card-take",
			fontBigSize = 26,
		},

		FavoriteHudBorder =
		{
			type = MenuItemTypes.Border,
			x = 652,
			y = 80,
			width = 150,
			height = 44,
		},
		EmptyBorder =
		{
			type = MenuItemTypes.Border,
			x = 122,
			y = 120,
			width = 776,
			height = 410,
		},
		
		--[[PrOSettings =
		{
			text = "Plus",
			desc = "",
			x	 = 600,
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
			width = 216,
			height = 44,
		},
		EmptyBorder =
		{
			type = MenuItemTypes.Border,
			x = 122,
			y = 120,
			width = 776,
			height = 513,
		},]]--
	}
}
crosshairoptions = 
{

	bgStartFrame = { 120, 243, 268 },
	bgEndFrame   = { 180, 267, 291 },

	fontBigSize = 26,

	backAction = "PainMenu:ApplySettings(); Hud.CrossScale = Cfg.CrosshairSize; PainMenu:ActivateScreen(OptionsMenu)",
	applyAction = "PainMenu:ApplySettings(true); PMENU.SetItemVisibility('ApplyButton',false)",

	items =
	{
		CrosshairopBorder =
		{
			type = MenuItemTypes.Border,
			x = 122,
			y = 120,
			width = 776,
			height = 410,
		},	
		ShowFPS =
		{
			type = MenuItemTypes.Checkbox,
			text = "FPS",
			desc = "Set the FPS to the screen",
			option = "HUD_Show_FPS",
			valueOn = true,
			valueOff = false,
			x	 = 150,
			y	 = 132,
			action = "",
			align = MenuAlign.None,
			applyRequired = false,
		},
		ShowPing =
		{
			type = MenuItemTypes.Checkbox,
			text = "Ping",
			desc = "Set the Ping to the screen",
			option = "HUD_Show_Ping",
			valueOn = true,
			valueOff = false,
			x	 = 150,
			y	 = 172,
			action = "",
			align = MenuAlign.None,
			applyRequired = false,
		},
		PacketLoss =
		{
			type = MenuItemTypes.Checkbox,
			text = "Packet Loss",
			desc = "Set the Packet Loss to the screen",
			option = "HUD_Show_PacketLoss",
			valueOn = true,
			valueOff = false,
			x	 = 150,
			y	 = 212,
			action = "",
			align = MenuAlign.None,
			applyRequired = false,
		},
		showscore =
		{
			type = MenuItemTypes.Checkbox,
			text = "Score",
			desc = "Set the Scores to the screen",
			option = "HUD_Scores",
			--values = { 0.8, 1.0, 0 },
			--visible = { TXT.Menu.Small, TXT.Menu.Normal, "None" },
			valueOn = true,
			valueOff = false,
			x	 = 150,
			y	 = 252,
			action = "",
			align = MenuAlign.None,
			applyRequired = false,
		},
		FragMessage =
		{
			type = MenuItemTypes.Checkbox,
			text = "Frag message",
			desc = "Set a message when you have fraged an opponent",
			option = "HUD_FragMessage",
			valueOn = true,
			valueOff = false,
			x	 = 150,
			y	 = 292,
			action = "",
			align = MenuAlign.None,
			applyRequired = false,
		},
		currentweapon =
		{
			type = MenuItemTypes.Checkbox,
			text = "Current weapon icon",
			desc = "Set the current weapon icon to the screen",
			option = "HUD_Show_CurrentWeapon_Icon",
			valueOn = true,
			valueOff = false,
			x	 = 150,
			y	 = 332,
			action = "",
			align = MenuAlign.None,
			applyRequired = false,
			--disabled = 1,
		},
		TeamOverlay =
		{
			type = MenuItemTypes.Checkbox,
			text = "Team Overlay",
			desc = "Set the Team Overlay to the screen",
			option = "TeamOverlay",
			valueOn = true,
			valueOff = false,
			x	 = 150,
			y	 = 372,
			action = "PainMenu:ApplySettings()",
			align = MenuAlign.None,
			applyRequired = false,
		},
		
		
		
		--[[infosize =
		{
			type = MenuItemTypes.TextButtonEx,
			text = "Infos size",
			desc = "Set the infos size (fps/ping/pl)",
			option = "HUD_FontSize",
			values = { 0, 1 },
			visible = { TXT.Menu.Small, TXT.Menu.Normal },
			x	 = -1,
			y	 = 162,
			action = "",
			align = MenuAlign.Right,
			applyRequired = false,
		},]]	
		Scoreboard2 =
		{
			type = MenuItemTypes.Checkbox,
			text = "AltScoreboard",
			desc = "Shows the alternative scoreboard.",
			option = "AltScoreboard",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 132,
			action = "PainMenu:ApplySettings(); PainMenu:NeedRestartGame('crosshairoptions')",
			--fontBigSize = 30,
			align = MenuAlign.Right,
		},
		Scoreboard =
		{
			type = MenuItemTypes.Checkbox,
			text = "OldScoreboard",
			desc = "Set the old crappy PCF scoreboard.",
			option = "OldScoreboard",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 172,
			action = "PainMenu:ApplySettings(); PainMenu:NeedRestartGame('crosshairoptions')",
			--fontBigSize = 30,
			align = MenuAlign.Right,
		},
		
		QuitConfirmation =
		{					
			type = MenuItemTypes.Checkbox,
			text = "Quit Confirmation",
			desc = "Quit the game without the confirmation message",
			option = "QuitConfirmation",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 212,
			action = "",
			align = MenuAlign.Right,
			applyRequired = false,
		},
		animated3Dicohud =
		{
			type = MenuItemTypes.Checkbox,
			text = "Animate 3D icons",
			desc = "Set 3D icons animated for custom HUD",
			option = "HUD_3DIcon_Anim",
			--values = { 0, 1, 2, 3},
			--visible = {"None", "All", "Health", "Ammo"},
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 252,
			action = "",
			align = MenuAlign.Right,
			applyRequired = false,
			--disabled = 1,
		},
		WeaponsPos =
		{
			type = MenuItemTypes.Checkbox,
			text = "Weapons position",
			desc = "Set your weapons positions to x/y/z axis",
			option = "WeaponsPositionning",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 292,
			action = "PainMenu:NeedReconnection(1)",
			align = MenuAlign.Right,
			applyRequired = false,
		},
		ShowWeaponAnim =
		{					
			type = MenuItemTypes.Checkbox,
			text = "Weapon animation",
			desc = "Set the classic anim of the current weapon",
			option = "ShowWeaponAnim",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 332,
			action = "PainMenu:NeedReconnection(2)",
			align = MenuAlign.Right,
			applyRequired = false,
		},	
		KeysHelp =
		{
			type = MenuItemTypes.Checkbox,
			text = "SuperHUD help",
			desc = "Set Help for using SuperHUD",
			option = "HelpsOnPressKeys",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 372,
			action = "",
			align = MenuAlign.Right,
			applyRequired = false,
		},
		
		--[[animated3DicoCWhud =
		{
			type = MenuItemTypes.Checkbox,
			text = "Animate current weapon 3D icon",
			desc = "Sets a 3D model with the custom HUD 3D style",
			option = "HUD_3DIcon_AnimCW",
			valueOn = true,
			valueOff = false,
			x	 = -1,
			y	 = 332,
			action = "",
			align = MenuAlign.Right,
			applyRequired = false,
			--disabled = 1,
		},]]
		
		--[[infosposx =
		{
			type = MenuItemTypes.TextButtonEx,
			text = "Infos/Scores",
			desc = "Sets the Infos/Scores (scores, only if default position)",
			option = "HUD_Infos_Posx",
			values = { 0, 1 },
			visible = { "Left/Right", "Right/Left" },
			x	 = -1,
			y	 = 362,
			action = "",
			align = MenuAlign.Right,
			applyRequired = false,
		},]]
		
		
--======================================================================================END		
		
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
			x = 298,
			y = 80,
			width = 185,
			height = 44,
		},
		CrosshairopSettings =
		{
			text = TXT.Menu.Advanced,
			desc = TXT.MenuDesc.Advanced,
			x	 = 572,
			y	 = 88,
			align = MenuAlign.Center,
			action = "",
			sndAccept   = "menu/magicboard/card-take",
			fontBigSize = 26,
		},
		Border =
		{
			type = MenuItemTypes.Border,
			x = 478,
			y = 70,
			width = 180,
			height = 54,
		},
		FavHudSettings =
		{
			text = "Presets",
			desc = "Loading yours favorites HUDs",
			x	 = 727,
			y	 = 96,
			align = MenuAlign.Center,
			--action = "PainMenu:ApplySettings(); PainMenu:IfDefFavHudExist(); PainMenu:ActivateScreen(FavoriteHud); PainMenu:CheckBackbutton()",
			action = "PainMenu:ApplySettings(); PainMenu:IfDefFavHudExist(); PainMenu:ActivateScreen(FavoriteHud);",
			sndAccept   = "menu/magicboard/card-take",
			fontBigSize = 26,
		},

		FavoriteHudBorder =
		{
			type = MenuItemTypes.Border,
			x = 652,
			y = 80,
			width = 150,
			height = 44,
		},
		EmptyBorder =
		{
			type = MenuItemTypes.Border,
			x = 122,
			y = 120,
			width = 776,
			height = 410,
		},
		GeneralSettings =
		{
			text = TXT.Menu.General,
			desc = TXT.MenuDesc.General,
			x	 = 212,
			y	 = 96,
			align = MenuAlign.Center,
			action = "PainMenu:ApplySettings(); PainMenu:ActivateScreen(HUDConfig); PainMenu:CheckItems(); PainMenu:HideTabGroup(PainMenu.currScreen.items.AdvancedTab, 'AdvancedTab'); PainMenu:ShowTabGroup(PainMenu.currScreen.items.GeneralTab, 'GeneralTab')",
			sndAccept   = "menu/magicboard/card-take",
			fontBigSize = 26,
		},
		
		AdvancedSettings =
		{
			text = "Crosshair",
			desc = "Crosshair Setting",
			x	 = 392,
			y	 = 96,
			align = MenuAlign.Center,
			action = "PainMenu:ApplySettings(); PainMenu:ActivateScreen(HUDConfig); PainMenu:HideTabGroup(PainMenu.currScreen.items.GeneralTab, 'GeneralTab'); PainMenu:ShowTabGroup(PainMenu.currScreen.items.AdvancedTab, 'AdvancedTab'); PainMenu:CheckItemsCrosshair()",
			sndAccept   = "menu/magicboard/card-take",
			fontBigSize = 26,
		},
	},	
}
FavoriteHud = 
{

	bgStartFrame = { 120, 243, 268 },
	bgEndFrame   = { 180, 267, 291 },

	fontBigSize = 26,

	backAction = "PainMenu:ApplySettings(); PainMenu:ActivateScreen(OptionsMenu)",
	applyAction = "PainMenu:ApplySettings(true); PMENU.SetItemVisibility('ApplyButton',false)",

--Favorites HUD
	items =
	{
		--[[FavoritesHudBorder =
		{
			type = MenuItemTypes.Border,
			x = 85,
			y = 120,
			width = 850,
			height = 250,
		},
		FavHud =
		{
			type = MenuItemTypes.StaticText,
			text = "Favorites HUD:",
			x	 = -1,
			y	 = 250,
			action = "",
		},]]	
		FavHudList =
		{
			text = "FavList",
			desc = "",
			x = 105,
			y = 140,
			fontBigSize = 18,
			action = "",
			disabledColor = R3D.RGB( 200, 200, 200 ),
			fullWidth = 1,
			listMaxHeight = 250,
			type = MenuItemTypes.LoadSave,
		},
		
		DeleteButton =
		{
			text = TXT.Menu.Remove,
			desc = "",
			x	 = -1,
			y	 = 430,
			fontBigSize = 36,
--			align = MenuAlign.Right,
			action = "PainMenu:DelFavoriteHud(); ",
			fontBigTex  = "font_texturka_alpha",
			fontSmallTex  = "font_texturka_alpha",
			disabledColor = R3D.RGBA( 155, 155, 155, 255 ),
			textColor   = R3D.RGBA( 255, 255, 255, 255 ),
			descColor	= R3D.RGB( 255, 255, 255 ),
			disabled = 1,
		},
		
		AddButton =
		{
			text = TXT.Menu.Add,
			desc = "",
			x	 = 752,
			y	 = 430,
			fontBigSize = 36,
			align = MenuAlign.Right,
			action = "PainMenu:AskForFavoriteHudName( 'Type Name for the favorite.', 'PainMenu:AddFavoriteHud()', 'PainMenu:ActivateScreen(FavoriteHud); PainMenu:CheckItems()' )",
			fontBigTex  = "font_texturka_alpha",
			fontSmallTex  = "font_texturka_alpha",
			disabledColor = R3D.RGBA( 155, 155, 155, 255 ),
			textColor   = R3D.RGBA( 255, 255, 255, 255 ),
			descColor	= R3D.RGB( 255, 255, 255 ),
		},
		
		LoadButton =
		{
			text = TXT.Menu.Load,
			desc = "",
			x	 = 952,
			y	 = 430,
			fontBigSize = 36,
			align = MenuAlign.Right,
			action = "PainMenu:LoadFavoriteHud()",
			fontBigTex  = "font_texturka_alpha",
			fontSmallTex  = "font_texturka_alpha",
			disabledColor = R3D.RGBA( 155, 155, 155, 255 ),
			textColor   = R3D.RGBA( 255, 255, 255, 255 ),
			descColor	= R3D.RGB( 255, 255, 255 ),
			disabled = 1,
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
			x = 298,
			y = 80,
			width = 185,
			height = 44,
		},
		CrosshairopSettings =
		{
			text = TXT.Menu.Advanced,
			desc = TXT.MenuDesc.Advanced,
			x	 = 572,
			y	 = 96,
			align = MenuAlign.Center,
			action = "PainMenu:ApplySettings();PainMenu:ActivateScreen(crosshairoptions);PainMenu:CheckItems()",
			sndAccept   = "menu/magicboard/card-take",
			fontBigSize = 26,
		},
		CrossdBorder =
		{
			type = MenuItemTypes.Border,
			x = 478,
			y = 80,
			width = 180,
			height = 44,
		},
		FavHudSettingsBorder =
		{
			type = MenuItemTypes.Border,
			x = 653,
			y = 70,
			width = 150,
			height = 54,
			dark = true,
		},
		FavHudSettingss =
		{
			text = "Presets",
			desc = "Loading yours favorites HUDs",
			x	 = 727,
			y	 = 88,
			align = MenuAlign.Center,
			action = "",
			sndAccept   = "menu/magicboard/card-take",
			fontBigSize = 26,
		},
		
		GeneralSettings =
		{
			text = TXT.Menu.General,
			desc = TXT.MenuDesc.General,
			x	 = 212,
			y	 = 96,
			align = MenuAlign.Center,
			action = "PainMenu:ApplySettings(); PainMenu:ActivateScreen(HUDConfig); PainMenu:CheckItems(); PainMenu:HideTabGroup(PainMenu.currScreen.items.AdvancedTab, 'AdvancedTab'); PainMenu:ShowTabGroup(PainMenu.currScreen.items.GeneralTab, 'GeneralTab')",
			sndAccept   = "menu/magicboard/card-take",
			fontBigSize = 26,
		},
		
		AdvancedSettings =
		{
			text = "Crosshair",
			desc = "Crosshair Setting",
			x	 = 392,
			y	 = 96,
			align = MenuAlign.Center,
			action = "PainMenu:ApplySettings(); PainMenu:ActivateScreen(HUDConfig); PainMenu:HideTabGroup(PainMenu.currScreen.items.GeneralTab, 'GeneralTab'); PainMenu:ShowTabGroup(PainMenu.currScreen.items.AdvancedTab, 'AdvancedTab'); PainMenu:CheckItemsCrosshair()",
			sndAccept   = "menu/magicboard/card-take",
			fontBigSize = 26,
		},
	},	
}

AskForFavoriteHudName =
{
	bgStartFrame = { 120, 243, 268 },
	bgEndFrame   = { 180, 267, 291 },

	items		=
	{
		DialogBorder = 
		{
			type = MenuItemTypes.Border,
			x = 200,
			y = 200,
			width = 624,
			height = 300,
		},

		FavoriteName =
		{
			type = MenuItemTypes.TextEdit,
			text = TXT.Menu.Name..":",
			desc = "Type name for the favorite (20 character length maximum allowed).",
			option = "",
			x	 = 260,
			y	 = 340,
			action = "",
			maxLength = 20,
			fontBigSize = 36,
			align = MenuAlign.Left,
		},

		OKButton =
		{
			text = "OK",
			desc = "",
			x	 = 360,
			y	 = 440,
			fontBigSize = 36,
--			align = MenuAlign.Left,
			action = "",
		},
		
		BackButton =
		{
			text = TXT.Menu.Back,
			desc = "",
			x	 = 600,
			y	 = 440,
			fontBigSize = 36,
--			align = MenuAlign.Right,
			action = "",
		},
	}
}

--OriOn_Modification=end=########################################################################