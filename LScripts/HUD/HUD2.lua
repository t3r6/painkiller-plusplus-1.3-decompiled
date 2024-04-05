function Hud:DrawSpeedmeter(entity)
  local w, h = R3D.ScreenSize()
  
  local vx, vy, vz, vl = ENTITY.GetVelocity(entity)
  local ups = string.format("%.01f Ups", Dist2D(0, 0, vx, vz))
  local infoitems = Cfg.HUD_SMeter_Setting
  local spressthiskey = false
  local spfontsizes = 22
  if Player then
    spfontsizes = infoitems[3] - 4
  end
  local spfontcolortxt = {
    255,
    255,
    255
  }
  local spfonttypo = "Impact"
  if Cfg.PositioningSystem == 4 then
    if INP.Key(Keys.Home) == 2 then
      spressthiskey = true
    end
    if INP.Key(Keys.Home) == 3 then
      spressthiskey = false
    end
  end
  if Cfg.HUD_HudStyle == 0 then
    spfontsizes = infoitems[3]
    spfontcolortxt = {
      230,
      161,
      97
    }
    spfonttypo = "timesbd"
  end
  local hll = Dist2D(0, 0, vx, vz)
  if Cfg.HUD_Show_Speedmeter == 2 then
    hll = 0
  end
  local fh = 0
  if 12 <= hll then
    fh = hll - 10
  end
  colorfont = {
    347 - string.format("%02d", Dist2D(0, 0, vx, vz)) * (9.2 + fh / 5),
    -92 + string.format("%02d", Dist2D(0, 0, vx, vz)) * (9.2 + fh / 5)
  }
  if 0 >= colorfont[1] then
    colorfont[1] = 0
  elseif 255 <= colorfont[1] then
    colorfont[1] = 255
  end
  if 0 >= colorfont[2] then
    colorfont[2] = 0
  elseif 255 <= colorfont[2] then
    colorfont[2] = 255
  end
  local posx = Cfg.HUD_SMeter_Setting[1]
  local posy = Cfg.HUD_SMeter_Setting[2]
  local fontsize = Cfg.HUD_SMeter_Setting[3]
  local checkposx = posx * w / 1024
  HUD.SetFont(spfonttypo, spfontsizes)
  if infoitems[1] < 508 or 4 < infoitems[2] then
    realpos = 0
    showpossmeter = 0
  else
    realpos = heightpos
    showpossmeter = heightpos
  end
  local vara = realpos
  local varb = realpos + HUD.GetTextHeight()
  specrealpos = specrealpos
  if Player then
    if 0 < checkposx then
      HUD.SetFont(spfonttypo, spfontsizes)
      if Cfg.HUD_Show_Speedmeter == 2 or Cfg.HUD_Show_Speedmeter == 3 then
        HUD.PrintXY(w / 2 - HUD.GetTextWidth(ups) + (posx * w / 1024 + 1), vara + (posy + 1) * h / 768, ups, spfonttypo, 15, 15, 15, spfontsizes)
        HUD.PrintXY(w / 2 - HUD.GetTextWidth(ups) + posx * w / 1024, vara + posy * h / 768, ups, spfonttypo, spfontcolortxt[1], spfontcolortxt[2], spfontcolortxt[3], spfontsizes)
        HUD.DrawQuadRGBA(nil, w / 2 - hll * (hll / 10.5) * w / 1024 + posx * w / 1024, varb + (posy + 1) * h / 768, hll * (hll / 10.5) * w / 1024, 3 * h / 768, colorfont[1], colorfont[2], 0)
      elseif Cfg.HUD_Show_Speedmeter == 1 then
        HUD.DrawQuadRGBA(nil, w / 2 - hll * (hll / 10.5) * w / 1024 + posx * w / 1024, vara + (posy + 1) * h / 768, hll * (hll / 10.5) * w / 1024, 10 * h / 768, colorfont[1], colorfont[2], 0)
      end
      if spressthiskey == true and Cfg.HUD_Infos_Items == 4 then
        if Cfg.HUD_Show_Speedmeter == 2 or Cfg.HUD_Show_Speedmeter == 3 then
          if Cfg.HUD_Show_Speedmeter == 3 then
            HUD.DrawQuadRGBA(nil, w / 2 - HUD.GetTextWidth(ups) + posx * w / 1024, varb + (posy + 1) * h / 768, HUD.GetTextWidth(ups), 3 * h / 768, 0, 0, 0, 255)
          end
          HUD.DrawQuadRGBA(nil, w / 2 - HUD.GetTextWidth(ups) + posx * w / 1024, infoitems[2] * h / 768 + showpossmeter + HUD.GetTextHeight() / 2 - 3 * h / 768, HUD.GetTextWidth(ups), 3 * h / 768, 0, 255, 0, 255)
          HUD.DrawQuadRGBA(nil, w / 2 - (HUD.GetTextWidth(ups) - HUD.GetTextWidth(ups) / 2) + posx * w / 1024, infoitems[2] * h / 768 - 1.5 * h / 768 + showpossmeter, 3 * w / 1024, HUD.GetTextHeight(), 0, 255, 0, 255)
        else
          HUD.DrawQuadRGBA(nil, w / 2 - HUD.GetTextWidth("0.0 Ups") + posx * w / 1024, vara + (posy + 1) * h / 768, HUD.GetTextWidth("0.0 Ups"), 10 * h / 768, 0, 255, 0)
        end
      end
    else
      HUD.SetFont(spfonttypo, spfontsizes)
      if Cfg.HUD_Show_Speedmeter == 2 or Cfg.HUD_Show_Speedmeter == 3 then
        HUD.PrintXY(w / 2 - HUD.GetTextWidth("0.0 Ups") + (posx * w / 1024 + 1), vara + (posy + 1) * h / 768, ups, spfonttypo, 15, 15, 15, spfontsizes)
        HUD.PrintXY(w / 2 - HUD.GetTextWidth("0.0 Ups") + posx * w / 1024, vara + posy * h / 768, ups, spfonttypo, spfontcolortxt[1], spfontcolortxt[2], spfontcolortxt[3], spfontsizes)
        HUD.DrawQuadRGBA(nil, w / 2 - HUD.GetTextWidth("0.0 Ups") + posx * w / 1024, varb + (posy + 1) * h / 768, hll * (hll / 10.5) * w / 1024, 3 * h / 768, colorfont[1], colorfont[2], 0)
      elseif Cfg.HUD_Show_Speedmeter == 1 then
        HUD.DrawQuadRGBA(nil, w / 2 - HUD.GetTextWidth("0.0 Ups") + posx * w / 1024, vara + (posy + 1) * h / 768, hll * (hll / 10.5) * w / 1024, 10 * h / 768, colorfont[1], colorfont[2], 0)
      end
      if spressthiskey == true and Cfg.HUD_Infos_Items == 4 then
        if Cfg.HUD_Show_Speedmeter == 2 or Cfg.HUD_Show_Speedmeter == 3 then
          if Cfg.HUD_Show_Speedmeter == 3 then
            HUD.DrawQuadRGBA(nil, w / 2 - HUD.GetTextWidth("0.0 Ups") + posx * w / 1024, varb + (posy + 1) * h / 768, HUD.GetTextWidth(ups), 3 * h / 768, 0, 0, 0, 255)
          end
          HUD.DrawQuadRGBA(nil, w / 2 - HUD.GetTextWidth("0.0 Ups") + posx * w / 1024, infoitems[2] * h / 768 + showpossmeter + HUD.GetTextHeight() / 2 - 3 * h / 768, HUD.GetTextWidth(ups), 3 * h / 768, 0, 255, 0, 255)
          HUD.DrawQuadRGBA(nil, w / 2 - (HUD.GetTextWidth("0.0 Ups") - HUD.GetTextWidth(ups) / 2) + posx * w / 1024, infoitems[2] * h / 768 - 1.5 * h / 768 + showpossmeter, 3 * w / 1024, HUD.GetTextHeight(), 0, 255, 0, 255)
        else
          HUD.DrawQuadRGBA(nil, w / 2 - HUD.GetTextWidth("0.0 Ups") + posx * w / 1024, vara + (posy + 1) * h / 768, HUD.GetTextWidth("0.0 Ups"), 10 * h / 768, 0, 255, 0)
        end
      end
    end
    if posx * w / 1024 <= -(w - w / 2) + HUD.GetTextWidth("0.0 Ups") then
      infoitems[1] = tonumber(string.format("%d", -(w - w / 2) + HUD.GetTextWidth("0.0 Ups")))
      infoitems[1] = tonumber(string.format("%d", (infoitems[1] + 2) / w * 1024))
    end
    if infoitems[2] >= 770 - HUD.GetTextHeight() then
      infoitems[2] = tonumber(string.format("%d", 770 - HUD.GetTextHeight()))
    end
    grosspe = HUD.GetTextWidth("0.0 Ups") / 2
  else
    HUD.SetFont(spfonttypo, spfontsizes)
    HUD.PrintXY(w / 2 - HUD.GetTextWidth(ups) + (508 * w / 1024 + 1), specrealpos + 5 * h / 768 + 1, ups, spfonttypo, 15, 15, 15, spfontsizes)
    HUD.PrintXY(w / 2 - HUD.GetTextWidth(ups) + 508 * w / 1024, specrealpos + 4 * h / 768, ups, spfonttypo, spfontcolortxt[1], spfontcolortxt[2], spfontcolortxt[3], spfontsizes)
    HUD.DrawQuadRGBA(nil, w / 2 - HUD.GetTextWidth(ups) + 508 * w / 1024, specrealpos + HUD.GetTextHeight() + 5 * h / 768, hll * 1.6 * w / 1024, 3 * h / 768, colorfont[1], colorfont[2], 0)
  end
end

function Hud:DrawInfosTimerBegins()
  local w, h = R3D.ScreenSize()
  local spressthiskey = false
  heightpos = 0
  realpos = 0
  specrealpos = 0
  showpossmeter = 0
  grosfps = 0
  grospl = 0
  grospig = 0
  grosspe = 0
  local infoitems = {
    Cfg.HUD_FPS_Setting,
    Cfg.HUD_PL_Setting,
    Cfg.HUD_Ping_Setting,
    Cfg.HUD_SMeter_Setting,
    Cfg.HUD_Timer_Setting,
    Cfg.HUD_FragMessage_Status_Setting
  }
  local infoitemssav = {
    Cfg.HUD_FPS_Setting_Save,
    Cfg.HUD_PL_Setting_Save,
    Cfg.HUD_Ping_Setting_Save,
    Cfg.HUD_SMeter_Setting_Save,
    Cfg.HUD_Timer_Setting_Save,
    Cfg.HUD_FragMessage_Status_Setting_Save
  }
  local itemsname = {
    "FPS",
    "Packet loss",
    "Ping",
    "Speedmeter",
    "Timer",
    "FragMessage"
  }
  local checkitem = {
    false,
    false,
    false,
    false,
    false,
    false
  }
  local j = 0
  local showpospl = 0
  local showposping = 0
  local ping = string.format("%02d ms", NET.GetClientPing(NET.GetClientID()))
  local fps = string.format("%03d FPS", R3D.GetFPS())
  local ploss = NET.GetClientPacketLoss(NET.GetClientID()) .. " PL"
  local vx, vy, vz, vl = ENTITY.GetVelocity(entity)
  local ups = string.format("%.01f Ups", Dist2D(0, 0, vx, vz))
  local fontsizes = {
    22,
    22,
    22,
    22,
    40
  }
  if Player then
    fontsizes = {
      infoitems[1][3] - 4,
      infoitems[2][3] - 4,
      infoitems[3][3] - 4,
      infoitems[4][3] - 4,
      infoitems[5][3] - 4
    }
  end
  local fontcolortxt = {
    255,
    255,
    255
  }
  local fontcolortxtb = {
    255,
    255,
    255
  }
  local fonttypo = "Impact"
  if Cfg.HUD_HudStyle == 0 then
    fontsizes = {
      infoitems[1][3],
      infoitems[2][3],
      infoitems[3][3],
      infoitems[4][3],
      infoitems[5][3]
    }
    fontcolortxt = {
      230,
      161,
      97
    }
    fontcolortxtb = {
      230,
      161,
      97
    }
    fonttypo = "timesbd"
  end
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
  if Player and Cfg.PositioningSystem == 4 then
    if INP.Key(Keys.Home) == 2 then
      spressthiskey = true
      if Game.currentTime > Hud.movespeedstarttime and Hud.movespeedstart then
        Hud.keypressmode = 2
      end
    end
    if INP.Key(Keys.Home) == 3 then
      Cfg:Save()
      spressthiskey = false
    end
  end
  if self._showFPS or Game.GMode ~= GModes.SingleGame then
    if Cfg.HUD_Show_FPS == false then
      Cfg.ShowFPS = false
    else
      Cfg.ShowFPS = true
    end
    if Cfg.ShowFPS or Cfg.HUD_Show_FPS then
      local posx = Cfg.HUD_FPS_Setting[1]
      local posy = Cfg.HUD_FPS_Setting[2]
      local fontsize = Cfg.HUD_FPS_Setting[3]
      local checkposx = posx * w / 1024
      j = j + 1
      checkitem[1] = true
      if Player then
        if 0 < checkposx then
          HUD.SetFont(fonttypo, fontsizes[1])
          HUD.PrintXY(w / 2 - HUD.GetTextWidth(fps) + (posx * w / 1024 + 1), posy * h / 768 + 1, fps, fonttypo, 15, 15, 15, fontsizes[1])
          HUD.PrintXY(w / 2 - HUD.GetTextWidth(fps) + posx * w / 1024, posy * h / 768, fps, fonttypo, fontcolortxt[1], fontcolortxt[2], fontcolortxt[3], fontsizes[1])
          if spressthiskey == true and Cfg.HUD_Infos_Items == 1 then
            HUD.DrawQuadRGBA(nil, w / 2 - HUD.GetTextWidth(fps) + posx * w / 1024, posy * h / 768 + HUD.GetTextHeight() / 2 - 3 * h / 768, HUD.GetTextWidth(fps), 3 * h / 768, 0, 255, 0, 255)
            HUD.DrawQuadRGBA(nil, w / 2 - (HUD.GetTextWidth(fps) - HUD.GetTextWidth(fps) / 2) + posx * w / 1024, (posy - 1.5) * h / 768, 3 * w / 1024, HUD.GetTextHeight(fps), 0, 255, 0, 255)
          end
        else
          HUD.SetFont(fonttypo, fontsizes[1])
          HUD.PrintXY(w / 2 - HUD.GetTextWidth("000 FPS") + (posx * w / 1024 + 1), posy * h / 768 + 1, fps, fonttypo, 15, 15, 15, fontsizes[1])
          HUD.PrintXY(w / 2 - HUD.GetTextWidth("000 FPS") + posx * w / 1024, posy * h / 768, fps, fonttypo, fontcolortxt[1], fontcolortxt[2], fontcolortxt[3], fontsizes[1])
          if spressthiskey == true and Cfg.HUD_Infos_Items == 1 then
            HUD.DrawQuadRGBA(nil, w / 2 - HUD.GetTextWidth("000 FPS") + posx * w / 1024, posy * h / 768 + HUD.GetTextHeight(fps) / 2 - 3 * h / 768, HUD.GetTextWidth(fps), 3 * h / 768, 0, 255, 0, 255)
            HUD.DrawQuadRGBA(nil, w / 2 - (HUD.GetTextWidth("000 FPS") - HUD.GetTextWidth(fps) / 2) + posx * w / 1024, (posy - 1.5) * h / 768, 3 * w / 1024, HUD.GetTextHeight(fps), 0, 255, 0, 255)
          end
        end
      else
        HUD.SetFont(fonttypo, fontsizes[1])
        HUD.PrintXY(w / 2 - HUD.GetTextWidth(fps) + (508 * w / 1024 + 1), 5 * h / 768 + 1, fps, fonttypo, 15, 15, 15, fontsizes[1])
        HUD.PrintXY(w / 2 - HUD.GetTextWidth(fps) + 508 * w / 1024, 4 * h / 768, fps, fonttypo, fontcolortxt[1], fontcolortxt[2], fontcolortxt[3], fontsizes[1])
      end
      if infoitems[1][1] < 508 or 4 < infoitems[1][2] then
        heightpos = heightpos
      else
        heightpos = HUD.GetTextHeight()
      end
      specrealpos = HUD.GetTextHeight()
      if posx * w / 1024 <= -(w - w / 2) + HUD.GetTextWidth("000 FPS") then
        infoitems[1][1] = tonumber(string.format("%d", -(w - w / 2) + HUD.GetTextWidth("000 FPS")))
        infoitems[1][1] = tonumber(string.format("%d", (infoitems[1][1] + 2) / w * 1024))
      end
      if infoitems[1][2] >= 770 - HUD.GetTextHeight() then
        infoitems[1][2] = tonumber(string.format("%d", 770 - HUD.GetTextHeight()))
      end
      grosfps = HUD.GetTextWidth("000 FPS") / 2
    end
    if Cfg.HUD_Show_PacketLoss then
      local posx = Cfg.HUD_PL_Setting[1]
      local posy = Cfg.HUD_PL_Setting[2]
      local fontsize = Cfg.HUD_PL_Setting[3]
      local checkposx = posx * w / 1024
      j = j + 1
      checkitem[2] = true
      if infoitems[2][1] < 508 or 4 < infoitems[2][2] then
        realpos = 0
        showpospl = 0
      else
        realpos = heightpos
        showpospl = heightpos
      end
      if Player then
        if 0 < checkposx then
          HUD.SetFont(fonttypo, fontsizes[2])
          HUD.PrintXY(w / 2 - HUD.GetTextWidth(ploss) + (posx * w / 1024 + 1), realpos + (posy * h / 768 + 1), ploss, fonttypo, 15, 15, 15, fontsizes[2])
          HUD.PrintXY(w / 2 - HUD.GetTextWidth(ploss) + posx * w / 1024, realpos + posy * h / 768, ploss, fonttypo, fontcolortxt[1], fontcolortxt[2], fontcolortxt[3], fontsizes[2])
          if spressthiskey == true and Cfg.HUD_Infos_Items == 2 then
            HUD.DrawQuadRGBA(nil, w / 2 - HUD.GetTextWidth(ploss) + posx * w / 1024, posy * h / 768 + showpospl + HUD.GetTextHeight() / 2 - 3 * h / 768, HUD.GetTextWidth(ploss), 3 * h / 768, 0, 255, 0, 255)
            HUD.DrawQuadRGBA(nil, w / 2 - (HUD.GetTextWidth(ploss) - HUD.GetTextWidth(ploss) / 2) + posx * w / 1024, (posy - 1.5) * h / 768 + showpospl, 3 * w / 1024, HUD.GetTextHeight(), 0, 255, 0, 255)
          end
        else
          HUD.SetFont(fonttypo, fontsizes[2])
          HUD.PrintXY(w / 2 - HUD.GetTextWidth("0 PL") + (posx * w / 1024 + 1), realpos + (posy * h / 768 + 1), ploss, fonttypo, 15, 15, 15, fontsizes[2])
          HUD.PrintXY(w / 2 - HUD.GetTextWidth("0 PL") + posx * w / 1024, realpos + posy * h / 768, ploss, fonttypo, fontcolortxt[1], fontcolortxt[2], fontcolortxt[3], fontsizes[2])
          if spressthiskey == true and Cfg.HUD_Infos_Items == 2 then
            HUD.DrawQuadRGBA(nil, w / 2 - HUD.GetTextWidth("0 PL") + posx * w / 1024, posy * h / 768 + showpospl + HUD.GetTextHeight() / 2 - 3 * h / 768, HUD.GetTextWidth(ploss), 3 * h / 768, 0, 255, 0, 255)
            HUD.DrawQuadRGBA(nil, w / 2 - (HUD.GetTextWidth("0 PL") - HUD.GetTextWidth(ploss) / 2) + posx * w / 1024, (posy - 1.5) * h / 768 + showpospl, 3 * w / 1024, HUD.GetTextHeight(), 0, 255, 0, 255)
          end
        end
      else
        HUD.SetFont(fonttypo, fontsizes[1])
        HUD.PrintXY(w / 2 - HUD.GetTextWidth(ploss) + (508 * w / 1024 + 1), specrealpos + 5 * h / 768 + 1, ploss, fonttypo, 15, 15, 15, fontsizes[2])
        HUD.PrintXY(w / 2 - HUD.GetTextWidth(ploss) + 508 * w / 1024, specrealpos + 4 * h / 768, ploss, fonttypo, fontcolortxt[1], fontcolortxt[2], fontcolortxt[3], fontsizes[2])
      end
      if infoitems[2][1] < 508 or 4 < infoitems[2][2] then
        heightpos = heightpos
      else
        heightpos = heightpos + HUD.GetTextHeight()
      end
      specrealpos = specrealpos + HUD.GetTextHeight()
      if posx * w / 1024 <= -(w - w / 2) + HUD.GetTextWidth("0 PL") then
        infoitems[2][1] = tonumber(string.format("%d", -(w - w / 2) + HUD.GetTextWidth("0 PL")))
        infoitems[2][1] = tonumber(string.format("%d", (infoitems[2][1] + 2) / w * 1024))
      end
      if infoitems[2][2] >= 770 - HUD.GetTextHeight() then
        infoitems[2][2] = tonumber(string.format("%d", 770 - HUD.GetTextHeight()))
      end
      grospl = HUD.GetTextWidth("0 PL") / 2
    else
      heightpos = heightpos
      specrealpos = specrealpos
    end
  end
  if Game.GMode ~= GModes.SingleGame then
    if Cfg.HUD_Show_Ping then
      local posx = Cfg.HUD_Ping_Setting[1]
      local posy = Cfg.HUD_Ping_Setting[2]
      local fontsize = Cfg.HUD_Ping_Setting[3]
      local checkposx = posx * w / 1024
      j = j + 1
      checkitem[3] = true
      if infoitems[3][1] < 508 or 4 < infoitems[3][2] then
        realpos = 0
        showposping = 0
      else
        realpos = heightpos
        showposping = heightpos
      end
      local pingcolor = fontcolortxt
      local vping = NET.GetClientPing(NET.GetClientID())
      if Cfg.HUD_Ping_Colored then
        if 20 < vping and vping <= 60 then
          pingcolor = {
            0,
            255,
            0
          }
        elseif 60 < vping and vping <= 100 then
          pingcolor = {
            255,
            255,
            0
          }
        elseif 100 < vping then
          pingcolor = {
            255,
            0,
            0
          }
        end
      end
      if Player then
        if 0 < checkposx then
          HUD.SetFont(fonttypo, fontsizes[3])
          HUD.PrintXY(w / 2 - HUD.GetTextWidth(ping) + (posx * w / 1024 + 1), realpos + (posy * h / 768 + 1), ping, fonttypo, 15, 15, 15, fontsizes[3])
          HUD.PrintXY(w / 2 - HUD.GetTextWidth(ping) + posx * w / 1024, realpos + posy * h / 768, ping, fonttypo, pingcolor[1], pingcolor[2], pingcolor[3], fontsizes[3])
          if spressthiskey == true and Cfg.HUD_Infos_Items == 3 then
            HUD.DrawQuadRGBA(nil, w / 2 - HUD.GetTextWidth(ping) + posx * w / 1024, posy * h / 768 + showposping + HUD.GetTextHeight() / 2 - 3 * h / 768, HUD.GetTextWidth(ping), 3 * h / 768, 0, 255, 0, 255)
            HUD.DrawQuadRGBA(nil, w / 2 - (HUD.GetTextWidth(ping) - HUD.GetTextWidth(ping) / 2) + posx * w / 1024, (posy - 1.5) * h / 768 + showposping, 3 * w / 1024, HUD.GetTextHeight(), 0, 255, 0, 255)
          end
        else
          HUD.SetFont(fonttypo, fontsizes[3])
          HUD.PrintXY(w / 2 - HUD.GetTextWidth("00 ms") + (posx * w / 1024 + 1), realpos + (posy * h / 768 + 1), ping, fonttypo, 15, 15, 15, fontsizes[3])
          HUD.PrintXY(w / 2 - HUD.GetTextWidth("00 ms") + posx * w / 1024, realpos + posy * h / 768, ping, fonttypo, pingcolor[1], pingcolor[2], pingcolor[3], fontsizes[3])
          if spressthiskey == true and Cfg.HUD_Infos_Items == 3 then
            HUD.DrawQuadRGBA(nil, w / 2 - HUD.GetTextWidth("00 ms") + posx * w / 1024, posy * h / 768 + showposping + HUD.GetTextHeight() / 2 - 3 * h / 768, HUD.GetTextWidth(ping), 3 * h / 768, 0, 255, 0, 255)
            HUD.DrawQuadRGBA(nil, w / 2 - (HUD.GetTextWidth("00 ms") - HUD.GetTextWidth(ping) / 2) + posx * w / 1024, (posy - 1.5) * h / 768 + showposping, 3 * w / 1024, HUD.GetTextHeight(), 0, 255, 0, 255)
          end
        end
      else
        HUD.SetFont(fonttypo, fontsizes[1])
        HUD.PrintXY(w / 2 - HUD.GetTextWidth(ping) + (508 * w / 1024 + 1), specrealpos + 5 * h / 768 + 1, ping, fonttypo, 15, 15, 15, fontsizes[3])
        HUD.PrintXY(w / 2 - HUD.GetTextWidth(ping) + 508 * w / 1024, specrealpos + 4 * h / 768, ping, fonttypo, pingcolor[1], pingcolor[2], pingcolor[3], fontsizes[3])
      end
      if infoitems[3][1] < 508 or 4 < infoitems[3][2] then
        heightpos = heightpos
      else
        heightpos = heightpos + HUD.GetTextHeight()
      end
      specrealpos = specrealpos + HUD.GetTextHeight()
      if posx * w / 1024 <= -(w - w / 2) + HUD.GetTextWidth("00 ms") then
        infoitems[3][1] = tonumber(string.format("%d", -(w - w / 2) + HUD.GetTextWidth("00 ms")))
        infoitems[3][1] = tonumber(string.format("%d", (infoitems[3][1] + 2) / w * 1024))
      end
      if infoitems[3][2] >= 770 - HUD.GetTextHeight() then
        infoitems[3][2] = tonumber(string.format("%d", 770 - HUD.GetTextHeight()))
      end
      grospig = HUD.GetTextWidth("00 ms") / 2
    else
      heightpos = heightpos
      specrealpos = specrealpos
    end
  end
  if Cfg.HUD_Show_Speedmeter == 1 or Cfg.HUD_Show_Speedmeter == 2 or Cfg.HUD_Show_Speedmeter == 3 then
    j = j + 1
    checkitem[4] = true
    if Player and Player._Entity then
      Hud:DrawSpeedmeter(Player._Entity)
    elseif not Player and getplayerentity then
      Hud:DrawSpeedmeter(getplayerentity)
    end
  end
  if Game and Game.GMode ~= GModes.SingleGame and (self._showtimer or Cfg.ShowTimer) and Game._TimeLimitOut then
    local tm = (MPCfg.TimeLimit * 60 - Game._TimeLimitOut) / 60
    if Cfg.ShowTimerCountUp == true then
      tm = Game._TimeLimitOut / 60
    end
    if 0 > Game._TimeLimitOut then
      tm = 0
    end
    local m = math.floor(tm)
    local s = math.floor((tm - m) * 60)
    local red = false
    local posw = infoitems[5][1] * w / 1024
    local posh = (768 - infoitems[5][2]) * h / 768
    if m <= 0 and Cfg.ShowTimerCountUp == false then
      red = true
    elseif m >= MPCfg.TimeLimit - 1 and Cfg.ShowTimerCountUp then
      red = true
    end
    if Cfg.ShowTimer ~= false then
      if Player then
        checkitem[5] = true
        j = j + 1
        posilelt = -506 + fontsizes[5]
        posiright = 506 - fontsizes[5]
        posidown = fontsizes[5]
        if Cfg.HUD_Timer_Setting[3] > 43 then
          posilelt = -501 + fontsizes[5]
          posiright = 501 - fontsizes[5]
          posidown = fontsizes[5]
        end
        if infoitems[5][1] <= posilelt then
          infoitems[5][1] = tonumber(string.format("%01d", posilelt))
        elseif infoitems[5][1] >= posiright then
          infoitems[5][1] = tonumber(string.format("%01d", posiright))
        end
        if infoitems[5][2] >= 768 then
          infoitems[5][2] = tonumber(string.format("%01d", 768))
        elseif infoitems[5][2] <= fontsizes[5] then
          infoitems[5][2] = tonumber(string.format("%01d", fontsizes[5]))
        end
        local time = string.format(string.format("%02d", m) .. ":" .. string.format("%02d", s))
        HUD.SetFont(fonttypo, fontsizes[5])
        if (self._showtimer or Cfg.ShowTimer) and Game.GMode ~= GModes.SingleGame then
          HUD.PrintXY((w - HUD.GetTextWidth(time)) / 2 + posw + 1, posh + 1, time, fonttypo, 15, 15, 15, fontsizes[5])
          if red then
            HUD.PrintXY((w - HUD.GetTextWidth(time)) / 2 + posw, posh, time, fonttypo, 230, 0, 0, fontsizes[5])
          else
            HUD.PrintXY((w - HUD.GetTextWidth(time)) / 2 + posw, posh, time, fonttypo, fontcolortxt[1], fontcolortxt[2], fontcolortxt[3], fontsizes[5])
          end
        end
        if spressthiskey == true and Cfg.HUD_Infos_Items == 5 then
          HUD.DrawQuadRGBA(nil, (w - HUD.GetTextWidth(time)) / 2 + posw, posh + (fontsizes[5] - fontsizes[5] / 3) * h / 768 / 2, HUD.GetTextWidth(time), 3 * h / 768, 0, 255, 0, 255)
          HUD.DrawQuadRGBA(nil, (w - HUD.GetTextWidth(time)) / 2 + posw + (HUD.GetTextWidth(time) / 2 - 2), posh, 3 * w / 1024, HUD.GetTextHeight(time) - fontsizes[5] / 4.5 * h / 768, 0, 255, 0, 255)
        end
      else
        posw = 0
        posh = 50 * h / 768
        local time = string.format(string.format("%02d", m) .. ":" .. string.format("%02d", s))
        HUD.SetFont(fonttypo, fontsizes[5])
        if (self._showtimer or Cfg.ShowTimer) and Game.GMode ~= GModes.SingleGame then
          HUD.PrintXY((w - HUD.GetTextWidth(time)) / 2 + posw + 1, posh + 1, time, fonttypo, 15, 15, 15, fontsizes[5])
          if red then
            HUD.PrintXY((w - HUD.GetTextWidth(time)) / 2 + posw, posh, time, fonttypo, 230, 0, 0, fontsizes[5])
          else
            HUD.PrintXY((w - HUD.GetTextWidth(time)) / 2 + posw, posh, time, fonttypo, fontcolortxt[1], fontcolortxt[2], fontcolortxt[3], fontsizes[5])
          end
        end
      end
    end
  end
  if Cfg.HUD_FragMessage_Status then
    local posx = Cfg.HUD_FragMessage_Status_Setting[1]
    local posy = Cfg.HUD_FragMessage_Status_Setting[2]
    local itsize = Cfg.HUD_FragMessage_Status_Setting[3]
    local checkposx = posx * w / 1024
    j = j + 1
    checkitem[6] = true
    local attacktype = {
      [1] = Hud._matAmmoListShellIconSH,
      [2] = Hud._matAmmoListRocketIconSH,
      [3] = Hud._matAmmoListRocketIconSH,
      [5] = Hud._matAmmoListMiniIconSH,
      [10] = Hud._matAmmoListKolkiIconSH,
      [11] = Hud._matAmmoCloseIconSH,
      [19] = Hud._matAmmoListSzurikenIconSH,
      [23] = Hud._matAmmoListElectroIconSH,
      [24] = Hud._matAmmoOpenIconSH,
      [31] = Hud._matAmmoListrifleIconSH,
      [34] = Hud._matAmmoListBoltyIconSH,
      [35] = Hud._matAmmoListKulkiIconSH
    }
    local color = {
      [1] = Color:New(255, 102, 0),
      [2] = Color:New(255, 0, 0),
      [3] = Color:New(255, 0, 0),
      [5] = Color:New(255, 255, 0),
      [10] = Color:New(0, 255, 0),
      [11] = Color:New(255, 255, 255),
      [19] = Color:New(204, 0, 255),
      [23] = Color:New(255, 255, 153),
      [24] = Color:New(0, 204, 255),
      [31] = Color:New(153, 153, 153),
      [34] = Color:New(0, 255, 204),
      [35] = Color:New(255, 0, 153)
    }
    local sizex, sizey = MATERIAL.Size(Hud._matAmmoCloseIconSH)
    local dname = Hud.DeadPlayerName
    local kname = Hud.KillerPlayerName
    local at = Hud.AttackType
    local itemsposh = Hud.FMessageStatusPos
    if spressthiskey == true then
      dname = {
        "Player",
        "Player",
        "Player",
        "Player"
      }
      kname = {
        "Player",
        "Player",
        "Player",
        "Player"
      }
      at = {
        1,
        1,
        1,
        1
      }
      itemsposh = {
        0,
        42,
        82,
        122
      }
    end
    local fsize = infoitems[6][3]
    local varsize = string.format("%.01f", fsize / (22 / 0.6))
    HUD.SetFont("Impact", fsize)
    if 0 < checkposx then
      if Game.currentTime * 2 == Hud.AttackTypeEnd[1] then
        Hud.AttackTypeEnd[1] = 0
      end
      if Game.currentTime * 2 < Hud.AttackTypeEnd[1] or spressthiskey then
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth(kname[1]) - HUD.GetTextWidth(dname[1]) - sizex * varsize * w / 1024 + 1, (posy + itemsposh[1]) * h / 768 + 1, HUD.StripColorInfo(kname[1]), "Impact", 15, 15, 15, fsize)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth(kname[1]) - HUD.GetTextWidth(dname[1]) - sizex * varsize * w / 1024, (posy + itemsposh[1]) * h / 768, kname[1], "Impact", 255, 255, 255, fsize)
        Hud:QuadRGBA(attacktype[at[1]], w / 2 + posx * w / 1024 - sizex * varsize * w / 1024 - HUD.GetTextWidth(dname[1]), (posy - 2 + itemsposh[1]) * h / 768, varsize, false, color[at[1]].R, color[at[1]].G, color[at[1]].B, 255)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth(dname[1]) + 1, (posy + itemsposh[1]) * h / 768 + 1, HUD.StripColorInfo(dname[1]), "Impact", 15, 15, 15, fsize)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth(dname[1]), (posy + itemsposh[1]) * h / 768, dname[1], "Impact", 255, 255, 255, fsize)
      end
      if Game.currentTime * 2 == Hud.AttackTypeEnd[2] then
        Hud.AttackTypeEnd[2] = 0
      end
      if Game.currentTime * 2 < Hud.AttackTypeEnd[2] or spressthiskey then
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth(kname[2]) - HUD.GetTextWidth(dname[2]) - sizex * varsize * w / 1024 + 1, (posy + itemsposh[2] * varsize) * h / 768 + 1, HUD.StripColorInfo(kname[2]), "Impact", 15, 15, 15, fsize)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth(kname[2]) - HUD.GetTextWidth(dname[2]) - sizex * varsize * w / 1024, (posy + itemsposh[2] * varsize) * h / 768, kname[2], "Impact", 255, 255, 255, fsize)
        Hud:QuadRGBA(attacktype[at[2]], w / 2 + posx * w / 1024 - sizex * varsize * w / 1024 - HUD.GetTextWidth(dname[2]), (posy - 2 + itemsposh[2] * varsize) * h / 768, varsize, false, color[at[2]].R, color[at[2]].G, color[at[2]].B, 255)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth(dname[2]) + 1, (posy + itemsposh[2] * varsize) * h / 768 + 1, HUD.StripColorInfo(dname[2]), "Impact", 15, 15, 15, fsize)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth(dname[2]), (posy + itemsposh[2] * varsize) * h / 768, dname[2], "Impact", 255, 255, 255, fsize)
      end
      if Game.currentTime * 2 == Hud.AttackTypeEnd[3] then
        Hud.AttackTypeEnd[3] = 0
      end
      if Game.currentTime * 2 < Hud.AttackTypeEnd[3] or spressthiskey then
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth(kname[3]) - HUD.GetTextWidth(dname[3]) - sizex * varsize * w / 1024 + 1, (posy + itemsposh[3] * varsize) * h / 768 + 1, HUD.StripColorInfo(kname[3]), "Impact", 15, 15, 15, fsize)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth(kname[3]) - HUD.GetTextWidth(dname[3]) - sizex * varsize * w / 1024, (posy + itemsposh[3] * varsize) * h / 768, kname[3], "Impact", 255, 255, 255, fsize)
        Hud:QuadRGBA(attacktype[at[3]], w / 2 + posx * w / 1024 - sizex * varsize * w / 1024 - HUD.GetTextWidth(dname[3]), (posy - 2 + itemsposh[3] * varsize) * h / 768, varsize, false, color[at[3]].R, color[at[3]].G, color[at[3]].B, 255)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth(dname[3]) + 1, (posy + itemsposh[3] * varsize) * h / 768 + 1, HUD.StripColorInfo(dname[3]), "Impact", 15, 15, 15, fsize)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth(dname[3]), (posy + itemsposh[3] * varsize) * h / 768, dname[3], "Impact", 255, 255, 255, fsize)
      end
      if Game.currentTime * 2 == Hud.AttackTypeEnd[4] then
        Hud.AttackTypeEnd[4] = 0
      end
      if Game.currentTime * 2 < Hud.AttackTypeEnd[4] or spressthiskey then
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth(kname[4]) - HUD.GetTextWidth(dname[4]) - sizex * varsize * w / 1024 + 1, (posy + itemsposh[4] * varsize) * h / 768 + 1, HUD.StripColorInfo(kname[4]), "Impact", 15, 15, 15, fsize)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth(kname[4]) - HUD.GetTextWidth(dname[4]) - sizex * varsize * w / 1024, (posy + itemsposh[4] * varsize) * h / 768, kname[4], "Impact", 255, 255, 255, fsize)
        Hud:QuadRGBA(attacktype[at[4]], w / 2 + posx * w / 1024 - sizex * varsize * w / 1024 - HUD.GetTextWidth(dname[4]), (posy - 2 + itemsposh[4] * varsize) * h / 768, varsize, false, color[at[4]].R, color[at[4]].G, color[at[4]].B, 255)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth(dname[4]) + 1, (posy + itemsposh[4] * varsize) * h / 768 + 1, HUD.StripColorInfo(dname[4]), "Impact", 15, 15, 15, fsize)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth(dname[4]), (posy + itemsposh[4] * varsize) * h / 768, dname[4], "Impact", 255, 255, 255, fsize)
      end
      if spressthiskey == true and Cfg.HUD_Infos_Items == 6 then
        HUD.DrawQuadRGBA(nil, w / 2 + posx * w / 1024 - HUD.GetTextWidth(kname[1]) - HUD.GetTextWidth(dname[1]) - sizex * varsize * w / 1024, posy * h / 768 + HUD.GetTextHeight() / 2 - 3, HUD.GetTextWidth(kname[1]) + HUD.GetTextWidth(dname[1]) + sizex * varsize * w / 1024, 3 * h / 768, 0, 255, 0, 255)
        HUD.DrawQuadRGBA(nil, w / 2 + posx * w / 1024 - HUD.GetTextWidth(kname[1]) - sizex * varsize * w / 1024 / 2 - 1.5, posy * h / 768, 3 * w / 1024, HUD.GetTextHeight(), 0, 255, 0, 255)
      end
    else
      if Game.currentTime * 2 == Hud.AttackTypeEnd[1] then
        Hud.AttackTypeEnd[1] = 0
      end
      if Game.currentTime * 2 < Hud.AttackTypeEnd[1] or spressthiskey then
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 - sizex * varsize * w / 1024 + 1, (posy + itemsposh[1]) * h / 768 + 1, HUD.StripColorInfo(kname[1]), "Impact", 15, 15, 15, fsize)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 - sizex * varsize * w / 1024, (posy + itemsposh[1]) * h / 768, kname[1], "Impact", 255, 255, 255, fsize)
        Hud:QuadRGBA(attacktype[at[1]], w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 - sizex * varsize * w / 1024 + HUD.GetTextWidth(kname[1]), (posy - 2 + itemsposh[1]) * h / 768, varsize, false, color[at[1]].R, color[at[1]].G, color[at[1]].B, 255)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 + HUD.GetTextWidth(kname[1]) + 1, (posy + itemsposh[1]) * h / 768 + 1, HUD.StripColorInfo(dname[1]), "Impact", 15, 15, 15, fsize)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 + HUD.GetTextWidth(kname[1]), (posy + itemsposh[1]) * h / 768, dname[1], "Impact", 255, 255, 255, fsize)
      end
      if Game.currentTime * 2 == Hud.AttackTypeEnd[2] then
        Hud.AttackTypeEnd[2] = 0
      end
      if Game.currentTime * 2 < Hud.AttackTypeEnd[2] or spressthiskey then
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 - sizex * varsize * w / 1024 + 1, (posy + itemsposh[2] * varsize) * h / 768 + 1, HUD.StripColorInfo(kname[2]), "Impact", 15, 15, 15, fsize)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 - sizex * varsize * w / 1024, (posy + itemsposh[2] * varsize) * h / 768, kname[2], "Impact", 255, 255, 255, fsize)
        Hud:QuadRGBA(attacktype[at[2]], w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 - sizex * varsize * w / 1024 + HUD.GetTextWidth(kname[2]), (posy - 2 + itemsposh[2] * varsize) * h / 768, varsize, false, color[at[2]].R, color[at[2]].G, color[at[2]].B, 255)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 + HUD.GetTextWidth(kname[2]) + 1, (posy + itemsposh[2] * varsize) * h / 768 + 1, HUD.StripColorInfo(dname[2]), "Impact", 15, 15, 15, fsize)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 + HUD.GetTextWidth(kname[2]), (posy + itemsposh[2] * varsize) * h / 768, dname[2], "Impact", 255, 255, 255, fsize)
      end
      if Game.currentTime * 2 == Hud.AttackTypeEnd[3] then
        Hud.AttackTypeEnd[3] = 0
      end
      if Game.currentTime * 2 < Hud.AttackTypeEnd[3] or spressthiskey then
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 - sizex * varsize * w / 1024 + 1, (posy + itemsposh[3] * varsize) * h / 768 + 1, HUD.StripColorInfo(kname[3]), "Impact", 15, 15, 15, fsize)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 - sizex * varsize * w / 1024, (posy + itemsposh[3] * varsize) * h / 768, kname[3], "Impact", 255, 255, 255, fsize)
        Hud:QuadRGBA(attacktype[at[3]], w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 - sizex * varsize * w / 1024 + HUD.GetTextWidth(kname[3]), (posy - 2 + itemsposh[3] * varsize) * h / 768, varsize, false, color[at[3]].R, color[at[3]].G, color[at[3]].B, 255)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 + HUD.GetTextWidth(kname[3]) + 1, (posy + itemsposh[3] * varsize) * h / 768 + 1, HUD.StripColorInfo(dname[3]), "Impact", 15, 15, 15, fsize)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 + HUD.GetTextWidth(kname[3]), (posy + itemsposh[3] * varsize) * h / 768, dname[3], "Impact", 255, 255, 255, fsize)
      end
      if Game.currentTime * 2 == Hud.AttackTypeEnd[4] then
        Hud.AttackTypeEnd[4] = 0
      end
      if Game.currentTime * 2 < Hud.AttackTypeEnd[4] or spressthiskey then
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 - sizex * varsize * w / 1024 + 1, (posy + itemsposh[4] * varsize) * h / 768 + 1, HUD.StripColorInfo(kname[4]), "Impact", 15, 15, 15, fsize)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 - sizex * varsize * w / 1024, (posy + itemsposh[4] * varsize) * h / 768, kname[4], "Impact", 255, 255, 255, fsize)
        Hud:QuadRGBA(attacktype[at[4]], w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 - sizex * varsize * w / 1024 + HUD.GetTextWidth(kname[4]), (posy - 2 + itemsposh[4] * varsize) * h / 768, varsize, false, color[at[4]].R, color[at[4]].G, color[at[4]].B, 255)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 + HUD.GetTextWidth(kname[4]) + 1, (posy + itemsposh[4] * varsize) * h / 768 + 1, HUD.StripColorInfo(dname[4]), "Impact", 15, 15, 15, fsize)
        HUD.PrintXY(w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 + HUD.GetTextWidth(kname[4]), (posy + itemsposh[4] * varsize) * h / 768, dname[4], "Impact", 255, 255, 255, fsize)
      end
      if spressthiskey == true and Cfg.HUD_Infos_Items == 6 then
        HUD.DrawQuadRGBA(nil, w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") * 2 - sizex * varsize * w / 1024, posy * h / 768 + HUD.GetTextHeight() / 2 - 3, HUD.GetTextWidth(kname[1]) + HUD.GetTextWidth(dname[1]) + sizex * varsize * w / 1024, 3 * h / 768, 0, 255, 0, 255)
        HUD.DrawQuadRGBA(nil, w / 2 + posx * w / 1024 - HUD.GetTextWidth("Player") - sizex * varsize * w / 1024 / 2 - 1.5, posy * h / 768, 3 * w / 1024, HUD.GetTextHeight(), 0, 255, 0, 255)
      end
    end
    if infoitems[6][2] >= 661 + HUD.GetTextHeight() then
      infoitems[6][2] = tonumber(string.format("%01d", 661 + HUD.GetTextHeight()))
    elseif 4 >= infoitems[6][2] then
      infoitems[6][2] = tonumber(string.format("%01d", 4))
    end
    if posx * w / 1024 <= -(w - w / 2 - HUD.GetTextWidth("Player") * 2 - sizex * varsize * w / 1024) then
      infoitems[6][1] = -(w - w / 2 - HUD.GetTextWidth("Player") * 2 - sizex * varsize * w / 1024)
      infoitems[6][1] = tonumber(string.format("%d", (infoitems[6][1] + 2) / w * 1024))
    end
    if infoitems[6][1] >= 511 then
      infoitems[6][1] = tonumber(string.format("%01d", 511))
    end
  end
  if Player and Cfg.PositioningSystem == 4 then
    local nosavecheck = false
    if spressthiskey == true then
      if 0 < j then
        local nu = 1
        if INP.Key(Keys.Num7) == 1 then
          nu = 1
          Cfg.HUD_Infos_Items = Cfg.HUD_Infos_Items - nu
        end
        if INP.Key(Keys.Num1) == 1 then
          nu = 0 - 1
          Cfg.HUD_Infos_Items = Cfg.HUD_Infos_Items - nu
        end
        for c = 1, 6 do
          if not checkitem[Cfg.HUD_Infos_Items] then
            Cfg.HUD_Infos_Items = Cfg.HUD_Infos_Items - nu
            if Cfg.HUD_Infos_Items > 6 then
              Cfg.HUD_Infos_Items = 1
            end
            if 1 > Cfg.HUD_Infos_Items then
              Cfg.HUD_Infos_Items = 6
            end
          end
        end
      end
      local v = Cfg.HUD_Infos_Items
      if checkitem[v] == true then
        if 5 > Cfg.HUD_Infos_Items then
          if INP.Key(Keys.Num4) == Hud.keypressmode then
            if Hud.keypressmode == 1 then
              Hud.movespeedstarttime = Game.currentTime + Hud.latency
              Hud.movespeedstart = true
            end
            infoitems[v][1] = tonumber(string.format("%01d", infoitems[v][1] - 1))
          elseif INP.Key(Keys.Num6) == Hud.keypressmode then
            if Hud.keypressmode == 1 then
              Hud.movespeedstarttime = Game.currentTime + Hud.latency
              Hud.movespeedstart = true
            end
            infoitems[v][1] = tonumber(string.format("%01d", infoitems[v][1] + 1))
          elseif INP.Key(Keys.Num8) == Hud.keypressmode then
            if Hud.keypressmode == 1 then
              Hud.movespeedstarttime = Game.currentTime + Hud.latency
              Hud.movespeedstart = true
            end
            infoitems[v][2] = tonumber(string.format("%01d", infoitems[v][2] - 1))
          elseif INP.Key(Keys.Num2) == Hud.keypressmode then
            if Hud.keypressmode == 1 then
              Hud.movespeedstarttime = Game.currentTime + Hud.latency
              Hud.movespeedstart = true
            end
            infoitems[v][2] = tonumber(string.format("%01d", infoitems[v][2] + 1))
          elseif INP.Key(Keys.Num9) == Hud.keypressmode then
            if Hud.keypressmode == 1 then
              Hud.movespeedstarttime = Game.currentTime + Hud.latency
              Hud.movespeedstart = true
            end
            infoitems[v][3] = tonumber(string.format("%02d", infoitems[v][3] + 1))
            if 40 <= infoitems[v][3] then
              infoitems[v][3] = tonumber(string.format("%02d", 40))
            end
          elseif INP.Key(Keys.Num3) == Hud.keypressmode then
            if Hud.keypressmode == 1 then
              Hud.movespeedstarttime = Game.currentTime + Hud.latency
              Hud.movespeedstart = true
            end
            infoitems[v][3] = tonumber(string.format("%02d", infoitems[v][3] - 1))
            if infoitems[v][3] <= 20 then
              infoitems[v][3] = tonumber(string.format("%02d", 20))
            end
          end
          if infoitems[v][1] >= 510 then
            infoitems[v][1] = tonumber(string.format("%d", 510))
          end
          if 4 >= infoitems[v][2] then
            infoitems[v][2] = tonumber(string.format("%d", 4))
          end
          if INP.Key(Keys.Num8) == 3 or INP.Key(Keys.Num6) == 3 or INP.Key(Keys.Num4) == 3 or INP.Key(Keys.Num2) == 3 or INP.Key(Keys.Num9) == 3 or INP.Key(Keys.Num3) == 3 then
            Hud.movespeedstarttime = 0
            Hud.movespeedstart = false
            Hud.keypressmode = 1
          end
          if INP.Key(Keys.Num0) == 1 then
            infoitems[v][1] = tonumber(string.format("%d", 508))
            infoitems[v][2] = tonumber(string.format("%d", 4))
            infoitems[v][3] = tonumber(string.format("%d", 26))
          end
          if INP.Key(Keys.NumDivide) == 1 then
            if infoitems[v][1] ~= 4 or infoitems[v][2] ~= 4 or infoitems[v][3] ~= 26 then
              PlaySound2DOnKey_in = true
              infoitemssav[v][1] = infoitems[v][1]
              infoitemssav[v][2] = infoitems[v][2]
              infoitemssav[v][3] = infoitems[v][3]
              CONSOLE.AddMessage(settingsave, R3D.RGB(0, 255, 0))
            else
              PlaySound2DOnKey_in = false
              CONSOLE.AddMessage(settingnosave, R3D.RGB(0, 255, 0))
            end
          end
          if INP.Key(Keys.NumMultiply) == 1 then
            if infoitemssav[v][1] == 0 and infoitemssav[v][2] == 0 and infoitemssav[v][3] == 0 then
              PlaySound2DOnKey_in = false
              CONSOLE.AddMessage(settingnoloaded, R3D.RGB(0, 255, 0))
            else
              PlaySound2DOnKey_in = true
              infoitems[v][1] = infoitemssav[v][1]
              infoitems[v][2] = infoitemssav[v][2]
              infoitems[v][3] = infoitemssav[v][3]
              CONSOLE.AddMessage(settingloaded, R3D.RGB(0, 255, 0))
            end
          end
          local showpos = {
            0,
            showpospl,
            showposping,
            showpossmeter
          }
          local infos = {
            fps,
            ploss,
            ping,
            ups
          }
          local fixposw = grosfps
          if Cfg.HUD_Infos_Items == 2 then
            fixposw = grospl
          elseif Cfg.HUD_Infos_Items == 3 then
            fixposw = grospig
          elseif Cfg.HUD_Infos_Items == 4 then
            fixposw = grosspe
          end
          HUD.SetFont("courbd", 20)
          HUD.PrintXY((w - HUD.GetTextWidth(itemsname[v] .. " Font Size: " .. infoitems[v][3])) / 2, h / 2.6, itemsname[v] .. " Font Size: " .. infoitems[v][3], "courbd", 0, 255, 0, 20)
          HUD.PrintXY((w - HUD.GetTextWidth(string.format("Vertical Position: %.01f px", infoitems[v][2] * h / 768 + showpos[v]))) / 2, h / 2.6 + HUD.GetTextHeight(), string.format("Vertical Position: %.01f px", infoitems[v][2] * h / 768 + showpos[v]), "courbd", 0, 255, 0, 20)
          HUD.PrintXY((w - HUD.GetTextWidth(string.format("Horinzontal Position: %.01f px", (infoitems[v][1] - fixposw) * w / 1024))) / 2, h / 2.6 + HUD.GetTextHeight() * 2, string.format("Horinzontal Position: %.01f px", (infoitems[v][1] - fixposw) * w / 1024), "courbd", 0, 255, 0, 20)
        elseif Cfg.HUD_Infos_Items == 5 then
          if INP.Key(Keys.Num4) == Hud.keypressmode then
            if Hud.keypressmode == 1 then
              Hud.movespeedstarttime = Game.currentTime + Hud.latency
              Hud.movespeedstart = true
            end
            infoitems[v][1] = tonumber(string.format("%01d", infoitems[v][1] - 1))
          elseif INP.Key(Keys.Num6) == Hud.keypressmode then
            if Hud.keypressmode == 1 then
              Hud.movespeedstarttime = Game.currentTime + Hud.latency
              Hud.movespeedstart = true
            end
            infoitems[v][1] = tonumber(string.format("%01d", infoitems[v][1] + 1))
          elseif INP.Key(Keys.Num8) == Hud.keypressmode then
            if Hud.keypressmode == 1 then
              Hud.movespeedstarttime = Game.currentTime + Hud.latency
              Hud.movespeedstart = true
            end
            infoitems[v][2] = tonumber(string.format("%01d", infoitems[v][2] + 1))
          elseif INP.Key(Keys.Num2) == Hud.keypressmode then
            if Hud.keypressmode == 1 then
              Hud.movespeedstarttime = Game.currentTime + Hud.latency
              Hud.movespeedstart = true
            end
            infoitems[v][2] = tonumber(string.format("%01d", infoitems[v][2] - 1))
          elseif INP.Key(Keys.Num9) == Hud.keypressmode then
            if Hud.keypressmode == 1 then
              Hud.movespeedstarttime = Game.currentTime + Hud.latency
              Hud.movespeedstart = true
            end
            infoitems[v][3] = tonumber(string.format("%01d", infoitems[v][3] + 1))
            if infoitems[v][3] >= 60 then
              infoitems[v][3] = 60
            end
          elseif INP.Key(Keys.Num3) == Hud.keypressmode then
            if Hud.keypressmode == 1 then
              Hud.movespeedstarttime = Game.currentTime + Hud.latency
              Hud.movespeedstart = true
            end
            infoitems[v][3] = tonumber(string.format("%01d", infoitems[v][3] - 1))
            if infoitems[v][3] <= 26 then
              infoitems[v][3] = 26
            end
          end
          if INP.Key(Keys.Num8) == 3 or INP.Key(Keys.Num6) == 3 or INP.Key(Keys.Num4) == 3 or INP.Key(Keys.Num2) == 3 or INP.Key(Keys.Num9) == 3 or INP.Key(Keys.Num3) == 3 then
            Hud.movespeedstarttime = 0
            Hud.movespeedstart = false
            Hud.keypressmode = 1
          end
          if INP.Key(Keys.Num0) == 1 then
            infoitems[v][1] = tonumber(string.format(0))
            infoitems[v][2] = tonumber(string.format(718))
            infoitems[v][3] = 40
          end
          if INP.Key(Keys.NumDivide) == 1 then
            if Cfg.HUD_Timer_Setting[1] == 0 and Cfg.HUD_Timer_Setting[2] == 718 then
              CONSOLE.AddMessage(settingnosave, R3D.RGB(0, 255, 0))
              PlaySound2DOnKey_in = false
            else
              PlaySound2DOnKey_in = true
              infoitemssav[v][1] = infoitems[v][1]
              infoitemssav[v][2] = infoitems[v][2]
              infoitemssav[v][3] = infoitems[v][3]
              CONSOLE.AddMessage(settingsave, R3D.RGB(0, 255, 0))
            end
          end
          if INP.Key(Keys.NumMultiply) == 1 then
            if Cfg.HUD_Timer_Setting_Save[1] == 0 and Cfg.HUD_Timer_Setting_Save[2] == 0 then
              CONSOLE.AddMessage(settingnoloaded, R3D.RGB(0, 255, 0))
              PlaySound2DOnKey_in = false
            else
              PlaySound2DOnKey_in = true
              infoitems[v][1] = infoitemssav[v][1]
              infoitems[v][2] = infoitemssav[v][2]
              infoitems[v][3] = infoitemssav[v][3]
              CONSOLE.AddMessage(settingloaded, R3D.RGB(0, 255, 0))
            end
          end
          if infoitems[v][1] == 0 then
            npositon = "Timer Center - Font: " .. infoitems[v][3]
          elseif 0 > infoitems[v][1] then
            npositon = "Timer Left- Font: " .. infoitems[v][3]
          elseif 0 < infoitems[v][1] then
            npositon = "Timer Right- Font: " .. infoitems[v][3]
          end
          HUD.SetFont("courbd", 20)
          HUD.PrintXY((w - HUD.GetTextWidth(npositon)) / 2, h / 2.6, npositon, "courbd", 0, 255, 0, 20)
          HUD.PrintXY((w - HUD.GetTextWidth(string.format("Vertical Position: %.01f px", infoitems[v][2]))) / 2, h / 2.6 + HUD.GetTextHeight(), string.format("Vertical Position: %01d px", infoitems[v][2]), "courbd", 0, 255, 0, 20)
          HUD.PrintXY((w - HUD.GetTextWidth(string.format("Horinzontal Position: %.01f px", infoitems[v][1]))) / 2, h / 2.6 + HUD.GetTextHeight() * 2, string.format("Horinzontal Position: %01d px", infoitems[v][1]), "courbd", 0, 255, 0, 20)
        elseif Cfg.HUD_Infos_Items == 6 then
          if INP.Key(Keys.Num4) == Hud.keypressmode then
            if Hud.keypressmode == 1 then
              Hud.movespeedstarttime = Game.currentTime + Hud.latency
              Hud.movespeedstart = true
            end
            infoitems[v][1] = tonumber(string.format("%01d", infoitems[v][1] - 1))
          elseif INP.Key(Keys.Num6) == Hud.keypressmode then
            if Hud.keypressmode == 1 then
              Hud.movespeedstarttime = Game.currentTime + Hud.latency
              Hud.movespeedstart = true
            end
            infoitems[v][1] = tonumber(string.format("%01d", infoitems[v][1] + 1))
          elseif INP.Key(Keys.Num8) == Hud.keypressmode then
            if Hud.keypressmode == 1 then
              Hud.movespeedstarttime = Game.currentTime + Hud.latency
              Hud.movespeedstart = true
            end
            infoitems[v][2] = tonumber(string.format("%01d", infoitems[v][2] - 1))
          elseif INP.Key(Keys.Num2) == Hud.keypressmode then
            if Hud.keypressmode == 1 then
              Hud.movespeedstarttime = Game.currentTime + Hud.latency
              Hud.movespeedstart = true
            end
            infoitems[v][2] = tonumber(string.format("%01d", infoitems[v][2] + 1))
          elseif INP.Key(Keys.Num9) == Hud.keypressmode then
            if Hud.keypressmode == 1 then
              Hud.movespeedstarttime = Game.currentTime + Hud.latency
              Hud.movespeedstart = true
            end
            infoitems[v][3] = tonumber(string.format("%d", infoitems[v][3] + 1))
            if infoitems[v][3] >= 24 then
              infoitems[v][3] = 24
            end
          elseif INP.Key(Keys.Num3) == Hud.keypressmode then
            if Hud.keypressmode == 1 then
              Hud.movespeedstarttime = Game.currentTime + Hud.latency
              Hud.movespeedstart = true
            end
            infoitems[v][3] = tonumber(string.format("%d", infoitems[v][3] - 1))
            if infoitems[v][3] <= 18 then
              infoitems[v][3] = 18
            end
          end
          if INP.Key(Keys.Num8) == 3 or INP.Key(Keys.Num6) == 3 or INP.Key(Keys.Num4) == 3 or INP.Key(Keys.Num2) == 3 or INP.Key(Keys.Num9) == 3 or INP.Key(Keys.Num3) == 3 then
            Hud.movespeedstarttime = 0
            Hud.movespeedstart = false
            Hud.keypressmode = 1
          end
          if INP.Key(Keys.Num0) == 1 then
            infoitems[v][1] = tonumber(string.format(400))
            infoitems[v][2] = tonumber(string.format(4))
            infoitems[v][3] = 22
          end
          if INP.Key(Keys.NumDivide) == 1 then
            if Cfg.HUD_FragMessage_Status_Setting[1] == 400 and Cfg.HUD_FragMessage_Status_Setting[2] == 4 then
              CONSOLE.AddMessage(settingnosave, R3D.RGB(0, 255, 0))
              PlaySound2DOnKey_in = false
            else
              PlaySound2DOnKey_in = true
              infoitemssav[v][1] = infoitems[v][1]
              infoitemssav[v][2] = infoitems[v][2]
              infoitemssav[v][3] = infoitems[v][3]
              CONSOLE.AddMessage(settingsave, R3D.RGB(0, 255, 0))
            end
          end
          if INP.Key(Keys.NumMultiply) == 1 then
            if Cfg.HUD_Timer_Setting_Save[1] == 0 and Cfg.HUD_Timer_Setting_Save[2] == 0 then
              CONSOLE.AddMessage(settingnoloaded, R3D.RGB(0, 255, 0))
              PlaySound2DOnKey_in = false
            else
              PlaySound2DOnKey_in = true
              infoitems[v][1] = infoitemssav[v][1]
              infoitems[v][2] = infoitemssav[v][2]
              infoitems[v][3] = infoitemssav[v][3]
              CONSOLE.AddMessage(settingloaded, R3D.RGB(0, 255, 0))
            end
          end
          local varsize = string.format("%.01f", infoitems[v][3] / (22 / 0.6))
          local sizex, sizey = MATERIAL.Size(Hud._matAmmoCloseIconSH)
          local poshfix = 0
          HUD.SetFont("courbd", 20)
          HUD.PrintXY((w - HUD.GetTextWidth(itemsname[v] .. " font size: " .. infoitems[v][3])) / 2, h / 2.6, itemsname[v] .. " font size: " .. infoitems[v][3], "courbd", 0, 255, 0, 20)
          HUD.PrintXY((w - HUD.GetTextWidth(string.format("Vertical Position: %.01f px", infoitems[v][2]))) / 2, h / 2.6 + HUD.GetTextHeight(), string.format("Vertical Position: %01d px", infoitems[v][2]), "courbd", 0, 255, 0, 20)
          HUD.PrintXY((w - HUD.GetTextWidth(string.format("Horinzontal Position: %.01f px", infoitems[v][1] - poshfix))) / 2, h / 2.6 + HUD.GetTextHeight() * 2, string.format("Horinzontal Position: %01d px", infoitems[v][1] - poshfix), "courbd", 0, 255, 0, 20)
        end
      end
    end
  end
  if Game and MPCfg.GameState == GameStates.Counting and Game._countTimer and Game._countTimer > 0.99 then
    local countdown = "Match begins in: " .. string.format("%02d", Game._countTimer)
    HUD.SetFont(fonttypo, 26)
    HUD.PrintXY((w - HUD.GetTextWidth(countdown)) / 2 + 1, 601 * h / 768, countdown, fonttypo, 15, 15, 15, 26)
    HUD.PrintXY((w - HUD.GetTextWidth(countdown)) / 2, 601 * h / 768, countdown, fonttypo, fontcolortxtb[1], fontcolortxtb[2], fontcolortxtb[3], 26)
  end
end

function Hud:CurrentWeaponIcon()
  local w, h = R3D.ScreenSize()
  local CurrentWeaponIcons = {
    self._matPainKillerIcon,
    self._matShotgunIcon,
    self._matStakeIcon,
    self._matMiniGunIcon,
    self._matElectroIcon,
    self._matRifleIcon,
    self._matBoltIcon
  }
  local curw = {
    {
      self._matAmmoOpenIconSH,
      self._matAmmoListShellIconSH,
      self._matAmmoListKolkiIconSH,
      self._matAmmoListRocketIconSH,
      self._matAmmoListSzurikenIconSH,
      self._matAmmoListrifleIconSH,
      self._matAmmoListBoltyIconSH
    },
    {
      self._matAmmoCloseIconSH,
      self._matAmmoListFreezerIconSH,
      self._matAmmoListRocketIconSH,
      self._matAmmoListMiniIconSH,
      self._matAmmoListElectroIconSH,
      self._matAmmoListikonaIconSH,
      self._matAmmoListKulkiIconSH
    }
  }
  local n = Player._CurWeaponIndex
  local s = 0
  local color = {
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
  if not INP.IsFireSwitched() then
    if not (not Game.SwitchFire[n] and Cfg.SwitchFire[n]) or not Cfg.SwitchFire[n] and Game.SwitchFire[n] then
      s = 1
      color = {
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
    else
      s = 2
      color = {
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
    end
    if INP.Action(Actions.AltFire) then
      if not (not Game.SwitchFire[n] and Cfg.SwitchFire[n]) or not Cfg.SwitchFire[n] and Game.SwitchFire[n] then
        s = 2
        color = {
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
      else
        s = 1
        color = {
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
      end
    end
  else
    if not (not Game.SwitchFire[n] and Cfg.SwitchFire[n]) or not Cfg.SwitchFire[n] and Game.SwitchFire[n] then
      s = 2
      color = {
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
    else
      s = 1
      color = {
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
    end
    if INP.Action(Actions.Fire) then
      if not (not Game.SwitchFire[n] and Cfg.SwitchFire[n]) or not Cfg.SwitchFire[n] and Game.SwitchFire[n] then
        s = 1
        color = {
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
      else
        s = 2
        color = {
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
      end
    end
  end
  local ji = Player:GetCurWeaponSlotIndex()
  if Cfg.HUD_HudStyle == 0 then
    if type(ji) == "number" and ji <= 7 and 1 <= ji and Player._CurWeaponIndex == ji then
      Hud:QuadTrans(CurrentWeaponIcons[ji], 490.5 * w / 1024, 700 * h / 768, 1, false, 255)
    end
  elseif Cfg.HUD_HudStyle == 3 and type(ji) == "number" and ji <= 7 and 1 <= ji and Player._CurWeaponIndex == ji then
    Hud:QuadRGBA(curw[s][ji], 492 * w / 1024, 695 * h / 768, 1, false, color[ji][1], color[ji][2], color[ji][3], 255)
  end
end

function Hud:DrawPlayerVsPlayer(check)
  if MPCfg.GameState == GameStates.WarmUp or MPCfg.GameState == GameStates.Counting then
    local w, h = R3D.ScreenSize()
    local pl1 = ""
    local pl2 = ""
    if Cfg.HUD_HudStyle == 0 then
      vsfontsizes = 36
      vsfontcolortxt = {
        230,
        161,
        97
      }
      vsfonttypo = "timesbd"
    else
      vsfontsizes = 32
      vsfontcolortxt = {
        255,
        255,
        255
      }
      vsfonttypo = "Impact"
    end
    for i, o in Game.PlayerStats, nil do
      if o.Spectator == 0 then
        if pl1 == "" then
          pl1 = o.Name
        else
          pl2 = o.Name
        end
      end
    end
    local cb = {
      0,
      102,
      255
    }
    local cr = {
      255,
      0,
      0
    }
    if Cfg.BrightSkins and Cfg.HUD_Brightskins_Style then
      cb = {
        Game._ColorTeamB[1],
        Game._ColorTeamB[2],
        Game._ColorTeamB[3]
      }
      cr = {
        Game._ColorTeamR[1],
        Game._ColorTeamR[2],
        Game._ColorTeamR[3]
      }
    end
    if check == "no" then
      if pl1 ~= "" and pl2 ~= "" then
        HUD.SetFont(vsfonttypo, vsfontsizes)
        HUD.PrintXY((w - HUD.GetTextWidth("" .. HUD.StripColorInfo(pl1) .. "  -VS-  " .. HUD.StripColorInfo(pl2) .. "")) / 2 + 2, 200 * h / 768 + 2, "" .. HUD.StripColorInfo(pl1) .. "  -VS-  " .. HUD.StripColorInfo(pl2) .. "", vsfonttypo, 15, 15, 15, vsfontsizes)
        HUD.PrintXY((w - HUD.GetTextWidth("" .. pl1 .. "  -VS-  " .. pl2 .. "")) / 2, 200 * h / 768, "" .. pl1 .. "  -VS-  " .. pl2 .. "", vsfonttypo, vsfontcolortxt[1], vsfontcolortxt[2], vsfontcolortxt[3], vsfontsizes)
      end
    elseif check == "yes" then
      HUD.SetFont(vsfonttypo, vsfontsizes)
      local tbluew = (w - HUD.GetTextWidth("Angels")) / 2 - HUD.GetTextWidth("Angels") / 1.1
      local tredw = (w - HUD.GetTextWidth("Demons")) / 2 + HUD.GetTextWidth("Demons") / 1.2
      if Cfg.Team == 0 then
        HUD.PrintXY(tbluew + 2, 200 * h / 768 + 2, "Angels", vsfonttypo, 15, 15, 15, vsfontsizes)
        HUD.PrintXY(tbluew, 200 * h / 768, "Angels", vsfonttypo, cb[1], cb[2], cb[3], vsfontsizes)
        HUD.PrintXY((w - HUD.GetTextWidth(" -VS- ")) / 2 + 2, 200 * h / 768 + 2, " -VS- ", vsfonttypo, 15, 15, 15, vsfontsizes)
        HUD.PrintXY((w - HUD.GetTextWidth(" -VS- ")) / 2, 200 * h / 768, " -VS- ", vsfonttypo, vsfontcolortxt[1], vsfontcolortxt[2], vsfontcolortxt[3], vsfontsizes)
        HUD.PrintXY(tredw + 2, 200 * h / 768 + 2, "Demons", vsfonttypo, 15, 15, 15, vsfontsizes)
        HUD.PrintXY(tredw, 200 * h / 768, "Demons", vsfonttypo, cr[1], cr[2], cr[3], vsfontsizes)
      elseif not Cfg.FixedColors and NET.IsSpectator(NET.GetClientID()) == false then
        tbluew = (w - HUD.GetTextWidth("Demons")) / 2 - HUD.GetTextWidth("Demons") / 1.2
        tredw = (w - HUD.GetTextWidth("Angels")) / 2 + HUD.GetTextWidth("Angels") / 1.1
        HUD.PrintXY(tbluew + 2, 200 * h / 768 + 2, "Demons", vsfonttypo, 15, 15, 15, vsfontsizes)
        HUD.PrintXY(tbluew, 200 * h / 768, "Demons", vsfonttypo, cb[1], cb[2], cb[3], vsfontsizes)
        HUD.PrintXY((w - HUD.GetTextWidth(" -VS- ")) / 2 + 2, 200 * h / 768 + 2, " -VS- ", vsfonttypo, 15, 15, 15, vsfontsizes)
        HUD.PrintXY((w - HUD.GetTextWidth(" -VS- ")) / 2, 200 * h / 768, " -VS- ", vsfonttypo, vsfontcolortxt[1], vsfontcolortxt[2], vsfontcolortxt[3], vsfontsizes)
        HUD.PrintXY(tredw + 2, 200 * h / 768 + 2, "Angels", vsfonttypo, 15, 15, 15, vsfontsizes)
        HUD.PrintXY(tredw, 200 * h / 768, "Angels", vsfonttypo, cr[1], cr[2], cr[3], vsfontsizes)
      else
        tbluew = (w - HUD.GetTextWidth("Demons")) / 2 - HUD.GetTextWidth("Demons") / 1.2
        tredw = (w - HUD.GetTextWidth("Angels")) / 2 + HUD.GetTextWidth("Angels") / 1.1
        HUD.PrintXY(tbluew + 2, 200 * h / 768 + 2, "Demons", vsfonttypo, 15, 15, 15, vsfontsizes)
        HUD.PrintXY(tbluew, 200 * h / 768, "Demons", vsfonttypo, cr[1], cr[2], cr[3], vsfontsizes)
        HUD.PrintXY((w - HUD.GetTextWidth(" -VS- ")) / 2 + 2, 200 * h / 768 + 2, " -VS- ", vsfonttypo, 15, 15, 15, vsfontsizes)
        HUD.PrintXY((w - HUD.GetTextWidth(" -VS- ")) / 2, 200 * h / 768, " -VS- ", vsfonttypo, vsfontcolortxt[1], vsfontcolortxt[2], vsfontcolortxt[3], vsfontsizes)
        HUD.PrintXY(tredw + 2, 200 * h / 768 + 2, "Angels", vsfonttypo, 15, 15, 15, vsfontsizes)
        HUD.PrintXY(tredw, 200 * h / 768, "Angels", vsfonttypo, cb[1], cb[2], cb[3], vsfontsizes)
      end
    end
  end
end

function Hud:FragMessage(fname)
  local w, h = R3D.ScreenSize()
  if Cfg.HUD_HudStyle == 0 then
    fafontsizes = Cfg.HUD_FragMessageFontSize + 4
    fafontcolortxt = {
      230,
      161,
      97
    }
    fafonttypo = "timesbd"
  else
    fafontsizes = Cfg.HUD_FragMessageFontSize
    fafontcolortxt = {
      255,
      255,
      255
    }
    fafonttypo = "Impact"
  end
  HUD.SetFont(fafonttypo, fafontsizes)
  HUD.PrintXY((w - HUD.GetTextWidth("You killed: " .. HUD.StripColorInfo(fname) .. "!")) / 2 + 1, 450 * h / 768 + 1, "You killed: " .. HUD.StripColorInfo(fname) .. "!", fafonttypo, 15, 15, 15, fafontsizes)
  HUD.PrintXY((w - HUD.GetTextWidth("You killed: " .. fname .. "!")) / 2, 450 * h / 768, "You killed: " .. fname .. "!", fafonttypo, fafontcolortxt[1], fafontcolortxt[2], fafontcolortxt[3], fafontsizes)
end

function Hud:CurrentWeaponBG()
  local w, h = R3D.ScreenSize()
  local wep1 = {w = 0.07, d = 0.049}
  local wep2 = {w = 0.07, d = 0.049}
  local wep3 = {w = 0.045, d = 0.049}
  local wep4 = {w = 0.045, d = 0.049}
  if Player._CurWeaponIndex == 1 then
  elseif Player._CurWeaponIndex == 2 then
    HUD.DrawQuadRGBA(Hud._matBluePix, AmmoList_Text_Pos1_X, AmmoList_Pos1_Y, w * wep1.w, h * wep1.d)
    HUD.DrawQuadRGBA(Hud._matBluePix, AmmoList_Text_Pos2_X, AmmoList_Pos2_Y, w * wep2.w, h * wep2.d)
  elseif Player._CurWeaponIndex == 3 then
    HUD.DrawQuadRGBA(Hud._matBluePix, AmmoList_Text_Pos3_X, AmmoList_Pos3_Y, w * wep1.w, h * wep1.d)
  elseif Player._CurWeaponIndex == 4 then
    HUD.DrawQuadRGBA(Hud._matBluePix, AmmoList_Text_Pos4_X, AmmoList_Pos4_Y, w * wep1.w, h * wep1.d)
    HUD.DrawQuadRGBA(Hud._matBluePix, AmmoList_Text_Pos5_X, AmmoList_Pos5_Y, w * wep2.w, h * wep2.d)
  elseif Player._CurWeaponIndex == 5 then
    HUD.DrawQuadRGBA(Hud._matBluePix, AmmoList_Text_Pos6_X, AmmoList_Pos6_Y, w * wep1.w, h * wep1.d)
    HUD.DrawQuadRGBA(Hud._matBluePix, AmmoList_Text_Pos7_X, AmmoList_Pos7_Y, w * wep2.w, h * wep2.d)
  end
end

function Hud_OnConsoleTab(cmd)
  Hud:OnConsoleTab(cmd)
end

function Hud:TeamWins()
  local bluecount = 0
  local redcount = 0
  local teamwins = "Demons team wins"
  local co = {
    255,
    0,
    0
  }
  if Cfg.BrightSkins and Cfg.HUD_Brightskins_Style then
    co = {
      Game._ColorTeamR[1],
      Game._ColorTeamR[2],
      Game._ColorTeamR[3]
    }
  end
  if not Cfg.FixedColors and NET.IsSpectator(NET.GetClientID()) == false and Cfg.Team == 1 then
    co = {
      0,
      102,
      255
    }
    if Cfg.BrightSkins and Cfg.HUD_Brightskins_Style then
      co = {
        Game._ColorTeamB[1],
        Game._ColorTeamB[2],
        Game._ColorTeamB[3]
      }
    end
  end
  local w, h = R3D.ScreenSize()
  for i, ps in Game.PlayerStats, nil do
    if ps.Team == 0 and ps.Spectator == 0 then
      bluecount = bluecount + 1
    end
    if ps.Team == 1 and ps.Spectator == 0 then
      redcount = redcount + 1
    end
  end
  if redcount == 0 then
    co = {
      0,
      102,
      255
    }
    if Cfg.BrightSkins and Cfg.HUD_Brightskins_Style then
      co = {
        Game._ColorTeamB[1],
        Game._ColorTeamB[2],
        Game._ColorTeamB[3]
      }
    end
    if not Cfg.FixedColors and NET.IsSpectator(NET.GetClientID()) == false and Cfg.Team == 1 then
      co = {
        255,
        0,
        0
      }
      if Cfg.BrightSkins and Cfg.HUD_Brightskins_Style then
        co = {
          Game._ColorTeamR[1],
          Game._ColorTeamR[2],
          Game._ColorTeamR[3]
        }
      end
    end
    teamwins = "Angels team wins"
  end
  HUD.SetFont("impact", 50)
  local tw = HUD.GetTextWidth(teamwins)
  HUD.PrintXY(w / 2 - tw / 2 + 3, h - 600 * h / 768 + 3, teamwins, "impact", 15, 15, 15, 50)
  HUD.PrintXY(w / 2 - tw / 2, h - 600 * h / 768, teamwins, "impact", co[1], co[2], co[3], 50)
end
