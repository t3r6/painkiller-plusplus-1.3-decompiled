SoundOptions =
{
	bgStartFrame = { 120, 243, 268 },
	bgEndFrame   = { 180, 267, 291 },

	fontBigSize = 36,
	sliderWidth = 340,
	--fontBig		= "timesbd",
	--fontSmall	= "timesbd",
	textColor	= R3D.RGBA( 255, 255, 255, 255 ),
	disabledColor = R3D.RGBA( 155, 155, 155, 255 ),
	
	fontBigTex  = "font_texturka_alpha",
	fontSmallTex  = "font_texturka_alpha",
	descColor	= R3D.RGB( 255, 255, 255 ),
--	backAction = "PainMenu:ActivateScreen(OptionsMenu)",
	backAction = "PainMenu:ApplySettings(); PainMenu:ApplyAudioSettings(true); PainMenu:ActivateScreen(OptionsMenu)",
	applyAction = "PainMenu:ApplySettings(); PainMenu:ApplyAudioSettings(true); PainMenu:ActivateScreen(OptionsMenu)",
--OriOn_Modification=########################################################################################################
	--[[items =
	{
		VolumeBorder =
		{
			type = MenuItemTypes.Border,
			x = 100,
			y = 60,
			width = 824,
			height = 260,
		},

	
			
	},]]--
	items =
	{
		GeneralTab =
		{
			type = MenuItemTypes.TabGroup,
			x = 122,
			y = 70,
			width = 776,
			height = 300,
			visible = true,
			align = MenuAlign.Left,
			
			items =
			{
				MasterVolume =
				{
					type = MenuItemTypes.Slider,
					text = TXT.Menu.MasterVolume,
					desc = TXT.MenuDesc.MasterVolume,
					option = "MasterVolume",
					minValue = 0,
					maxValue = 100,
					x	 = 160,
					y	 = 160,
					action = "PainMenu:ApplyAudioSettings(false)",
				},

				MusicVolume =
				{
					type = MenuItemTypes.Slider,
					text = TXT.Menu.MusicVolume,
					desc = TXT.MenuDesc.MusicVolume,
					option = "MusicVolume",
					minValue = 0,
					maxValue = 100,
					x	 = 160,
					y	 = 210,
					action = "PainMenu:ApplyAudioSettings(false)",
				},
				
				AmbientVolume =
				{
					type = MenuItemTypes.Slider,
					text = TXT.Menu.AmbientVolume,
					desc = TXT.MenuDesc.AmbientVolume,
					option = "AmbientVolume",
					minValue = 0,
					maxValue = 100,
					x	 = 160,
					y	 = 260,
					action = "PainMenu:ApplyAudioSettings(false)",
				},

				SfxVolume =
				{
					type = MenuItemTypes.Slider,
					text = TXT.Menu.SoundVolume,
					desc = TXT.MenuDesc.SoundVolume,
					option = "SfxVolume",
					minValue = 0,
					maxValue = 100,
					x	 = 160,
					y	 = 310,
					action = "PainMenu:ApplyAudioSettings(false)",
				},

				SoundBorder =
				{
					type = MenuItemTypes.Border,
					x = 122,
					y = 410,
					width = 776,
					height = 200,
				},
--[[
				ReverseStereo =
				{
					type = MenuItemTypes.Checkbox,
					text = TXT.Menu.ReverseStereo,
					desc = TXT.MenuDesc.ReverseStereo,
					option = "ReverseStereo",
					valueOn = true,
					valueOff = false,
					x	 = -1,
					y	 = 445,
					action = "",
					fontBigSize = 26,
				},
]]--		
				SpeakersSetup =
				{
					type = MenuItemTypes.TextButtonEx,
					text = TXT.Menu.SpeakersSetup,
					desc = TXT.MenuDesc.SpeakersSetup,
					option = "SpeakersSetup",
					values = { "Two Speakers", "Headphones", "Surround", "Four Speakers", "Five-One", "Seven-One" },
					visible = { TXT.Menu.TwoSpeakers, TXT.Menu.Headphones, TXT.Menu.Surround, TXT.Menu.FourSpeakers, TXT.Menu.FiveOne, TXT.Menu.SevenOne },
					x	 = -1,
					y	 = 440,
					action = "",
					fontBigSize = 26,
				},

				SoundProvider =
				{
					type = MenuItemTypes.TextButtonEx,
					text = TXT.Menu.SoundProvider,
					desc = TXT.MenuDesc.SoundProvider,
					option = "SoundProvider3D",
					values = {},
					visible = {},
					x	 = -1,
					y	 = 475,
					action = "",
					fontBigSize = 26,
				},
				
				EAXAcoustics =
				{
					type = MenuItemTypes.Checkbox,
					text = TXT.Menu.EAXAcoustics,
					desc = TXT.MenuDesc.EAXAcoustics,
					option = "EAXAcoustics",
					valueOn = true,
					valueOff = false,
					x	 = -1,
					y	 = 500,
					action = "",
					fontBigSize = 26,
				},
				
				AmbientSounds =
				{
					type = MenuItemTypes.Checkbox,
					text = TXT.Menu.AmbientSounds,
					desc = TXT.MenuDesc.AmbientSounds,
					option = "AmbientSounds",
					valueOn = true,
					valueOff = false,
					x	 = -1,
					y	 = 545,
					action = "",
					fontBigSize = 26,
				},
			},
		},
		
		AdvancedTab =
		{
			type = MenuItemTypes.TabGroup,
			x = 122,
			y = 70,
			width = 776,
			height = 300,
			visible = false,
			align = MenuAlign.Right,

			items = 
			{
				LowAmmoVolume =
				{
					type = MenuItemTypes.Slider,
					text = "",
					desc = "Low Ammo volume",
					option = "LASoundVolume",
					minValue = 0,
					maxValue = 100,
					x	 = 500,
					y	 = 152,
					action = "",
					sliderWidth = 300,
					sliderCtrlWidth = 360,
					fontBigSize = 30,
				},
				KillsoundVolume =
				{
					type = MenuItemTypes.Slider,
					text = "",
					desc = "Killsound volume",
					option = "KillSoundVolume",
					minValue = 0,
					maxValue = 100,
					x	 = 500,
					y	 = 202,
					action = "",
					sliderWidth = 300,
					sliderCtrlWidth = 360,
					fontBigSize = 30,
				},
				HitsoundVolume =
				{
					type = MenuItemTypes.Slider,
					text = "",
					desc = "Hitsound volume",
					option = "HitSoundVolume",
					minValue = 0,
					maxValue = 100,
					x	 = 500,
					y	 = 252,
					action = "",
					sliderWidth = 300,
					sliderCtrlWidth = 360,
					fontBigSize = 30,
				},
				HitsoundTeamVolume =
				{
					type = MenuItemTypes.Slider,
					text = "",
					desc = "Hitsound Team volume",
					option = "HitSoundTeamVolume",
					minValue = 0,
					maxValue = 100,
					x	 = 500,
					y	 = 302,
					action = "",
					sliderWidth = 300,
					sliderCtrlWidth = 360,
					fontBigSize = 30,
				},
				lowammosnd =
				{
					type = MenuItemTypes.Checkbox,
					text = "LowAmmo sound",
					desc = "Plays a sound when your ammo are low",
					option = "LowAmmoSound",
					valueOn = true,
					valueOff = false,
					x	 = 160,
					y	 = 142,
					action = "",
					fontBigSize = 30,
					align = MenuAlign.None,
					applyRequired = false,
				},
				killsound =
				{
					type = MenuItemTypes.Checkbox,
					text = "Kill sound",
					desc = "Plays a sound when you kill an opponent",
					option = "KillSound",
					valueOn = true,
					valueOff = false,
					x	 = 160,
					y	 = 192,
					action = "",
					fontBigSize = 30,
					align = MenuAlign.None,
					applyRequired = false,
				},
				hitsound =
				{
					type = MenuItemTypes.Checkbox,
					text = "Hit sound",
					desc = "Plays a sound when you hit an opponent",
					option = "HitSound",
					valueOn = true,
					valueOff = false,
					x	 = 160,
					y	 = 242,
					action = "",
					fontBigSize = 30,
					align = MenuAlign.None,
					applyRequired = false,
				},
				hitsoundteam =
				{
					type = MenuItemTypes.Checkbox,
					text = "Team sound",
					desc = "Plays a sound when you hit a TeamMate",
					option = "HitsoundTeammate",
					valueOn = true,
					valueOff = false,
					x	 = 160,
					y	 = 292,
					action = "",
					fontBigSize = 30,
					applyRequired = false,
					align = MenuAlign.None,
				},
					
				SdBorder =
				{
					type = MenuItemTypes.Border,
					x = 122,
					y = 410,
					width = 776,
					height = 200,
				},
				Newhitsound =
				{
					type = MenuItemTypes.Checkbox,
					text = "Alternative sounds",
					desc = "Alternative sounds for Hitsound & Killsound",
					option = "Newhitsound",
					valueOn = true,
					valueOff = false,
					x	 = 160,
					y	 = 430,
					action = "",
					fontBigSize = 26,
					applyRequired = false,
					align = MenuAlign.None,
				},
				NoGong =
				{
					type = MenuItemTypes.Checkbox,
					text = "No Gong",
					desc = "Disables clock's gong for MP",
					option = "NoGong",
					valueOn = true,
					valueOff = false,
					x	 = 160,
					y	 = 470,
					action = "",
					fontBigSize = 26,
					align = MenuAlign.None,
					applyRequired = false,
				},	
				NoMPComments =
				{
					type = MenuItemTypes.Checkbox,
					text = "No MP Comments",
					desc = "Disables Multiplayer's comments",
					option = "NoMPComments",
					valueOn = true,
					valueOff = false,
					x	 = 160,
					y	 = 510,
					action = "",
					fontBigSize = 26,
					align = MenuAlign.None,
					applyRequired = false,
				},
				KeysSounds =
				{
					type = MenuItemTypes.Checkbox,
					text = "HUD sound",
					desc = "Plays a sound when you customise yours HUD elements",
					option = "CustomHudSound",
					valueOn = true,
					valueOff = false,
					x	 = 160,
					y	 = 550,
					action = "",
					fontBigSize = 26,
					align = MenuAlign.None,
					applyRequired = false,
				},
				FlagCarrierSound =
				{
					type = MenuItemTypes.Checkbox,
					text = "Flag Carrier sound",
					desc = "Disable the boring flag carrier sound in CTF games",
					option = "FlagCarrierSound",
					valueOn = true,
					valueOff = false,
					x	 = -1,
					y	 = 430,
					action = "",
					fontBigSize = 26,
					applyRequired = false,
					align = MenuAlign.Right,
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
	},
}
--OriOn_Modification=end=########################################################################################################
