function Hud:LowAmmo()
  LAmmos = {
    {
      1,
      
      0,
      0,
      0,
      0
    },
    {
      2,
      Player.Ammo.Shotgun,
      Player.Ammo.IceBullets,
      Player.s_SubClass.AmmoWarning.Shotgun,
      Player.s_SubClass.AmmoWarning.IceBullets
    },
    {
      3,
      Player.Ammo.Stakes,
      Player.Ammo.Grenades,
      Player.s_SubClass.AmmoWarning.Stakes,
      Player.s_SubClass.AmmoWarning.Grenades
    },
    {
      4,
      Player.Ammo.Grenades,
      Player.Ammo.MiniGun,
      Player.s_SubClass.AmmoWarning.Grenades,
      Player.s_SubClass.AmmoWarning.MiniGun
    },
    {
      5,
      Player.Ammo.Shurikens,
      Player.Ammo.Electro,
      Player.s_SubClass.AmmoWarning.Shurikens,
      Player.s_SubClass.AmmoWarning.Electro
    },
    {
      6,
      Player.Ammo.Rifle,
      Player.Ammo.FlameThrower,
      Player.s_SubClass.AmmoWarning.Rifle,
      Player.s_SubClass.AmmoWarning.FlameThrower
    },
    {
      7,
      Player.Ammo.Bolt,
      Player.Ammo.HeaterBomb,
      Player.s_SubClass.AmmoWarning.Bolt,
      Player.s_SubClass.AmmoWarning.HeaterBomb
    }
  }
  local w, h = R3D.ScreenSize()
  local cw = Player._CurWeaponIndex
  local j = Player:GetCurWeaponSlotIndex()
  if 1 < LAmmos[j][1] then
    cwx = LAmmos[j][1]
    pfire = LAmmos[j][2]
    paltfire = LAmmos[j][3]
    warfire = LAmmos[j][4]
    waraltfire = LAmmos[j][5]
    tmendsnd = Hud.LAmmosPlaySound[j][1]
    tmendaltsnd = Hud.LAmmosPlaySound[j][2]
  end
  local amfire = tonumber(string.sub(string.format("%03d", pfire), -3))
  local amaltfire = tonumber(string.sub(string.format("%03d", paltfire), -3))
  if amfire > warfire and cw == 2 then
    if tmendsnd == false then
      Hud.LAmmosPlaySound[j][1] = true
    end
  elseif amfire > warfire and cw == 3 then
    if tmendsnd == false then
      Hud.LAmmosPlaySound[j][1] = true
    end
  elseif amfire > warfire and cw == 4 then
    if tmendsnd == false then
      Hud.LAmmosPlaySound[j][1] = true
    end
  elseif amfire > warfire and cw == 5 then
    if tmendsnd == false then
      Hud.LAmmosPlaySound[j][1] = true
    end
  elseif amfire > warfire and cw == 6 then
    if tmendsnd == false then
      Hud.LAmmosPlaySound[j][1] = true
    end
  elseif amfire > warfire and cw == 7 and tmendsnd == false then
    Hud.LAmmosPlaySound[j][1] = true
  end
  if amaltfire > waraltfire and cw == 2 then
    if tmendaltsnd == false then
      Hud.LAmmosPlaySound[j][2] = true
    end
  elseif amaltfire > waraltfire and cw == 3 then
    if tmendaltsnd == false then
      Hud.LAmmosPlaySound[j][2] = true
    end
  elseif amaltfire > waraltfire and cw == 4 then
    if tmendaltsnd == false then
      Hud.LAmmosPlaySound[j][2] = true
    end
  elseif amaltfire > waraltfire and cw == 5 then
    if tmendaltsnd == false then
      Hud.LAmmosPlaySound[j][2] = true
    end
  elseif amaltfire > waraltfire and cw == 6 then
    if tmendaltsnd == false then
      Hud.LAmmosPlaySound[j][2] = true
    end
  elseif amaltfire > waraltfire and cw == 7 and tmendaltsnd == false then
    Hud.LAmmosPlaySound[j][2] = true
  end
  if amfire <= warfire and amfire ~= 0 and cw == cwx and tmendsnd then
    PlaySound2D("../Sounds/lowammo", Cfg.LASoundVolume, nil, true)
    Hud.LAmmosPlaySound[j][1] = false
  end
  if amaltfire <= waraltfire and amaltfire ~= 0 and cw == cwx and tmendaltsnd then
    PlaySound2D("../Sounds/lowammo", Cfg.LASoundVolume, nil, true)
    Hud.LAmmosPlaySound[j][2] = false
  end
end

function Hud:DrawDigit1(x, y, chr, scale, r, g, b, trans)
  local w, h = R3D.ScreenSize()
  local n = tonumber(chr)
  if not n then
    return
  end
  local mw, mh = MATERIAL.Size(self._matDigits[n + 1])
  if Cfg.HUD_HudStyle == 0 then
    HUD.DrawQuad(self._matDigits[n + 1], x, y, mw * scale * w / 1024, mh * scale * h / 768)
  else
    HUD.DrawQuadRGBA(self._matDigitsT[n + 1], x, y, mw * scale * w / 1024, mh * scale * h / 768, r, g, b, trans)
  end
end

function Hud:DrawDigitRed1(x, y, chr, scale, r, g, b, trans)
  local w, h = R3D.ScreenSize()
  local n = tonumber(chr)
  if not n then
    return
  end
  local mw, mh = MATERIAL.Size(self._matDigitsRed[n + 1])
  if Cfg.HUD_HudStyle == 0 then
    HUD.DrawQuad(self._matDigitsRed[n + 1], x, y, mw * scale * w / 1024, mh * scale * h / 768)
  else
    HUD.DrawQuadRGBA(self._matDigitsTRed[n + 1], x, y, mw * scale * w / 1024, mh * scale * h / 768, r, g, b, trans)
  end
end

function Hud:DrawDigitsText1(x, y, txt, scale, warning, r, g, b, trans)
  local w, h = R3D.ScreenSize()
  local l = string.len(txt)
  local mw, mh = MATERIAL.Size(Hud._matDigits[5])
  if warning == nil or 0 <= warning and warning < tonumber(txt) or warning < 0 and -warning > tonumber(txt) then
    for i = 1, l do
      self:DrawDigit1(x + (i - 1) * (mw - 4) * (w / 1024) * scale, y, string.sub(txt, i, i), scale, r, g, b, trans)
    end
  else
    for i = 1, l do
      self:DrawDigitRed1(x + (i - 1) * (mw - 4) * (w / 1024) * scale, y, string.sub(txt, i, i), scale, nil, nil, nil, trans)
    end
  end
end

function Hud:SelectBestWeapon(priorityList)
  for i, o in priorityList, nil do
    if o == 0 then
      return -1, -1
    end
    local slot = tonumber(string.sub(tostring(o), 1, 1))
    local fire = tonumber(string.sub(tostring(o), 2, 2))
    local ammoname = Weapon2Ammo[o]
    if Player.EnabledWeapons[slot] then
      return slot, fire, ammoname
    end
  end
end

function Hud:NoAltFire()
  local action = INP.GetActionStatus(Player._Entity)
  local cw = Player._CurWeaponIndex
  local cwe = Player:GetCurWeapon()
  local ns, fire, wea = Hud:SelectBestWeapon(Cfg.BestWeapons1)
  local ns1, fire1, wea1 = Hud:SelectBestWeapon(Cfg.BestWeapons2)
  if INP.Action(Actions.SelectBestWeapon1) or INP.Action(Actions.FireBestWeapon1) then
    if fire == 2 then
      local ammonum = Player.Ammo[wea]
      if wea1 == "Full" then
        ammonum = 1
      end
      if Hud._weaponsalt[ns] == false and 0 < ammonum then
        Hud._weaponsalt[ns] = true
      end
      if Hud._weaponspri[ns] == true and 0 < ammonum then
        Hud._prevsoltalt = true
        Hud._weaponspri[ns] = false
      end
    end
    if fire == 1 then
      local ammonum = Player.Ammo[wea]
      if wea1 == "Full" then
        ammonum = 1
      end
      if Hud._weaponspri[ns] == false and 0 < ammonum then
        Hud._weaponspri[ns] = true
      end
      if Hud._weaponsalt[ns] == true and 0 < ammonum then
        Hud._prevsoltpri = true
        Hud._weaponsalt[ns] = false
      end
    end
  else
    if Hud._prevsoltalt == true and cwe.ShotTimeOut == -2 then
      Hud._weaponspri[ns] = true
      Hud._weaponsalt[ns] = false
      Hud._prevsoltalt = false
    end
    if Hud._prevsoltpri == true and cwe.ShotTimeOut == -2 then
      Hud._weaponsalt[ns] = true
      Hud._weaponspri[ns] = false
      Hud._prevsoltpri = false
    end
  end
  if INP.Action(Actions.SelectBestWeapon2) or INP.Action(Actions.FireBestWeapon2) then
    if fire1 == 2 then
      local ammonum = Player.Ammo[wea1]
      if wea1 == "Full" then
        ammonum = 1
      end
      if Hud._weaponsalt[ns1] == false and 0 < ammonum then
        Hud._weaponsalt[ns1] = true
      end
      if Hud._weaponspri[ns1] == true and 0 < ammonum then
        Hud._prevsoltalt1 = true
        Hud._weaponspri[ns1] = false
      end
    end
    if fire1 == 1 then
      local ammonum = Player.Ammo[wea1]
      if wea1 == "Full" then
        ammonum = 1
      end
      if Hud._weaponspri[ns1] == false and 0 < ammonum then
        Hud._weaponspri[ns1] = true
      end
      if Hud._weaponsalt[ns1] == true and 0 < ammonum then
        Hud._prevsoltpri1 = true
        Hud._weaponsalt[ns1] = false
      end
    end
  else
    if Hud._prevsoltalt1 == true and cwe.ShotTimeOut == -2 then
      Hud._weaponsalt[ns1] = false
      Hud._weaponspri[ns1] = true
      Hud._prevsoltalt1 = false
    end
    if Hud._prevsoltpri1 == true and cwe.ShotTimeOut == -2 then
      Hud._weaponsalt[ns1] = true
      Hud._weaponspri[ns1] = false
      Hud._prevsoltpri1 = false
    end
  end
  if (INP.Action(Actions.NextWeapon) or INP.Action(Actions.PrevWeapon)) and Hud._weaponsalt[cw] == false then
    Hud._weaponspri[cw] = true
    Hud._weaponsalt[cw] = false
  end
  if INP.Key(FKeys[Cfg.KeyPrimaryWeapon2]) == 1 or INP.Key(FKeys[Cfg.KeyAlternativeWeapon2]) == 1 then
    Hud._PriKeyPressed[2] = true
  end
  if INP.Key(FKeys[Cfg.KeyPrimaryWeapon3]) == 1 or INP.Key(FKeys[Cfg.KeyAlternativeWeapon3]) == 1 then
    Hud._PriKeyPressed[3] = true
  end
  if INP.Key(FKeys[Cfg.KeyPrimaryWeapon4]) == 1 or INP.Key(FKeys[Cfg.KeyAlternativeWeapon4]) == 1 then
    Hud._PriKeyPressed[4] = true
  end
  if INP.Key(FKeys[Cfg.KeyPrimaryWeapon5]) == 1 or INP.Key(FKeys[Cfg.KeyAlternativeWeapon5]) == 1 then
    Hud._PriKeyPressed[5] = true
  end
  if INP.Key(FKeys[Cfg.KeyPrimaryWeapon7]) == 1 or INP.Key(FKeys[Cfg.KeyAlternativeWeapon7]) == 1 then
    Hud._PriKeyPressed[7] = true
  end
  if Hud._PriKeyPressed[cw] == true then
    local cwe = Player:GetCurWeapon()
    if cwe.ShotTimeOut == -2 then
      for i = 1, 7 do
        Hud._weaponsalt[i] = false
      end
      Hud._weaponspri[cw] = true
      Hud._PriKeyPressed[cw] = false
    end
  end
  if INP.Key(FKeys[Cfg.KeyPrimaryWeapon9]) == 1 or INP.Key(FKeys[Cfg.KeyAlternativeWeapon9]) == 1 then
    Hud._AltKeyPressed[2] = true
  end
  if INP.Key(FKeys[Cfg.KeyPrimaryWeapon10]) == 1 or INP.Key(FKeys[Cfg.KeyAlternativeWeapon10]) == 1 then
    Hud._AltKeyPressed[3] = true
  end
  if INP.Key(FKeys[Cfg.KeyPrimaryWeapon11]) == 1 or INP.Key(FKeys[Cfg.KeyAlternativeWeapon11]) == 1 then
    Hud._AltKeyPressed[4] = true
  end
  if INP.Key(FKeys[Cfg.KeyPrimaryWeapon12]) == 1 or INP.Key(FKeys[Cfg.KeyAlternativeWeapon12]) == 1 then
    Hud._AltKeyPressed[5] = true
  end
  if INP.Key(FKeys[Cfg.KeyPrimaryWeapon14]) == 1 or INP.Key(FKeys[Cfg.KeyAlternativeWeapon14]) == 1 then
    Hud._AltKeyPressed[7] = true
  end
  if Hud._AltKeyPressed[cw] == true then
    local cwe = Player:GetCurWeapon()
    if cwe.ShotTimeOut == -2 then
      if Cfg.SwitchFire[cw] then
        Hud._weaponsalt[cw] = false
        Hud._weaponspri[cw] = true
      else
        Hud._weaponsalt[cw] = true
        Hud._weaponspri[cw] = false
      end
      Hud._AltKeyPressed[cw] = false
    end
  end
end

function Hud:AmmoListOriOn()
  local w, h = R3D.ScreenSize()
  local gray = R3D.RGB(120, 120, 70)
  local sizex, sizey = MATERIAL.Size(Hud._matHUDLeft)
  local sizem = Cfg.HUD_AmmoList_Size[1]
  local posiy = Cfg.HUD_AmmoList_Position[1]
  if Cfg.HUD_AmmoList == 3 then
    sizem = Cfg.HUD_AmmoList_Size[2]
    posiy = Cfg.HUD_AmmoList_Position[2]
  end
  local posiymini = 306
  local posiymaxi = 768
  local trans = Cfg.HUD_Ammolist_Marker_Trans
  local transic = Cfg.HUD_Ammolist_Icons_Trans
  local transco = Cfg.HUD_Ammolist_Count_Trans
  local color = {
    Cfg.HUD_Ammolist_Marker_RGB[1],
    Cfg.HUD_Ammolist_Marker_RGB[2],
    Cfg.HUD_Ammolist_Marker_RGB[3]
  }
  local colord = {
    Cfg.HUD_Ammolist_Count_RGB[1],
    Cfg.HUD_Ammolist_Count_RGB[2],
    Cfg.HUD_Ammolist_Count_RGB[3]
  }
  local matselectG = Hud._matammoselectG
  local matselectR = Hud._matammoselectR
  local showinfi = 0.9
  local settingsave = "Your custom settings have been saved."
  local settingnosave = "This is the default settings, none settings saved."
  local settingloaded = "Your custom settings have been loaded."
  local settingnoloaded = "This is the default settings, none settings loaded"
  if Cfg.Language == "french" then
    settingsave = "Vos param\232tres personnalis\233s ont \233t\233 enregistr\233s."
    settingnosave = "C'est le param\233trage par d\233faut, aucun param\232tres enregistr\233s."
    settingloaded = "Vos param\232tres personnalis\233s ont \233t\233 charg\233s."
    settingnoloaded = "C'est le param\233trage par d\233faut, aucun param\232tres charg\233s."
  end
  local icoposix = 5 * w / 1024
  local textposix = icoposix + 42 * sizem * w / 1024
  local selectpoxix = 4 * w / 1024
  local textposix1 = (1019 - 113 * sizem) * w / 1024
  local textposix2 = icoposix + 1 * sizem * w / 1024
  if Cfg.HUD_AmmoList == 1 then
    icoposix = (1019 - 40 * sizem) * w / 1024
    textposix = (1019 - 105 * sizem) * w / 1024
    selectpoxix = (1019 - 111 * sizem) * w / 1024
  end
  local prcolor = {
    {
      255,
      255,
      255
    },
    {
      255,
      255,
      255
    },
    {
      255,
      255,
      255
    },
    {
      255,
      255,
      255
    },
    {
      255,
      255,
      255
    },
    {
      255,
      255,
      255
    },
    {
      255,
      255,
      255
    }
  }
  local alcolor = {
    {
      255,
      255,
      255
    },
    {
      255,
      255,
      255
    },
    {
      255,
      255,
      255
    },
    {
      255,
      255,
      255
    },
    {
      255,
      255,
      255
    },
    {
      255,
      255,
      255
    },
    {
      255,
      255,
      255
    }
  }
  local ammo1 = {
    Hud._matAmmoListShellIcon,
    Hud._matAmmoListKolkiIcon,
    Hud._matAmmoListMiniIcon,
    Hud._matAmmoListSzurikenIcon,
    Hud._matAmmoListrifleIcon,
    Hud._matAmmoListBoltyIcon
  }
  local ammo2 = {
    Hud._matAmmoListFreezerIcon,
    Hud._matAmmoListRocketIcon,
    Hud._matAmmoListRocketIcon,
    Hud._matAmmoListElectroIcon,
    Hud._matAmmoListikonaIcon,
    Hud._matAmmoListKulkiIcon
  }
  if Cfg.HUD_HudStyle ~= 0 then
    ammo1 = {
      Hud._matAmmoListShellIconSH,
      Hud._matAmmoListKolkiIconSH,
      Hud._matAmmoListMiniIconSH,
      Hud._matAmmoListSzurikenIconSH,
      Hud._matAmmoListrifleIconSH,
      Hud._matAmmoListBoltyIconSH
    }
    ammo2 = {
      Hud._matAmmoListFreezerIconSH,
      Hud._matAmmoListRocketIconSH,
      Hud._matAmmoListRocketIconSH,
      Hud._matAmmoListElectroIconSH,
      Hud._matAmmoListikonaIconSH,
      Hud._matAmmoListKulkiIconSH
    }
    prcolor = {
      {
        0,
        0,
        0
      },
      {
        255,
        102,
        0
      },
      {
        0,
        255,
        0
      },
      {
        255,
        0,
        0
      },
      {
        204,
        0,
        255
      },
      {
        153,
        153,
        153
      },
      {
        0,
        255,
        204
      }
    }
    alcolor = {
      {
        0,
        0,
        0
      },
      {
        0,
        102,
        255
      },
      {
        255,
        0,
        0
      },
      {
        255,
        255,
        0
      },
      {
        255,
        255,
        153
      },
      {
        0,
        0,
        0
      },
      {
        255,
        0,
        153
      }
    }
  end
  local nextposh = 0
  local nextposhfix = 0
  local ecart = 0
  local eca = 111
  local ecafix = 0
  local centhfix = 0
  local centwfix = 0
  local cent = h / 768 / 2
  if Player.EnabledWeapons[2] ~= Shotgun then
    centhfix = centhfix + 84
    centwfix = centwfix + eca
  end
  if Player.EnabledWeapons[3] ~= StakeGunGL then
    centhfix = centhfix + 84
    centwfix = centwfix + eca
  end
  if Player.EnabledWeapons[4] ~= MiniGunRL then
    centhfix = centhfix + 42
    centwfix = centwfix + eca / 2
  end
  if Player.EnabledWeapons[5] ~= DriverElectro then
    centhfix = centhfix + 84
    centwfix = centwfix + eca
  end
  if Player.EnabledWeapons[6] ~= RifleFlameThrower then
    centhfix = centhfix + 42
    centwfix = centwfix + eca / 2
  end
  if Player.EnabledWeapons[7] ~= BoltGunHeater then
    centhfix = centhfix + 84
    centwfix = centwfix + eca
  end
  local dsa = 115 - centwfix
  local dsb = 156 - centwfix
  local dsda = dsa - eca
  local dsdb = dsb - eca
  local sizemark = 219 * sizem
  local comar = {
    51,
    51,
    153
  }
  local selectedkey = ""
  Hud:NoAltFire()
  if Cfg.HUD_AmmoList == 3 then
    if Player._CurWeaponIndex == 2 then
      if Cfg.HUD_Ammolist_Marker_Primary then
        if not INP.IsFireSwitched() then
          if not (not Game.SwitchFire[2] and Cfg.SwitchFire[2]) or not Cfg.SwitchFire[2] and Game.SwitchFire[2] then
            if Hud._weaponspri[2] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponsalt[2] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
          else
            if Hud._weaponsalt[2] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponspri[2] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
          end
        elseif not (not Game.SwitchFire[2] and Cfg.SwitchFire[2]) or not Cfg.SwitchFire[2] and Game.SwitchFire[2] then
          if Hud._weaponsalt[2] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponspri[2] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
        else
          if Hud._weaponspri[2] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponsalt[2] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
        end
      else
        Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
        Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
      end
    end
    if Player.EnabledWeapons[2] ~= Shotgun then
      Hud:QuadRGBA(ammo1[1], w / 2 + (dsda + ecart) * sizem * w / 1024, (768 - posiy) * h / 768, sizem, false, prcolor[2][1], prcolor[2][2], prcolor[2][3], transic)
      Hud:QuadRGBA(ammo2[1], w / 2 + (dsa + ecart) * sizem * w / 1024, (768 - posiy) * h / 768, sizem, false, alcolor[2][1], alcolor[2][2], alcolor[2][3], transic)
      Hud:DrawDigitsText1(w / 2 + (dsdb + ecart) * sizem * w / 1024, (768 - (posiy - 2 * sizem)) * h / 768, string.sub(string.format("%03d", Player.Ammo.Shotgun), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.Shotgun, colord[1], colord[2], colord[3], transco)
      Hud:DrawDigitsText1(w / 2 + (dsb + ecart) * sizem * w / 1024, (768 - (posiy - 2 * sizem)) * h / 768, string.sub(string.format("%03d", Player.Ammo.IceBullets), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.IceBullets, colord[1], colord[2], colord[3], transco)
      ecafix = 0
      ecart = ecart + eca * 2 - ecafix
    end
    if Player._CurWeaponIndex == 3 then
      if Cfg.HUD_Ammolist_Marker_Primary then
        if not INP.IsFireSwitched() then
          if not (not Game.SwitchFire[3] and Cfg.SwitchFire[3]) or not Cfg.SwitchFire[3] and Game.SwitchFire[3] then
            if Hud._weaponspri[3] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponsalt[3] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
          else
            if Hud._weaponsalt[3] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponspri[3] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
          end
        elseif not (not Game.SwitchFire[3] and Cfg.SwitchFire[3]) or not Cfg.SwitchFire[3] and Game.SwitchFire[3] then
          if Hud._weaponsalt[3] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponspri[3] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
        else
          if Hud._weaponspri[3] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponsalt[3] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
        end
      else
        Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
        Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
      end
    end
    if Player._CurWeaponIndex == 4 then
      if Cfg.HUD_Ammolist_Marker_Primary then
        if not INP.IsFireSwitched() then
          if not (not Game.SwitchFire[4] and Cfg.SwitchFire[4]) or not Cfg.SwitchFire[4] and Game.SwitchFire[4] then
            if Hud._weaponspri[4] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart + 109) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponsalt[4] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart + 109) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
          else
            if Hud._weaponsalt[4] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart + 109) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponspri[4] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart + 109) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
          end
        elseif not (not Game.SwitchFire[4] and Cfg.SwitchFire[4]) or not Cfg.SwitchFire[4] and Game.SwitchFire[4] then
          if Hud._weaponsalt[4] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart + 109) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponspri[4] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart + 109) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
        else
          if Hud._weaponspri[4] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart + 109) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponsalt[4] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart + 109) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
        end
      else
        Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart + 109) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
        Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart + 109) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
      end
    end
    if Player.EnabledWeapons[3] ~= StakeGunGL then
      Hud:QuadRGBA(ammo1[2], w / 2 + (dsda + ecart) * sizem * w / 1024, (768 - posiy) * h / 768, sizem, false, prcolor[3][1], prcolor[3][2], prcolor[3][3], transic)
      Hud:QuadRGBA(ammo2[2], w / 2 + (dsa + ecart) * sizem * w / 1024, (768 - posiy) * h / 768, sizem, false, alcolor[3][1], alcolor[3][2], alcolor[3][3], transic)
      Hud:DrawDigitsText1(w / 2 + (dsdb + ecart) * sizem * w / 1024, (768 - (posiy - 2 * sizem)) * h / 768, string.sub(string.format("%04d", Player.Ammo.Stakes), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.Stakes, colord[1], colord[2], colord[3], transco)
      Hud:DrawDigitsText1(w / 2 + (dsb + ecart) * sizem * w / 1024, (768 - (posiy - 2 * sizem)) * h / 768, string.sub(string.format("%04d", Player.Ammo.Grenades), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.Grenades, colord[1], colord[2], colord[3], transco)
      ecafix = 0
      ecart = ecart + eca * 2 - ecafix
    end
    if Player.EnabledWeapons[4] ~= MiniGunRL then
      Hud:QuadRGBA(ammo1[3], w / 2 + (dsda + ecart) * sizem * w / 1024, (768 - posiy) * h / 768, sizem, false, alcolor[4][1], alcolor[4][2], alcolor[4][3], transic)
      Hud:DrawDigitsText1(w / 2 + (dsdb + ecart) * sizem * w / 1024, (768 - (posiy - 2 * sizem)) * h / 768, string.sub(string.format("%03d", Player.Ammo.MiniGun), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.MiniGun, colord[1], colord[2], colord[3], transco)
      ecafix = eca
      ecart = ecart + eca * 2 - ecafix
    end
    if Player._CurWeaponIndex == 5 then
      if Cfg.HUD_Ammolist_Marker_Primary then
        if not INP.IsFireSwitched() then
          if not (not Game.SwitchFire[5] and Cfg.SwitchFire[5]) or not Cfg.SwitchFire[5] and Game.SwitchFire[5] then
            if Hud._weaponspri[5] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponsalt[5] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
          else
            if Hud._weaponsalt[5] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponspri[5] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
          end
        elseif not (not Game.SwitchFire[5] and Cfg.SwitchFire[5]) or not Cfg.SwitchFire[5] and Game.SwitchFire[5] then
          if Hud._weaponsalt[5] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponspri[5] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
        else
          if Hud._weaponspri[5] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponsalt[5] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
        end
      else
        Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
        Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
      end
    end
    if Player.EnabledWeapons[5] ~= DriverElectro then
      Hud:QuadRGBA(ammo1[4], w / 2 + (dsda + ecart) * sizem * w / 1024, (768 - posiy) * h / 768, sizem, false, prcolor[5][1], prcolor[5][2], prcolor[5][3], transic)
      Hud:QuadRGBA(ammo2[4], w / 2 + (dsa + ecart) * sizem * w / 1024, (768 - posiy) * h / 768, sizem, false, alcolor[5][1], alcolor[5][2], alcolor[5][3], transic)
      Hud:DrawDigitsText1(w / 2 + (dsdb + ecart) * sizem * w / 1024, (768 - (posiy - 2 * sizem)) * h / 768, string.sub(string.format("%04d", Player.Ammo.Shurikens), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.Shurikens, colord[1], colord[2], colord[3], transco)
      Hud:DrawDigitsText1(w / 2 + (dsb + ecart) * sizem * w / 1024, (768 - (posiy - 2 * sizem)) * h / 768, string.sub(string.format("%04d", Player.Ammo.Electro), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.Electro, colord[1], colord[2], colord[3], transco)
      ecafix = 0
      ecart = ecart + eca * 2 - ecafix
    end
    if Player._CurWeaponIndex == 6 then
      Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
    end
    if Player.EnabledWeapons[6] ~= RifleFlameThrower then
      Hud:QuadRGBA(ammo1[5], w / 2 + (dsda + ecart) * sizem * w / 1024, (768 - posiy) * h / 768, sizem, false, prcolor[6][1], prcolor[6][2], prcolor[6][3], transic)
      Hud:DrawDigitsText1(w / 2 + (dsdb + ecart) * sizem * w / 1024, (768 - (posiy - 2 * sizem)) * h / 768, string.sub(string.format("%04d", Player.Ammo.Rifle), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.Rifle, colord[1], colord[2], colord[3], transco)
      ecafix = eca
      ecart = ecart + eca * 2 - ecafix
    end
    if Player._CurWeaponIndex == 7 then
      if Cfg.HUD_Ammolist_Marker_Primary then
        if not INP.IsFireSwitched() then
          if not (not Game.SwitchFire[7] and Cfg.SwitchFire[7]) or not Cfg.SwitchFire[7] and Game.SwitchFire[7] then
            if Hud._weaponspri[7] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponsalt[7] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
          else
            if Hud._weaponsalt[7] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponspri[7] then
              Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
            end
          end
        elseif not (not Game.SwitchFire[7] and Cfg.SwitchFire[7]) or not Cfg.SwitchFire[7] and Game.SwitchFire[7] then
          if Hud._weaponsalt[7] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponspri[7] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
        else
          if Hud._weaponspri[7] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponsalt[7] then
            Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
          end
        end
      else
        Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsda + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
        Hud:QuadRGBA(self._matSelectFrame, w / 2 + (dsa + ecart - 2) * sizem * w / 1024, (768 - (posiy + 1)) * h / 768, sizem, false, color[1], color[2], color[3], trans)
      end
    end
    if Player.EnabledWeapons[7] ~= BoltGunHeater then
      Hud:QuadRGBA(ammo1[6], w / 2 + (dsda + ecart) * sizem * w / 1024, (768 - posiy) * h / 768, sizem, false, prcolor[7][1], prcolor[7][2], prcolor[7][3], transic)
      Hud:QuadRGBA(ammo2[6], w / 2 + (dsa + ecart) * sizem * w / 1024, (768 - posiy) * h / 768, sizem, false, alcolor[7][1], alcolor[7][2], alcolor[7][3], transic)
      Hud:DrawDigitsText1(w / 2 + (dsdb + ecart) * sizem * w / 1024, (768 - (posiy - 2 * sizem)) * h / 768, string.sub(string.format("%04d", Player.Ammo.Bolt), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.Bolt, colord[1], colord[2], colord[3], transco)
      Hud:DrawDigitsText1(w / 2 + (dsb + ecart) * sizem * w / 1024, (768 - (posiy - 2 * sizem)) * h / 768, string.sub(string.format("%04d", Player.Ammo.HeaterBomb), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.HeaterBomb, colord[1], colord[2], colord[3], transco)
      ecafix = 0
      ecart = ecart + eca * 2 - ecafix
    end
  else
    if Player._CurWeaponIndex == 2 then
      if Cfg.HUD_Ammolist_Marker_Primary then
        if not INP.IsFireSwitched() then
          if not (not Game.SwitchFire[2] and Cfg.SwitchFire[2]) or not Cfg.SwitchFire[2] and Game.SwitchFire[2] then
            if Hud._weaponspri[2] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + centhfix * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponsalt[2] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
          else
            if Hud._weaponsalt[2] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + centhfix * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponspri[2] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
          end
        elseif not (not Game.SwitchFire[2] and Cfg.SwitchFire[2]) or not Cfg.SwitchFire[2] and Game.SwitchFire[2] then
          if Hud._weaponsalt[2] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + centhfix * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponspri[2] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
        else
          if Hud._weaponspri[2] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + centhfix * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponsalt[2] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
        end
      else
        Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + centhfix * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
        Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
      end
    end
    if Player.EnabledWeapons[2] ~= Shotgun then
      Hud:QuadRGBA(ammo1[1], icoposix, (768 - (posiy * 2 + centhfix * sizem)) * cent, sizem, false, prcolor[2][1], prcolor[2][2], prcolor[2][3], transic)
      Hud:QuadRGBA(ammo2[1], icoposix, (768 - (posiy * 2 - (84 - centhfix) * sizem)) * cent, sizem, false, alcolor[2][1], alcolor[2][2], alcolor[2][3], transic)
      Hud:DrawDigitsText1(textposix, (768 - (posiy * 2 + (centhfix - 3) * sizem)) * cent, string.sub(string.format("%03d", Player.Ammo.Shotgun), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.Shotgun, colord[1], colord[2], colord[3], transco)
      Hud:DrawDigitsText1(textposix, (768 - (posiy * 2 - (87 - centhfix) * sizem)) * cent, string.sub(string.format("%03d", Player.Ammo.IceBullets), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.IceBullets, colord[1], colord[2], colord[3], transco)
      nextposhfix = 0
      nextposh = nextposh + 168 + nextposhfix
    end
    if Player._CurWeaponIndex == 3 then
      if Cfg.HUD_Ammolist_Marker_Primary then
        if not INP.IsFireSwitched() then
          if not (not Game.SwitchFire[3] and Cfg.SwitchFire[3]) or not Cfg.SwitchFire[3] and Game.SwitchFire[3] then
            if Hud._weaponspri[3] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponsalt[3] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
          else
            if Hud._weaponsalt[3] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponspri[3] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
          end
        elseif not (not Game.SwitchFire[3] and Cfg.SwitchFire[3]) or not Cfg.SwitchFire[3] and Game.SwitchFire[3] then
          if Hud._weaponsalt[3] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponspri[3] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
        else
          if Hud._weaponspri[3] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponsalt[3] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
        end
      else
        Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
        Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
      end
    end
    if Player._CurWeaponIndex == 4 then
      if Cfg.HUD_Ammolist_Marker_Primary then
        if not INP.IsFireSwitched() then
          if not (not Game.SwitchFire[4] and Cfg.SwitchFire[4]) or not Cfg.SwitchFire[4] and Game.SwitchFire[4] then
            if Hud._weaponspri[4] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - (nextposh + 168) + 84) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponsalt[4] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + (nextposh + 168) - 84) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
          else
            if Hud._weaponsalt[4] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - (nextposh + 168) + 84) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponspri[4] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + (nextposh + 168) - 84) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
          end
        elseif not (not Game.SwitchFire[4] and Cfg.SwitchFire[4]) or not Cfg.SwitchFire[4] and Game.SwitchFire[4] then
          if Hud._weaponsalt[4] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - (nextposh + 168) + 84) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponspri[4] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + (nextposh + 168) - 84) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
        else
          if Hud._weaponspri[4] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - (nextposh + 168) + 84) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponsalt[4] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + (nextposh + 168) - 84) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
        end
      else
        Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - (nextposh + 168) + 84) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
        Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + (nextposh + 168) - 84) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
      end
    end
    if Player.EnabledWeapons[3] ~= StakeGunGL then
      Hud:QuadRGBA(ammo1[2], icoposix, (768 - (posiy * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, prcolor[3][1], prcolor[3][2], prcolor[3][3], transic)
      Hud:QuadRGBA(ammo2[2], icoposix, (768 - (posiy * 2 - (84 - centhfix + nextposh) * sizem)) * cent, sizem, false, alcolor[3][1], alcolor[3][2], alcolor[3][3], transic)
      Hud:DrawDigitsText1(textposix, (768 - (posiy * 2 + (centhfix - 3 - nextposh) * sizem)) * cent, string.sub(string.format("%04d", Player.Ammo.Stakes), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.Stakes, colord[1], colord[2], colord[3], transco)
      Hud:DrawDigitsText1(textposix, (768 - (posiy * 2 - (87 - centhfix + nextposh) * sizem)) * cent, string.sub(string.format("%04d", Player.Ammo.Grenades), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.Grenades, colord[1], colord[2], colord[3], transco)
      nextposhfix = 0
      nextposh = nextposh + 168 + nextposhfix
    end
    if Player.EnabledWeapons[4] ~= MiniGunRL then
      Hud:QuadRGBA(ammo1[3], icoposix, (768 - (posiy * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, alcolor[4][1], alcolor[4][2], alcolor[4][3], transic)
      Hud:DrawDigitsText1(textposix, (768 - (posiy * 2 + (centhfix - 3 - nextposh) * sizem)) * cent, string.sub(string.format("%03d", Player.Ammo.MiniGun), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.MiniGun, colord[1], colord[2], colord[3], transco)
      nextposhfix = 0 - 84
      nextposh = nextposh + 168 + nextposhfix
    end
    if Player._CurWeaponIndex == 5 then
      if Cfg.HUD_Ammolist_Marker_Primary then
        if not INP.IsFireSwitched() then
          if not (not Game.SwitchFire[5] and Cfg.SwitchFire[5]) or not Cfg.SwitchFire[5] and Game.SwitchFire[5] then
            if Hud._weaponspri[5] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponsalt[5] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
          else
            if Hud._weaponsalt[5] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponspri[5] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
          end
        elseif not (not Game.SwitchFire[5] and Cfg.SwitchFire[5]) or not Cfg.SwitchFire[5] and Game.SwitchFire[5] then
          if Hud._weaponsalt[5] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponspri[5] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
        else
          if Hud._weaponspri[5] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponsalt[5] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
        end
      else
        Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
        Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
      end
    end
    if Player.EnabledWeapons[5] ~= DriverElectro then
      Hud:QuadRGBA(ammo1[4], icoposix, (768 - (posiy * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, prcolor[5][1], prcolor[5][2], prcolor[5][3], transic)
      Hud:QuadRGBA(ammo2[4], icoposix, (768 - (posiy * 2 - (84 - centhfix + nextposh) * sizem)) * cent, sizem, false, alcolor[5][1], alcolor[5][2], alcolor[5][3], transic)
      Hud:DrawDigitsText1(textposix, (768 - (posiy * 2 + (centhfix - 3 - nextposh) * sizem)) * cent, string.sub(string.format("%04d", Player.Ammo.Shurikens), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.Shurikens, colord[1], colord[2], colord[3], transco)
      Hud:DrawDigitsText1(textposix, (768 - (posiy * 2 - (87 - centhfix + nextposh) * sizem)) * cent, string.sub(string.format("%04d", Player.Ammo.Electro), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.Electro, colord[1], colord[2], colord[3], transco)
      nextposhfix = 0
      nextposh = nextposh + 168 + nextposhfix
    end
    if Player._CurWeaponIndex == 6 then
      Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
    end
    if Player.EnabledWeapons[6] ~= RifleFlameThrower then
      Hud:QuadRGBA(ammo1[5], icoposix, (768 - (posiy * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, prcolor[6][1], prcolor[6][2], prcolor[6][3], transic)
      Hud:DrawDigitsText1(textposix, (768 - (posiy * 2 + (centhfix - 3 - nextposh) * sizem)) * cent, string.sub(string.format("%04d", Player.Ammo.Rifle), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.Rifle, colord[1], colord[2], colord[3], transco)
      nextposhfix = 0 - 84
      nextposh = nextposh + 168 + nextposhfix
    end
    if Player._CurWeaponIndex == 7 then
      if Cfg.HUD_Ammolist_Marker_Primary then
        if not INP.IsFireSwitched() then
          if not (not Game.SwitchFire[7] and Cfg.SwitchFire[7]) or not Cfg.SwitchFire[7] and Game.SwitchFire[7] then
            if Hud._weaponspri[7] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponsalt[7] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
          else
            if Hud._weaponsalt[7] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
            if Hud._weaponspri[7] then
              Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
            end
          end
        elseif not (not Game.SwitchFire[7] and Cfg.SwitchFire[7]) or not Cfg.SwitchFire[7] and Game.SwitchFire[7] then
          if Hud._weaponsalt[7] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponspri[7] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
        else
          if Hud._weaponspri[7] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
          if Hud._weaponsalt[7] then
            Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
          end
        end
      else
        Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
        Hud:QuadRGBA(self._matSelectFrame, selectpoxix, (768 - ((posiy + 1) * 2 - (84 - centhfix + nextposh) * sizem)) * cent, sizem, false, color[1], color[2], color[3], trans)
      end
    end
    if Player.EnabledWeapons[7] ~= BoltGunHeater then
      Hud:QuadRGBA(ammo1[6], icoposix, (768 - (posiy * 2 + (centhfix - nextposh) * sizem)) * cent, sizem, false, prcolor[7][1], prcolor[7][2], prcolor[7][3], transic)
      Hud:QuadRGBA(ammo2[6], icoposix, (768 - (posiy * 2 - (84 - centhfix + nextposh) * sizem)) * cent, sizem, false, alcolor[7][1], alcolor[7][2], alcolor[7][3], transic)
      Hud:DrawDigitsText1(textposix, (768 - (posiy * 2 + (centhfix - 3 - nextposh) * sizem)) * cent, string.sub(string.format("%04d", Player.Ammo.Bolt), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.Bolt, colord[1], colord[2], colord[3], transco)
      Hud:DrawDigitsText1(textposix, (768 - (posiy * 2 - (87 - centhfix + nextposh) * sizem)) * cent, string.sub(string.format("%04d", Player.Ammo.HeaterBomb), -3), showinfi * sizem, Player.s_SubClass.AmmoWarning.HeaterBomb, colord[1], colord[2], colord[3], transco)
      nextposhfix = 0
      nextposh = nextposh + 168 + nextposhfix
    end
  end
  if Cfg.PositioningSystem == 2 then
    if INP.Key(Keys.Home) == 2 then
      if Game.currentTime > Hud.movespeedstarttime and Hud.movespeedstart then
        Hud.keypressmode = 2
      end
      if INP.Key(Keys.Num8) == Hud.keypressmode then
        if Hud.keypressmode == 1 then
          Hud.movespeedstarttime = Game.currentTime + Hud.latency
          Hud.movespeedstart = true
        end
        if Cfg.HUD_AmmoList ~= 3 then
          Cfg.HUD_AmmoList_Position[1] = tonumber(string.format("%01d", posiy + 1))
          if 216 <= posiy then
            Cfg.HUD_AmmoList_Position[1] = tonumber(string.format("%01d", 216))
          end
        else
          Cfg.HUD_AmmoList_Position[2] = tonumber(string.format("%01d", posiy + 1))
          if 768 <= posiy then
            Cfg.HUD_AmmoList_Position[2] = tonumber(string.format("%01d", 768))
          end
        end
      elseif INP.Key(Keys.Num2) == Hud.keypressmode then
        if Hud.keypressmode == 1 then
          Hud.movespeedstarttime = Game.currentTime + Hud.latency
          Hud.movespeedstart = true
        end
        if Cfg.HUD_AmmoList ~= 3 then
          Cfg.HUD_AmmoList_Position[1] = tonumber(string.format("%01d", posiy - 1))
          if posiy <= -216 then
            Cfg.HUD_AmmoList_Position[1] = tonumber(string.format("%01d", -216))
          end
        else
          Cfg.HUD_AmmoList_Position[2] = tonumber(string.format("%01d", posiy - 1))
          if posiy <= 40 * sizem then
            Cfg.HUD_AmmoList_Position[2] = tonumber(string.format("%01d", 40 * sizem))
          end
        end
      elseif INP.Key(Keys.Num9) == Hud.keypressmode then
        if Hud.keypressmode == 1 then
          Hud.movespeedstarttime = Game.currentTime + Hud.latency
          Hud.movespeedstart = true
        end
        if Cfg.HUD_AmmoList ~= 3 then
          Cfg.HUD_AmmoList_Size[1] = tonumber(string.format("%.02f", sizem + 0.01))
          if 1 <= sizem then
            Cfg.HUD_AmmoList_Size[1] = tonumber(string.format("%01d", 1))
          end
        else
          Cfg.HUD_AmmoList_Size[2] = tonumber(string.format("%.02f", sizem + 0.01))
          if 0.9 <= sizem then
            Cfg.HUD_AmmoList_Size[2] = tonumber(string.format("%.01f", 0.9))
          end
        end
      elseif INP.Key(Keys.Num3) == Hud.keypressmode then
        if Hud.keypressmode == 1 then
          Hud.movespeedstarttime = Game.currentTime + Hud.latency
          Hud.movespeedstart = true
        end
        if Cfg.HUD_AmmoList ~= 3 then
          Cfg.HUD_AmmoList_Size[1] = tonumber(string.format("%.02f", sizem - 0.01))
          if sizem <= 0.5 then
            Cfg.HUD_AmmoList_Size[1] = tonumber(string.format("%.01f", 0.5))
          end
        else
          Cfg.HUD_AmmoList_Size[2] = tonumber(string.format("%.02f", sizem - 0.01))
          if sizem <= 0.5 then
            Cfg.HUD_AmmoList_Size[2] = tonumber(string.format("%.01f", 0.5))
          end
        end
      end
      if INP.Key(Keys.Num8) == 3 or INP.Key(Keys.Num2) == 3 or INP.Key(Keys.Num9) == 3 or INP.Key(Keys.Num3) == 3 then
        Hud.movespeedstarttime = 0
        Hud.movespeedstart = false
        Hud.keypressmode = 1
      end
      if INP.Key(Keys.Num0) == 1 then
        if Cfg.HUD_AmmoList ~= 3 then
          Cfg.HUD_AmmoList_Position[1] = tonumber(string.format(0))
          Cfg.HUD_AmmoList_Size[1] = tonumber(string.format("%.01f", 0.8))
        else
          Cfg.HUD_AmmoList_Position[2] = tonumber(string.format(120))
          Cfg.HUD_AmmoList_Size[2] = tonumber(string.format("%.01f", 0.8))
        end
      end
      if INP.Key(Keys.NumDivide) == 1 then
        if Cfg.HUD_AmmoList ~= 3 then
          if Cfg.HUD_AmmoList_Position[1] == 0 then
            CONSOLE.AddMessage(settingnosave, R3D.RGB(0, 255, 0))
            PlaySound2DOnKey_am = false
          else
            PlaySound2DOnKey_am = true
            CONSOLE.AddMessage(settingsave, R3D.RGB(0, 255, 0))
            Cfg.HUD_AmmoList_Position_Save[1] = Cfg.HUD_AmmoList_Position[1]
          end
        elseif Cfg.HUD_AmmoList_Position[2] == 120 then
          CONSOLE.AddMessage(settingnosave, R3D.RGB(0, 255, 0))
          PlaySound2DOnKey_am = false
        else
          PlaySound2DOnKey_am = true
          CONSOLE.AddMessage(settingsave, R3D.RGB(0, 255, 0))
          Cfg.HUD_AmmoList_Position_Save[2] = Cfg.HUD_AmmoList_Position[2]
        end
      end
      if INP.Key(Keys.NumMultiply) == 1 then
        if Cfg.HUD_AmmoList ~= 3 then
          if Cfg.HUD_AmmoList_Position_Save[1] == 0 then
            CONSOLE.AddMessage(settingnoloaded, R3D.RGB(0, 255, 0))
            PlaySound2DOnKey_am = false
          else
            PlaySound2DOnKey_am = true
            CONSOLE.AddMessage(settingloaded, R3D.RGB(0, 255, 0))
            Cfg.HUD_AmmoList_Position[1] = Cfg.HUD_AmmoList_Position_Save[1]
          end
        elseif Cfg.HUD_AmmoList_Position_Save[2] == 0 then
          CONSOLE.AddMessage(settingnoloaded, R3D.RGB(0, 255, 0))
          PlaySound2DOnKey_am = false
        else
          PlaySound2DOnKey_am = true
          CONSOLE.AddMessage(settingloaded, R3D.RGB(0, 255, 0))
          Cfg.HUD_AmmoList_Position[2] = Cfg.HUD_AmmoList_Position_Save[2]
        end
      end
      local ammolistRorL = "AmmoList - Right"
      if Cfg.HUD_AmmoList == 1 then
        HUD.DrawQuadRGBA(nil, textposix1, (768 - (posiy * 2 + (centhfix - (nextposh / 2 - 8)) * sizem)) * cent, 113 * sizem * w / 1024, 3 * h / 768, 0, 255, 0, 255)
        HUD.DrawQuadRGBA(nil, textposix1 + 55.5 * sizem * w / 1024, (768 - (posiy * 2 + (centhfix + 5) * sizem)) * cent, 3 * w / 1024, nextposh * sizem * cent, 0, 255, 0, 255)
      elseif Cfg.HUD_AmmoList == 2 then
        ammolistRorL = "AmmoList - Left"
        HUD.DrawQuadRGBA(nil, textposix2, (768 - (posiy * 2 + (centhfix - (nextposh / 2 - 8)) * sizem)) * cent, 113 * sizem * w / 1024, 3 * h / 768, 0, 255, 0, 255)
        HUD.DrawQuadRGBA(nil, textposix2 + 53.5 * sizem * w / 1024, (768 - (posiy * 2 + (centhfix + 5) * sizem)) * cent, 3 * w / 1024, nextposh * sizem * cent, 0, 255, 0, 255)
      elseif Cfg.HUD_AmmoList == 3 then
        ammolistRorL = "AmmoList - Center"
        HUD.DrawQuadRGBA(nil, w / 2 - (dsda + ecart - 2) * sizem * w / 1024, (768 - posiy + 19 * sizem) * h / 768, (dsda + ecart) * sizem * 2 * w / 1024, 3 * h / 768, 0, 255, 0, 255)
        HUD.DrawQuadRGBA(nil, w / 2 + 3 * sizem * w / 1024, (768 - posiy) * h / 768, 3 * w / 1024, 40 * sizem * h / 768, 0, 255, 0, 255)
      end
      HUD.SetFont("courbd", 20)
      HUD.PrintXY((w - HUD.GetTextWidth(ammolistRorL)) / 2, h / 2.6, ammolistRorL, "courbd", 0, 255, 0, 20)
      HUD.PrintXY((w - HUD.GetTextWidth(string.format("Size: %02d", sizem * 100) .. "%")) / 2, h / 2.6 + HUD.GetTextHeight(), string.format("Size: %02d", sizem * 100) .. "%", "courbd", 0, 255, 0, 20)
      HUD.PrintXY((w - HUD.GetTextWidth(string.format("Vertical Position: %01d px", posiy * h / 768))) / 2, h / 2.6 + HUD.GetTextHeight() * 2, string.format("Vertical Position: %01d px", posiy * h / 768), "courbd", 0, 255, 0, 20)
      if INP.Key(Keys.Num7) == 1 then
        Cfg.HUD_AmmoList = Cfg.HUD_AmmoList + 1
        if Cfg.HUD_AmmoList > 3 then
          Cfg.HUD_AmmoList = 1
        end
        if Cfg.HUD_AmmoList == 1 then
          CONSOLE.AddMessage("AmmoList - Right", R3D.RGB(0, 255, 0))
        elseif Cfg.HUD_AmmoList == 2 then
          CONSOLE.AddMessage("AmmoList - Left", R3D.RGB(0, 255, 0))
        elseif Cfg.HUD_AmmoList == 3 then
          CONSOLE.AddMessage("AmmoList - Center", R3D.RGB(0, 255, 0))
        end
      end
      if INP.Key(Keys.Num1) == 1 then
        Cfg.HUD_AmmoList = Cfg.HUD_AmmoList - 1
        if 1 > Cfg.HUD_AmmoList then
          Cfg.HUD_AmmoList = 3
        end
        if Cfg.HUD_AmmoList == 1 then
          CONSOLE.AddMessage("AmmoList - Right", R3D.RGB(0, 255, 0))
        elseif Cfg.HUD_AmmoList == 2 then
          CONSOLE.AddMessage("AmmoList - Left", R3D.RGB(0, 255, 0))
        elseif Cfg.HUD_AmmoList == 3 then
          CONSOLE.AddMessage("AmmoList - Center", R3D.RGB(0, 255, 0))
        end
      end
    end
    if INP.Key(Keys.Home) == 3 then
      Cfg:Save()
    end
  end
end

function Hud:HelpKeys()
  local w, h = R3D.ScreenSize()
  if Cfg.Language == "french" then
    matKeysHelpW = {
      Hud._matKeysPgUpW_fr,
      Hud._matKeysHomeW_fr
    }
    matKeysHelpSc = Hud._matKeysHomeSc_fr
    matKeysHelpAm = Hud._matKeysHomeAm_fr
    matKeysHelpTi = Hud._matKeysHomeMi_fr
    matKeysHelpHu = Hud._matKeysHomeHu_fr
    matKeysHelpCross = Hud._matKeysNumDecimal_fr
    matKeysHelpInfos = self._matKeysHomeIf_fr
  else
    matKeysHelpW = {
      Hud._matKeysPgUpW_en,
      Hud._matKeysHomeW_en
    }
    matKeysHelpSc = Hud._matKeysHomeSc_en
    matKeysHelpAm = Hud._matKeysHomeAm_en
    matKeysHelpTi = Hud._matKeysHomeMi_en
    matKeysHelpHu = Hud._matKeysHomeHu_en
    matKeysHelpCross = Hud._matKeysNumDecimal_en
    matKeysHelpInfos = self._matKeysHomeIf_en
  end
  if Cfg.PositioningSystem == 0 and Cfg.ViewWeaponModel and Cfg.WeaponsPositionning and Cfg.WeaponsPositionning then
    if INP.Key(Keys.PgUp) == 2 then
      Hud:QuadTrans(matKeysHelpW[1], 1024 / 2 * w / 1024, 140 * h / 768, 0.8, true, 255)
    elseif INP.Key(Keys.Home) == 2 then
      Hud:QuadTrans(matKeysHelpW[2], 1024 / 2 * w / 1024, 140 * h / 768, 0.8, true, 255)
    end
  end
  if MPCfg.GameMode ~= "Instagib" and MPCfg.GameMode ~= "ICTF" then
    if Cfg.PositioningSystem == 3 and (Cfg.HUD_HudStyle == 2 or Cfg.HUD_HudStyle == 1) and INP.Key(Keys.Home) == 2 then
      Hud:QuadTrans(matKeysHelpHu, 1024 / 2 * w / 1024, (384 + 140) * h / 768, 0.8, true, 255)
    end
    if Cfg.PositioningSystem == 2 and Cfg.HUD_AmmoList ~= 0 and INP.Key(Keys.Home) == 2 then
      Hud:QuadTrans(matKeysHelpAm, 1024 / 2 * w / 1024, (384 + 140) * h / 768, 0.8, true, 255)
    end
  end
  if Cfg.PositioningSystem == 1 and Cfg.HUD_Scores == true and INP.Key(Keys.Home) == 2 then
    Hud:QuadTrans(matKeysHelpSc, 1024 / 2 * w / 1024, (384 + 140) * h / 768, 0.8, true, 255)
  end
  if Cfg.PositioningSystem == 4 and (Cfg.ShowFPS or Cfg.HUD_Show_FPS or Cfg.HUD_Show_PacketLoss or Cfg.HUD_Show_Ping or Cfg.HUD_Show_Speedmeter == 1 or Cfg.HUD_Show_Speedmeter == 2 or Cfg.HUD_Show_Speedmeter == 3) and INP.Key(Keys.Home) == 2 then
    Hud:QuadTrans(matKeysHelpInfos, 1024 / 2 * w / 1024, (384 + 140) * h / 768, 0.8, true, 255)
  end
  if Cfg.PositioningSystem == 5 and INP.Key(Keys.Home) == 2 then
    Hud:QuadTrans(matKeysHelpTi, 1024 / 2 * w / 1024, (384 + 140) * h / 768, 0.8, true, 255)
  end
  if INP.Key(Keys.NumDecimal) == 2 then
    Hud:QuadTrans(matKeysHelpCross, 1024 / 2 * w / 1024, 140 * h / 768, 0.8, true, 255)
  end
end

function Hud:KeysSounds()
  if Player and MPCfg.GameMode ~= "Clan Arena" and Cfg.HUD_Scores == true then
    for i = 1, 2 do
      if Cfg.PositioningSystem == 1 then
        local scsizehud = Cfg.HUD_Scores_A_Setting[3]
        if INP.Key(Keys.Home) == 2 then
          if INP.Key(Keys.Num0) == 1 then
            PlaySound2D("../Sounds/reset", nil, nil, true)
          end
          if INP.Key(Keys.NumMultiply) == 1 and PlaySound2DOnKey_sc == true then
            PlaySound2D("../Sounds/loadset", nil, nil, true)
          end
          if INP.Key(Keys.NumDivide) == 1 and PlaySound2DOnKey_sc == true then
            PlaySound2D("../Sounds/saveset", nil, nil, true)
          end
          if INP.Key(Keys.Num4) == Hud.keypressmode or INP.Key(Keys.Num6) == Hud.keypressmode then
            if scoresposxy[i][1] < 1024 - 80 * scsizehud / 2 and scoresposxy[i][1] > 80 * scsizehud / 2 then
              PlaySound2D("../Sounds/move", nil, nil, true)
            end
          elseif INP.Key(Keys.Num8) == Hud.keypressmode or INP.Key(Keys.Num2) == Hud.keypressmode then
            if scoresposxy[i][2] < 768 - 50 * scsizehud / 2 and scoresposxy[i][2] > 50 * scsizehud / 2 then
              PlaySound2D("../Sounds/move", nil, nil, true)
            end
          elseif (INP.Key(Keys.Num9) == Hud.keypressmode or INP.Key(Keys.Num3) == Hud.keypressmode) and scoresposxy[i][3] < tonumber(string.format("%.01f", 1.6)) and scoresposxy[i][3] > tonumber(string.format("%.01f", 0.5)) then
            PlaySound2D("../Sounds/move", nil, nil, true)
          end
        end
      end
    end
  end
  if Cfg.PositioningSystem == 0 and Cfg.WeaponsPositionning and Cfg.ViewWeaponModel then
    if INP.Key(Keys.PgUp) == 2 and (INP.Key(Keys.Num4) == Hud.keypressmode or INP.Key(Keys.Num6) == Hud.keypressmode or INP.Key(Keys.Num8) == Hud.keypressmode or INP.Key(Keys.Num2) == Hud.keypressmode or INP.Key(Keys.Num9) == Hud.keypressmode or INP.Key(Keys.Num3) == Hud.keypressmode) then
      PlaySound2D("../Sounds/move", nil, nil, true)
    end
    if INP.Key(Keys.Home) == 2 then
      if INP.Key(Keys.Num5) == 1 then
        PlaySound2D("../Sounds/center", nil, nil, true)
      end
      if INP.Key(Keys.Num0) == 1 then
        PlaySound2D("../Sounds/reset", nil, nil, true)
      end
      if INP.Key(Keys.NumMultiply) == 1 and PlaySound2DOnKey_wa == true then
        PlaySound2D("../Sounds/loadset", nil, nil, true)
      end
      if INP.Key(Keys.NumDivide) == 1 and PlaySound2DOnKey_wa == true then
        PlaySound2D("../Sounds/saveset", nil, nil, true)
      end
      if INP.Key(Keys.Num4) == Hud.keypressmode or INP.Key(Keys.Num6) == Hud.keypressmode or INP.Key(Keys.Num8) == Hud.keypressmode or INP.Key(Keys.Num2) == Hud.keypressmode or INP.Key(Keys.Num9) == Hud.keypressmode or INP.Key(Keys.Num3) == Hud.keypressmode then
        PlaySound2D("../Sounds/move", nil, nil, true)
      end
    end
  end
  if Cfg.PositioningSystem == 2 and Cfg.HUD_AmmoList ~= 0 and INP.Key(Keys.Home) == 2 then
    if INP.Key(Keys.Num0) == 1 then
      PlaySound2D("../Sounds/reset", nil, nil, true)
    end
    if INP.Key(Keys.NumMultiply) == 1 and PlaySound2DOnKey_am == true then
      PlaySound2D("../Sounds/loadset", nil, nil, true)
    end
    if INP.Key(Keys.NumDivide) == 1 and PlaySound2DOnKey_am == true then
      PlaySound2D("../Sounds/saveset", nil, nil, true)
    end
    if (INP.Key(Keys.Num8) == Hud.keypressmode or INP.Key(Keys.Num2) == Hud.keypressmode) and Cfg.HUD_AmmoList_Position[1] < 216 and Cfg.HUD_AmmoList_Position[1] > -216 then
      PlaySound2D("../Sounds/move", nil, nil, true)
    end
  end
  if INP.Key(Keys.NumDecimal) == 2 then
    if INP.Key(Keys.Num8) == Hud.keypressmode or INP.Key(Keys.Num2) == Hud.keypressmode or INP.Key(Keys.Num3) == Hud.keypressmode or INP.Key(Keys.Num9) == Hud.keypressmode or INP.Key(Keys.Num7) == Hud.keypressmode or INP.Key(Keys.Num1) == Hud.keypressmode then
      PlaySound2D("../Sounds/move", nil, nil, true)
    elseif INP.Key(Keys.Num0) == 1 then
      PlaySound2D("../Sounds/reset", nil, nil, true)
    end
  end
  if Cfg.PositioningSystem == 4 and (Cfg.ShowTimer or Cfg.HUD_Show_Ping or Cfg.ShowFPS or Cfg.HUD_Show_FPS or Cfg.HUD_Show_PacketLoss or Cfg.HUD_Show_Speedmeter == 1 or Cfg.HUD_Show_Speedmeter == 2 or Cfg.HUD_Show_Speedmeter == 3) then
    local infoitems = {
      Cfg.HUD_FPS_Setting,
      Cfg.HUD_PL_Setting,
      Cfg.HUD_Ping_Setting,
      Cfg.HUD_SMeter_Setting,
      Cfg.HUD_Timer_Setting
    }
    local it = Cfg.HUD_Infos_Items
    if Cfg.HUD_Infos_Items < 5 then
      if INP.Key(Keys.Home) == 2 then
        if INP.Key(Keys.Num0) == 1 then
          PlaySound2D("../Sounds/reset", nil, nil, true)
        end
        if INP.Key(Keys.NumMultiply) == 1 and PlaySound2DOnKey_in == true then
          PlaySound2D("../Sounds/loadset", nil, nil, true)
        end
        if INP.Key(Keys.NumDivide) == 1 and PlaySound2DOnKey_in == true then
          PlaySound2D("../Sounds/saveset", nil, nil, true)
        end
        if INP.Key(Keys.Num4) == Hud.keypressmode or INP.Key(Keys.Num6) == Hud.keypressmode then
          if infoitems[it][1] >= -510 and infoitems[it][1] <= 508 then
            PlaySound2D("../Sounds/move", nil, nil, true)
          end
        elseif INP.Key(Keys.Num8) == Hud.keypressmode or INP.Key(Keys.Num2) == Hud.keypressmode then
          if infoitems[it][2] <= 770 - HUD.GetTextHeight() and infoitems[it][2] >= 4 then
            PlaySound2D("../Sounds/move", nil, nil, true)
          end
        elseif (INP.Key(Keys.Num9) == Hud.keypressmode or INP.Key(Keys.Num3) == Hud.keypressmode) and infoitems[it][3] < 40 and infoitems[it][3] > 20 then
          PlaySound2D("../Sounds/move", nil, nil, true)
        end
      end
    else
      local fonttimer = infoitems[5][3]
      local posxy = infoitems[5]
      if INP.Key(Keys.Home) == 2 then
        if INP.Key(Keys.Num0) == 1 then
          PlaySound2D("../Sounds/reset", nil, nil, true)
        end
        if INP.Key(Keys.NumMultiply) == 1 and PlaySound2DOnKey_in == true then
          PlaySound2D("../Sounds/loadset", nil, nil, true)
        end
        if INP.Key(Keys.NumDivide) == 1 and PlaySound2DOnKey_in == true then
          PlaySound2D("../Sounds/saveset", nil, nil, true)
        end
        if INP.Key(Keys.Num4) == Hud.keypressmode or INP.Key(Keys.Num6) == Hud.keypressmode then
          if posxy[1] >= posilelt + 1 and posxy[1] <= posiright - 1 then
            PlaySound2D("../Sounds/move", nil, nil, true)
          end
        elseif INP.Key(Keys.Num8) == Hud.keypressmode or INP.Key(Keys.Num2) == Hud.keypressmode then
          if posxy[2] <= 767 and posxy[2] >= fonttimer + 1 then
            PlaySound2D("../Sounds/move", nil, nil, true)
          end
        elseif (INP.Key(Keys.Num9) == Hud.keypressmode or INP.Key(Keys.Num3) == Hud.keypressmode) and posxy[3] <= 59 and posxy[3] >= 25 then
          PlaySound2D("../Sounds/move", nil, nil, true)
        end
      end
    end
  end
  if Cfg.PositioningSystem == 3 and (Cfg.HUD_HudStyle == 2 or Cfg.HUD_HudStyle == 1) and INP.Key(Keys.Home) == 2 then
    if INP.Key(Keys.Num0) == 1 then
      PlaySound2D("../Sounds/reset", nil, nil, true)
    end
    if INP.Key(Keys.NumMultiply) == 1 and PlaySound2DOnKey_qw == true then
      PlaySound2D("../Sounds/loadset", nil, nil, true)
    end
    if INP.Key(Keys.NumDivide) == 1 and PlaySound2DOnKey_qw == true then
      PlaySound2D("../Sounds/saveset", nil, nil, true)
    end
    if (INP.Key(Keys.Num4) == Hud.keypressmode or INP.Key(Keys.Num6) == Hud.keypressmode) and PlaySound2DOnKey_qw1 then
      PlaySound2D("../Sounds/move", nil, nil, true)
    end
    if (INP.Key(Keys.Num8) == Hud.keypressmode or INP.Key(Keys.Num2) == Hud.keypressmode) and PlaySound2DOnKey_qw2 then
      PlaySound2D("../Sounds/move", nil, nil, true)
    end
    if (INP.Key(Keys.Num9) == Hud.keypressmode or INP.Key(Keys.Num3) == Hud.keypressmode) and PlaySound2DOnKey_qw3 then
      PlaySound2D("../Sounds/move", nil, nil, true)
    end
  end
  if Cfg.PositioningSystem == 5 and INP.Key(Keys.Home) == 2 then
    if INP.Key(Keys.Num0) == 1 then
      PlaySound2D("../Sounds/reset", nil, nil, true)
    end
    if INP.Key(Keys.NumMultiply) == 1 and PlaySound2DOnKey_sh == true then
      PlaySound2D("../Sounds/loadset", nil, nil, true)
    end
    if INP.Key(Keys.NumDivide) == 1 and PlaySound2DOnKey_sh == true then
      PlaySound2D("../Sounds/saveset", nil, nil, true)
    end
    if (INP.Key(Keys.Num4) == Hud.keypressmode or INP.Key(Keys.Num6) == Hud.keypressmode) and PlaySound2DOnKey_sh1 then
      PlaySound2D("../Sounds/move", nil, nil, true)
    end
    if (INP.Key(Keys.Num8) == Hud.keypressmode or INP.Key(Keys.Num2) == Hud.keypressmode) and PlaySound2DOnKey_sh2 then
      PlaySound2D("../Sounds/move", nil, nil, true)
    end
    if (INP.Key(Keys.Num9) == Hud.keypressmode or INP.Key(Keys.Num3) == Hud.keypressmode) and PlaySound2DOnKey_sh3 then
      PlaySound2D("../Sounds/move", nil, nil, true)
    end
  end
end

function Hud:HudBar()
  local w, h = R3D.ScreenSize()
  local hee = Player.Health
  local armorr = Player.Armor
  local trans = Cfg.HUD_Bar_Trans
  local transco = Cfg.HUD_Count_Trans
  local colord = {
    Cfg.HUD_Count_RGB[1],
    Cfg.HUD_Count_RGB[2],
    Cfg.HUD_Count_RGB[3]
  }
  if Cfg.HUD_Switch_HudBar == 0 then
    poshudbardigit = 595
    poshudbardigit1 = 483
  else
    poshudbardigit = 483
    poshudbardigit1 = 595
  end
  HUD.DrawQuadRGBA(nil, (1024 - 999) * w / 1024, 702.5 * h / 768, 400 * w / 1024, 25 * h / 768, 0, 0, 0, 50)
  HUD.DrawQuadRGBA(nil, (1024 - 422.5) * w / 1024, 702.5 * h / 768, 400 * w / 1024, 25 * h / 768, 0, 0, 0, 50)
  if Player.Health <= Player.HealthWarning then
    barcolorh = {
      255,
      0,
      0
    }
  else
    barcolorh = {
      0,
      hee * 1.02,
      0
    }
  end
  if Player.ArmorType == 0 then
    barcolora = {
      0,
      0,
      0
    }
    alphabar = 0
  elseif Player.ArmorType == 1 then
    barcolora = {
      204,
      102,
      51
    }
    alphabar = 100
  elseif Player.ArmorType == 2 then
    barcolora = {
      153,
      153,
      153
    }
    alphabar = 100
  elseif Player.ArmorType == 3 then
    barcolora = {
      255,
      204,
      0
    }
    alphabar = 100
  end
  if Player.Armor <= Player.ArmorWarning then
    barcolora = {
      255,
      0,
      0
    }
  end
  local poshudbardigit = {595, 483}
  local hear = {
    {hee, armorr},
    {armorr, hee}
  }
  local color = {
    {barcolorh, barcolora},
    {barcolora, barcolorh}
  }
  local war = {
    {
      Player.HealthWarning,
      Player.ArmorWarning
    },
    {
      Player.ArmorWarning,
      Player.HealthWarning
    }
  }
  local multi = {
    {1.6, 2},
    {2, 1.6}
  }
  if Player._CurWeaponIndex == 7 then
    Hud.NoCrosshair = nil
    local cr = Player:GetCurWeapon()
    if 0 < cr._zoom then
      HUD.DrawQuad(Hud._matZoom, 0, 0, w, h)
      Hud.NoCrosshair = true
    end
  end
  if Cfg.HUD_Switch_HudBar == 0 then
    HUD.DrawQuadRGBA(nil, (1024 - (599 + hee * 1.6)) * w / 1024, 702.5 * h / 768, hee * 1.6 * w / 1024, 25 * h / 768, barcolorh[1], barcolorh[2], barcolorh[3], trans)
    HUD.DrawQuadRGBA(nil, (1024 - 422.5) * w / 1024, 702.5 * h / 768, armorr * 2 * w / 1024, 25 * h / 768, barcolora[1], barcolora[2], barcolora[3], trans)
    self:DrawDigitsText1((1024 - poshudbardigit[1]) * w / 1024, 699 * h / 768, string.sub(string.format("%03d", hee), -3), 0.8, Player.HealthWarning, colord[1], colord[2], colord[3], transco)
    self:DrawDigitsText1((1024 - poshudbardigit[2]) * w / 1024, 699 * h / 768, string.sub(string.format("%03d", armorr), -3), 0.8, Player.ArmorWarning, colord[1], colord[2], colord[3], transco)
  else
    HUD.DrawQuadRGBA(nil, (1024 - (599 + armorr * 2)) * w / 1024, 702.5 * h / 768, armorr * 2 * w / 1024, 25 * h / 768, barcolora[1], barcolora[2], barcolora[3], trans)
    HUD.DrawQuadRGBA(nil, (1024 - 422.5) * w / 1024, 702.5 * h / 768, hee * 1.6 * w / 1024, 25 * h / 768, barcolorh[1], barcolorh[2], barcolorh[3], trans)
    self:DrawDigitsText1((1024 - poshudbardigit[1]) * w / 1024, 699 * h / 768, string.sub(string.format("%03d", armorr), -3), 0.8, Player.ArmorWarning, colord[1], colord[2], colord[3], transco)
    self:DrawDigitsText1((1024 - poshudbardigit[2]) * w / 1024, 699 * h / 768, string.sub(string.format("%03d", hee), -3), 0.8, Player.HealthWarning, colord[1], colord[2], colord[3], transco)
  end
end

function Hud:DrawDigit2(x, y, chr, scale, r, g, b, trans)
  local w, h = R3D.ScreenSize()
  local n = tonumber(chr)
  if not n then
    return
  end
  local mw, mh = MATERIAL.Size(Hud._matDigitsBT[n + 1])
  HUD.DrawQuadRGBA(Hud._matDigitsBT[n + 1], x, y, mw * scale * w / 1024, mh * scale * h / 768, r, g, b, trans)
end

function Hud:DrawDigitRed2(x, y, chr, scale, r, g, b, trans)
  local w, h = R3D.ScreenSize()
  local n = tonumber(chr)
  if not n then
    return
  end
  local mw, mh = MATERIAL.Size(Hud._matDigitsBTRed[n + 1])
  HUD.DrawQuadRGBA(Hud._matDigitsBTRed[n + 1], x, y, mw * scale * w / 1024, mh * scale * h / 768, r, g, b, trans)
end

function Hud:DrawDigitsText2(x, y, txt, scale, warning, r, g, b, trans)
  local w, h = R3D.ScreenSize()
  local l = string.len(txt)
  local mw, mh = MATERIAL.Size(Hud._matDigitsBT[5])
  if warning == nil or 0 <= warning and warning < tonumber(txt) or warning < 0 and -warning > tonumber(txt) then
    for i = 1, l do
      self:DrawDigit2(x + (i - 1) * (mw - 5) * (w / 1024) * scale, y, string.sub(txt, i, i), scale, r, g, b, trans)
    end
  else
    for i = 1, l do
      self:DrawDigitRed2(x + (i - 1) * (mw - 5) * (w / 1024) * scale, y, string.sub(txt, i, i), scale, nil, nil, nil, trans)
    end
  end
end

function Hud:DrawDigitsText3(x, y, txt, scale, warning, r, g, b, trans)
  local w, h = R3D.ScreenSize()
  local l = string.len(txt)
  local mw, mh = MATERIAL.Size(Hud._matDigitsBT[5])
  if warning == nil or 0 <= warning and warning < tonumber(txt) or warning < 0 and -warning > tonumber(txt) then
    for i = 1, l do
      self:DrawDigit2(x + (i - 1) * (mw - 5) * (w / 1024) * scale, y, string.sub(txt, i, i), scale, r, g, b, trans)
    end
  else
    for i = 1, l do
      self:DrawDigitRed2(x + (i - 1) * (mw - 5) * (w / 1024) * scale, y, string.sub(txt, i, i), scale, nil, nil, nil, trans)
    end
  end
end

function Hud:SuperHud()
  local w, h = R3D.ScreenSize()
  local gray = R3D.RGB(120, 120, 70)
  local sizex, sizey = MATERIAL.Size(Hud._matHUDLeft)
  local hee = Player.Health
  local armorr = Player.Armor
  local showinf = 1
  local spressthiskey = false
  local colord = {
    Cfg.HUD_Count_RGB[1],
    Cfg.HUD_Count_RGB[2],
    Cfg.HUD_Count_RGB[3]
  }
  local transic = Cfg.HUD_Icons_Trans
  local transco = Cfg.HUD_Count_Trans
  priammolist3D = {
    self._matAmmoOpenIconQW3D,
    self._matAmmoListShellIconQW3D,
    self._matAmmoListKolkiIconQW3D,
    self._matAmmoListRocketIconQW3D,
    self._matAmmoListSzurikenIconQW3D,
    self._matAmmoListrifleIconQW3D,
    self._matAmmoListBoltyIconQW3D
  }
  altammolist3D = {
    self._matAmmoCloseIconQW3D,
    self._matAmmoListFreezerIconQW3D,
    self._matAmmoListRocketIconQW3D,
    self._matAmmoListMiniIconQW3D,
    self._matAmmoListElectroIconQW3D,
    self._matAmmoListflameIconQW3D,
    self._matAmmoListKulkiIconQW3D
  }
  priammolist = {
    self._matAmmoOpenIconQW,
    self._matAmmoListShellIconQW,
    self._matAmmoListKolkiIconQW,
    self._matAmmoListRocketIconQW,
    self._matAmmoListSzurikenIconQW,
    self._matAmmoListrifleIconQW,
    self._matAmmoListBoltyIconQW
  }
  altammolist = {
    self._matAmmoCloseIconQW,
    self._matAmmoListFreezerIconQW,
    self._matAmmoListRocketIconQW,
    self._matAmmoListMiniIconQW,
    self._matAmmoListElectroIconQW,
    self._matAmmoListikonaIconQW,
    self._matAmmoListKulkiIconQW
  }
  cweapons = {
    self._matPainKillerIcon3D,
    self._matShotgunIcon3D,
    self._matStakeIcon3D,
    self._matMiniGunIcon3D,
    self._matElectroIcon3D,
    self._matRifleIcon3D,
    self._matBoltIcon3D
  }
  cweaponsSH = {
    self._matAmmoOpenIconQW,
    self._matAmmoListShellIconQW,
    self._matAmmoListKolkiIconQW,
    self._matAmmoListRocketIconQW,
    self._matAmmoListSzurikenIconQW,
    self._matAmmoListrifleIconQW,
    self._matAmmoListBoltyIconQW
  }
  priammolistnum = {
    0,
    Player.Ammo.Shotgun,
    Player.Ammo.Stakes,
    Player.Ammo.Grenades,
    Player.Ammo.Shurikens,
    Player.Ammo.Rifle,
    Player.Ammo.Bolt
  }
  priammolistnumwar = {
    0,
    Player.s_SubClass.AmmoWarning.Shotgun,
    Player.s_SubClass.AmmoWarning.Stakes,
    Player.s_SubClass.AmmoWarning.Grenades,
    Player.s_SubClass.AmmoWarning.Shurikens,
    Player.s_SubClass.AmmoWarning.Rifle,
    Player.s_SubClass.AmmoWarning.Bolt
  }
  altammolistnum = {
    0,
    Player.Ammo.IceBullets,
    Player.Ammo.Grenades,
    Player.Ammo.MiniGun,
    Player.Ammo.Electro,
    Player.Ammo.FlameThrower,
    Player.Ammo.HeaterBomb
  }
  altammolistnumwar = {
    0,
    Player.s_SubClass.AmmoWarning.IceBullets,
    Player.s_SubClass.AmmoWarning.Grenades,
    Player.s_SubClass.AmmoWarning.MiniGun,
    Player.s_SubClass.AmmoWarning.Electro,
    Player.s_SubClass.AmmoWarning.FlameThrower,
    Player.s_SubClass.AmmoWarning.HeaterBomb
  }
  numcharact = {
    "%03d",
    "%03d",
    "%04d",
    "%03d",
    "%04d",
    "%04d",
    "%04d"
  }
  qwhuditemsname = {
    "Primary Ammo (Icon) -",
    "Primary Ammo (Number) -",
    "Alternative Ammo (Icon) -",
    "Alternative Ammo (Number) -",
    "Armor (Icon) -",
    "Armor (Number) -",
    "Health (Icon) -",
    "Health (Number) -",
    "CurrentWeapon -"
  }
  qwhuditems = {
    Cfg.HUD_Weapon1_Icon_Setting,
    Cfg.HUD_Weapon1_Text_Setting,
    Cfg.HUD_Weapon2_Icon_Setting,
    Cfg.HUD_Weapon2_Text_Setting,
    Cfg.HUD_Armor_Icon_Setting,
    Cfg.HUD_Armor_Text_Setting,
    Cfg.HUD_Health_Icon_Setting,
    Cfg.HUD_Health_Text_Setting,
    Cfg.HUD_CurrentWeapon_Icon_Setting
  }
  qwhuditemssav = {
    Cfg.HUD_Weapon1_Icon_Setting_Save,
    Cfg.HUD_Weapon1_Text_Setting_Save,
    Cfg.HUD_Weapon2_Icon_Setting_Save,
    Cfg.HUD_Weapon2_Text_Setting_Save,
    Cfg.HUD_Armor_Icon_Setting_Save,
    Cfg.HUD_Armor_Text_Setting_Save,
    Cfg.HUD_Health_Icon_Setting_Save,
    Cfg.HUD_Health_Text_Setting_Save,
    Cfg.HUD_CurrentWeapon_Icon_Setting_Save
  }
  local checkitem = {
    false,
    false,
    false,
    false,
    true,
    true,
    false,
    true,
    false
  }
  local defaultpos = {
    37,
    87,
    37,
    87,
    987,
    937,
    987,
    937,
    512
  }
  local defaultposa = {
    66,
    66,
    30,
    30,
    30,
    30,
    66,
    66,
    48
  }
  local defaultsiz = {
    0.58,
    0.55,
    0.58,
    0.55,
    0.58,
    0.55,
    0.58,
    0.55,
    0.8
  }
  if Cfg.HUD_HudStyle == 2 then
    defaultpos = {
      37,
      90,
      37,
      90,
      987,
      934,
      987,
      934,
      512
    }
    defaultposa = {
      69,
      69,
      30,
      30,
      30,
      30,
      69,
      69,
      48
    }
    defaultsiz = {
      0.72,
      0.55,
      0.72,
      0.55,
      0.72,
      0.55,
      0.72,
      0.55,
      0.8
    }
  end
  local qwhuditemsfix1 = qwhuditems[1][1]
  local qwhuditemsfix2 = qwhuditems[2][1]
  local qwhuditemsfix3 = qwhuditems[3][1]
  local qwhuditemsfix4 = qwhuditems[4][1]
  local qwhudsizew1 = qwhuditems[1][3]
  local qwhudsizewd1 = qwhuditems[2][3]
  local qwhudsizew2 = qwhuditems[3][3]
  local qwhudsizewd2 = qwhuditems[4][3]
  local qwhudsizea = qwhuditems[5][3]
  local qwhudsizead = qwhuditems[6][3]
  local qwhudsizeh = qwhuditems[7][3]
  local qwhudsizehd = qwhuditems[8][3]
  local qwhudsizecwd = qwhuditems[9][3]
  local qwhudposar = qwhuditems[5][1]
  local qwhudposard = qwhuditems[6][1]
  local qwhudposhe = qwhuditems[7][1]
  local qwhudposhed = qwhuditems[8][1]
  local qwhudposcw = qwhuditems[9][1]
  local qwhudposhw1 = qwhuditems[1][2]
  local qwhudposhw1d = qwhuditems[2][2]
  local qwhudposhw2 = qwhuditems[3][2]
  local qwhudposhw2d = qwhuditems[4][2]
  local qwhudposhar = qwhuditems[5][2]
  local qwhudposhard = qwhuditems[6][2]
  local qwhudposhhe = qwhuditems[7][2]
  local qwhudposhhed = qwhuditems[8][2]
  local qwhudposhcw = qwhuditems[9][2]
  local posInf = qwhuditemsfix2
  local posInff = qwhuditemsfix4
  local settingsave = "Your custom settings have been saved."
  local settingnosave = "This is the default settings, none settings saved."
  local settingloaded = "Your custom settings have been loaded."
  local settingnoloaded = "This is the default settings, none settings loaded"
  if Cfg.Language == "french" then
    settingsave = "Vos param\232tres personnalis\233s ont \233t\233 enregistr\233s."
    settingnosave = "C'est le param\233trage par d\233faut, aucun param\232tres enregistr\233s."
    settingloaded = "Vos param\232tres personnalis\233s ont \233t\233 charg\233s."
    settingnoloaded = "C'est le param\233trage par d\233faut, aucun param\232tres charg\233s."
  end
  if Player.FrozenArmor then
    armorr = 0
  end
  if hee < 1 and 0 < hee then
    hee = 1
  end
  local colorh = {
    255,
    0,
    0
  }
  if 25 < hee and hee <= 50 then
    colorh = {
      255,
      102,
      0
    }
  elseif 50 < hee and hee <= 100 then
    colorh = {
      0,
      204,
      0
    }
  elseif 100 < hee then
    colorh = {
      0,
      204,
      255
    }
  end
  local tm0 = Game.currentTime / 60 / 1.3
  local m0 = math.floor(tm0)
  local s0 = math.floor((tm0 - m0) * 60)
  if Cfg.HUD_Show_Health_Icon then
    checkitem[7] = true
    if Cfg.HUD_HudStyle == 2 then
      if Cfg.HUD_3DIcon_Anim then
        self:QuadTrans(self._matHealthQW3D[s0 + 1], (1024 - qwhudposhe) * w / 1024, (768 - qwhudposhhe) * h / 768, qwhudsizeh / 2, true, transic)
      else
        self:QuadTrans(self._matHealthQW3D[61], (1024 - qwhudposhe) * w / 1024, (768 - qwhudposhhe) * h / 768, qwhudsizeh / 2, true, transic)
      end
    else
      Hud:QuadRGBA(self._matHealthQW, (1024 - qwhudposhe) * w / 1024, (768 - qwhudposhhe) * h / 768, qwhudsizeh / 2, true, colorh[1], colorh[2], colorh[3], transic)
    end
  end
  self:DrawDigitsText2((1024 - qwhudposhed - 122 * qwhudsizehd / 2) * w / 1024, (768 - qwhudposhhed - 64 * qwhudsizehd / 2) * h / 768, string.sub(string.format("%03d", hee), -3), showinf * qwhudsizehd, Player.HealthWarning, colord[1], colord[2], colord[3], transco)
  local tm1 = Game.currentTime / 60 / 2
  local m1 = math.floor(tm1)
  local s1 = math.floor((tm1 - m1) * 64)
  if Cfg.HUD_HudStyle == 2 then
    if Cfg.HUD_3DIcon_Anim then
      if Player.ArmorType == 0 then
        self:QuadTrans(self._matArmorNormalQW3D[s1 + 1], (1024 - qwhudposar) * w / 1024, (768 - qwhudposhar) * h / 768, qwhudsizea / 2, true, transic / 2)
      elseif Player.ArmorType == 1 then
        self:QuadTrans(self._matArmorBronzeQW3D[s1 + 1], (1024 - qwhudposar) * w / 1024, (768 - qwhudposhar) * h / 768, qwhudsizea / 2, true, transic)
      elseif Player.ArmorType == 2 then
        self:QuadTrans(self._matArmorSilverQW3D[s1 + 1], (1024 - qwhudposar) * w / 1024, (768 - qwhudposhar) * h / 768, qwhudsizea / 2, true, transic)
      elseif Player.ArmorType == 3 then
        self:QuadTrans(self._matArmorYellowQW3D[s1 + 1], (1024 - qwhudposar) * w / 1024, (768 - qwhudposhar) * h / 768, qwhudsizea / 2, true, transic)
      end
    elseif Player.ArmorType == 0 then
      self:QuadTrans(self._matArmorNormalQW3D[1], (1024 - qwhudposar) * w / 1024, (768 - qwhudposhar) * h / 768, qwhudsizea / 2, true, transic / 2)
    elseif Player.ArmorType == 1 then
      self:QuadTrans(self._matArmorBronzeQW3D[1], (1024 - qwhudposar) * w / 1024, (768 - qwhudposhar) * h / 768, qwhudsizea / 2, true, transic)
    elseif Player.ArmorType == 2 then
      self:QuadTrans(self._matArmorSilverQW3D[1], (1024 - qwhudposar) * w / 1024, (768 - qwhudposhar) * h / 768, qwhudsizea / 2, true, transic)
    elseif Player.ArmorType == 3 then
      self:QuadTrans(self._matArmorYellowQW3D[1], (1024 - qwhudposar) * w / 1024, (768 - qwhudposhar) * h / 768, qwhudsizea / 2, true, transic)
    end
  else
    local color = {
      {
        204,
        102,
        0
      },
      {
        204,
        204,
        204
      },
      {
        255,
        204,
        0
      }
    }
    if Cfg.BrightSkinsArmors then
      color = {
        {
          0,
          204,
          0
        },
        {
          255,
          255,
          0
        },
        {
          255,
          0,
          0
        }
      }
    end
    if Player.ArmorType == 0 then
      Hud:QuadRGBA(self._matArmorBH, (1024 - qwhudposar) * w / 1024, (768 - qwhudposhar) * h / 768, qwhudsizea / 2, true, 0, 0, 0, transic / 2)
    elseif Player.ArmorType == 1 then
      Hud:QuadRGBA(self._matArmorBH, (1024 - qwhudposar) * w / 1024, (768 - qwhudposhar) * h / 768, qwhudsizea / 2, true, color[1][1], color[1][2], color[1][3], transic)
    elseif Player.ArmorType == 2 then
      Hud:QuadRGBA(self._matArmorBH, (1024 - qwhudposar) * w / 1024, (768 - qwhudposhar) * h / 768, qwhudsizea / 2, true, color[2][1], color[2][2], color[2][3], transic)
    elseif Player.ArmorType == 3 then
      Hud:QuadRGBA(self._matArmorBH, (1024 - qwhudposar) * w / 1024, (768 - qwhudposhar) * h / 768, qwhudsizea / 2, true, color[3][1], color[3][2], color[3][3], transic)
    end
  end
  self:DrawDigitsText2((1024 - qwhudposard - 122 * qwhudsizead / 2) * w / 1024, (768 - qwhudposhard - 64 * qwhudsizead / 2) * h / 768, string.sub(string.format("%03d", armorr), -3), showinf * qwhudsizead, Player.ArmorWarning, colord[1], colord[2], colord[3], transco)
  local amt = Game.currentTime / 60
  local amm = math.floor(amt)
  local ams = math.floor((amt - amm) * 16)
  local fix = 0
  if Player._CurWeaponIndex == 5 then
    amt = Game.currentTime / 60 * 2.5
    amm = math.floor(amt)
    ams = math.floor((amt - amm) * 26)
    fix = 26
  elseif Player._CurWeaponIndex == 6 then
    amt = Game.currentTime / 60
    amm = math.floor(amt)
    ams = math.floor((amt - amm) * 51)
    fix = 51
  end
  local tm2 = Game.currentTime / 60
  local m2 = math.floor(tm2)
  local s2 = math.floor((tm2 - m2) * 16)
  local tm3 = Game.currentTime / 60
  local m3 = math.floor(tm3)
  local s3 = math.floor((tm3 - m3) * 32)
  local prcolor = {
    {
      0,
      204,
      255
    },
    {
      255,
      102,
      0
    },
    {
      0,
      255,
      0
    },
    {
      255,
      0,
      0
    },
    {
      204,
      0,
      255
    },
    {
      153,
      153,
      153
    },
    {
      0,
      255,
      204
    }
  }
  local alcolor = {
    {
      255,
      255,
      255
    },
    {
      0,
      102,
      255
    },
    {
      255,
      0,
      0
    },
    {
      255,
      255,
      0
    },
    {
      255,
      255,
      153
    },
    {
      0,
      0,
      0
    },
    {
      255,
      0,
      153
    }
  }
  local j = Player:GetCurWeaponSlotIndex()
  if type(j) == "number" and j <= 7 and 1 <= j and Player._CurWeaponIndex == j then
    if Player._CurWeaponIndex == 7 then
      Hud.NoCrosshair = nil
      local cr = Player:GetCurWeapon()
      if 0 < cr._zoom then
        HUD.DrawQuad(Hud._matZoom, 0, 0, w, h)
        Hud.NoCrosshair = true
      end
    end
    if Cfg.HUD_Show_Ammo then
      checkitem[1] = true
      checkitem[2] = true
      checkitem[3] = true
      checkitem[4] = true
      if not INP.IsFireSwitched() then
        if not (not Game.SwitchFire[j] and Cfg.SwitchFire[j]) or not Cfg.SwitchFire[j] and Game.SwitchFire[j] then
          if Cfg.HUD_HudStyle == 2 then
            if Cfg.HUD_3DIcon_Anim then
              Hud:QuadTrans(priammolist3D[j][s2 + 1], (1024 - qwhuditemsfix1) * w / 1024, (768 - qwhudposhw1) * h / 768, qwhudsizew1 / 2, true, transic)
              Hud:QuadTrans(altammolist3D[j][ams + 1], (1024 - qwhuditemsfix3) * w / 1024, (768 - qwhudposhw2) * h / 768, qwhudsizew2 / 2, true, transic)
            else
              Hud:QuadTrans(priammolist3D[j][0 + 1], (1024 - qwhuditemsfix1) * w / 1024, (768 - qwhudposhw1) * h / 768, qwhudsizew1 / 2, true, transic)
              Hud:QuadTrans(altammolist3D[j][fix + 1], (1024 - qwhuditemsfix3) * w / 1024, (768 - qwhudposhw2) * h / 768, qwhudsizew2 / 2, true, transic)
            end
          else
            Hud:QuadRGBA(priammolist[j], (1024 - qwhuditemsfix1) * w / 1024, (768 - qwhudposhw1) * h / 768, qwhudsizew1 / 2, true, prcolor[j][1], prcolor[j][2], prcolor[j][3], transic)
            Hud:QuadRGBA(altammolist[j], (1024 - qwhuditemsfix3) * w / 1024, (768 - qwhudposhw2) * h / 768, qwhudsizew2 / 2, true, alcolor[j][1], alcolor[j][2], alcolor[j][3], transic)
          end
          Hud:DrawDigitsText3((1024 - posInf - 122 * qwhudsizewd1 / 2) * w / 1024, (768 - qwhudposhw1d - 64 * qwhudsizewd1 / 2) * h / 768, string.sub(string.format(numcharact[j], priammolistnum[j]), -3), showinf * qwhudsizewd1, priammolistnumwar[j], colord[1], colord[2], colord[3], transco)
          Hud:DrawDigitsText3((1024 - posInff - 122 * qwhudsizewd2 / 2) * w / 1024, (768 - qwhudposhw2d - 64 * qwhudsizewd2 / 2) * h / 768, string.sub(string.format(numcharact[j], altammolistnum[j]), -3), showinf * qwhudsizewd2, altammolistnumwar[j], colord[1], colord[2], colord[3], transco)
        else
          if Cfg.HUD_HudStyle == 2 then
            if Cfg.HUD_3DIcon_Anim then
              Hud:QuadTrans(priammolist3D[j][s2 + 1], (1024 - qwhuditemsfix3) * w / 1024, (768 - qwhudposhw2) * h / 768, qwhudsizew2 / 2, true, transic)
              Hud:QuadTrans(altammolist3D[j][ams + 1], (1024 - qwhuditemsfix1) * w / 1024, (768 - qwhudposhw1) * h / 768, qwhudsizew1 / 2, true, transic)
            else
              Hud:QuadTrans(priammolist3D[j][0 + 1], (1024 - qwhuditemsfix3) * w / 1024, (768 - qwhudposhw2) * h / 768, qwhudsizew2 / 2, true, transic)
              Hud:QuadTrans(altammolist3D[j][fix + 1], (1024 - qwhuditemsfix1) * w / 1024, (768 - qwhudposhw1) * h / 768, qwhudsizew1 / 2, true, transic)
            end
          else
            Hud:QuadRGBA(priammolist[j], (1024 - qwhuditemsfix3) * w / 1024, (768 - qwhudposhw2) * h / 768, qwhudsizew2 / 2, true, prcolor[j][1], prcolor[j][2], prcolor[j][3], transic)
            Hud:QuadRGBA(altammolist[j], (1024 - qwhuditemsfix1) * w / 1024, (768 - qwhudposhw1) * h / 768, qwhudsizew1 / 2, true, alcolor[j][1], alcolor[j][2], alcolor[j][3], transic)
          end
          Hud:DrawDigitsText3((1024 - posInff - 122 * qwhudsizewd2 / 2) * w / 1024, (768 - qwhudposhw2d - 64 * qwhudsizewd2 / 2) * h / 768, string.sub(string.format(numcharact[j], priammolistnum[j]), -3), showinf * qwhudsizewd2, priammolistnumwar[j], colord[1], colord[2], colord[3], transco)
          Hud:DrawDigitsText3((1024 - posInf - 122 * qwhudsizewd1 / 2) * w / 1024, (768 - qwhudposhw1d - 64 * qwhudsizewd1 / 2) * h / 768, string.sub(string.format(numcharact[j], altammolistnum[j]), -3), showinf * qwhudsizewd1, altammolistnumwar[j], colord[1], colord[2], colord[3], transco)
        end
      elseif not (not Game.SwitchFire[j] and Cfg.SwitchFire[j]) or not Cfg.SwitchFire[j] and Game.SwitchFire[j] then
        if Cfg.HUD_HudStyle == 2 then
          if Cfg.HUD_3DIcon_Anim then
            Hud:QuadTrans(priammolist3D[j][s2 + 1], (1024 - qwhuditemsfix3) * w / 1024, (768 - qwhudposhw2) * h / 768, qwhudsizew2 / 2, true, transic)
            Hud:QuadTrans(altammolist3D[j][ams + 1], (1024 - qwhuditemsfix1) * w / 1024, (768 - qwhudposhw1) * h / 768, qwhudsizew1 / 2, true, transic)
          else
            Hud:QuadTrans(priammolist3D[j][0 + 1], (1024 - qwhuditemsfix3) * w / 1024, (768 - qwhudposhw2) * h / 768, qwhudsizew2 / 2, true, transic)
            Hud:QuadTrans(altammolist3D[j][fix + 1], (1024 - qwhuditemsfix1) * w / 1024, (768 - qwhudposhw1) * h / 768, qwhudsizew1 / 2, true, transic)
          end
        else
          Hud:QuadRGBA(priammolist[j], (1024 - qwhuditemsfix3) * w / 1024, (768 - qwhudposhw2) * h / 768, qwhudsizew2 / 2, true, prcolor[j][1], prcolor[j][2], prcolor[j][3], transic)
          Hud:QuadRGBA(altammolist[j], (1024 - qwhuditemsfix1) * w / 1024, (768 - qwhudposhw1) * h / 768, qwhudsizew1 / 2, true, alcolor[j][1], alcolor[j][2], alcolor[j][3], transic)
        end
        Hud:DrawDigitsText3((1024 - posInff - 122 * qwhudsizewd2 / 2) * w / 1024, (768 - qwhudposhw2d - 64 * qwhudsizewd2 / 2) * h / 768, string.sub(string.format(numcharact[j], priammolistnum[j]), -3), showinf * qwhudsizewd2, priammolistnumwar[j], colord[1], colord[2], colord[3], transco)
        Hud:DrawDigitsText3((1024 - posInf - 122 * qwhudsizewd1 / 2) * w / 1024, (768 - qwhudposhw1d - 64 * qwhudsizewd1 / 2) * h / 768, string.sub(string.format(numcharact[j], altammolistnum[j]), -3), showinf * qwhudsizewd1, altammolistnumwar[j], colord[1], colord[2], colord[3], transco)
      else
        if Cfg.HUD_HudStyle == 2 then
          if Cfg.HUD_3DIcon_Anim then
            Hud:QuadTrans(priammolist3D[j][s2 + 1], (1024 - qwhuditemsfix1) * w / 1024, (768 - qwhudposhw1) * h / 768, qwhudsizew1 / 2, true, transic)
            Hud:QuadTrans(altammolist3D[j][ams + 1], (1024 - qwhuditemsfix3) * w / 1024, (768 - qwhudposhw2) * h / 768, qwhudsizew2 / 2, true, transic)
          else
            Hud:QuadTrans(priammolist3D[j][0 + 1], (1024 - qwhuditemsfix1) * w / 1024, (768 - qwhudposhw1) * h / 768, qwhudsizew1 / 2, true, transic)
            Hud:QuadTrans(altammolist3D[j][fix + 1], (1024 - qwhuditemsfix3) * w / 1024, (768 - qwhudposhw2) * h / 768, qwhudsizew2 / 2, true, transic)
          end
        else
          Hud:QuadRGBA(priammolist[j], (1024 - qwhuditemsfix1) * w / 1024, (768 - qwhudposhw1) * h / 768, qwhudsizew1 / 2, true, prcolor[j][1], prcolor[j][2], prcolor[j][3], transic)
          Hud:QuadRGBA(altammolist[j], (1024 - qwhuditemsfix3) * w / 1024, (768 - qwhudposhw2) * h / 768, qwhudsizew2 / 2, true, alcolor[j][1], alcolor[j][2], alcolor[j][3], transic)
        end
        Hud:DrawDigitsText3((1024 - posInf - 122 * qwhudsizewd1 / 2) * w / 1024, (768 - qwhudposhw1d - 64 * qwhudsizewd1 / 2) * h / 768, string.sub(string.format(numcharact[j], priammolistnum[j]), -3), showinf * qwhudsizewd1, priammolistnumwar[j], colord[1], colord[2], colord[3], transco)
        Hud:DrawDigitsText3((1024 - posInff - 122 * qwhudsizewd2 / 2) * w / 1024, (768 - qwhudposhw2d - 64 * qwhudsizewd2 / 2) * h / 768, string.sub(string.format(numcharact[j], altammolistnum[j]), -3), showinf * qwhudsizewd2, altammolistnumwar[j], colord[1], colord[2], colord[3], transco)
      end
    end
    if Cfg.HUD_Show_CurrentWeapon_Icon then
      checkitem[9] = true
      if Cfg.HUD_3DIcon_Anim and Cfg.HUD_HudStyle == 2 then
        Hud:QuadTrans(cweapons[j][s3 + 1], (1024 - qwhudposcw) * w / 1024, (768 - qwhudposhcw) * h / 768, qwhudsizecwd / 2, true, transic)
      elseif not Cfg.HUD_3DIcon_Anim and Cfg.HUD_HudStyle == 2 then
        Hud:QuadTrans(cweapons[j][0 + 1], (1024 - qwhudposcw) * w / 1024, (768 - qwhudposhcw) * h / 768, qwhudsizecwd / 2, true, transic)
      else
        Hud:QuadRGBA(priammolist[j], (1024 - qwhudposcw) * w / 1024, (768 - qwhudposhcw) * h / 768, qwhudsizecwd / 2, true, prcolor[j][1], prcolor[j][2], prcolor[j][3], transic)
      end
    end
  end
  if Cfg.PositioningSystem == 3 then
    local nosavecheck = false
    if INP.Key(Keys.Home) == 2 then
      if Game.currentTime > Hud.movespeedstarttime and Hud.movespeedstart then
        Hud.keypressmode = 2
      end
      spressthiskey = true
    end
    if INP.Key(Keys.Home) == 3 then
      Cfg:Save()
      spressthiskey = false
    end
    if spressthiskey == true then
      local nu = 1
      if INP.Key(Keys.Num7) == 1 then
        nu = 1
        Hud.SuperHud_Item = Hud.SuperHud_Item - nu
      end
      if INP.Key(Keys.Num1) == 1 then
        nu = 0 - 1
        Hud.SuperHud_Item = Hud.SuperHud_Item - nu
      end
      for i = 1, 9 do
        if not checkitem[Hud.SuperHud_Item] then
          Hud.SuperHud_Item = Hud.SuperHud_Item - nu
          if 9 < Hud.SuperHud_Item then
            Hud.SuperHud_Item = 1
          end
          if 1 > Hud.SuperHud_Item then
            Hud.SuperHud_Item = 9
          end
        end
        local g = {
          nil,
          2,
          nil,
          4,
          nil,
          6,
          nil,
          8,
          nil
        }
        local h = {
          1,
          nil,
          3,
          nil,
          5,
          nil,
          7,
          nil,
          nil
        }
        if Hud.SuperHud_Item == g[i] then
          qwposmarkerref = 59.5
          sizemarker = 122
        elseif Hud.SuperHud_Item == h[i] then
          qwposmarkerref = 30.5
          sizemarker = 64
        elseif Hud.SuperHud_Item == 9 then
          qwposmarkerref = 46.5
          sizemarker = 96
          if Cfg.HUD_HudStyle == 1 then
            qwposmarkerref = 30.5
            sizemarker = 64
          end
        end
        if INP.Key(Keys.Num0) == 1 then
          qwhuditems[i][1] = defaultpos[i]
          qwhuditems[i][2] = defaultposa[i]
          qwhuditems[i][3] = tonumber(string.format("%.02f", defaultsiz[i]))
        end
        if INP.Key(Keys.NumDivide) == 1 then
          if qwhuditems[i][1] ~= defaultpos[i] or qwhuditems[i][2] ~= defaultposa[i] or qwhuditems[i][3] ~= defaultsiz[i] then
            nosavecheck = true
          end
          if nosavecheck == false then
            PlaySound2DOnKey_qw = false
            CONSOLE.AddMessage(settingnosave, R3D.RGB(0, 255, 0))
          else
            PlaySound2DOnKey_qw = true
            qwhuditemssav[i][1] = qwhuditems[i][1]
            qwhuditemssav[i][2] = qwhuditems[i][2]
            qwhuditemssav[i][3] = qwhuditems[i][3]
            Cfg.HUD_Show_CurrentWeapon_Icon_Save = Cfg.HUD_Show_CurrentWeapon_Icon
            CONSOLE.AddMessage(settingsave, R3D.RGB(0, 255, 0))
          end
        end
        if INP.Key(Keys.NumMultiply) == 1 then
          if qwhuditemssav[i][1] == 0 and qwhuditemssav[i][2] == 0 and qwhuditemssav[i][3] == 0 then
            PlaySound2DOnKey_qw = false
            CONSOLE.AddMessage(settingnoloaded, R3D.RGB(0, 255, 0))
          else
            PlaySound2DOnKey_qw = true
            qwhuditems[i][1] = qwhuditemssav[i][1]
            qwhuditems[i][2] = qwhuditemssav[i][2]
            qwhuditems[i][3] = qwhuditemssav[i][3]
            Cfg.HUD_Show_CurrentWeapon_Icon = Cfg.HUD_Show_CurrentWeapon_Icon_Save
            CONSOLE.AddMessage(settingloaded, R3D.RGB(0, 255, 0))
          end
        end
      end
      local it = Hud.SuperHud_Item
      if checkitem[it] == true then
        if qwhuditems[it][1] < 1024 - sizemarker * qwhuditems[it][3] / 2 and qwhuditems[it][1] > 1 + sizemarker * qwhuditems[it][3] / 2 then
          PlaySound2DOnKey_qw1 = true
        else
          PlaySound2DOnKey_qw1 = false
        end
        if qwhuditems[it][2] < 768 - 64 * qwhuditems[it][3] / 2 and qwhuditems[it][2] > 1 + 64 * qwhuditems[it][3] / 2 then
          PlaySound2DOnKey_qw2 = true
        else
          PlaySound2DOnKey_qw2 = false
        end
        if qwhuditems[it][3] < 1.3 and qwhuditems[it][3] > 0.5 then
          PlaySound2DOnKey_qw3 = true
        else
          PlaySound2DOnKey_qw3 = false
        end
        if INP.Key(Keys.Num4) == Hud.keypressmode then
          if Hud.keypressmode == 1 then
            Hud.movespeedstarttime = Game.currentTime + Hud.latency
            Hud.movespeedstart = true
          end
          qwhuditems[it][1] = tonumber(string.format("%d", qwhuditems[it][1] + 1))
        elseif INP.Key(Keys.Num6) == Hud.keypressmode then
          if Hud.keypressmode == 1 then
            Hud.movespeedstarttime = Game.currentTime + Hud.latency
            Hud.movespeedstart = true
          end
          qwhuditems[it][1] = tonumber(string.format("%d", qwhuditems[it][1] - 1))
        end
        if INP.Key(Keys.Num8) == Hud.keypressmode then
          if Hud.keypressmode == 1 then
            Hud.movespeedstarttime = Game.currentTime + Hud.latency
            Hud.movespeedstart = true
          end
          qwhuditems[it][2] = tonumber(string.format("%d", qwhuditems[it][2] + 1))
        elseif INP.Key(Keys.Num2) == Hud.keypressmode then
          if Hud.keypressmode == 1 then
            Hud.movespeedstarttime = Game.currentTime + Hud.latency
            Hud.movespeedstart = true
          end
          qwhuditems[it][2] = tonumber(string.format("%d", qwhuditems[it][2] - 1))
        end
        if INP.Key(Keys.Num9) == Hud.keypressmode then
          if Hud.keypressmode == 1 then
            Hud.movespeedstarttime = Game.currentTime + Hud.latency
            Hud.movespeedstart = true
          end
          qwhuditems[it][3] = tonumber(string.format("%.02f", qwhuditems[it][3] + 0.01))
          if qwhuditems[it][3] > 1.3 then
            qwhuditems[it][3] = tonumber(string.format("%.01f", 1.3))
          end
        elseif INP.Key(Keys.Num3) == Hud.keypressmode then
          if Hud.keypressmode == 1 then
            Hud.movespeedstarttime = Game.currentTime + Hud.latency
            Hud.movespeedstart = true
          end
          qwhuditems[it][3] = tonumber(string.format("%.02f", qwhuditems[it][3] - 0.01))
          if qwhuditems[it][3] < 0.5 then
            qwhuditems[it][3] = tonumber(string.format("%.01f", 0.5))
          end
        end
        if INP.Key(Keys.Num8) == 3 or INP.Key(Keys.Num2) == 3 or INP.Key(Keys.Num6) == 3 or INP.Key(Keys.Num4) == 3 or INP.Key(Keys.Num9) == 3 or INP.Key(Keys.Num3) == 3 then
          Hud.movespeedstarttime = 0
          Hud.movespeedstart = false
          Hud.keypressmode = 1
        end
        HUD.SetFont("courbd", 20)
        HUD.PrintXY((w - HUD.GetTextWidth(qwhuditemsname[it] .. " Size: " .. qwhuditems[it][3] * 100 .. "%")) / 2, h / 2.6, qwhuditemsname[it] .. " Size: " .. qwhuditems[it][3] * 100 .. "%", "courbd", 0, 255, 0, 20)
        HUD.PrintXY((w - HUD.GetTextWidth(string.format("Vertical Position: %.01f px", qwhuditems[it][2] * h / 768))) / 2, h / 2.6 + HUD.GetTextHeight(), string.format("Vertical Position: %.01f px", qwhuditems[it][2] * h / 768), "courbd", 0, 255, 0, 20)
        HUD.PrintXY((w - HUD.GetTextWidth(string.format("Horinzontal Position: %.01f px", (qwhuditems[it][1] - 512) * w / 1024))) / 2, h / 2.6 + HUD.GetTextHeight() * 2, string.format("Horinzontal Position: %.01f px", (qwhuditems[it][1] - 512) * w / 1024), "courbd", 0, 255, 0, 20)
        if qwhuditems[it][1] > 1024 - sizemarker * qwhuditems[it][3] / 2 then
          qwhuditems[it][1] = tonumber(string.format("%d", 1024 - sizemarker * qwhuditems[it][3] / 2))
        end
        if qwhuditems[it][1] < 0 + sizemarker * qwhuditems[it][3] / 2 then
          qwhuditems[it][1] = tonumber(string.format("%d", 0 + sizemarker * qwhuditems[it][3] / 2))
        end
        if qwhuditems[it][2] > 768 - 64 * qwhuditems[it][3] / 2 then
          qwhuditems[it][2] = tonumber(string.format("%d", 768 - 64 * qwhuditems[it][3] / 2))
        end
        if qwhuditems[it][2] < 0 + 64 * qwhuditems[it][3] / 2 then
          qwhuditems[it][2] = tonumber(string.format("%d", 0 + 64 * qwhuditems[it][3] / 2))
        end
        if Hud.SuperHud_Item == it then
          if it == 1 then
            markerfix = qwhuditemsfix1
          elseif it == 2 then
            markerfix = qwhuditemsfix2
          elseif it == 3 then
            markerfix = qwhuditemsfix3
          elseif it == 4 then
            markerfix = qwhuditemsfix4
          else
            markerfix = qwhuditems[it][1]
          end
          HUD.DrawQuadRGBA(nil, (1024 - markerfix - sizemarker * qwhuditems[it][3] / 2) * w / 1024, (768 - (qwhuditems[it][2] - 30.5 * qwhuditems[it][3]) - 64 * qwhuditems[it][3] / 2) * h / 768, sizemarker * qwhuditems[it][3] * w / 1024, 3 * qwhuditems[it][3] * h / 768, 0, 255, 0, 255)
          HUD.DrawQuadRGBA(nil, (1024 - (markerfix - qwposmarkerref * qwhuditems[it][3]) - sizemarker * qwhuditems[it][3] / 2) * w / 1024, (768 - qwhuditems[it][2] - 64 * qwhuditems[it][3] / 2) * h / 768, 3 * qwhuditems[it][3] * w / 1024, 64 * qwhuditems[it][3] * h / 768, 0, 255, 0, 255)
        end
      end
    end
  end
end

function Hud:Shape(item, enable, morethantwo)
  local w, h = R3D.ScreenSize()
  local it = Hud.Shape_Item
  local itpos = {
    Cfg.HUD_Flag_Icon_Setting,
    Cfg.HUD_Modifier_Icon_Setting,
    Cfg.HUD_Immunity_Icon_Setting,
    Cfg.HUD_Rage_Icon_Setting,
    Cfg.HUD_Medals_Icon_Setting
  }
  local itpossav = {
    Cfg.HUD_Flag_Icon_Setting_Save,
    Cfg.HUD_Modifier_Icon_Setting_Save,
    Cfg.HUD_Immunity_Icon_Setting_Save,
    Cfg.HUD_Rage_Icon_Setting_Save,
    Cfg.HUD_Medals_Icon_Setting_Save
  }
  local defpos = {
    {
      0,
      -280,
      0.73
    },
    {
      489,
      70,
      0.73
    },
    {
      489,
      -70,
      0.73
    },
    {
      489,
      0,
      0.73
    },
    {
      0,
      240,
      0.73
    }
  }
  local itemsname = {
    "Flag Icon",
    "WeaponModifier Icon",
    "Immunity Icon",
    "Rage Icon",
    "Medals Icon"
  }
  local ftrans = Cfg.HUD_Flag_Icon_Trans
  local ptrans = Cfg.HUD_PowerUp_Icons_Trans
  local etrans = Cfg.HUD_Medals_Icons_Trans
  local medalnm = Hud.MedalNoMercy
  local medals = Hud.MedalSweet
  local medalst = Hud.MedalStylish
  local medalg = Hud.MedalGood
  local nosavecheck = false
  local settingsave = "Your custom settings have been saved."
  local settingnosave = "This is the default settings, none settings saved."
  local settingloaded = "Your custom settings have been loaded."
  local settingnoloaded = "This is the default settings, none settings loaded"
  if Cfg.Language == "french" then
    settingsave = "Vos param\232tres personnalis\233s ont \233t\233 enregistr\233s."
    settingnosave = "C'est le param\233trage par d\233faut, aucun param\232tres enregistr\233s."
    settingloaded = "Vos param\232tres personnalis\233s ont \233t\233 charg\233s."
    settingnoloaded = "C'est le param\233trage par d\233faut, aucun param\232tres charg\233s."
  end
  if Cfg.PositioningSystem == 5 then
    if INP.Key(Keys.Home) == 2 then
      if Game.currentTime > Hud.movespeedstarttime and Hud.movespeedstart then
        Hud.keypressmode = 2
      end
      if INP.Key(Keys.Num7) == 1 then
        Hud.Shape_Item = Hud.Shape_Item - 1
        if Hud.Shape_Item < 1 then
          Hud.Shape_Item = table.getn(itemsname)
        end
      end
      if INP.Key(Keys.Num1) == 1 then
        Hud.Shape_Item = Hud.Shape_Item + 1
        if Hud.Shape_Item > table.getn(itemsname) then
          Hud.Shape_Item = 1
        end
      end
      if INP.Key(Keys.Num4) == Hud.keypressmode then
        if Hud.keypressmode == 1 then
          Hud.movespeedstarttime = Game.currentTime + Hud.latency
          Hud.movespeedstart = true
        end
        itpos[it][1] = tonumber(string.format("%d", itpos[it][1] - 1))
      elseif INP.Key(Keys.Num6) == Hud.keypressmode then
        if Hud.keypressmode == 1 then
          Hud.movespeedstarttime = Game.currentTime + Hud.latency
          Hud.movespeedstart = true
        end
        itpos[it][1] = tonumber(string.format("%d", itpos[it][1] + 1))
      end
      if INP.Key(Keys.Num8) == Hud.keypressmode then
        if Hud.keypressmode == 1 then
          Hud.movespeedstarttime = Game.currentTime + Hud.latency
          Hud.movespeedstart = true
        end
        itpos[it][2] = tonumber(string.format("%d", itpos[it][2] + 1))
      elseif INP.Key(Keys.Num2) == Hud.keypressmode then
        if Hud.keypressmode == 1 then
          Hud.movespeedstarttime = Game.currentTime + Hud.latency
          Hud.movespeedstart = true
        end
        itpos[it][2] = tonumber(string.format("%d", itpos[it][2] - 1))
      end
      if INP.Key(Keys.Num9) == Hud.keypressmode then
        if Hud.keypressmode == 1 then
          Hud.movespeedstarttime = Game.currentTime + Hud.latency
          Hud.movespeedstart = true
        end
        itpos[it][3] = tonumber(string.format("%.02f", itpos[it][3] + 0.01))
        if 1 < itpos[it][3] then
          itpos[it][3] = tonumber(string.format("%d", 1))
        end
      elseif INP.Key(Keys.Num3) == Hud.keypressmode then
        if Hud.keypressmode == 1 then
          Hud.movespeedstarttime = Game.currentTime + Hud.latency
          Hud.movespeedstart = true
        end
        itpos[it][3] = tonumber(string.format("%.02f", itpos[it][3] - 0.01))
        if itpos[it][3] < 0.3 then
          itpos[it][3] = tonumber(string.format("%.01f", 0.3))
        end
      end
      if INP.Key(Keys.Num8) == 3 or INP.Key(Keys.Num2) == 3 or INP.Key(Keys.Num6) == 3 or INP.Key(Keys.Num4) == 3 or INP.Key(Keys.Num9) == 3 or INP.Key(Keys.Num3) == 3 then
        Hud.movespeedstarttime = 0
        Hud.movespeedstart = false
        Hud.keypressmode = 1
      end
      if INP.Key(Keys.Num0) == 1 then
        itpos[it][1] = defpos[it][1]
        itpos[it][2] = defpos[it][2]
        itpos[it][3] = defpos[it][3]
      end
      if INP.Key(Keys.NumDivide) == 1 then
        if itpos[it][1] ~= defpos[it][1] or itpos[it][2] ~= defpos[it][2] or itpos[it][3] ~= defpos[it][3] then
          nosavecheck = true
        end
        if nosavecheck == false then
          PlaySound2DOnKey_sh = false
          CONSOLE.AddMessage(settingnosave, R3D.RGB(0, 255, 0))
        else
          PlaySound2DOnKey_sh = true
          itpossav[it][1] = itpos[it][1]
          itpossav[it][2] = itpos[it][2]
          itpossav[it][3] = itpos[it][3]
          CONSOLE.AddMessage(settingsave, R3D.RGB(0, 255, 0))
        end
      end
      if INP.Key(Keys.NumMultiply) == 1 then
        if itpossav[it][1] == 0 and itpossav[it][2] == 0 and itpossav[it][3] == 0 then
          PlaySound2DOnKey_sh = false
          CONSOLE.AddMessage(settingnoloaded, R3D.RGB(0, 255, 0))
        else
          PlaySound2DOnKey_sh = true
          itpos[it][1] = itpossav[it][1]
          itpos[it][2] = itpossav[it][2]
          itpos[it][3] = itpossav[it][3]
          CONSOLE.AddMessage(settingloaded, R3D.RGB(0, 255, 0))
        end
      end
      HUD.SetFont("courbd", 20)
      HUD.PrintXY((w - HUD.GetTextWidth(itemsname[it] .. " Size: " .. itpos[it][3] * 100 .. "%")) / 2, h / 2.6, itemsname[it] .. " Size: " .. itpos[it][3] * 100 .. "%", "courbd", 0, 255, 0, 20)
      HUD.PrintXY((w - HUD.GetTextWidth(string.format("Vertical Position: %.01f px", itpos[it][2] * h / 768))) / 2, h / 2.6 + HUD.GetTextHeight(), string.format("Vertical Position: %.01f px", itpos[it][2] * h / 768), "courbd", 0, 255, 0, 20)
      HUD.PrintXY((w - HUD.GetTextWidth(string.format("Horinzontal Position: %.01f px", itpos[it][1] * w / 1024))) / 2, h / 2.6 + HUD.GetTextHeight() * 2, string.format("Horinzontal Position: %.01f px", itpos[it][1] * w / 1024), "courbd", 0, 255, 0, 20)
    end
    if itpos[it][1] > 512 - 32 * itpos[it][3] then
      itpos[it][1] = 512 - 32 * itpos[it][3]
    end
    if itpos[it][1] < -512 + 32 * itpos[it][3] then
      itpos[it][1] = -512 + 32 * itpos[it][3]
    end
    if itpos[it][2] > 384 - 32 * itpos[it][3] then
      itpos[it][2] = 384 - 32 * itpos[it][3]
    end
    if itpos[it][2] < -384 + 32 * itpos[it][3] then
      itpos[it][2] = -384 + 32 * itpos[it][3]
    end
    if itpos[it][1] < 511 - 32 * itpos[it][3] and itpos[it][1] > -511 + 32 * itpos[it][3] then
      PlaySound2DOnKey_sh1 = true
    else
      PlaySound2DOnKey_sh1 = false
    end
    if itpos[it][2] < 383 - 32 * itpos[it][3] and itpos[it][2] > -383 + 32 * itpos[it][3] then
      PlaySound2DOnKey_sh2 = true
    else
      PlaySound2DOnKey_sh2 = false
    end
    if itpos[it][3] < 0.9 and itpos[it][3] > 0.4 then
      PlaySound2DOnKey_sh3 = true
    else
      PlaySound2DOnKey_sh3 = false
    end
  end
  local sizerx, sizery = MATERIAL.Size(Hud._matPlayerHasFlag)
  if item == "flag" or item == "all" then
    if Player.Team == 0 then
      local cr = {
        255,
        0,
        0
      }
      if Cfg.BrightSkins and Cfg.HUD_Brightskins_Style then
        cr = {
          Game._ColorTeamR[1],
          Game._ColorTeamR[2],
          Game._ColorTeamR[3]
        }
      end
      self:QuadRGBA(Hud._matPlayerHasFlag, w / 2 + itpos[1][1] * w / 1024, h / 2 - itpos[1][2] * h / 768, itpos[1][3], true, cr[1], cr[2], cr[3], ftrans)
    elseif Player.Team == 1 then
      cb = {
        0,
        102,
        255
      }
      if Cfg.BrightSkins and Cfg.HUD_Brightskins_Style then
        cb = {
          Game._ColorTeamB[1],
          Game._ColorTeamB[2],
          Game._ColorTeamB[3]
        }
      end
      if not Cfg.FixedColors and NET.IsSpectator(NET.GetClientID()) == false then
        cb = {
          255,
          0,
          0
        }
        if Cfg.BrightSkins and Cfg.HUD_Brightskins_Style then
          cb = {
            Game._ColorTeamR[1],
            Game._ColorTeamR[2],
            Game._ColorTeamR[3]
          }
        end
      end
      self:QuadRGBA(Hud._matPlayerHasFlag, w / 2 + itpos[1][1] * w / 1024, h / 2 - itpos[1][2] * h / 768, itpos[1][3], true, cb[1], cb[2], cb[3], ftrans)
    end
  end
  if item == "modifier" or item == "all" then
    local modifier = Hud.HasWeaponModifierCountdown
    local fixposw = 17 * itpos[2][3] * w / 1024
    local fixposh = -34 * itpos[2][3] * h / 768
    if modifier < 10 then
      fixposw = 9 * itpos[2][3] * w / 1024
    end
    self:QuadRGBA(Hud._matPlayerHasPowerUp, w / 2 + itpos[2][1] * w / 1024, h / 2 - itpos[2][2] * h / 768, itpos[2][3], true, 255, 102, 0, ptrans)
    if enable then
      Hud:DrawDigitsText3(w / 2 - fixposw + itpos[2][1] * w / 1024, h / 2 - fixposh - itpos[2][2] * h / 768, string.sub(string.format("%d", modifier), -3), 0.4 * itpos[2][3], nil, 255, 255, 255, ptrans)
    end
  end
  if item == "immunity" or item == "all" then
    local fixposw = 17 * itpos[3][3] * w / 1024
    local fixposh = -34 * itpos[3][3] * h / 768
    local immunity = Hud.HasPentagramCountdown
    if immunity < 10 then
      fixposw = 9 * itpos[3][3] * w / 1024
    end
    self:QuadRGBA(Hud._matPlayerHasPowerUp, w / 2 + itpos[3][1] * w / 1024, h / 2 - itpos[3][2] * h / 768, itpos[3][3], true, 255, 0, 0, ptrans)
    if enable then
      Hud:DrawDigitsText3(w / 2 - fixposw + itpos[3][1] * w / 1024, h / 2 - fixposh - itpos[3][2] * h / 768, string.sub(string.format("%d", immunity), -3), 0.4 * itpos[3][3], nil, 255, 255, 255, ptrans)
    end
  end
  if item == "rage" or item == "all" then
    local fixposw = 17 * itpos[4][3] * w / 1024
    local fixposh = -34 * itpos[4][3] * h / 768
    local rage = Hud.HasQuadCountdown
    if rage < 10 then
      fixposw = 9 * itpos[4][3] * w / 1024
    end
    self:QuadRGBA(Hud._matPlayerHasPowerUp, w / 2 + itpos[4][1] * w / 1024, h / 2 - itpos[4][2] * h / 768, itpos[4][3], true, 0, 255, 255, ptrans)
    if enable then
      Hud:DrawDigitsText3(w / 2 - fixposw + itpos[4][1] * w / 1024, h / 2 - fixposh - itpos[4][2] * h / 768, string.sub(string.format("%d", rage), -3), 0.4 * itpos[4][3], nil, 255, 255, 255, ptrans)
    end
  end
  local fixposw = 18 * itpos[5][3] * w / 1024
  local fixposh = -34 * itpos[5][3] * h / 768
  local fixsize = 0.4 * itpos[5][3]
  if item == "good" or item == "all" then
    local rep = 0
    if item == "all" then
      medalg = 9
    end
    local center = 33 * itpos[5][3] * w / 1024 * medalg - 1
    if medalg < 10 then
      for i = 1, medalg do
        self:QuadRGBA(Hud._matPlayerExcellentMedal, w / 2 + itpos[5][1] * w / 1024 + 33 * itpos[5][3] * w / 1024 + rep - center, h / 2 - morethantwo - itpos[5][2] * h / 768, itpos[5][3], true, 255, 255, 255, etrans)
        rep = rep + 66 * itpos[5][3] * w / 1024
      end
    else
      self:QuadRGBA(Hud._matPlayerExcellentMedal, w / 2 + itpos[5][1] * w / 1024, h / 2 - morethantwo - itpos[5][2] * h / 768, itpos[5][3], true, 255, 255, 255, etrans)
      Hud:DrawDigitsText3(w / 2 - fixposw + itpos[5][1] * w / 1024, h / 2 - morethantwo - fixposh - itpos[5][2] * h / 768, string.sub(string.format("%d", medalg), -3), fixsize, nil, 255, 255, 255, etrans)
    end
  end
  if item == "nomercy" then
    local rep = 0
    if item == "all" then
      medalnm = 9
    end
    local center = 33 * itpos[5][3] * w / 1024 * medalnm - 1
    if medalnm < 10 then
      for i = 1, medalnm do
        self:QuadRGBA(Hud._matPlayerRampageMedal, w / 2 + itpos[5][1] * w / 1024 + 33 * itpos[5][3] * w / 1024 + rep - center, h / 2 - morethantwo - itpos[5][2] * h / 768, itpos[5][3], true, 255, 255, 255, etrans)
        rep = rep + 66 * itpos[5][3] * w / 1024
      end
    else
      self:QuadRGBA(Hud._matPlayerRampageMedal, w / 2 + itpos[5][1] * w / 1024, h / 2 - morethantwo - itpos[5][2] * h / 768, itpos[5][3], true, 255, 255, 255, etrans)
      Hud:DrawDigitsText3(w / 2 - fixposw + itpos[5][1] * w / 1024, h / 2 - morethantwo - fixposh - itpos[5][2] * h / 768, string.sub(string.format("%d", medalnm), -3), fixsize, nil, 255, 255, 255, etrans)
    end
  end
  if item == "sweet" then
    local rep = 0
    if item == "all" then
      medals = 9
    end
    local center = 33 * itpos[5][3] * w / 1024 * medals - 1
    if medals < 10 then
      for i = 1, medals do
        self:QuadRGBA(Hud._matPlayerPKRotorMedal, w / 2 + itpos[5][1] * w / 1024 + 33 * itpos[5][3] * w / 1024 + rep - center, h / 2 - morethantwo - itpos[5][2] * h / 768, itpos[5][3], true, 255, 255, 255, etrans)
        rep = rep + 66 * itpos[5][3] * w / 1024
      end
    else
      self:QuadRGBA(Hud._matPlayerPKRotorMedal, w / 2 + itpos[5][1] * w / 1024, h / 2 - morethantwo - itpos[5][2] * h / 768, itpos[5][3], true, 255, 255, 255, etrans)
      Hud:DrawDigitsText3(w / 2 - fixposw + itpos[5][1] * w / 1024, h / 2 - morethantwo - fixposh - itpos[5][2] * h / 768, string.sub(string.format("%d", medals), -3), fixsize, nil, 255, 255, 255, etrans)
    end
  end
  if item == "stylish" then
    local rep = 0
    if item == "all" then
      medalst = 9
    end
    local center = 33 * itpos[5][3] * w / 1024 * medalst - 1
    if medalst < 10 then
      for i = 1, medalst do
        self:QuadRGBA(Hud._matPlayerImpressiveMedal, w / 2 + itpos[5][1] * w / 1024 + 33 * itpos[5][3] * w / 1024 + rep - center, h / 2 - morethantwo - itpos[5][2] * h / 768, itpos[5][3], true, 255, 255, 255, etrans)
        rep = rep + 66 * itpos[5][3] * w / 1024
      end
    else
      self:QuadRGBA(Hud._matPlayerImpressiveMedal, w / 2 + itpos[5][1] * w / 1024, h / 2 - morethantwo - itpos[5][2] * h / 768, itpos[5][3], true, 255, 255, 255, etrans)
      Hud:DrawDigitsText3(w / 2 - fixposw + itpos[5][1] * w / 1024, h / 2 - morethantwo - fixposh - itpos[5][2] * h / 768, string.sub(string.format("%d", medalst), -3), fixsize, nil, 255, 255, 255, etrans)
    end
  end
  if item == "all" then
    HUD.DrawQuadRGBA(nil, w / 2 + (itpos[it][1] - sizerx / 2 * itpos[it][3]) * w / 1024, h / 2 - (itpos[it][2] + 1.5) * h / 768, 64 * itpos[it][3] * w / 1024, 3 * h / 768, 0, 255, 0, 255)
    HUD.DrawQuadRGBA(nil, w / 2 + (itpos[it][1] - 1) * w / 1024, h / 2 - (itpos[it][2] + sizery / 2 * itpos[it][3]) * h / 768, 3 * w / 1024, 64 * itpos[it][3] * h / 768, 0, 255, 0, 255)
    if Hud.Shape_Item == 5 then
      Hud:DrawDigitsText3(w / 2 - fixposw + itpos[5][1] * w / 1024, h / 2 - fixposh - itpos[5][2] * h / 768, string.sub(string.format("%d", 10), -3), fixsize, nil, 255, 255, 255, etrans)
    end
  end
end
