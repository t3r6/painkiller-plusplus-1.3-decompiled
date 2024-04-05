LoadGameMenu =
{
	bgStartFrame = { 120, 243, 268 },
	bgEndFrame   = { 180, 267, 291 },

	backAction = "PainMenu:ActivateScreen(LoadSaveMenu)",
	
	menuWidth   = 880,

	items		=
	{
		SaveList =
		{
			text = "SaveList",
			desc = "",
			x = 100,
			y = 180,
			fontBigSize = 22,
			action = "",
			disabledColor = R3D.RGB( 200, 200, 200 ),
			fullWidth = 1,
			type = MenuItemTypes.LoadSave,
		},

		LoadButton =
		{
			text = "Load",
			desc = "",
			x	 = 952,
			y	 = 660,
			fontBigSize = 36,
			align = MenuAlign.Right,
			action = "",
			fontBigTex  = "font_texturka_alpha",
			fontSmallTex  = "font_texturka_alpha",
			textColor   = R3D.RGBA( 255, 255, 255, 255 ),
			descColor	= R3D.RGB( 255, 255, 255 ),
		},
	}
}
