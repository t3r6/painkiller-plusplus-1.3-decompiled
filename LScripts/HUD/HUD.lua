Hud = {
  fname = "",
  Enabled = true,
  DrawEyes = false,
  TickCount = 0,
  _matCrosshair = -1,
  _matAmmo = -1,
  _matGameOver = -1,
  _matHealth = -1,
  _matArmor = -1,
  _matArmorNormal = -1,
  _matArmorRed = -1,
  _matArmorGreen = -1,
  _matArmorYellow = -1,
  _matHead = -1,
  _matEyes = -1,
  _matDemons = -1,
  _matNumbers = -1,
  _matLifeIcon = -1,
  _matShieldIcon = -1,
  _matHUDTop = -1,
  _matHUDLeft = -1,
  _matHUDRight = -1,
  _matMoney = -1,
  _matPentagram = -1,
  _matStar = -1,
  _matBossFace = -1,
  _matBossAlastor = -1,
  _matBossGiant = -1,
  _matBossSwamp = -1,
  _matBossThor = -1,
  _matBossAlastor2 = -1,
  _matBossSpider = -1,
  _matCompassArrow = -1,
  _matCompassArrShadow = -1,
  _matCompassArrGlow = -1,
  _matCompassDown = -1,
  _matCompassDownOn = -1,
  _matCompassUp = -1,
  _matCompassUpOn = -1,
  _glowTime = 0,
  _glowDir = 0,
  _glowTrans = 0,
  _glowStart = 0,
  _glowTime2 = 0,
  _glowDir2 = 0,
  _glowTrans2 = 0,
  _glowStart2 = 0,
  showCompassArrow = true,
  r_closestEnemy = nil,
  _nearestCheckPoint = nil,
  _nearestIsCheckpoint = false,
  _lastTime = 0,
  _matDigits = {},
  _matDigitsRed = {},
  _matDigitsT = {},
  _matDigitsTRed = {},
  _matDigitsBT = {},
  _matDigitsBTRed = {},
  _matShotgunIcon3D = {},
  _matPainKillerIcon3D = {},
  _matStakeIcon3D = {},
  _matMiniGunIcon3D = {},
  _matElectroIcon3D = {},
  _matRifleIcon3D = {},
  _matBoltIcon3D = {},
  _matAmmoOpenIconQW3D = {},
  _matAmmoListShellIconQW3D = {},
  _matAmmoListKolkiIconQW3D = {},
  _matAmmoListRocketIconQW3D = {},
  _matAmmoListSzurikenIconQW3D = {},
  _matAmmoListrifleIconQW3D = {},
  _matAmmoListBoltyIconQW3D = {},
  _matAmmoCloseIconQW3D = {},
  _matAmmoListFreezerIconQW3D = {},
  _matAmmoListRocketIconQW3D = {},
  _matAmmoListMiniIconQW3D = {},
  _matAmmoListElectroIconQW3D = {},
  _matAmmoListflameIconQW3D = {},
  _matAmmoListKulkiIconQW3D = {},
  _matHealthQW3D = {},
  _matArmorYellowQW3D = {},
  _matArmorSilverQW3D = {},
  _matArmorBronzeQW3D = {},
  _matArmorNormalQW3D = {},
  playerHasFlag = 1,
  CrosshairHitTime = 0.25,
  _weaponspri = {
    [1] = true,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true
  },
  _weaponsalt = {
    [1] = false,
    [2] = false,
    [3] = false,
    [4] = false,
    [5] = false,
    [6] = false,
    [7] = false
  },
  _prevsoltpri = false,
  _prevsoltalt = false,
  _prevsoltpri1 = false,
  _prevsoltalt1 = false,
  _SwitchToggle = true,
  _Switch = true,
  _AltKeyPressed = {
    [1] = false,
    [2] = false,
    [3] = false,
    [4] = false,
    [5] = false,
    [6] = false,
    [7] = false
  },
  _PriKeyPressed = {
    [1] = false,
    [2] = false,
    [3] = false,
    [4] = false,
    [5] = false,
    [6] = false,
    [7] = false
  },
  _lastCross = -1,
  CrossScale = 1,
  _matModifier = -1,
  _showSPStats = false,
  mpMsgColor = {
    255,
    186,
    122
  },
  mpMsgPosition = {0, 0},
  mpMsgFont = "courbd",
  mpMsgFontTex = "",
  mpMsgFontSize = 20,
  _matDemonCross = nil,
  _crosshairs = {
    "HUD/crosshair",
    "HUD/crossy/cross1",
    "HUD/crossy/cross2",
    "HUD/crossy/cross3",
    "HUD/crossy/cross4",
    "HUD/crossy/cross5",
    "HUD/crossy/cross6",
    "HUD/crossy/cross7",
    "HUD/crossy/cross8",
    "HUD/crossy/cross9",
    "HUD/crossy/cross91",
    "HUD/crossy/cross92",
    "HUD/crossy/cross93",
    "HUD/crossy/cross94",
    "HUD/crossy/cross95",
    "HUD/crossy/cross96",
    "HUD/crossy/cross97",
    "HUD/crossy/cross98",
    "HUD/crossy/cross99",
    "HUD/crossy/cross991",
    "HUD/crossy/cross992",
    "HUD/crossy/cross993",
    "HUD/crossy/cross994",
    "HUD/crossy/cross995",
    "HUD/crossy/cross996",
    "HUD/crossy/cross997",
    "HUD/crossy/cross998",
    "HUD/crossy/cross999",
    "HUD/crossy/cross9991",
    "HUD/crossy/cross9992",
    "HUD/crossy/cross9993",
    "HUD/crossy/cross9994",
    "Crosshairs/crosshairc",
    "Crosshairs/crosshairb"
  },
  _colors = {
    R3D.RGB(0, 0, 255)
  },
  _showCheckPointInfo = false,
  _showFPS = false,
  _showPacketLoss = false,
  _matPacketLoss = nil,
  _mpStatsDrawFunc = Hud.DrawScoreboard,
  _overlayMessage = "",
  _overlayMsgStart = 0,
  _DrawQuickOptions = false,
  _DrawQuickOptionsMenu = "Hud Style",
  _DrawQuickOptionsSubMenuA = "",
  _DrawQuickOptionsSubMenuB = "",
  SubMenuAOpen = false,
  SubMenuBOpen = false,
  fasizew = 0,
  fasizeaw = 0,
  _MenuBright = 1,
  _SubMenuABright = 1,
  _SubMenuBBright = 1,
  bstexta = 0,
  bstextb = 0,
  mposh = 0,
  SuperHud_Item = 1,
  Shape_Item = 1,
  movespeedstart = false,
  movespeedstarttime = 0,
  keypressmode = 1,
  latency = 10,
  FpsPos = 0,
  MedalNoMercyIconStart = 0,
  MedalNoMercyIconEnd = 0,
  MedalNoMercy = 0,
  MedalGoodIconStart = 0,
  MedalGoodIconEnd = 0,
  MedalGood = 0,
  MedalSweetIconStart = 0,
  MedalSweetIconEnd = 0,
  MedalSweet = 0,
  MedalStylish = 0,
  MedalStylishIconStart = 0,
  MedalStylishIconEnd = 0,
  HasQuadCountdown = 30,
  HasPentagramCountdown = 30,
  HasWeaponModifierCountdown = 30,
  DeadPlayerName = {
    "Dead",
    "Dead",
    "Dead",
    "Dead"
  },
  KillerPlayerName = {
    "Killer",
    "Killer",
    "Killer",
    "Killer"
  },
  AttackType = {
    1,
    1,
    1,
    1
  },
  AttackTypeEnd = {
    0,
    0,
    0,
    0
  },
  StatsPos = 0,
  FMessageStatusPos = {
    0,
    42,
    82,
    122
  },
  LAmmosPlaySound = {
    {false, false},
    {false, false},
    {false, false},
    {false, false},
    {false, false},
    {false, false},
    {false, false}
  }
}

function Hud:GetNextPlayer(ID, Team, Spec)
end

function Hud:LoadData()
  if Cfg.OldScoreboard then
    self._mpStatsDrawFunc = MPSTATS.Draw
  end
  self._matArrowMenu = MATERIAL.Create("SHud/arrow", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matHealth = MATERIAL.Create("HUD/energia", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matArmorNormal = MATERIAL.Create("HUD/armor", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matArmorRed = MATERIAL.Create("HUD/armor_czerwony", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matArmorGreen = MATERIAL.Create("HUD/armor_zielony", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matArmorYellow = MATERIAL.Create("HUD/armor_zolty", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matArmor = self._matArmorNormal
  self._matMenu = MATERIAL.Create("HUD/menu", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matPlayerHasFlag = MATERIAL.Create("Pickup/Flags/flag", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matPlayerHasPowerUp = MATERIAL.Create("Pickup/PowerUp/PowerUp", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matPlayerExcellentMedal = MATERIAL.Create("Medals/medalgood", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matPlayerRampageMedal = MATERIAL.Create("Medals/medalnomercy", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matPlayerPKRotorMedal = MATERIAL.Create("Medals/medalsweet", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matPlayerImpressiveMedal = MATERIAL.Create("Medals/medalstylish", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matArmorRedNEw = MATERIAL.Create("SHud/armor_classic_strong", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matArmorGreenNEw = MATERIAL.Create("SHud/armor_classic_weak", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matArmorYellowNEw = MATERIAL.Create("SHud/armor_classic_medium", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matHealthSH = MATERIAL.Create("SHud/energia", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matHealthQW = MATERIAL.Create("BHud/energia", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  for he = 0, 60 do
    self._matHealthQW3D[he + 1] = MATERIAL.Create("3Dico/Health/Health_" .. he, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  end
  self._matArmorNormalSH = MATERIAL.Create("SHud/armor", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matArmorYellowSH = MATERIAL.Create("SHud/armor_czerwony", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matArmorBronzeSH = MATERIAL.Create("SHud/armor_zielony", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matArmorSilverSH = MATERIAL.Create("SHud/armor_zolty", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matArmorBH = MATERIAL.Create("BHud/armor", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  for ar = 0, 64 do
    self._matArmorYellowQW3D[ar + 1] = MATERIAL.Create("3Dico/Armor/Gold/Gold_" .. ar, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matArmorBronzeQW3D[ar + 1] = MATERIAL.Create("3Dico/Armor/Copper/Copper_" .. ar, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matArmorSilverQW3D[ar + 1] = MATERIAL.Create("3Dico/Armor/Silver/Silver_" .. ar, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matArmorNormalQW3D[ar + 1] = MATERIAL.Create("3Dico/Armor/Normal/Normal_" .. ar, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  end
  self._matShotgunIcon = MATERIAL.Create("CurrentW/shell", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matPainKillerIcon = MATERIAL.Create("CurrentW/painkiller_open", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matStakeIcon = MATERIAL.Create("CurrentW/kolki", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matMiniGunIcon = MATERIAL.Create("CurrentW/rocket", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matElectroIcon = MATERIAL.Create("CurrentW/ikona_szuriken", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matRifleIcon = MATERIAL.Create("CurrentW/rifle", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matBoltIcon = MATERIAL.Create("CurrentW/bolty", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  for cw = 0, 31 do
    self._matShotgunIcon3D[cw + 1] = MATERIAL.Create("3Dico/Weapons/ShotGun/ShotGun_" .. cw, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matPainKillerIcon3D[cw + 1] = MATERIAL.Create("3Dico/Weapons/PainKiller/PainKiller_" .. cw, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matStakeIcon3D[cw + 1] = MATERIAL.Create("3Dico/Weapons/Stake/Stake_" .. cw, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matMiniGunIcon3D[cw + 1] = MATERIAL.Create("3Dico/Weapons/MiniGun/MiniGun_" .. cw, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matElectroIcon3D[cw + 1] = MATERIAL.Create("3Dico/Weapons/Electro/Electro_" .. cw, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matRifleIcon3D[cw + 1] = MATERIAL.Create("3Dico/Weapons/Rifle/Rifle_" .. cw, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matBoltIcon3D[cw + 1] = MATERIAL.Create("3Dico/Weapons/Bolt/Bolt_" .. cw, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  end
  self._matMinus = MATERIAL.Create("Scores/minus", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matMinusDef = MATERIAL.Create("Scores/minusdef", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matKeysPgUpW_fr = MATERIAL.Create("Help/fr/Weapons/PgUp", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matKeysHomeW_fr = MATERIAL.Create("Help/fr/Weapons/Home", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matKeysNumDecimal_fr = MATERIAL.Create("Help/fr/Crosshair/NumDecimal", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matKeysHomeSc_fr = MATERIAL.Create("Help/fr/Scores/Home", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matKeysHomeAm_fr = MATERIAL.Create("Help/fr/AmmoList/Home", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matKeysHomeMi_fr = MATERIAL.Create("Help/fr/Misc/Home", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matKeysHomeHu_fr = MATERIAL.Create("Help/fr/Hud/Home", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matKeysHomeIf_fr = MATERIAL.Create("Help/fr/Infos/Home", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matKeysPgUpW_en = MATERIAL.Create("Help/en/Weapons/PgUp", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matKeysHomeW_en = MATERIAL.Create("Help/en/Weapons/Home", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matKeysNumDecimal_en = MATERIAL.Create("Help/en/Crosshair/NumDecimal", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matKeysHomeSc_en = MATERIAL.Create("Help/en/Scores/Home", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matKeysHomeAm_en = MATERIAL.Create("Help/en/AmmoList/Home", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matKeysHomeMi_en = MATERIAL.Create("Help/en/Misc/Home", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matKeysHomeHu_en = MATERIAL.Create("Help/en/Hud/Home", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matKeysHomeIf_en = MATERIAL.Create("Help/en/Infos/Home", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matSelectFrame = MATERIAL.Create("SHud/mask", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoOpenIcon = MATERIAL.Create("HUD/painkiller_open", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoCloseIcon = MATERIAL.Create("HUD/painkiller_close", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoOpenIconSH = MATERIAL.Create("SHud/painkiller_open", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoCloseIconSH = MATERIAL.Create("SHud/painkiller_close", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoOpenIconQW = MATERIAL.Create("BHud/painkiller_open", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoCloseIconQW = MATERIAL.Create("BHud/painkiller_close", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListShellIcon = MATERIAL.Create("HUD/shell", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListFreezerIcon = MATERIAL.Create("HUD/ikona_freezer", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListShellIconSH = MATERIAL.Create("SHud/shell", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListFreezerIconSH = MATERIAL.Create("SHud/ikona_freezer", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListShellIconQW = MATERIAL.Create("BHud/shell", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListFreezerIconQW = MATERIAL.Create("BHud/ikona_freezer", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListKolkiIcon = MATERIAL.Create("HUD/kolki", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListRocketIcon = MATERIAL.Create("HUD/rocket", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListKolkiIconSH = MATERIAL.Create("SHud/kolki", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListRocketIconSH = MATERIAL.Create("SHud/rocket", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListKolkiIconQW = MATERIAL.Create("BHud/kolki", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListRocketIconQW = MATERIAL.Create("BHud/rocket", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListMiniIcon = MATERIAL.Create("HUD/minigun", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListRocketIcon = MATERIAL.Create("HUD/rocket", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListMiniIconSH = MATERIAL.Create("SHud/minigun", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListMiniIconQW = MATERIAL.Create("BHud/minigun", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListRocketIconQW = MATERIAL.Create("BHud/rocket", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListSzurikenIcon = MATERIAL.Create("HUD/ikona_szuriken", TextureFlags.NoLOD)
  self._matAmmoListElectroIcon = MATERIAL.Create("HUD/ikona_electro", TextureFlags.NoLOD)
  self._matAmmoListSzurikenIconSH = MATERIAL.Create("SHud/ikona_szuriken", TextureFlags.NoLOD)
  self._matAmmoListElectroIconSH = MATERIAL.Create("SHud/ikona_electro", TextureFlags.NoLOD)
  self._matAmmoListSzurikenIconQW = MATERIAL.Create("BHud/ikona_szuriken", TextureFlags.NoLOD)
  self._matAmmoListElectroIconQW = MATERIAL.Create("BHud/ikona_electro", TextureFlags.NoLOD)
  self._matAmmoListrifleIcon = MATERIAL.Create("HUD/rifle", TextureFlags.NoLOD)
  self._matAmmoListikonaIcon = MATERIAL.Create("HUD/ikona_flamer", TextureFlags.NoLOD)
  self._matAmmoListrifleIconSH = MATERIAL.Create("SHud/rifle", TextureFlags.NoLOD)
  self._matAmmoListikonaIconSH = MATERIAL.Create("SHud/ikona_flamer", TextureFlags.NoLOD)
  self._matAmmoListrifleIconQW = MATERIAL.Create("BHud/rifle", TextureFlags.NoLOD)
  self._matAmmoListikonaIconQW = MATERIAL.Create("BHud/ikona_flamer", TextureFlags.NoLOD)
  self._matAmmoListBoltyIcon = MATERIAL.Create("HUD/bolty", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListKulkiIcon = MATERIAL.Create("HUD/kulki", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListBoltyIconSH = MATERIAL.Create("SHud/bolty", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListKulkiIconSH = MATERIAL.Create("SHud/kulki", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListBoltyIconQW = MATERIAL.Create("BHud/bolty", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoListKulkiIconQW = MATERIAL.Create("BHud/kulki", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matZoom = MATERIAL.Create("HUD/zoom", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  for am = 0, 15 do
    self._matAmmoOpenIconQW3D[am + 1] = MATERIAL.Create("3Dico/Ammo/PKh/PKh_" .. am, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matAmmoListShellIconQW3D[am + 1] = MATERIAL.Create("3Dico/Ammo/Shell/Shell_" .. am, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matAmmoListKolkiIconQW3D[am + 1] = MATERIAL.Create("3Dico/Ammo/Stake/Stake_" .. am, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matAmmoListRocketIconQW3D[am + 1] = MATERIAL.Create("3Dico/Ammo/Grenade/Grenade_" .. am, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matAmmoListSzurikenIconQW3D[am + 1] = MATERIAL.Create("3Dico/Ammo/Szuriken/Szuriken_" .. am, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matAmmoListrifleIconQW3D[am + 1] = MATERIAL.Create("3Dico/Ammo/Rifle/Rifle_" .. am, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matAmmoListBoltyIconQW3D[am + 1] = MATERIAL.Create("3Dico/Ammo/Bolt/Bolt_" .. am, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matAmmoCloseIconQW3D[am + 1] = MATERIAL.Create("3Dico/Ammo/PKf/PKf_" .. am, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matAmmoListFreezerIconQW3D[am + 1] = MATERIAL.Create("3Dico/Ammo/Freezer/Freezer_" .. am, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matAmmoListRocketIconQW3D[am + 1] = MATERIAL.Create("3Dico/Ammo/Grenade/Grenade_" .. am, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matAmmoListMiniIconQW3D[am + 1] = MATERIAL.Create("3Dico/Ammo/Minigun/Minigun_" .. am, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matAmmoListKulkiIconQW3D[am + 1] = MATERIAL.Create("3Dico/Ammo/HeaterB/HeaterB_" .. am, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  end
  for el = 0, 26 do
    self._matAmmoListElectroIconQW3D[el + 1] = MATERIAL.Create("3Dico/Ammo/Electro/Electro_" .. el, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  end
  for fl = 0, 52 do
    self._matAmmoListflameIconQW3D[fl + 1] = MATERIAL.Create("3Dico/Ammo/Flame/Rtf_" .. fl, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  end
  self._matInfinity = MATERIAL.Create("SHud/infinity", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matInfinity1 = MATERIAL.Create("HUD/infinity", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matInfinityQW = MATERIAL.Create("BHud/infinity", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matammoselectG = MATERIAL.Create("SHud/pix_1", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  if Cfg.ColouredIcons then
    Hud._matTeamRed = MATERIAL.Create("Textures/team_redcol.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matTeamBlue = MATERIAL.Create("Textures/team_bluecol.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matShell = MATERIAL.Create("Textures/Shellcol.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matFreezer = MATERIAL.Create("Textures/Freezercol.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matRocket = MATERIAL.Create("Textures/Rocketcol.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matMinigun = MATERIAL.Create("Textures/Miniguncol.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matStake = MATERIAL.Create("Textures/Stakecol.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matSzuriken = MATERIAL.Create("Textures/Szurikencol.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matElectro = MATERIAL.Create("Textures/Electrocol.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matPainkiller = MATERIAL.Create("Textures/Painkillercol", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matInfinity = MATERIAL.Create("Textures/infinitycol.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matout = MATERIAL.Create("Textures/outcol.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  else
    Hud._matTeamRed = MATERIAL.Create("Textures/team_red.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matTeamBlue = MATERIAL.Create("Textures/team_blue.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matShell = MATERIAL.Create("Textures/Shell.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matFreezer = MATERIAL.Create("Textures/Freezer.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matRocket = MATERIAL.Create("Textures/Rocket.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matMinigun = MATERIAL.Create("Textures/Minigun.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matStake = MATERIAL.Create("Textures/Stake.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matSzuriken = MATERIAL.Create("Textures/Szuriken.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matElectro = MATERIAL.Create("Textures/Electro.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matPainkiller = MATERIAL.Create("Textures/Painkiller", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matInfinity = MATERIAL.Create("Textures/infinity.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matout = MATERIAL.Create("Textures/out.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  end
  if Cfg.AltScoreboard then
    Hud._matRedPix = MATERIAL.Create("Textures/redpixalt.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matGreenPix = MATERIAL.Create("Textures/greenpixalt.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matBluePix = MATERIAL.Create("Textures/bluepixalt.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  else
    Hud._matRedPix = MATERIAL.Create("Textures/redpix.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matGreenPix = MATERIAL.Create("Textures/greenpix.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    Hud._matBluePix = MATERIAL.Create("Textures/bluepix.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  end
  if Cfg.Crosshair then
    if Cfg.Crosshair == 0 then
      Cfg.Crosshair = 1
    end
    self._matCrosshair = MATERIAL.Create(self._crosshairs[Cfg.Crosshair], TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._lastCross = self._crosshairs[Cfg.Crosshair]
  else
    self._matCrosshair = MATERIAL.Create("HUD/crosshair", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._lastCross = "HUD/crosshair"
  end
  self._matHead = MATERIAL.Create("HUD/czaszka sama", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matEyes = MATERIAL.Create("HUD/oczy_do_czachy copy", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matDemons = MATERIAL.Create("HUD/demon count 64 % transp", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matDemonsGrey = MATERIAL.Create("HUD/demon count szary30 % transp", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matNumbers = MATERIAL.Create("HUD/cyfry", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matLifeIcon = MATERIAL.Create("HUD/eskulap", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matShieldIcon = MATERIAL.Create("HUD/tarcza", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matGameOver = MATERIAL.Create("HUD/gejm_ouwer", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  if not Cfg.BlackEdition then
    self._matHUDTop = MATERIAL.Create("HUD/hud_top", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matHUDLeft = MATERIAL.Create("HUD/hud_left", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matHUDRight = MATERIAL.Create("HUD/hud_right", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  else
    self._matHUDTop = MATERIAL.Create("HUD/hud_top_black", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matHUDLeft = MATERIAL.Create("HUD/hud_left_black", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matHUDRight = MATERIAL.Create("HUD/hud_right_black", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  end
  self._matMoney = MATERIAL.Create("HUD/ikona_dusze_zlota", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matPentagram = MATERIAL.Create("HUD/pentagram", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matStar = MATERIAL.Create("HUD/gwiazdka", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  for i = 0, 9 do
    self._matDigits[i + 1] = MATERIAL.Create("HUD/numbers/" .. i, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matDigitsRed[i + 1] = MATERIAL.Create("HUD/numbers/" .. i .. "_cz", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matDigitsT[i + 1] = MATERIAL.Create("SHud/numbers/" .. i, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matDigitsTRed[i + 1] = MATERIAL.Create("SHud/numbers/" .. i .. "_cz", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matDigitsBT[i + 1] = MATERIAL.Create("BHud/numbers/" .. i, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._matDigitsBTRed[i + 1] = MATERIAL.Create("BHud/numbers/" .. i .. "_cz", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  end
  self._matBossFace = MATERIAL.Create("HUD/hud_boss", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matBossAlastor = MATERIAL.Create("HUD/kompas/icon_alastor", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matBossGiant = MATERIAL.Create("HUD/kompas/icon_giant", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matBossSwamp = MATERIAL.Create("HUD/kompas/icon_swamp", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matBossThor = MATERIAL.Create("HUD/kompas/icon_thor", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matBossAlastor2 = MATERIAL.Create("HUD/kompas/icon_alastor2", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matBossSpider = MATERIAL.Create("HUD/kompas/icon_spider", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matCompassArrow = MATERIAL.Create("HUD/kompas/strzalka_kompas", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matCompassArrShadow = MATERIAL.Create("HUD/kompas/strzalka_kompas_cien", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matCompassArrGlow = MATERIAL.Create("HUD/kompas/strzalka_glow_next", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matCompassDown = MATERIAL.Create("HUD/kompas/wsk_dol_wyl", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matCompassDownOn = MATERIAL.Create("HUD/kompas/wsk_dol_wl", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matCompassUp = MATERIAL.Create("HUD/kompas/wsk_gora_wyl", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matCompassUpOn = MATERIAL.Create("HUD/kompas/wsk_gora_wl", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._arrowRot = 0
  self._matPacketLoss = MATERIAL.Create("HUD/packet_loss", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matDemonCross = MATERIAL.Create("HUD/crossy/crosshair_demon_morph", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matModifier = MATERIAL.Create("HUD/modifier", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  CONSOLE.SetMPMsgColor(self.mpMsgColor[1], self.mpMsgColor[2], self.mpMsgColor[3])
  CONSOLE.SetMPMsgPosition(self.mpMsgPosition[1], Cfg.HUD_ConsolePosition)
  CONSOLE.SetMPMsgFont(self.mpMsgFont, self.mpMsgFontTex, Cfg.HUD_ConsoleFontSize)
  self.CrossScale = Cfg.CrosshairSize
  HUD.SetTransparency(Cfg.HUDTransparency)
  fragmessagestart = 0
  fragmessageend = 0.1
  fname = ""
  endbonesnd = 0
  endcannonsnd = 0
  endarrowsnd = 0
  endbrainsnd = 0
  endskullsnd = 0
  endectoplasmsnd = 0
  endminigunsnd = 0
  endbulletsnd = 0
  endheadsnd = 0
  endbrokensnd = 0
  endenergysnd = 0
  endgreengoosnd = 0
end

function Hud:Clear()
  if self._ShotGun then
    MDL.Release(self._ShotGun)
  end
  self.r_closestEnemy = nil
  self._nearestCheckPoint = nil
  self._lastTime = 0
  self._timeCrossHit = nil
  self.MedalNoMercy = 0
  self.MedalGood = 0
  self.MedalSweet = 0
  self.MedalStylish = 0
end

function Hud:CrosshairHit()
  self._timeCrossHit = self.CrosshairHitTime
end

function Hud:Tick(delta)
  if self._timeCrossHit then
    self._timeCrossHit = self._timeCrossHit - delta
    if self._timeCrossHit < 0 then
      self._timeCrossHit = nil
    end
  end
  if not IsDedicatedServer() and Player then
    if Player.HasQuad and Cfg.HUD_PowerUp_Icons then
      Hud.HasQuadCountdown = Hud.HasQuadCountdown - delta
      if 0 > Hud.HasQuadCountdown then
        Hud.HasQuadCountdown = 30
      end
    elseif Hud.HasQuadCountdown < 30 then
      Hud.HasQuadCountdown = 30
    end
    if Player.HasPentagram and Cfg.HUD_PowerUp_Icons then
      Hud.HasPentagramCountdown = Hud.HasPentagramCountdown - delta
      if 0 > Hud.HasPentagramCountdown then
        Hud.HasPentagramCountdown = 30
      end
    elseif 30 > Hud.HasPentagramCountdown then
      Hud.HasPentagramCountdown = 30
    end
    if Player.HasWeaponModifier and Cfg.HUD_PowerUp_Icons then
      Hud.HasWeaponModifierCountdown = Hud.HasWeaponModifierCountdown - delta
      if 0 > Hud.HasWeaponModifierCountdown then
        Hud.HasWeaponModifierCountdown = 30
      end
    elseif 30 > Hud.HasWeaponModifierCountdown then
      Hud.HasWeaponModifierCountdown = 30
    end
  end
end

function Hud:Render(delta)
  local w, h = R3D.ScreenSize()
  if Cfg.DisableHud then
    return
  end
  if not Cfg.DisableMOTDRendering and Hud._MOTDTime and Hud._MOTDTime >= INP.GetTime() then
    Hud:DrawMOTD()
  end
  if Player then
    local statsoverlay = false
    if MPCfg.GameMode == "Duel" then
      Hud:DrawPlayerVsPlayer("no")
    elseif MPGameRules[MPCfg.GameMode].Teams then
      Hud:DrawPlayerVsPlayer("yes")
    end
  end
  Hud:DrawInfosTimerBegins()
  if INP.Key(Keys.Home) == 2 and INP.Key(Keys.NumlockEnter) == 1 then
    Cfg.PositioningSystem = Cfg.PositioningSystem + 1
    if Cfg.PositioningSystem > 5 then
      Cfg.PositioningSystem = 0
    end
  end
  if Game and 0 < Game._voteTimeLeft then
    local yesVotes = 0
    local noVotes = 0
    for i, o in Game.PlayerStats, nil do
      if o._vote and o.Spectator == 0 then
        if o._vote == 1 then
          yesVotes = yesVotes + 1
        elseif o._vote == 0 then
          noVotes = noVotes + 1
        end
      end
    end
    HUD.SetFont("Impact", 26)
    local currentvote = "Vote(" .. string.format("%02d", Game._voteTimeLeft) .. "): '" .. Game._voteCmd .. " " .. Game._voteParams .. "'  yes(" .. yesVotes .. ") no(" .. noVotes .. ")"
    HUD.PrintXY(-1, h / 6.2, currentvote, "Impact", 200, 200, 200, 26)
  end
  if not self.Enabled then
    return
  end
  local CrosshairWeapon = {
    Cfg.Crosshair_PK,
    Cfg.Crosshair_SG,
    Cfg.Crosshair_GL,
    Cfg.Crosshair_RL,
    Cfg.Crosshair_LG,
    Cfg.Crosshair_SM,
    Cfg.Crosshair_BG,
    Cfg.Crosshair_All
  }
  local CrosshairTransWeapon = {
    Cfg.CrosshairTrans_PK,
    Cfg.CrosshairTrans_SG,
    Cfg.CrosshairTrans_GL,
    Cfg.CrosshairTrans_RL,
    Cfg.CrosshairTrans_LG,
    Cfg.CrosshairTrans_SM,
    Cfg.CrosshairTrans_BG,
    Cfg.CrosshairTrans_All
  }
  local CrosshairColRWeapon = {
    Cfg.CrosshairR_PK,
    Cfg.CrosshairR_SG,
    Cfg.CrosshairR_GL,
    Cfg.CrosshairR_RL,
    Cfg.CrosshairR_LG,
    Cfg.CrosshairR_SM,
    Cfg.CrosshairR_BG,
    Cfg.CrosshairR_All
  }
  local CrosshairColGWeapon = {
    Cfg.CrosshairG_PK,
    Cfg.CrosshairG_SG,
    Cfg.CrosshairG_GL,
    Cfg.CrosshairG_RL,
    Cfg.CrosshairG_LG,
    Cfg.CrosshairG_SM,
    Cfg.CrosshairG_BG,
    Cfg.CrosshairG_All
  }
  local CrosshairColBWeapon = {
    Cfg.CrosshairB_PK,
    Cfg.CrosshairB_SG,
    Cfg.CrosshairB_GL,
    Cfg.CrosshairB_RL,
    Cfg.CrosshairB_LG,
    Cfg.CrosshairB_SM,
    Cfg.CrosshairB_BG,
    Cfg.CrosshairB_All
  }
  local CrosshairSize = {
    Cfg.CrosshairSize_PK,
    Cfg.CrosshairSize_SG,
    Cfg.CrosshairSize_GL,
    Cfg.CrosshairSize_RL,
    Cfg.CrosshairSize_LG,
    Cfg.CrosshairSize_SM,
    Cfg.CrosshairSize_BG,
    Cfg.CrosshairSize_All
  }
  if Player then
    Hud:DrawQuickOptionsMenu()
    if not Player._died then
      if Cfg.SetCrossPerWeapons == 8 then
        Cfg.CrosshairTrans = CrosshairTransWeapon[8]
        Cfg.CrosshairR = CrosshairColRWeapon[8]
        Cfg.CrosshairG = CrosshairColGWeapon[8]
        Cfg.CrosshairB = CrosshairColBWeapon[8]
      else
        for i = 1, 7 do
          if Player._CurWeaponIndex == i then
            Cfg.CrosshairTrans = CrosshairTransWeapon[i]
            Cfg.CrosshairR = CrosshairColRWeapon[i]
            Cfg.CrosshairG = CrosshairColGWeapon[i]
            Cfg.CrosshairB = CrosshairColBWeapon[i]
          end
        end
      end
    end
    if not Player._died and Game.IsDemon then
      self:QuadRGBA(self._matDemonCross, w / 2, h / 2, self.CrossScale, true, 255, 255, 255, Cfg.CrosshairTrans / 100 * 96)
    end
    if Player.HasWeaponModifier and not Cfg.NoPowerUpFX then
      HUD.DrawQuad(self._matModifier, 0, 0, w, h)
    end
    if INP.Key(FKeys[Cfg.KeyPrimaryStatsOverlay]) == 2 or INP.Key(FKeys[Cfg.KeyAlternativeStatsOverlay]) == 2 then
      if Game.Stats[Player.ClientID] ~= nil then
        statsoverlay = true
      end
      Hud:StatsText(Player.ClientID)
    end
  end
  if Game.IsDemon and not Lucifer_001 then
    return
  end
  if Player and not Player._died then
    if Cfg.SetCrossPerWeapons == 8 then
      Cfg.Crosshair = CrosshairWeapon[8]
    else
      for i = 1, 7 do
        if Player._CurWeaponIndex == i then
          Cfg.Crosshair = CrosshairWeapon[i]
        end
      end
    end
  end
  if Cfg.Crosshair and not Game.IsDemon and self._crosshairs[Cfg.Crosshair] ~= self._lastCross then
    MATERIAL.Release(self._matCrosshair)
    self._matCrosshair = MATERIAL.Create(self._crosshairs[Cfg.Crosshair], TextureFlags.NoLOD + TextureFlags.NoMipMaps)
    self._lastCross = self._crosshairs[Cfg.Crosshair]
  end
  local trans = HUD.GetTransparency()
  if Game.GMode == GModes.SingleGame then
    self:QuadTrans(self._matHUDTop, (512 - Cfg.HUDSize * 230) * w / 1024, 0, Cfg.HUDSize, false, trans)
  end
  if Game.GMode == GModes.SingleGame then
    self:Quad(self._matPentagram, (512 - Cfg.HUDSize * 105) * w / 1024, Cfg.HUDSize * 14 * h / 768, Cfg.HUDSize, false)
    self:Quad(self._matMoney, (512 + Cfg.HUDSize * 55) * w / 1024, Cfg.HUDSize * 4 * h / 768, Cfg.HUDSize, false)
  end
  local sizex, sizey = MATERIAL.Size(self._matHUDLeft)
  if MPCfg.GameMode ~= "Instagib" and MPCfg.GameMode ~= "ICTF" then
    if Cfg.HUD_HudStyle == 0 then
      self:QuadTrans(self._matHUDLeft, 0, (768 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false, trans)
      self:QuadTrans(self._matHUDRight, (1024 - Cfg.HUDSize * sizex) * w / 1024, (768 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false, trans)
    end
    if Cfg.HUD_HudStyle == 0 then
      self:Quad(self._matHealth, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 14 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
    end
  end
  if Player then
    if not Player._died then
      if not Hud.NoCrosshair then
        local w = Player:GetCurWeaponSlotIndex()
        if type(w) == "number" and w <= 7 and 1 <= w and Player._CurWeaponIndex == w and Player._CurWeaponIndex == w then
          if INP.Key(Keys.NumDecimal) == 2 then
            if Cfg.SetCrossPerWeapons == 8 then
              local txtposy = CrosshairSize[8] / 100 * 22
              HUD.SetFont("courbd", 14)
              HUD.PrintXY((w - HUD.GetTextWidth(tonumber(string.format("%03d", CrosshairSize[8])) .. "%")) / 2 + 1, h / 2 + txtposy + 1, tonumber(string.format("%03d", CrosshairSize[8])) .. "%", "courbd", 15, 15, 15, 14)
              HUD.PrintXY((w - HUD.GetTextWidth(tonumber(string.format("%03d", CrosshairSize[8])) .. "%")) / 2, h / 2 + txtposy, tonumber(string.format("%03d", CrosshairSize[8])) .. "%", "courbd", 0, 255, 0, 14)
            else
              local txtposy = CrosshairSize[w] / 100 * 22
              HUD.SetFont("courbd", 14)
              HUD.PrintXY((w - HUD.GetTextWidth(tonumber(string.format("%03d", CrosshairSize[w])) .. "%")) / 2 + 1, h / 2 + txtposy + 1, tonumber(string.format("%03d", CrosshairSize[w])) .. "%", "courbd", 15, 15, 15, 14)
              HUD.PrintXY((w - HUD.GetTextWidth(tonumber(string.format("%03d", CrosshairSize[w])) .. "%")) / 2, h / 2 + txtposy, tonumber(string.format("%03d", CrosshairSize[w])) .. "%", "courbd", 0, 255, 0, 14)
            end
            Cfg:SetCrosshairPerWeapons(w)
            Cfg:SetCrosshairTransPerWeapons(w)
            Cfg:SetCrosshairSizePerWeapons(w)
          elseif INP.Key(Keys.NumDecimal) == 3 then
            Cfg:Save()
          end
          if Cfg.SetCrossPerWeapons == 8 then
            Cfg.CrosshairSize = CrosshairSize[8] / 100
          else
            Cfg.CrosshairSize = CrosshairSize[w] / 100
          end
        end
        Hud.CrossScale = Cfg.CrosshairSize
      end
      if not statsoverlay then
        if not Hud.NoCrosshair and not Cfg.CustomCrosshairLocation then
          if self._timeCrossHit then
            self:QuadRGBA(self._matCrosshair, w / 2, h / 2, self.CrossScale, true, Cfg.CrosshairHit_RGB[1], Cfg.CrosshairHit_RGB[2], Cfg.CrosshairHit_RGB[3], Cfg.CrosshairHit_Trans)
          else
            self:QuadRGBA(self._matCrosshair, w / 2, h / 2, self.CrossScale, true, Cfg.CrosshairR, Cfg.CrosshairG, Cfg.CrosshairB, Cfg.CrosshairTrans / 100 * 255)
          end
        end
        if not Hud.NoCrosshair and Cfg.CustomCrosshairLocation then
          if self._timeCrossHit then
            self:QuadRGBA(self._matCrosshair, w / 2, h / 2, self.CrossScale, true, Cfg.CrosshairHit_RGB[1], Cfg.CrosshairHit_RGB[2], Cfg.CrosshairHit_RGB[3], Cfg.CrosshairHit_Trans)
          else
            self:QuadRGBA(self._matCrosshair, w * Cfg.CustomCrosshairLocationX, h * Cfg.CustomCrosshairLocationY, self.CrossScale, true, Cfg.CrosshairR, Cfg.CrosshairG, Cfg.CrosshairB, Cfg.CrosshairTrans / 100 * 255)
          end
        end
      end
      if MPCfg.GameMode ~= "Duel" then
        self:CrosshairNames()
      end
      if Cfg.TeamOverlay and MPGameRules[MPCfg.GameMode] and MPGameRules[MPCfg.GameMode].Teams then
        self:DrawTeamOverlay()
      end
      if Cfg.HUD_Scores and MPCfg.GameMode ~= "Clan Arena" then
        self:DrawScores(Player.ClientID)
      end
      if Cfg.HUD_AmmoList ~= 0 and MPCfg.GameMode ~= "Voosh" and MPCfg.GameMode ~= "People Can Fly" and MPCfg.GameMode ~= "Instagib" and MPCfg.GameMode ~= "ICTF" then
        self:AmmoListOriOn()
      end
      if MPCfg.GameMode ~= "Instagib" and MPCfg.GameMode ~= "ICTF" and Cfg.HUD_Show_CurrentWeapon_Icon then
        self:CurrentWeaponIcon()
      end
      if Cfg.HUD_FragMessage and fragmessagestart < Game.currentTime and fragmessageend > Game.currentTime and fragmessageend > Game.currentTime then
        self:FragMessage(self.fname)
      end
    end
    if MPCfg.GameMode ~= "Instagib" and MPCfg.GameMode ~= "ICTF" then
      if Player:GetCurWeapon() then
        if Cfg.HUD_HudStyle == 0 then
          Player:GetCurWeapon():DrawHUD(delta)
        elseif Cfg.HUD_HudStyle == 1 then
          self:SuperHud()
        elseif Cfg.HUD_HudStyle == 2 then
          self:SuperHud()
        elseif Cfg.HUD_HudStyle == 3 then
          self:HudBar()
        end
      end
      if Cfg.HUD_HudStyle == 0 then
        if Player.ArmorType == 0 then
          self:Quad(self._matArmorNormal, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 49 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
        elseif Player.ArmorType == 1 then
          self:Quad(self._matArmorGreen, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 49 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
        elseif Player.ArmorType == 2 then
          self:Quad(self._matArmorYellow, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 49 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
        elseif Player.ArmorType == 3 then
          self:Quad(self._matArmorRed, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 49 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
        end
        if Cfg.BrightSkinsArmors then
          if Player.ArmorType == 0 then
            self:Quad(self._matArmorNormal, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 49 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
          elseif Player.ArmorType == 1 then
            self:Quad(self._matArmorGreenNEw, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 49 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
          elseif Player.ArmorType == 2 then
            self:Quad(self._matArmorYellowNEw, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 49 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
          elseif Player.ArmorType == 3 then
            self:Quad(self._matArmorRedNEw, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 49 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
          end
        end
      end
    end
    if Cfg.LowAmmoSound then
      self:LowAmmo()
    end
    local enabletimer = false
    if Cfg.HUD_PowerUp_Timer then
      enabletimer = true
    end
    if Cfg.PositioningSystem == 5 and INP.Key(Keys.Home) == 2 then
      enabletimer = true
      Hud:Shape("all", enabletimer, 0)
    elseif Cfg.PositioningSystem == 5 and INP.Key(Keys.Home) == 3 then
      Cfg:Save()
    else
      if Player.HasFlag and Cfg.HUD_Flag_Icon then
        Hud:Shape("flag")
      end
      if Player.HasQuad and Cfg.HUD_PowerUp_Icons then
        Hud:Shape("rage", enabletimer)
      end
      if Player.HasPentagram and Cfg.HUD_PowerUp_Icons then
        Hud:Shape("immunity", enabletimer)
      end
      if Player.HasWeaponModifier and Cfg.HUD_PowerUp_Icons then
        Hud:Shape("modifier", enabletimer)
      end
      local morethantwo = 0
      if Game.currentTime * 2 >= Hud.MedalNoMercyIconStart and Game.currentTime * 2 <= Hud.MedalNoMercyIconEnd and Cfg.HUD_Medal_NoMercy_Icon then
        Hud:Shape("nomercy", nil, morethantwo)
        if Hud.MedalNoMercy > 9 then
          morethantwo = morethantwo + -94 * Cfg.HUD_Medals_Icon_Setting[3] * h / 768
        else
          morethantwo = morethantwo + -68 * Cfg.HUD_Medals_Icon_Setting[3] * h / 768
        end
      end
      if Game.currentTime * 2 >= Hud.MedalGoodIconStart and Game.currentTime * 2 <= Hud.MedalGoodIconEnd and Cfg.HUD_Medal_Good_Icon then
        Hud:Shape("good", nil, morethantwo)
        if 9 < Hud.MedalGood then
          morethantwo = morethantwo + -94 * Cfg.HUD_Medals_Icon_Setting[3] * h / 768
        else
          morethantwo = morethantwo + -68 * Cfg.HUD_Medals_Icon_Setting[3] * h / 768
        end
      end
      if Game.currentTime * 2 >= Hud.MedalSweetIconStart and Game.currentTime * 2 <= Hud.MedalSweetIconEnd and Cfg.HUD_Medal_Sweet_Icon then
        Hud:Shape("sweet", nil, morethantwo)
        if 9 < Hud.MedalSweet then
          morethantwo = morethantwo + -94 * Cfg.HUD_Medals_Icon_Setting[3] * h / 768
        else
          morethantwo = morethantwo + -68 * Cfg.HUD_Medals_Icon_Setting[3] * h / 768
        end
      end
      if Game.currentTime * 2 >= Hud.MedalStylishIconStart and Game.currentTime * 2 <= Hud.MedalStylishIconEnd and Cfg.HUD_Medal_Stylish_Icon then
        Hud:Shape("stylish", nil, morethantwo)
        if 9 < Hud.MedalStylish then
          morethantwo = morethantwo + -94 * Cfg.HUD_Medals_Icon_Setting[3] * h / 768
        else
          morethantwo = morethantwo + -68 * Cfg.HUD_Medals_Icon_Setting[3] * h / 768
        end
      end
    end
    if Game.GMode == GModes.SingleGame then
      self:DrawDigitsText((512 - Cfg.HUDSize * 202) * w / 1024, Cfg.HUDSize * 14 * h / 768, string.format("%05d", Game.BodyCountTotal), 0.8 * Cfg.HUDSize)
      self:DrawDigitsText((512 + Cfg.HUDSize * 105) * w / 1024, Cfg.HUDSize * 14 * h / 768, string.format("%05d", Player.SoulsCount), 0.8 * Cfg.HUDSize, 5 - Game.Demon_HowManyCorpses)
    end
    local he = Player.Health
    if he < 1 and 0 < he then
      he = 1
    end
    if MPCfg.GameMode ~= "Instagib" and MPCfg.GameMode ~= "ICTF" then
      if Cfg.HUD_HudStyle == 0 then
        self:DrawDigitsText1(Cfg.HUDSize * 52 * w / 1024, (768 + Cfg.HUDSize * 16 - Cfg.HUDSize * sizey) * h / 768, string.sub(string.format("%03d", he), -3), 0.9 * Cfg.HUDSize, Player.HealthWarning)
      end
      local armor = Player.Armor
      if Player.FrozenArmor then
        armor = 0
      end
      if Cfg.HUD_HudStyle == 0 then
        self:DrawDigitsText1(Cfg.HUDSize * 52 * w / 1024, (768 + Cfg.HUDSize * 50 - Cfg.HUDSize * sizey) * h / 768, string.sub(string.format("%03d", armor), -3), 0.9 * Cfg.HUDSize, Player.ArmorWarning)
      end
    end
  end
  if Game.GMode == GModes.SingleGame then
    local time = INP.GetTime()
    if 1 <= time - self._lastTime then
      self:UpdateCompass()
      self._lastTime = time
    end
    if self.showCompassArrow == true then
      self:RenderCompass()
    end
    if Game.MegaBossHealth and Game.MegaBossHealthMax then
      local size = Game.MegaBossHealth / Game.MegaBossHealthMax
      if Game.CurrChapter == 1 and not Game.AddOn then
        self:Quad(self._matBossGiant, (512 - Cfg.HUDSize * 48) * w / 1024, Cfg.HUDSize * 10 * h / 768, Cfg.HUDSize, false)
      elseif Game.CurrChapter == 2 then
        self:Quad(self._matBossSwamp, (512 - Cfg.HUDSize * 48) * w / 1024, Cfg.HUDSize * 10 * h / 768, Cfg.HUDSize, false)
      elseif Game.CurrChapter == 3 then
        self:Quad(self._matBossThor, (512 - Cfg.HUDSize * 48) * w / 1024, Cfg.HUDSize * 10 * h / 768, Cfg.HUDSize, false)
      elseif Game.CurrChapter == 4 then
        self:Quad(self._matBossAlastor, (512 - Cfg.HUDSize * 48) * w / 1024, Cfg.HUDSize * 10 * h / 768, Cfg.HUDSize, false)
      elseif Game.AddOn and Game.CurrLevel == 4 then
        self:Quad(self._matBossSpider, (512 - Cfg.HUDSize * 48) * w / 1024, Cfg.HUDSize * 10 * h / 768, Cfg.HUDSize, false)
      elseif Game.AddOn and Game.CurrLevel == 10 then
        self:Quad(self._matBossAlastor2, (512 - Cfg.HUDSize * 48) * w / 1024, Cfg.HUDSize * 10 * h / 768, Cfg.HUDSize, false)
      else
        self:Quad(self._matBossFace, (512 - Cfg.HUDSize * 48) * w / 1024, Cfg.HUDSize * 10 * h / 768, Cfg.HUDSize, false)
      end
      if size < 0.01 and 0 < Game.MegaBossHealth then
        size = 0.01
      end
      HUD.DrawBossHealth(size * 100)
    else
      self:RenderUpDown()
    end
    if self._showSPStats then
      self:RenderSPStats()
    end
    if self._showCheckPointInfo then
      local w, h = R3D.ScreenSize()
      HUD.DrawBorder(312, 200, 400, 140)
      HUD.PrintXY(-1, 240 * h / 768, Languages.Texts[647], "timesbd", 230, 161, 97, 26)
      HUD.PrintXY(-1, 280 * h / 768, Languages.Texts[648] .. "...", "timesbd", 230, 161, 97, 26)
    end
    if self._overlayMessage ~= "" and self._overlayMsgStart == 0 then
      self._overlayMsgStart = INP.GetTime()
    end
    if self._overlayMessage ~= "" and 5 > INP.GetTime() - self._overlayMsgStart then
      local w, h = R3D.ScreenSize()
      HUD.SetFont("timesbd", 26)
      local tw = HUD.GetTextWidth(self._overlayMessage)
      local th = HUD.GetTextHeight(self._overlayMessage)
      HUD.DrawBorder((w - tw) / 2 * 1024 / w - 20, 198, tw * 1024 / w + 40, th * 768 / h + 40)
      HUD.PrintXY(-1, 220 * h / 768, self._overlayMessage, "timesbd", 230, 161, 97, 26)
    else
      self._overlayMessage = ""
      self._overlayMsgStart = 0
    end
  end
  if Game.Paused then
    local w, h = R3D.ScreenSize()
    HUD.DrawQuadRGBA(nil, 0, 0, w, h, 0, 0, 0, 90)
    HUD.DrawBorder(332, 220, 360, 100)
    HUD.PrintXY(-1, 260 * h / 768, Languages.Texts[709], "timesbd", 230, 161, 97, 26)
  end
  if Game.IsDemon then
    return
  end
  if Cfg.HUD_Show_Speedmeter == 4 and Player and Player._Entity then
    local vx, vy, vz, vl = ENTITY.GetVelocity(Player._Entity)
    local hl = Dist2D(0, 0, vx, vz)
    HUD.DrawQuadRGBA(nil, w / 2 - 50, h - 17, 100, 13, 100, 100, 100)
    HUD.DrawQuadRGBA(nil, w / 2 - 50, h - 17, hl * 2, 13, 255, 0, 0)
    HUD.PrintXY(w / 2 - 10, h - 15, string.format("%.02f", hl))
  end
  if Player and Cfg.CustomHudSound then
    Hud:KeysSounds()
  end
  if self._showPacketLoss and Game.GMode ~= GModes.SingleGame then
    local w, h = R3D.ScreenSize()
    local mw, mh = MATERIAL.Size(self._matPacketLoss)
    HUD.DrawQuad(self._matPacketLoss, w - (mw + 8) * w / 1024, 8 * h / 768, mw * w / 1024, mh * h / 768)
  end
  if Player and Cfg.HelpsOnPressKeys then
    Hud:HelpKeys()
  end
end

function Hud:DrawForDemo()
  local w, h = R3D.ScreenSize()
  if self._showFPS or Cfg.ShowFPS and Game.GMode ~= GModes.SingleGame then
    local fps = string.format("FPS: %d", R3D.GetFPS())
    HUD.SetFont("timesbd", 26)
    HUD.PrintXY(w - HUD.GetTextWidth(fps) + 1, 1, fps, "timesbd", 15, 15, 15, 26)
    HUD.PrintXY(w - HUD.GetTextWidth(fps), 0, fps, "timesbd", 230, 161, 97, 26)
  end
  Hud.Render()
end

function Hud:DrawSingleStat(index, name, val, total, bonus, show_star)
  local w, h = R3D.ScreenSize()
  HUD.SetFont("timesbd", 26)
  local fh = HUD.GetTextHeight() + 8 * h / 768
  local sepPos = w / 2 + 50 * w / 1024
  local spos = 0
  local sepWidth = HUD.GetTextWidth(": ")
  local slashWidth = HUD.GetTextWidth("/")
  local numWidth = HUD.GetTextWidth("000")
  local minPos = sepPos + sepWidth
  local slashPos = minPos + numWidth
  local maxPos = slashPos + slashWidth
  local y = h / 2 - fh * 5 + index * fh
  local colorTxt = {
    230,
    161,
    97
  }
  local colorMin = {
    214,
    0,
    23
  }
  local colorMax = {
    189,
    0,
    0
  }
  spos = sepPos - HUD.GetTextWidth(name)
  HUD.PrintXY(spos, y, name .. ": ", "timesbd", colorTxt[1], colorTxt[2], colorTxt[3], 26)
  local star_pos = maxPos
  if val < 1000 then
    HUD.PrintXY(minPos, y, string.format("%03d", val), "timesbd", colorMin[1], colorMin[2], colorMin[3], 26)
    HUD.PrintXY(slashPos, y, "/", "timesbd", colorTxt[1], colorTxt[2], colorTxt[3], 26)
    HUD.PrintXY(maxPos, y, string.format("%03d", total), "timesbd", colorMax[1], colorMax[2], colorMax[3], 26)
    if bonus and 0 < bonus then
      HUD.PrintXY(maxPos + HUD.GetTextWidth(string.format("%03d", total)), y, string.format("+%d", bonus), "timesbd", 120, 120, 120, 26)
      star_pos = maxPos + HUD.GetTextWidth(string.format("%03d+%d", total, bonus))
    else
      star_pos = maxPos + HUD.GetTextWidth(string.format("%03d", total))
    end
  else
    local len = HUD.GetTextWidth(string.format("%d", val))
    local diff = len - HUD.GetTextWidth("000")
    HUD.PrintXY(minPos, y, string.format("%03d", val), "timesbd", colorMin[1], colorMin[2], colorMin[3], 26)
    HUD.PrintXY(slashPos + diff, y, "/", "timesbd", colorTxt[1], colorTxt[2], colorTxt[3], 26)
    HUD.PrintXY(maxPos + diff, y, string.format("%03d", total), "timesbd", colorMax[1], colorMax[2], colorMax[3], 26)
    if bonus and 0 < bonus then
      HUD.PrintXY(maxPos + diff + HUD.GetTextWidth(string.format("%03d", total)), y, string.format("+%d", bonus), "timesbd", 120, 120, 120, 26)
      star_pos = maxPos + HUD.GetTextWidth(string.format("%03d+%d", total, bonus))
    else
      star_pos = maxPos + HUD.GetTextWidth(string.format("%03d", total))
    end
  end
  if show_star and total <= val then
    self:Quad(self._matStar, star_pos, y + HUD.GetTextHeight() / 2 - 18 * h / 768, 1)
  end
end

function Hud:RenderSPStats()
  local colorTxt = {
    230,
    161,
    97
  }
  local colorMin = {
    214,
    0,
    23
  }
  local colorMax = {
    189,
    0,
    0
  }
  HUD.DrawBorder(100, 128, 824, 560)
  local w, h = R3D.ScreenSize()
  HUD.SetFont("timesbd", 26)
  local fh = HUD.GetTextHeight() + 8 * h / 768
  HUD.PrintXY(-1, h / 2 - fh * 7, TXT.SPStats.YourScore, "timesbd", colorTxt[1], colorTxt[2], colorTxt[3], 26)
  local min = math.abs(Game.LevelTime / 60)
  local sec = math.mod(Game.LevelTime, 60)
  local sepPos = w / 2 + 50 * w / 1024
  local spos = 0
  local sepWidth = HUD.GetTextWidth(": ")
  local slashWidth = HUD.GetTextWidth("/")
  local numWidth = HUD.GetTextWidth("000")
  local minPos = sepPos + sepWidth
  local slashPos = minPos + numWidth
  local maxPos = slashPos + slashWidth
  spos = sepPos - HUD.GetTextWidth(TXT.SPStats.GameplayTime)
  HUD.PrintXY(spos, h / 2 - fh * 5, TXT.SPStats.GameplayTime .. ": ", "timesbd", colorTxt[1], colorTxt[2], colorTxt[3], 26)
  if min < 60 then
    HUD.PrintXY(minPos, h / 2 - fh * 5, string.format("%02d", min) .. ":" .. string.format("%02d", sec), "timesbd", colorMin[1], colorMin[2], colorMin[3], 26)
  else
    local hour = math.floor(min / 60)
    min = min - hour * 60
    HUD.PrintXY(minPos, h / 2 - fh * 5, string.format("%02d", hour) .. ":" .. string.format("%02d", min) .. ":" .. string.format("%02d", sec), "timesbd", colorMin[1], colorMin[2], colorMin[3], 26)
  end
  local diff = {
    TXT.Menu.Daydream,
    TXT.Menu.Insomnia,
    TXT.Menu.Nightmare,
    TXT.Menu.Trauma
  }
  spos = sepPos - HUD.GetTextWidth(TXT.SPStats.Difficulty)
  HUD.PrintXY(spos, h / 2 - fh * 4, TXT.SPStats.Difficulty .. ": ", "timesbd", colorTxt[1], colorTxt[2], colorTxt[3], 26)
  HUD.PrintXY(minPos, h / 2 - fh * 4, diff[Game.Difficulty + 1], "timesbd", colorMin[1], colorMin[2], colorMin[3], 26)
  if not Player then
    return
  end
  self:DrawSingleStat(2, TXT.SPStats.MonstersKilled, Game.BodyCountTotal, Game.TotalActors)
  self:DrawSingleStat(3, TXT.SPStats.SoulsCollected, Player.TotalSoulsCount, Game.TotalSouls)
  self:DrawSingleStat(4, TXT.SPStats.GoldFound, Game.PlayerMoneyFound - Player.BonusItems, Game.TotalMoney, Player.BonusItems)
  HUD.DrawQuadRGBA(nil, 300 * w / 1024, h / 2 - 5 * h / 768, 440 * w / 1024, 1, 230, 161, 97, 255)
  self:DrawSingleStat(5, TXT.SPStats.ArmorFound, Player.ArmorFound, Game.TotalArmor, nil, true)
  self:DrawSingleStat(6, TXT.SPStats.HolyItemsFound, Player.HolyItems, Game.TotalHolyItems, nil, true)
  self:DrawSingleStat(7, TXT.SPStats.AmmoFound, Game.PlayerAmmoFound, Game.TotalAmmo, nil, true)
  self:DrawSingleStat(8, TXT.SPStats.ObjectsDestroyed, Game.PlayerDestroyedItems, Game.TotalDestroyed, nil, true)
  self:DrawSingleStat(9, TXT.SPStats.SecretsFound, Player.SecretsFound, Game.TotalSecrets, nil, true)
  HUD.PrintXY(-1, h / 2 + fh * 6 - 8 * w / 768, TXT.SPStats.CardCondition .. ":", "timesbd", colorTxt[1], colorTxt[2], colorTxt[3], 26)
  HUD.PrintXY(-1, h / 2 + fh * 7 - 8 * w / 768, Lev._CardTask, "timesbd", colorMax[1], colorMax[2], colorMax[3], 26)
  local cardStatus = Lev:GetCardStatus()
  local cardText = TXT.SPStats.Locked
  if cardStatus == 0 then
    cardText = TXT.SPStats.Failed
  elseif cardStatus == 1 then
    cardText = TXT.SPStats.Unlocked
  end
  if Game.Difficulty == 0 or Lev._Name == "C6L0_PCFHQ" then
    cardText = TXT.SPStats.NA
  end
  local statLen = HUD.GetTextWidth(TXT.SPStats.Status .. ": " .. cardText)
  HUD.PrintXY(w / 2 - statLen / 2, h / 2 + fh * 8 - 8 * w / 768, TXT.SPStats.Status .. ": ", "timesbd", colorTxt[1], colorTxt[2], colorTxt[3], 26)
  HUD.PrintXY(w / 2 + statLen / 2 - HUD.GetTextWidth(cardText), h / 2 + fh * 8 - 8 * w / 768, cardText, "timesbd", colorMin[1], colorMin[2], colorMin[3], 26)
end

function Hud:DrawSingleStat2(index, name, val, total, bonus, show_star, diff)
  local w, h = R3D.ScreenSize()
  HUD.SetFont("timesbd", 26)
  local fh = HUD.GetTextHeight() + 8 * h / 768
  local sepPos = w / 2 - 80 * w / 1024
  local spos = 0
  local sepWidth = HUD.GetTextWidth(": ")
  local slashWidth = HUD.GetTextWidth("/")
  local numWidth = HUD.GetTextWidth("000")
  local minPos = sepPos + sepWidth
  local slashPos = minPos + numWidth
  local maxPos = slashPos + slashWidth
  local y = h / 2 - fh * 5 + index * fh
  local colorTxt = {
    230,
    161,
    97
  }
  local colorMin = {
    214,
    0,
    23
  }
  local colorMax = {
    189,
    0,
    0
  }
  spos = sepPos - HUD.GetTextWidth(name)
  HUD.PrintXY(spos, y, name .. ": ", "timesbd", colorTxt[1], colorTxt[2], colorTxt[3], 26)
  local star_pos = maxPos
  if val < 1000 then
    HUD.PrintXY(minPos, y, string.format("%03d", val), "timesbd", colorMin[1], colorMin[2], colorMin[3], 26)
    HUD.PrintXY(slashPos, y, "/", "timesbd", colorTxt[1], colorTxt[2], colorTxt[3], 26)
    HUD.PrintXY(maxPos, y, string.format("%03d", total), "timesbd", colorMax[1], colorMax[2], colorMax[3], 26)
    if bonus and 0 < bonus then
      HUD.PrintXY(maxPos + HUD.GetTextWidth(string.format("%03d", total)), y, string.format("+%d", bonus), "timesbd", 120, 120, 120, 26)
      star_pos = maxPos + HUD.GetTextWidth(string.format("%03d+%d", total, bonus))
    else
      star_pos = maxPos + HUD.GetTextWidth(string.format("%03d", total))
    end
  else
    local len = HUD.GetTextWidth(string.format("%d", val))
    local diff = len - HUD.GetTextWidth("000")
    HUD.PrintXY(minPos, y, string.format("%03d", val), "timesbd", colorMin[1], colorMin[2], colorMin[3], 26)
    HUD.PrintXY(slashPos + diff, y, "/", "timesbd", colorTxt[1], colorTxt[2], colorTxt[3], 26)
    HUD.PrintXY(maxPos + diff, y, string.format("%03d", total), "timesbd", colorMax[1], colorMax[2], colorMax[3], 26)
    if bonus and 0 < bonus then
      HUD.PrintXY(maxPos + diff + HUD.GetTextWidth(string.format("%03d", total)), y, string.format("+%d", bonus), "timesbd", 120, 120, 120, 26)
      star_pos = maxPos + HUD.GetTextWidth(string.format("%03d+%d", total, bonus))
    else
      star_pos = maxPos + HUD.GetTextWidth(string.format("%03d", total))
    end
  end
  if show_star and total <= val then
    self:Quad(self._matStar, star_pos, y + HUD.GetTextHeight() / 2 - 18 * h / 768, 1)
  end
  if diff then
    HUD.PrintXY(maxPos + HUD.GetTextWidth("000000000"), y, string.format("(%s)", diff), "timesbd", colorTxt[1], colorTxt[2], colorTxt[3], 26)
  end
end

function Hud_RenderLevelStats()
  if not Game then
    return
  end
  local name = PMENU.MapGetCurrLevelName()
  Game:MakeEmptyLevelStats(name)
  local stats = Game.LevelsStats[name]
  if not stats then
    return
  end
  local colorTxt = {
    230,
    161,
    97
  }
  local colorMin = {
    214,
    0,
    23
  }
  local colorMax = {
    189,
    0,
    0
  }
  HUD.DrawBorder(100, 128, 824, 560)
  local w, h = R3D.ScreenSize()
  HUD.SetFont("timesbd", 26)
  local fh = HUD.GetTextHeight() + 8 * h / 768
  HUD.PrintXY(-1, h / 2 - fh * 7, TXT.SPStats.BestScore, "timesbd", colorTxt[1], colorTxt[2], colorTxt[3], 26)
  local min = math.abs(stats.GameplayTime / 60)
  local sec = math.mod(stats.GameplayTime, 60)
  local sepPos = w / 2 - 80 * w / 1024
  local spos = 0
  local sepWidth = HUD.GetTextWidth(": ")
  local slashWidth = HUD.GetTextWidth("/")
  local numWidth = HUD.GetTextWidth("000")
  local minPos = sepPos + sepWidth
  local slashPos = minPos + numWidth
  local maxPos = slashPos + slashWidth
  local diff = {
    TXT.Menu.Daydream,
    TXT.Menu.Insomnia,
    TXT.Menu.Nightmare,
    TXT.Menu.Trauma
  }
  spos = sepPos - HUD.GetTextWidth(TXT.SPStats.GameplayTime)
  HUD.PrintXY(spos, h / 2 - fh * 5, TXT.SPStats.GameplayTime .. ": ", "timesbd", colorTxt[1], colorTxt[2], colorTxt[3], 26)
  if min < 60 then
    HUD.PrintXY(minPos, h / 2 - fh * 5, string.format("%02d", min) .. ":" .. string.format("%02d", sec), "timesbd", colorMin[1], colorMin[2], colorMin[3], 26)
  else
    local hour = math.floor(min / 60)
    min = min - hour * 60
    HUD.PrintXY(minPos, h / 2 - fh * 5, string.format("%02d", hour) .. ":" .. string.format("%02d", min) .. ":" .. string.format("%02d", sec), "timesbd", colorMin[1], colorMin[2], colorMin[3], 26)
  end
  if diff[stats.TimeDiff + 1] then
    HUD.PrintXY(maxPos + HUD.GetTextWidth("000000000"), h / 2 - fh * 5, string.format("(%s)", diff[stats.TimeDiff + 1]), "timesbd", colorTxt[1], colorTxt[2], colorTxt[3], 26)
  end
  local show_stars = true
  if stats.GameplayTime == 0 then
    show_stars = false
  end
  Hud:DrawSingleStat2(1, TXT.SPStats.MonstersKilled, stats.MonstersKilled, stats.TotalMonsters, nil, false, diff[stats.MonstersDiff + 1])
  Hud:DrawSingleStat2(2, TXT.SPStats.SoulsCollected, stats.SoulsCollected, stats.TotalSouls, nil, false, diff[stats.SoulsDiff + 1])
  Hud:DrawSingleStat2(3, TXT.SPStats.GoldFound, stats.GoldFound, stats.TotalGold, stats.BonusItems, false, diff[stats.GoldDiff + 1])
  HUD.DrawQuadRGBA(nil, 300 * w / 1024, h / 2 - 5 * h / 768 - fh / 2, 440 * w / 1024, 1, 230, 161, 97, 255)
  Hud:DrawSingleStat2(5, TXT.SPStats.ArmorFound, stats.ArmorsFound, stats.TotalArmors, nil, show_stars, diff[stats.ArmorsDiff + 1])
  Hud:DrawSingleStat2(6, TXT.SPStats.HolyItemsFound, stats.HolyItemsFound, stats.TotalHolyItems, nil, show_stars, diff[stats.HolyDiff + 1])
  Hud:DrawSingleStat2(7, TXT.SPStats.AmmoFound, stats.AmmoFound, stats.TotalAmmo, nil, show_stars, diff[stats.AmmoDiff + 1])
  Hud:DrawSingleStat2(8, TXT.SPStats.ObjectsDestroyed, stats.ObjectsDestroyed, stats.TotalObjects, nil, show_stars, diff[stats.ObjectsDiff + 1])
  Hud:DrawSingleStat2(9, TXT.SPStats.SecretsFound, stats.SecretsFound, stats.TotalSecrets, nil, show_stars, diff[stats.SecretsDiff + 1])
  HUD.PrintXY(-1, h / 2 + fh * 6 - 8 * w / 768, TXT.SPStats.CardCondition .. ":", "timesbd", colorTxt[1], colorTxt[2], colorTxt[3], 26)
  HUD.PrintXY(-1, h / 2 + fh * 7 - 8 * w / 768, PMENU.MapGetCurrLevelCardCondition(), "timesbd", colorMax[1], colorMax[2], colorMax[3], 26)
  local cardStatus = Game.CardsAvailable[PMENU.MapGetCurrLevelCardIndex()]
  local cardText = TXT.SPStats.Locked
  if cardStatus == true then
    cardText = TXT.SPStats.Unlocked
  end
  local statLen = HUD.GetTextWidth(TXT.SPStats.Status .. ": " .. cardText)
  HUD.PrintXY(w / 2 - statLen / 2, h / 2 + fh * 8 - 8 * w / 768, TXT.SPStats.Status .. ": ", "timesbd", colorTxt[1], colorTxt[2], colorTxt[3], 26)
  HUD.PrintXY(w / 2 + statLen / 2 - HUD.GetTextWidth(cardText), h / 2 + fh * 8 - 8 * w / 768, cardText, "timesbd", colorMin[1], colorMin[2], colorMin[3], 26)
end

function Hud:RenderCompass()
  if not Player then
    return
  end
  local check = false
  self.upDown = 0
  local vert = 0
  if self.r_closestEnemy then
    local tx = self.r_closestEnemy._groundx - Player._groundx
    local tz = self.r_closestEnemy._groundz - Player._groundz
    local angle = math.atan2(tx, tz)
    self._arrowRot = AngDist(Player.angle, angle)
    vert = self.r_closestEnemy._groundy - Player._groundy
  elseif self._nearestCheckPoint then
    local tx = self._nearestCheckPoint.Pos.X - Player._groundx
    local tz = self._nearestCheckPoint.Pos.Z - Player._groundz
    local angle = math.atan2(tx, tz)
    self._arrowRot = AngDist(Player.angle, angle)
    vert = self._nearestCheckPoint.Pos.Y - Player._groundy
    check = true
  else
    self._arrowRot = 0
  end
  if vert < -2 then
    self.upDown = 1
  elseif 2 < vert then
    self.upDown = 2
  else
    self.upDown = 0
  end
  local time = INP.GetTime()
  if check and self._nearestIsCheckpoint then
    if 0 >= self._glowTrans and time - self._glowStart > 1.5 then
      local dist = Dist3D(self._nearestCheckPoint.Pos.X, self._nearestCheckPoint.Pos.Y, self._nearestCheckPoint.Pos.Z, Player._groundx, Player._groundy, Player._groundz)
      local vol = 120 - 4 * dist
      if 0 < vol then
        if 100 < vol then
          vol = 100
        end
        PlaySound2D("pickup_health_minisphere", vol, true, false)
      end
      self._glowDir = 1
      self._glowTrans = 0
    end
    if self._glowTrans >= 255 then
      self._glowDir = -1
      self._glowTrans = 255
      self._glowStart = time
    end
    if time - self._glowTime > 0.001 then
      if self._glowDir == 1 then
        self._glowTrans = self._glowTrans + self._glowDir * 18
      else
        self._glowTrans = self._glowTrans + self._glowDir * 6
      end
      if 0 >= self._glowTrans then
        self._glowTrans = 0
      end
      if self._glowTrans >= 255 then
        self._glowTrans = 255
      end
      self._glowTime = time
    end
  else
    self._glowTrans = 0
  end
  if self._glowTrans2 <= Tweak.HUD.CompassUpDownStrength then
    self._glowDir2 = 1
    self._glowTrans2 = Tweak.HUD.CompassUpDownStrength
  end
  if 255 <= self._glowTrans2 then
    self._glowDir2 = -1
    self._glowTrans2 = 255
    self._glowStart2 = time
  end
  if 0.001 < time - self._glowTime2 then
    self._glowTrans2 = self._glowTrans2 + self._glowDir2 * Tweak.HUD.CompassUpDownSpeed * (time - self._glowTime2)
    if self._glowTrans2 <= Tweak.HUD.CompassUpDownStrength then
      self._glowTrans2 = Tweak.HUD.CompassUpDownStrength
    end
    if 255 <= self._glowTrans2 then
      self._glowTrans2 = 255
    end
    self._glowTime2 = time
  end
  local w, h = R3D.ScreenSize()
  if not check then
    self:QuadRot(self._matCompassArrShadow, 500 * w / 1024, Cfg.HUDSize * 62 * h / 768, Cfg.HUDSize, self._arrowRot, 516 * w / 1024, Cfg.HUDSize * 58 * h / 768)
    self:QuadRot(self._matCompassArrow, 495 * w / 1024, Cfg.HUDSize * 58 * h / 768, Cfg.HUDSize, self._arrowRot, 511 * w / 1024, Cfg.HUDSize * 54 * h / 768)
  else
    self:QuadRot(self._matCompassArrShadow, 500 * w / 1024, Cfg.HUDSize * 62 * h / 768, Cfg.HUDSize, self._arrowRot, 516 * w / 1024, Cfg.HUDSize * 58 * h / 768)
    self:QuadRot(self._matCompassArrow, 495 * w / 1024, Cfg.HUDSize * 58 * h / 768, Cfg.HUDSize, self._arrowRot, 511 * w / 1024, Cfg.HUDSize * 54 * h / 768)
    self:QuadRotTrans(self._matCompassArrGlow, 495 * w / 1024, Cfg.HUDSize * 58 * h / 768, Cfg.HUDSize, self._arrowRot, 511 * w / 1024, Cfg.HUDSize * 54 * h / 768, self._glowTrans)
  end
end

function Hud:RenderUpDown()
  local w, h = R3D.ScreenSize()
  local trans = HUD.GetTransparency()
  if self.upDown == 0 then
    self:QuadTrans(self._matCompassUp, (512 - 17 * Cfg.HUDSize) * w / 1024, 0, Cfg.HUDSize, false, trans)
    self:QuadTrans(self._matCompassDown, (512 - 17 * Cfg.HUDSize) * w / 1024, 87 * Cfg.HUDSize * h / 768, Cfg.HUDSize, false, trans)
  elseif self.upDown == 1 then
    self:QuadTrans(self._matCompassUp, (512 - 17 * Cfg.HUDSize) * w / 1024, 0, Cfg.HUDSize, false, trans)
    self:QuadTrans(self._matCompassDownOn, (512 - 17 * Cfg.HUDSize) * w / 1024, 87 * Cfg.HUDSize * h / 768, Cfg.HUDSize, false, self._glowTrans2)
  elseif self.upDown == 2 then
    self:QuadTrans(self._matCompassUpOn, (512 - 17 * Cfg.HUDSize) * w / 1024, 0, Cfg.HUDSize, false, self._glowTrans2)
    self:QuadTrans(self._matCompassDown, (512 - 17 * Cfg.HUDSize) * w / 1024, 87 * Cfg.HUDSize * h / 768, Cfg.HUDSize, false, trans)
  end
end

function Hud:UpdateCompass()
  self.r_closestEnemy = GetNearestLiveActor()
  if self.r_closestEnemy then
    for i, v in GObjects.CheckPoints, nil do
      if v.Frozen == false and v.BaseObj == "CheckPoint.CItem" then
        GObjects:ToKill(v)
      end
    end
  end
  self._nearestIsCheckpoint = false
  self._nearestCheckPoint, self._nearestIsCheckpoint = GetNearestCheckPoint()
end

function Hud:QuadSlice(mat, mw, mh, x, y, u1, v1, u2, v2)
  if 0 < u1 then
    mw = mw * (1 - u1)
  end
  if 0 < v1 then
    mh = mh * (1 - v1)
  end
  if 0 < u2 then
    mw = mw * u2
  end
  if 0 < v2 then
    mh = mh * v2
  end
  HUD.DrawQuad(mat, x, y, mw, mh, color, u1, v1, u2, v2)
end

function Hud:Quad(mat, x, y, size, center)
  local mw, mh = MATERIAL.Size(mat)
  if mw == -1 then
    Game:Print("Hud:Quad - material: " .. mat .. " not found!")
    return
  end
  local w, h = R3D.ScreenSize()
  mw = mw * size * w / 1024
  mh = mh * size * h / 768
  if center then
    x = x - mw / 2
    y = y - mh / 2
  end
  HUD.DrawQuad(mat, x, y, mw, mh)
end

function Hud:QuadUV(mat, x, y, size, center, u, v, u1, v1)
  local mw, mh = MATERIAL.Size(mat)
  local w, h = R3D.ScreenSize()
  mw = mw * size * w / 1024
  mh = mh * size * h / 768
  if center then
    x = x - mw / 2
    y = y - mh / 2
  end
  HUD.DrawQuad(mat, x, y, mw, mh, R3D.RGB(255, 255, 255), u, v, u1, v1)
end

function Hud:QuadTrans(mat, x, y, size, center, trans)
  local mw, mh = MATERIAL.Size(mat)
  local w, h = R3D.ScreenSize()
  mw = mw * size * w / 1024
  mh = mh * size * h / 768
  if center then
    x = x - mw / 2
    y = y - mh / 2
  end
  HUD.DrawQuadRGBA(mat, x, y, mw, mh, 255, 255, 255, trans)
end

function Hud:QuadTransUV(mat, x, y, size, center, trans, u, v, u1, v1)
  local mw, mh = MATERIAL.Size(mat)
  local w, h = R3D.ScreenSize()
  mw = mw * size * w / 1024
  mh = mh * size * h / 768
  if center then
    x = x - mw / 2
    y = y - mh / 2
  end
  HUD.DrawQuadRGBA(mat, x, y, mw, mh, 255, 255, 255, trans, u, v, u1, v1)
end

function Hud:QuadRGBA(mat, x, y, size, center, r, g, b, a)
  local mw, mh = MATERIAL.Size(mat)
  local w, h = R3D.ScreenSize()
  mw = mw * size * w / 1024
  mh = mh * size * h / 768
  if center then
    x = x - mw / 2
    y = y - mh / 2
  end
  HUD.DrawQuadRGBA(mat, x, y, mw, mh, r, g, b, a)
end

function Hud:QuadRot(mat, x, y, size, angle, rotx, roty)
  local mw, mh = MATERIAL.Size(mat)
  local w, h = R3D.ScreenSize()
  mw = mw * size * w / 1024
  mh = mh * size * h / 768
  HUD.DrawQuadRotated(mat, x, y, mw, mh, angle, rotx, roty)
end

function Hud:QuadRotTrans(mat, x, y, size, angle, rotx, roty, trans)
  local mw, mh = MATERIAL.Size(mat)
  local w, h = R3D.ScreenSize()
  mw = mw * size * w / 1024
  mh = mh * size * h / 768
  HUD.DrawQuadRotated(mat, x, y, mw, mh, angle, rotx, roty, 255, 255, 255, trans)
end

function Hud:DrawChar(x, y, chr, color, size)
  local n = tonumber(chr)
  if not n then
    return
  end
  local cy = math.floor(n / 4)
  local cx = n - cy * 4
  local mw, mh = MATERIAL.Size(self._matNumbers)
  HUD.DrawQuad(self._matNumbers, x, y, mw / 4 * size, mh / 4 * size, color, cx * 0.25, cy * 0.25, cx * 0.25 + 0.25, cy * 0.25 + 0.25)
end

function Hud:DrawText(x, y, txt, color, size)
  local l = string.len(txt)
  local mw, mh = MATERIAL.Size(self._matNumbers)
  for i = 1, l do
    self:DrawChar(x + (i - 1) * mw / 4 * size * 0.5, y, string.sub(txt, i, i), color, size)
  end
end

function Hud:DrawDigit(x, y, chr, scale)
  local w, h = R3D.ScreenSize()
  local n = tonumber(chr)
  if not n then
    return
  end
  local mw, mh = MATERIAL.Size(self._matDigits[n + 1])
  HUD.DrawQuad(self._matDigits[n + 1], x, y, mw * scale * w / 1024, mh * scale * h / 768)
end

function Hud:DrawDigitRed(x, y, chr, scale)
  local w, h = R3D.ScreenSize()
  local n = tonumber(chr)
  if not n then
    return
  end
  local mw, mh = MATERIAL.Size(self._matDigitsRed[n + 1])
  HUD.DrawQuad(self._matDigitsRed[n + 1], x, y, mw * scale * w / 1024, mh * scale * h / 768)
end

function Hud:DrawDigitsText(x, y, txt, scale, warning)
  local w, h = R3D.ScreenSize()
  local l = string.len(txt)
  local mw, mh = MATERIAL.Size(self._matDigits[5])
  if warning == nil or 0 <= warning and warning < tonumber(txt) or warning < 0 and -warning > tonumber(txt) then
    for i = 1, l do
      self:DrawDigit(x + (i - 1) * (mw - 4) * (w / 1024) * scale, y, string.sub(txt, i, i), scale)
    end
  else
    for i = 1, l do
      self:DrawDigitRed(x + (i - 1) * (mw - 4) * (w / 1024) * scale, y, string.sub(txt, i, i), scale)
    end
  end
end

ConCommands = {
  {
    cmd = "god",
    params = {
      p1 = "GOD = true",
      p0 = "GOD = false",
      default = "p1"
    }
  },
  {cmd = "quit", action = "Exit()"}
}

function Hud_OnConsoleCommand(cmd)
  Console:OnCommand(cmd)
end

function Hud_OnSayToAll(txt, color)
  if Game.GMode == GModes.SingleGame then
    return
  end
  txt = string.sub(txt, 1, 200)
  color = color or R3D.RGB(255, 0, 0)
  Game.SayToAll(NET.GetClientID(), txt, color)
  CONSOLE.Activate(false)
end

function Hud_OnSayToTeam(txt, color)
  if Game.GMode == GModes.SingleGame then
    return
  end
  txt = string.sub(txt, 1, 200)
  if Player then
    color = color or R3D.RGB(0, 255, 0)
    Game.SayToTeam(NET.GetClientID(), txt, color)
  end
  CONSOLE.Activate(false)
end

function Hud_OnSayTo(index)
  if not Cfg.MessagesTexts[index] then
    return
  end
  local txt = Cfg.MessagesTexts[index]
  local prefix = string.sub(txt, 1, 1)
  local c = string.sub(txt, 2, 2)
  local color
  if prefix == "#" and c then
    Game:Print("color message -" .. c .. "- " .. txt)
    c = tonumber(c)
    if c and type(c) == "number" and 0 <= c and c < 16 then
      local r, g, b = PMENU.GetTextColor("" .. c)
      color = R3D.RGB(r, g, b)
      txt = string.sub(txt, 3)
    end
  end
  if color then
    Game:Print("Color ok")
  end
  if Cfg.MessagesSayAll[index] == 1 then
    Hud_OnSayToAll(txt, color)
  else
    Hud_OnSayToTeam(txt, color)
  end
end

function Hud:ExecConsoleCommand(i, param)
  if ConCommands[i].params then
    if ConCommands[i].params["p" .. param] then
      dostring(ConCommands[i].params["p" .. param])
    elseif param == "" then
      dostring(ConCommands[i].params[ConCommands[i].params.default])
    end
  elseif ConCommands[i].action then
    dostring(ConCommands[i].action)
  end
end

function Hud:OnConsoleTab(cmd)
  Console:OnPrompt(cmd)
end
