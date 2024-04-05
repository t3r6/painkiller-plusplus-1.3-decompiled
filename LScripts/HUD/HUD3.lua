function Hud:DrawMOTD()
  if not Hud or MPCfg.MOTD == nil then
    return
  end
  local w, h = R3D.ScreenSize()
  local font = "Impact"
  local fontfactor = h / 600
  local linespacing = 1.2
  local mediumfont = 24
  local line = mediumfont * fontfactor * linespacing
  local txt = ""
  local rest = MPCfg.MOTD
  local linelevel = h * 0.6
  local pattern = "([^%;]+);([%p%s%w%d]+)"
  local fade = 1
  local timeinout = 3
  if timeinout > Hud._MOTDTime - INP.GetTime() then
    fade = (Hud._MOTDTime - INP.GetTime()) / timeinout
  end
  if timeinout > INP.GetTime() - (Hud._MOTDTime - 10) then
    fade = (INP.GetTime() - (Hud._MOTDTime - 10)) / timeinout
  end
  local poo = math.floor(80 * fade)
  local pie = math.floor(255 * fade)
  txt = string.gsub(rest, pattern, "%1")
  if txt ~= nil then
    HUD.PrintXY(w * 0.2, linelevel, txt, font, poo, pie, poo, mediumfont)
  end
  rest = string.gsub(rest, pattern, "%2")
  linelevel = linelevel + line
  txt = string.gsub(rest, pattern, "%1")
  if txt ~= nil then
    HUD.PrintXY(w * 0.2, linelevel, txt, font, poo, pie, poo, mediumfont)
  end
  rest = string.gsub(rest, pattern, "%2")
  linelevel = linelevel + line
  txt = string.gsub(rest, pattern, "%1")
  if txt ~= nil then
    HUD.PrintXY(w * 0.2, linelevel, txt, font, poo, pie, poo, mediumfont)
  end
  rest = string.gsub(rest, pattern, "%2")
  linelevel = linelevel + line
  txt = string.gsub(rest, pattern, "%1")
  if txt ~= nil then
    HUD.PrintXY(w * 0.2, linelevel, txt, font, poo, pie, poo, mediumfont)
  end
  rest = string.gsub(rest, pattern, "%2")
  linelevel = linelevel + line
  txt = string.gsub(rest, pattern, "%1")
  if txt ~= nil then
    HUD.PrintXY(w * 0.2, linelevel, txt, font, poo, pie, poo, mediumfont)
  end
  rest = string.gsub(rest, pattern, "%2")
  linelevel = linelevel + line
  txt = string.gsub(rest, pattern, "%1")
  if txt ~= nil then
    HUD.PrintXY(w * 0.2, linelevel, txt, font, poo, pie, poo, mediumfont)
  end
  rest = string.gsub(rest, pattern, "%2")
  linelevel = linelevel + line
  txt = string.gsub(rest, pattern, "%1")
  if txt ~= nil then
    HUD.PrintXY(w * 0.2, linelevel, txt, font, poo, pie, poo, mediumfont)
  end
  rest = string.gsub(rest, pattern, "%2")
  linelevel = linelevel + line
  txt = string.gsub(rest, pattern, "%1")
  if txt ~= nil then
    HUD.PrintXY(w * 0.2, linelevel, txt, font, poo, pie, poo, mediumfont)
  end
  rest = string.gsub(rest, pattern, "%2")
  linelevel = linelevel + line
  txt = string.gsub(rest, pattern, "%1")
  if txt ~= nil then
    HUD.PrintXY(w * 0.2, linelevel, txt, font, poo, pie, poo, mediumfont)
  end
  rest = string.gsub(rest, pattern, "%2")
  linelevel = linelevel + line
  txt = string.gsub(rest, pattern, "%1")
  if txt ~= nil then
    HUD.PrintXY(w * 0.2, linelevel, txt, font, poo, pie, poo, mediumfont)
  end
  rest = string.gsub(rest, pattern, "%2")
  linelevel = linelevel + line
  txt = string.gsub(rest, pattern, "%1")
  if txt ~= nil then
    HUD.PrintXY(w * 0.2, linelevel, txt, font, poo, pie, poo, mediumfont)
  end
  rest = string.gsub(rest, pattern, "%2")
  linelevel = linelevel + line
end

function Hud:DrawScores(clientid)
  local gteam1Score = Game._team1Score
  local gteam2Score = Game._team2Score
  local w, h = R3D.ScreenSize()
  local sizex, sizey = MATERIAL.Size(Hud._matHUDLeft)
  local colord = {
    Cfg.HUD_Scores_Count_RGB[1],
    Cfg.HUD_Scores_Count_RGB[2],
    Cfg.HUD_Scores_Count_RGB[3]
  }
  local currentplayerscore = Game.PlayerStats[clientid].Score
  local playerteam = Game.PlayerStats[clientid].Team
  local scplayer1 = 0
  local scplayer2 = 0
  local scorelist = {}
  local spressthiskey = false
  bestenemyscore = 0
  for i, psc in Game.PlayerStats, nil do
    checkifenemy = psc.ClientID
    if psc.Spectator == 0 then
      if checkifenemy == clientid then
        scplayer1 = Game.PlayerStats[psc.ClientID].Score
      else
        scplayer2 = Game.PlayerStats[psc.ClientID].Score
        scorelist[i] = Game.PlayerStats[psc.ClientID].Score
      end
    end
  end
  for ig, ni in scorelist, nil do
    checksc = scorelist[ig]
    if checksc > bestenemyscore then
      bestenemyscore = scorelist[ig]
    end
  end
  if Cfg.HUD_HudStyle == 0 then
    matminus = Hud._matMinusDef
  else
    matminus = Hud._matMinus
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
  if Player then
    if playerteam == 1 and MPGameRules[MPCfg.GameMode].Teams then
      if not Cfg.FixedColors and NET.IsSpectator(NET.GetClientID()) == false then
        scoresposxy = {
          Cfg.HUD_Scores_A_Setting,
          Cfg.HUD_Scores_B_Setting
        }
        scoresposxysav = {
          Cfg.HUD_Scores_A_Setting_Save,
          Cfg.HUD_Scores_B_Setting_Save
        }
      else
        scoresposxy = {
          Cfg.HUD_Scores_B_Setting,
          Cfg.HUD_Scores_A_Setting
        }
        scoresposxysav = {
          Cfg.HUD_Scores_B_Setting_Save,
          Cfg.HUD_Scores_A_Setting_Save
        }
      end
    else
      scoresposxy = {
        Cfg.HUD_Scores_A_Setting,
        Cfg.HUD_Scores_B_Setting
      }
      scoresposxysav = {
        Cfg.HUD_Scores_A_Setting_Save,
        Cfg.HUD_Scores_B_Setting_Save
      }
    end
  elseif playerteam == 1 and MPGameRules[MPCfg.GameMode].Teams then
    if not Cfg.FixedColors and NET.IsSpectator(NET.GetClientID()) == false then
      scoresposxy = {
        {
          126,
          140,
          0.8
        },
        {
          62,
          140,
          0.8
        }
      }
    else
      scoresposxy = {
        {
          62,
          140,
          0.8
        },
        {
          126,
          140,
          0.8
        }
      }
    end
  else
    scoresposxy = {
      {
        126,
        140,
        0.8
      },
      {
        62,
        140,
        0.8
      }
    }
  end
  local scsizehud = scoresposxy[1][3]
  if Player and Cfg.PositioningSystem == 1 then
    local it = Cfg.HUD_Scores_Frame
    if INP.Key(Keys.Home) == 2 then
      spressthiskey = true
      if Game.currentTime > Hud.movespeedstarttime and Hud.movespeedstart then
        Hud.keypressmode = 2
      end
      if INP.Key(Keys.Num4) == Hud.keypressmode then
        if Hud.keypressmode == 1 then
          Hud.movespeedstarttime = Game.currentTime + Hud.latency
          Hud.movespeedstart = true
        end
        scoresposxy[it][1] = tonumber(string.format("%01d", scoresposxy[it][1] + 1))
      elseif INP.Key(Keys.Num6) == Hud.keypressmode then
        if Hud.keypressmode == 1 then
          Hud.movespeedstarttime = Game.currentTime + Hud.latency
          Hud.movespeedstart = true
        end
        scoresposxy[it][1] = tonumber(string.format("%01d", scoresposxy[it][1] - 1))
      elseif INP.Key(Keys.Num8) == Hud.keypressmode then
        if Hud.keypressmode == 1 then
          Hud.movespeedstarttime = Game.currentTime + Hud.latency
          Hud.movespeedstart = true
        end
        scoresposxy[it][2] = tonumber(string.format("%01d", scoresposxy[it][2] + 1))
      elseif INP.Key(Keys.Num2) == Hud.keypressmode then
        if Hud.keypressmode == 1 then
          Hud.movespeedstarttime = Game.currentTime + Hud.latency
          Hud.movespeedstart = true
        end
        scoresposxy[it][2] = tonumber(string.format("%01d", scoresposxy[it][2] - 1))
      elseif INP.Key(Keys.Num9) == Hud.keypressmode then
        if Hud.keypressmode == 1 then
          Hud.movespeedstarttime = Game.currentTime + Hud.latency
          Hud.movespeedstart = true
        end
        scoresposxy[1][3] = tonumber(string.format("%.01f", scoresposxy[1][3] + 0.1))
        scoresposxy[2][3] = scoresposxy[1][3]
      elseif INP.Key(Keys.Num3) == Hud.keypressmode then
        if Hud.keypressmode == 1 then
          Hud.movespeedstarttime = Game.currentTime + Hud.latency
          Hud.movespeedstart = true
        end
        scoresposxy[1][3] = tonumber(string.format("%.01f", scoresposxy[1][3] - 0.1))
        scoresposxy[2][3] = scoresposxy[1][3]
      end
    end
    if INP.Key(Keys.Num8) == 3 or INP.Key(Keys.Num6) == 3 or INP.Key(Keys.Num4) == 3 or INP.Key(Keys.Num2) == 3 or INP.Key(Keys.Num9) == 3 or INP.Key(Keys.Num3) == 3 then
      Hud.movespeedstarttime = 0
      Hud.movespeedstart = false
      Hud.keypressmode = 1
    end
    if scoresposxy[1][1] >= 1024 - 80 * scsizehud / 2 then
      scoresposxy[1][1] = tonumber(string.format("%01d", 1024 - 80 * scsizehud / 2))
    elseif scoresposxy[1][1] <= 80 * scsizehud / 2 then
      scoresposxy[1][1] = tonumber(string.format("%01d", 80 * scsizehud / 2))
    end
    if scoresposxy[2][1] >= 1024 - 80 * scsizehud / 2 then
      scoresposxy[2][1] = tonumber(string.format("%01d", 1024 - 80 * scsizehud / 2))
    elseif scoresposxy[2][1] <= 80 * scsizehud / 2 then
      scoresposxy[2][1] = tonumber(string.format("%01d", 80 * scsizehud / 2))
    end
    if scoresposxy[1][2] >= 768 - 50 * scsizehud / 2 then
      scoresposxy[1][2] = tonumber(string.format("%01d", 768 - 50 * scsizehud / 2))
    elseif scoresposxy[1][2] <= 50 * scsizehud / 2 then
      scoresposxy[1][2] = tonumber(string.format("%01d", 50 * scsizehud / 2))
    end
    if scoresposxy[2][2] >= 768 - 50 * scsizehud / 2 then
      scoresposxy[2][2] = tonumber(string.format("%01d", 768 - 50 * scsizehud / 2))
    elseif scoresposxy[2][2] <= 50 * scsizehud / 2 then
      scoresposxy[2][2] = tonumber(string.format("%01d", 50 * scsizehud / 2))
    end
    if scoresposxy[1][3] >= tonumber(string.format("%.01f", 1.6)) then
      scoresposxy[1][3] = tonumber(string.format("%.01f", 1.6))
      scoresposxy[2][3] = scoresposxy[1][3]
    elseif scoresposxy[1][3] <= tonumber(string.format("%.01f", 0.5)) then
      scoresposxy[1][3] = tonumber(string.format("%.01f", 0.5))
      scoresposxy[2][3] = scoresposxy[1][3]
    end
    if INP.Key(Keys.Home) == 2 then
      if INP.Key(Keys.Num7) == 1 then
        if Cfg.HUD_Scores_Frame == 1 then
          Cfg.HUD_Scores_Frame = 2
        elseif Cfg.HUD_Scores_Frame == 2 then
          Cfg.HUD_Scores_Frame = 1
        end
      end
      if INP.Key(Keys.Num1) == 1 then
        if Cfg.HUD_Scores_Frame == 1 then
          Cfg.HUD_Scores_Frame = 2
        elseif Cfg.HUD_Scores_Frame == 2 then
          Cfg.HUD_Scores_Frame = 1
        end
      end
      if INP.Key(Keys.Num0) == 1 then
        scoresposxy[1][1] = 974
        scoresposxy[2][1] = 974
        scoresposxy[1][3] = 1
        scoresposxy[2][3] = 1
        if playerteam == 0 and MPGameRules[MPCfg.GameMode].Teams then
          scoresposxy[1][2] = 733
          scoresposxy[2][2] = 683
        elseif playerteam == 1 and MPGameRules[MPCfg.GameMode].Teams then
          scoresposxy[1][2] = 683
          scoresposxy[2][2] = 733
          if not Cfg.FixedColors and NET.IsSpectator(NET.GetClientID()) == false then
            scoresposxy[1][2] = 733
            scoresposxy[2][2] = 683
          end
        else
          scoresposxy[1][2] = 733
          scoresposxy[2][2] = 683
        end
      end
      if INP.Key(Keys.NumMultiply) == 1 then
        if scoresposxysav[1][1] == 0 and scoresposxysav[1][2] == 0 and scoresposxysav[2][1] == 0 and scoresposxysav[2][2] == 0 then
          CONSOLE.AddMessage(settingnoloaded, R3D.RGB(0, 255, 0))
          PlaySound2DOnKey_sc = false
        else
          PlaySound2DOnKey_sc = true
          CONSOLE.AddMessage(settingloaded, R3D.RGB(0, 255, 0))
          scoresposxy[1][3] = scoresposxysav[1][3]
          scoresposxy[2][3] = scoresposxysav[2][3]
          scoresposxy[1][1] = scoresposxysav[1][1]
          scoresposxy[1][2] = scoresposxysav[1][2]
          scoresposxy[2][1] = scoresposxysav[2][1]
          scoresposxy[2][2] = scoresposxysav[2][2]
        end
      end
      if INP.Key(Keys.NumDivide) == 1 then
        if (scoresposxy[1][1] == 50 and scoresposxy[2][1] == 50 or scoresposxy[1][1] == 974 and scoresposxy[2][1] == 974) and (scoresposxy[1][2] == 733 and scoresposxy[2][2] == 683 or scoresposxy[1][2] == 683 and scoresposxy[2][2] == 733) then
          CONSOLE.AddMessage(settingnosave, R3D.RGB(0, 255, 0))
          PlaySound2DOnKey_sc = false
        else
          PlaySound2DOnKey_sc = true
          CONSOLE.AddMessage(settingsave, R3D.RGB(0, 255, 0))
          scoresposxysav[1][1] = scoresposxy[1][1]
          scoresposxysav[2][1] = scoresposxy[2][1]
          scoresposxysav[1][2] = scoresposxy[1][2]
          scoresposxysav[2][2] = scoresposxy[2][2]
          scoresposxysav[1][3] = scoresposxy[1][3]
          scoresposxysav[2][3] = scoresposxy[2][3]
        end
      end
    end
    if INP.Key(Keys.Home) == 3 then
      spressthiskey = false
      Cfg:Save()
    end
  end
  if scoresposxy[1][1] == 50 and scoresposxy[2][1] == 50 and (scoresposxy[1][2] == 733 and scoresposxy[2][2] == 683 or scoresposxy[1][2] == 683 and scoresposxy[2][2] == 733) then
    scoresposxy[1][1] = 974
    scoresposxy[2][1] = 974
  end
  if gteam1Score < -9 or gteam2Score < -9 or scplayer1 < -9 or scplayer2 < -9 then
    scx = 1 * scsizehud
  else
    scx = -17 * scsizehud
  end
  scposxy1 = {
    scoresposxy[1][2],
    scoresposxy[1][2] - 7 * scsizehud,
    scoresposxy[1][1],
    scoresposxy[1][1] - 9 * scsizehud,
    scoresposxy[1][2] + 3
  }
  scposxy2 = {
    scoresposxy[2][2],
    scoresposxy[2][2] - 7 * scsizehud,
    scoresposxy[2][1],
    scoresposxy[2][1] - 9 * scsizehud,
    scoresposxy[2][2] + 3
  }
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
  local gamet1 = gteam1Score
  local gamet2 = gteam2Score
  if playerteam == 0 and MPGameRules[MPCfg.GameMode].Teams then
    markframe = scposxy1
    cmarframe = {
      cb[1],
      cb[2],
      cb[3]
    }
    if Cfg.HUD_Scores_Frame == 1 then
      alliedteam = "Allied"
    elseif Cfg.HUD_Scores_Frame == 2 then
      alliedteam = "Enemy"
    end
  elseif playerteam == 1 and MPGameRules[MPCfg.GameMode].Teams then
    markframe = scposxy2
    cmarframe = {
      cr[1],
      cr[2],
      cr[3]
    }
    if Cfg.HUD_Scores_Frame == 1 then
      alliedteam = "Enemy"
    elseif Cfg.HUD_Scores_Frame == 2 then
      alliedteam = "Allied"
    end
    if not Cfg.FixedColors and NET.IsSpectator(NET.GetClientID()) == false then
      gamet2 = gteam1Score
      gamet1 = gteam2Score
      markframe = scposxy1
      cmarframe = {
        cb[1],
        cb[2],
        cb[3]
      }
      if Cfg.HUD_Scores_Frame == 1 then
        alliedteam = "Allied"
      elseif Cfg.HUD_Scores_Frame == 2 then
        alliedteam = "Enemy"
      end
    end
  else
    markframe = scposxy1
    cmarframe = {
      cb[1],
      cb[2],
      cb[3]
    }
    if Cfg.HUD_Scores_Frame == 1 then
      alliedteam = "Your"
    elseif Cfg.HUD_Scores_Frame == 2 then
      alliedteam = "Enemy"
    end
  end
  HUD.DrawQuadRGBA(nil, (1024 - scposxy1[3] - 80 * scsizehud / 2) * w / 1024, (768 - scposxy1[1] - 50 * scsizehud / 2) * h / 768, 80 * scsizehud * w / 1024, 50 * scsizehud * h / 768, cb[1], cb[2], cb[3], 100)
  HUD.DrawQuadRGBA(nil, (1024 - scposxy2[3] - 80 * scsizehud / 2) * w / 1024, (768 - scposxy2[1] - 50 * scsizehud / 2) * h / 768, 80 * scsizehud * w / 1024, 50 * scsizehud * h / 768, cr[1], cr[2], cr[3], 100)
  if MPGameRules[MPCfg.GameMode].Teams then
    if gteam1Score < 0 then
      Hud:QuadTrans(matminus, (1024 - (scposxy1[3] + scx) - 80 * scsizehud / 2) * w / 1024, (768 - scposxy1[5] - 50 * scsizehud / 2) * h / 768, scsizehud * 1.4, false, 255)
    end
    if gteam2Score < 0 then
      Hud:QuadTrans(matminus, (1024 - (scposxy2[3] + scx) - 80 * scsizehud / 2) * w / 1024, (768 - scposxy2[5] - 50 * scsizehud / 2) * h / 768, scsizehud * 1.4, false, 255)
    end
    Hud:DrawDigitsText1((1024 - scposxy1[4] - 80 * scsizehud / 2) * w / 1024, (768 - scposxy1[2] - 50 * scsizehud / 2) * h / 768, string.format("%3d", gamet1), 0.9 * scsizehud, nil, colord[1], colord[2], colord[3], 255)
    Hud:DrawDigitsText1((1024 - scposxy2[4] - 80 * scsizehud / 2) * w / 1024, (768 - scposxy2[2] - 50 * scsizehud / 2) * h / 768, string.format("%3d", gamet2), 0.9 * scsizehud, nil, colord[1], colord[2], colord[3], 255)
  else
    if scplayer1 < 0 then
      Hud:QuadTrans(matminus, (1024 - (scposxy1[3] + scx) - 80 * scsizehud / 2) * w / 1024, (768 - scposxy1[5] - 50 * scsizehud / 2) * h / 768, scsizehud * 1.4, false, 255)
    end
    if scplayer2 < 0 or 0 > bestenemyscore then
      Hud:QuadTrans(matminus, (1024 - (scposxy2[3] + scx) - 80 * scsizehud / 2) * w / 1024, (768 - scposxy2[5] - 50 * scsizehud / 2) * h / 768, scsizehud * 1.4, false, 255)
    end
    Hud:DrawDigitsText1((1024 - scposxy1[4] - 80 * scsizehud / 2) * w / 1024, (768 - scposxy1[2] - 50 * scsizehud / 2) * h / 768, string.format("%3d", currentplayerscore), 0.9 * scsizehud, nil, colord[1], colord[2], colord[3], 255)
    if MPCfg.GameMode == "Duel" then
      Hud:DrawDigitsText1((1024 - scposxy2[4] - 80 * scsizehud / 2) * w / 1024, (768 - scposxy2[2] - 50 * scsizehud / 2) * h / 768, string.format("%3d", scplayer2), 0.9 * scsizehud, nil, colord[1], colord[2], colord[3], 255)
    else
      Hud:DrawDigitsText1((1024 - scposxy2[4] - 80 * scsizehud / 2) * w / 1024, (768 - scposxy2[2] - 50 * scsizehud / 2) * h / 768, string.format("%3d", bestenemyscore), 0.9 * scsizehud, nil, colord[1], colord[2], colord[3], 255)
    end
  end
  HUD.DrawQuadRGBA(nil, (1024 - markframe[3] - 80 * scsizehud / 2) * w / 1024, (768 - markframe[1] - 50 * scsizehud / 2) * h / 768, 80 * scsizehud * w / 1024, 3 * scsizehud * h / 768, cmarframe[1], cmarframe[2], cmarframe[3], 255)
  HUD.DrawQuadRGBA(nil, (1024 - markframe[3] - 80 * scsizehud / 2) * w / 1024, (768 - markframe[1] + 47 * scsizehud - 50 * scsizehud / 2) * h / 768, 80 * scsizehud * w / 1024, 3 * scsizehud * h / 768, cmarframe[1], cmarframe[2], cmarframe[3], 255)
  HUD.DrawQuadRGBA(nil, (1024 - markframe[3] - 80 * scsizehud / 2) * w / 1024, (768 - markframe[1] - 50 * scsizehud / 2) * h / 768, 3 * scsizehud * w / 1024, 50 * scsizehud * h / 768, cmarframe[1], cmarframe[2], cmarframe[3], 255)
  HUD.DrawQuadRGBA(nil, (1024 - markframe[3] - 80 * scsizehud / 2 + 77 * scsizehud) * w / 1024, (768 - markframe[1] - 50 * scsizehud / 2) * h / 768, 3 * scsizehud * w / 1024, 50 * scsizehud * h / 768, cmarframe[1], cmarframe[2], cmarframe[3], 255)
  if spressthiskey == true then
    if Cfg.HUD_Scores_Frame == 1 then
      HUD.DrawQuadRGBA(nil, (1024 - scposxy1[3] - 80 * scsizehud / 2) * w / 1024, (768 - scposxy1[1] + 23.5 * scsizehud - 50 * scsizehud / 2) * h / 768, 80 * scsizehud * w / 1024, 3 * scsizehud * h / 768, 0, 255, 0, 255)
      HUD.DrawQuadRGBA(nil, (1024 - scposxy1[3] - 80 * scsizehud / 2 + 38.5 * scsizehud) * w / 1024, (768 - scposxy1[1] - 50 * scsizehud / 2) * h / 768, 3 * scsizehud * w / 1024, 50 * scsizehud * h / 768, 0, 255, 0, 255)
    elseif Cfg.HUD_Scores_Frame == 2 then
      HUD.DrawQuadRGBA(nil, (1024 - scposxy2[3] - 80 * scsizehud / 2) * w / 1024, (768 - scposxy2[1] + 23.5 * scsizehud - 50 * scsizehud / 2) * h / 768, 80 * scsizehud * w / 1024, 3 * scsizehud * h / 768, 0, 255, 0, 255)
      HUD.DrawQuadRGBA(nil, (1024 - scposxy2[3] - 80 * scsizehud / 2 + 38.5 * scsizehud) * w / 1024, (768 - scposxy2[1] - 50 * scsizehud / 2) * h / 768, 3 * scsizehud * w / 1024, 50 * scsizehud * h / 768, 0, 255, 0, 255)
    end
  end
  if spressthiskey == true then
    HUD.SetFont("courbd", 20)
    if Cfg.HUD_Scores_Frame == 1 then
      HUD.PrintXY((w - HUD.GetTextWidth(alliedteam .. string.format(" Size: %02d", scsizehud * 100) .. "%")) / 2, h / 2.6, alliedteam .. string.format(" Size: %02d", scsizehud * 100) .. "%", "courbd", 0, 255, 0, 20)
      HUD.PrintXY((w - HUD.GetTextWidth(string.format("Vertical Position: %01d px", scposxy1[1] * h / 768))) / 2, h / 2.6 + HUD.GetTextHeight(), string.format("Vertical Position: %01d px", scposxy1[1] * h / 768), "courbd", 0, 255, 0, 20)
      HUD.PrintXY((w - HUD.GetTextWidth(string.format("Horinzontal Position: %01d px", scposxy1[3] * w / 1024))) / 2, h / 2.6 + HUD.GetTextHeight() * 2, string.format("Horinzontal Position: %01d px", scposxy1[3] * w / 1024), "courbd", 0, 255, 0, 20)
    elseif Cfg.HUD_Scores_Frame == 2 then
      HUD.PrintXY((w - HUD.GetTextWidth(alliedteam .. string.format(" Size: %02d", scsizehud * 100) .. "%")) / 2, h / 2.6, alliedteam .. string.format(" Size: %02d", scsizehud * 100) .. "%", "courbd", 0, 255, 0, 20)
      HUD.PrintXY((w - HUD.GetTextWidth(string.format("Vertical Position: %01d px", scposxy2[1] * h / 768))) / 2, h / 2.6 + HUD.GetTextHeight(), string.format("Vertical Position: %01d px", scposxy2[1] * h / 768), "courbd", 0, 255, 0, 20)
      HUD.PrintXY((w - HUD.GetTextWidth(string.format("Horinzontal Position: %01d px", scposxy2[3] * w / 1024))) / 2, h / 2.6 + HUD.GetTextHeight() * 2, string.format("Horinzontal Position: %01d px", scposxy2[3] * w / 1024), "courbd", 0, 255, 0, 20)
    end
  end
end

function Hud:GetCrosshairPlayerName()
  local b, d, x, y, z, nx, ny, nz, he, e = Player:Trace(100)
  if b and e then
    for i, ps in Game.PlayerStats, nil do
      if ps and ps._Entity and ps._Entity ~= 0 and ps._Entity == e then
        return ps.ClientID
      end
    end
  end
  return -1
end

function Hud:CrosshairNames()
  local nameshow = self:GetCrosshairPlayerName()
  if nameshow ~= -1 then
    local w, h = R3D.ScreenSize()
    local textna = Game.PlayerStats[nameshow].Name
    local txtposy = Cfg.CrosshairSize * 28
    local fontsize = Cfg.CrosshairNamesFontSize
    local varmor = 0
    local vhealth = 0
    local armortype = 0
    local player = Game.PlayerData[nameshow]
    if player ~= nil then
      varmor = player.Armour
      vhealth = player.Health
      armortype = player.ArmorType
    end
    local barsizearmor = varmor / 2
    local barsizehealth = vhealth / 2.5
    if armortype == 0 then
      colorarwar = {
        0,
        0,
        0
      }
    elseif armortype == 1 then
      colorarwar = {
        169,
        61,
        9
      }
      if Cfg.BrightSkinsArmors then
        colorarwar = {
          0,
          204,
          0
        }
      end
    elseif armortype == 2 then
      colorarwar = {
        153,
        153,
        153
      }
      if Cfg.BrightSkinsArmors then
        colorarwar = {
          255,
          255,
          0
        }
      end
    elseif armortype == 3 then
      colorarwar = {
        255,
        204,
        0
      }
      if Cfg.BrightSkinsArmors then
        colorarwar = {
          255,
          0,
          0
        }
      end
    end
    if varmor <= Player.ArmorWarning and armortype ~= 0 then
      colorarwar = {
        255,
        0,
        0
      }
    end
    if vhealth <= Player.HealthWarning then
      colorhewar = {
        255,
        0,
        0
      }
    else
      colorhewar = {
        0,
        vhealth * 1.02,
        0
      }
      if 153 >= colorhewar[2] then
        colorhewar = {
          0,
          153,
          0
        }
      end
    end
    if Game.PlayerStats[nameshow].Team == Player.Team and MPGameRules[MPCfg.GameMode].Teams then
      if Cfg.CrosshairNamesT == "White" then
        colortxtcnt = {
          255,
          255,
          255
        }
      elseif Cfg.CrosshairNamesT == "Red" then
        colortxtcnt = {
          255,
          0,
          0
        }
      elseif Cfg.CrosshairNamesT == "Blue" then
        colortxtcnt = {
          0,
          0,
          255
        }
      elseif Cfg.CrosshairNamesT == "Green" then
        colortxtcnt = {
          0,
          255,
          0
        }
      elseif Cfg.CrosshairNamesT == "Cyan" then
        colortxtcnt = {
          0,
          255,
          255
        }
      elseif Cfg.CrosshairNamesT == "Magenta" then
        colortxtcnt = {
          255,
          0,
          255
        }
      elseif Cfg.CrosshairNamesT == "Yellow" then
        colortxtcnt = {
          255,
          255,
          0
        }
      elseif Cfg.CrosshairNamesT == "Orange" then
        colortxtcnt = {
          255,
          102,
          0
        }
      elseif Cfg.CrosshairNamesT == "Pink" then
        colortxtcnt = {
          255,
          0,
          102
        }
      end
      if Cfg.CrosshairNamesT ~= "None" then
        HUD.SetFont("Impact", fontsize)
        vsfontcolortxtcnt = {
          colortxtcnt[1],
          colortxtcnt[2],
          colortxtcnt[3]
        }
        HUD.PrintXY((w - HUD.GetTextWidth(HUD.StripColorInfo(textna))) / 2 + 1, h / 2 + txtposy * h / 768 + 1, HUD.StripColorInfo(textna), "Impact", 15, 15, 15, fontsize)
        HUD.PrintXY((w - HUD.GetTextWidth(HUD.StripColorInfo(textna))) / 2, h / 2 + txtposy * h / 768, HUD.StripColorInfo(textna), "Impact", vsfontcolortxtcnt[1], vsfontcolortxtcnt[2], vsfontcolortxtcnt[3], fontsize)
        if Cfg.CrosshairTeamStatus then
          HUD.DrawQuadRGBA(nil, (w - 100 * w / 1024) / 2, h / 2 + (txtposy + 25) * h / 768, 100 * w / 1024, 8 * h / 768, 0, 0, 0, 100)
          HUD.DrawQuadRGBA(nil, (w - 100 * w / 1024) / 2, h / 2 + (txtposy + 36) * h / 768, 100 * w / 1024, 8 * h / 768, 0, 0, 0, 100)
          if vhealth ~= 0 and vhealth ~= nil then
            HUD.DrawQuadRGBA(nil, (w - 100 * w / 1024) / 2, h / 2 + (txtposy + 25) * h / 768, barsizehealth * w / 1024, 8 * h / 768, colorhewar[1], colorhewar[2], colorhewar[3])
          end
          if varmor ~= nil then
            HUD.DrawQuadRGBA(nil, (w - 100 * w / 1024) / 2, h / 2 + (txtposy + 36) * h / 768, barsizearmor * w / 1024, 8 * h / 768, colorarwar[1], colorarwar[2], colorarwar[3])
          end
        end
      end
    elseif Game.PlayerStats[nameshow].Team ~= Player.Team or MPCfg.GameMode ~= "Team Deathmatch" and MPCfg.GameMode ~= "Capture The Flag" and MPCfg.GameMode ~= "Clan Arena" then
      if Cfg.CrosshairNamesE == "White" then
        colortxtcne = {
          255,
          255,
          255
        }
      elseif Cfg.CrosshairNamesE == "Red" then
        colortxtcne = {
          255,
          0,
          0
        }
      elseif Cfg.CrosshairNamesE == "Blue" then
        colortxtcne = {
          0,
          0,
          255
        }
      elseif Cfg.CrosshairNamesE == "Green" then
        colortxtcne = {
          0,
          255,
          0
        }
      elseif Cfg.CrosshairNamesE == "Cyan" then
        colortxtcne = {
          0,
          255,
          255
        }
      elseif Cfg.CrosshairNamesE == "Magenta" then
        colortxtcne = {
          255,
          0,
          255
        }
      elseif Cfg.CrosshairNamesE == "Yellow" then
        colortxtcne = {
          255,
          255,
          0
        }
      elseif Cfg.CrosshairNamesE == "Orange" then
        colortxtcne = {
          255,
          102,
          0
        }
      elseif Cfg.CrosshairNamesE == "Pink" then
        colortxtcne = {
          255,
          0,
          102
        }
      end
      if Cfg.CrosshairNamesE ~= "None" then
        HUD.SetFont("Impact", fontsize)
        vsfontcolortxtcne = {
          colortxtcne[1],
          colortxtcne[2],
          colortxtcne[3]
        }
        HUD.PrintXY((w - HUD.GetTextWidth(HUD.StripColorInfo(textna))) / 2 + 1, h / 2 + txtposy * h / 768 + 1, HUD.StripColorInfo(textna), "Impact", 15, 15, 15, fontsize)
        HUD.PrintXY((w - HUD.GetTextWidth(HUD.StripColorInfo(textna))) / 2, h / 2 + txtposy * h / 768, HUD.StripColorInfo(textna), "Impact", vsfontcolortxtcne[1], vsfontcolortxtcne[2], vsfontcolortxtcne[3], fontsize)
      end
    end
  end
end

function Hud:DrawTeamOverlay()
  if not Hud then
    return
  end
  local w, h = R3D.ScreenSize()
  local font = "Impact"
  if Cfg.TeamOverlayFontSize == nil then
    Cfg.TeamOverlayFontSize = 26
  end
  local smallfont = Cfg.TeamOverlayFontSize
  local linespacing = 1
  if Cfg.TeamOverlayX == nil then
    Cfg.TeamOverlayX = 0.7
  end
  if Cfg.TeamOverlayY == nil then
    Cfg.TeamOverlayY = 0.71
  end
  if Cfg.TeamOverlayW == nil then
    Cfg.TeamOverlayW = 0.3
  end
  local overlaypanel = {
    x = Cfg.TeamOverlayX,
    y = Cfg.TeamOverlayY,
    w = Cfg.TeamOverlayW,
    d = 0.1
  }
  local panelfraction = {
    status = 0,
    name = 0.075,
    location = 0.45
  }
  local font = "Impact"
  local bigfont = "Impact"
  local fontfactor = h / 600
  local delta = smallfont * fontfactor
  local bluescore = 0
  local redscore = 0
  local vspace = smallfont * linespacing - smallfont
  local botcount = 0
  local playercount = 0
  local bluecount = 0
  local redcount = 0
  local speccount = 0
  for i, ps in Game.PlayerStats, nil do
    if ps.Team == 0 and ps.Spectator == 0 then
      bluecount = bluecount + 1
    end
    if ps.Team == 1 and ps.Spectator == 0 then
      redcount = redcount + 1
    end
  end
  if Player.Team == 0 then
    overlaypanel.d = (bluecount + 1) * smallfont * fontfactor / h
  else
    overlaypanel.d = (redcount + 1) * smallfont * fontfactor / h
  end
  HUD.DrawQuadRGBA(Hud._matBluePix, w * overlaypanel.x, h * overlaypanel.y, w * overlaypanel.w, h * overlaypanel.d, 255, 255, 255, 960)
  HUD.DrawQuadRGBA(Hud._matGreenPix, w * overlaypanel.x, h * overlaypanel.y, w * overlaypanel.w, smallfont * fontfactor, 255, 255, 255, 960)
  HUD.PrintXY(w * overlaypanel.x + w * panelfraction.name * overlaypanel.w, h * overlaypanel.y + vspace + 2, "Name", font, 255, 255, 255, smallfont)
  HUD.PrintXY(w * overlaypanel.x + w * panelfraction.location * overlaypanel.w, h * overlaypanel.y + vspace + 2, "Location", font, 255, 255, 255, smallfont)
  for i, ps in Game.PlayerStats, nil do
    if ps.Spectator == 0 and Game:IsTeammate(ps.ClientID) then
      local areaname = Game:GetLocation(ps.ClientID)
      if areaname == nil then
        areaname = ""
      end
      if Game.GetMyID() == ps.ClientID then
        HUD.DrawQuadRGBA(Hud._matBluePix, w * overlaypanel.x, h * overlaypanel.y + delta, w * overlaypanel.w, smallfont * fontfactor, 255, 255, 255, 960)
      end
      local playerstate = ""
      for ii, o in Game.Players, nil do
        if o.ClientID == ID then
          if o.HasQuad then
            playerstate = "Q"
          end
          if o.HasWeaponModifier then
            playerstate = "M"
          end
          if o.HasPentagram then
            playerstate = "P"
          end
          if o.HasFlag then
            playerstate = "F"
          end
        end
      end
      HUD.PrintXY(w * overlaypanel.x + w * panelfraction.status * overlaypanel.w, h * overlaypanel.y + delta + 2, playerstate, font, 255, 255, 255, smallfont)
      HUD.PrintXY(w * overlaypanel.x + w * panelfraction.name * overlaypanel.w, h * overlaypanel.y + delta + 2, ps.Name, font, 255, 255, 255, smallfont)
      HUD.PrintXY(w * overlaypanel.x + w * panelfraction.location * overlaypanel.w, h * overlaypanel.y + delta + 2, areaname, font, 255, 255, 255, smallfont)
      delta = delta + smallfont * fontfactor
    end
  end
end

function Hud:DrawBotInfo()
  if not Hud then
    return
  end
  local w, h = R3D.ScreenSize()
  local font = "Impact"
  local smallfont = 11
  for i, o in Game.Players, nil do
    if o.ClientID == 6 then
      local entx, enty, entz, vl = ENTITY.GetVelocity(Game.PlayerStats[7]._Entity)
      HUD.PrintXY(100, 100, "Entity vels : " .. entx .. " " .. enty .. " " .. entz .. " " .. vl, font, 255, 255, 255, smallfont)
      HUD.PrintXY(100, 110, "ForwardVector : " .. o.ForwardVector.X .. " " .. o.ForwardVector.Y .. " " .. o.ForwardVector.Z .. " ", font, 255, 255, 255, smallfont)
      HUD.PrintXY(100, 120, "cplayer vels : " .. o._velocityz .. " " .. o._velocityz .. " " .. o._velocityz .. " " .. o._yaw, font, 255, 255, 255, smallfont)
      if o:IsOnGround() then
        HUD.PrintXY(100, 130, "shit : ON GROUND ", font, 255, 255, 255, smallfont)
      end
      HUD.PrintXY(100, 140, "ACTION : ON FLOOR " .. tostring(INP.GetActionStatus(Game.PlayerStats[7]._Entity)) .. " " .. tostring(Game.bot[7].state), font, 255, 255, 255, smallfont)
      HUD.PrintXY(100, 150, "cfdsfdsfdsls : " .. o._velocityz .. " " .. o._velocityz .. " " .. o._velocityz .. " " .. o._yaw, font, 255, 255, 255, smallfont)
      HUD.PrintXY(100, 90, "BOT", font, 255, 255, 255, smallfont)
    end
  end
end

function Hud:IfDefFavHudExist()
  local defaultfile = {
    "Normal_HUD.cfg",
    "Pro_Hud.cfg",
    "Pro_Hud 3D.cfg",
    "Hud_Bar.cfg"
  }
  local name = {
    "Normal HUD Style",
    "Pro Hud Style",
    "Pro Hud 3D Style",
    "Hud Bar Style"
  }
  local defaultfilename = {
    "Classic",
    "Custom",
    "Custom 3D",
    "Bar"
  }
  local check = {
    true,
    true,
    true,
    true
  }
  local style = {
    0,
    1,
    2,
    3
  }
  local path = "../Bin/Configs/"
  for i = 1, 4 do
    if check[i] == true then
      local pathfile = "./Configs/" .. defaultfile[i]
      local fexist = FS.File_Exist(path .. defaultfile[i])
      local cfgdefvalue = {
        name[i],
        defaultfilename[i],
        os.date("%d/%m/%Y"),
        os.date("%H:%M:%S"),
        "2008010100000" .. style[i],
        "Not applicable"
      }
      if not fexist then
        FS.CreateDirectory(path)
        local f = io.open(pathfile, "w")
        if not f then
          if Game then
            Game:Print("WARNING: " .. defaultfile[i] .. "is read-only. Configuration not saved.")
          else
            MsgBox("WARNING: " .. defaultfile[i] .. " is read-only. Configuration not saved.")
          end
          return
        end
        if defaultfile[i] == "Normal_HUD.cfg" then
          f:write("--[WARNING: Do NOT edit this file. Can not be deleted.]" .. [[


]] .. "function PainMenu:SetRefValues()" .. "\n" .. "\tref.SaveName = " .. string.format("%q", cfgdefvalue[1]) .. "\n" .. "\tref.Style = " .. string.format("%q", cfgdefvalue[2]) .. "\n" .. "\tref.Date = " .. string.format("%q", cfgdefvalue[3]) .. "\n" .. "\tref.Time = " .. string.format("%q", cfgdefvalue[4]) .. "\n" .. "\tref.Sort = " .. string.format("%q", cfgdefvalue[5]) .. "\n" .. "\tref.Anim = " .. string.format("%q", cfgdefvalue[6]) .. "\n" .. "end" .. [[


]] .. "function PainMenu:SetCfgValues()" .. "\n" .. "\tCfg.HUD_HudStyle = " .. style[i] .. "\n" .. "end" .. "\n")
          io.close(f)
        elseif defaultfile[i] == "Pro_Hud.cfg" then
          f:write("--[WARNING: Do NOT edit this file. Can not be deleted.]" .. [[


]] .. "function PainMenu:SetRefValues()" .. "\n" .. "\tref.SaveName = " .. string.format("%q", cfgdefvalue[1]) .. "\n" .. "\tref.Style = " .. string.format("%q", cfgdefvalue[2]) .. "\n" .. "\tref.Date = " .. string.format("%q", cfgdefvalue[3]) .. "\n" .. "\tref.Time = " .. string.format("%q", cfgdefvalue[4]) .. "\n" .. "\tref.Sort = " .. string.format("%q", cfgdefvalue[5]) .. "\n" .. "\tref.Anim = " .. string.format("%q", cfgdefvalue[6]) .. "\n" .. "end" .. [[


]] .. "function PainMenu:SetCfgValues()" .. "\n" .. "\tCfg.HUD_HudStyle = " .. style[i] .. "\n" .. "\tCfg.HUD_Armor_Icon_Setting = {987,30,0.58,}" .. "\n" .. "\tCfg.HUD_Armor_Text_Setting = {937,30,0.55,}" .. "\n" .. "\tCfg.HUD_Health_Icon_Setting = {987,66,0.58,}" .. "\n" .. "\tCfg.HUD_Health_Text_Setting = {937,66,0.55,}" .. "\n" .. "\tCfg.HUD_CurrentWeapon_Icon_Setting = {512,48,0.8,}" .. "\n" .. "\tCfg.HUD_Weapon1_Icon_Setting = {37,66,0.58,}" .. "\n" .. "\tCfg.HUD_Weapon1_Text_Setting = {87,66,0.55,}" .. "\n" .. "\tCfg.HUD_Weapon2_Icon_Setting  = {37,30,0.58,}" .. "\n" .. "\tCfg.HUD_Weapon2_Text_Setting = {87,30,0.55,}" .. "\n" .. "end" .. "\n")
          io.close(f)
        elseif defaultfile[i] == "Pro_Hud 3D.cfg" then
          f:write("--[WARNING: Do NOT edit this file. Can not be deleted.]" .. [[


]] .. "function PainMenu:SetRefValues()" .. "\n" .. "\tref.SaveName = " .. string.format("%q", cfgdefvalue[1]) .. "\n" .. "\tref.Style = " .. string.format("%q", cfgdefvalue[2]) .. "\n" .. "\tref.Date = " .. string.format("%q", cfgdefvalue[3]) .. "\n" .. "\tref.Time = " .. string.format("%q", cfgdefvalue[4]) .. "\n" .. "\tref.Sort = " .. string.format("%q", cfgdefvalue[5]) .. "\n" .. "\tref.Anim = " .. string.format("%q", "Disabled") .. "\n" .. "end" .. [[


]] .. "function PainMenu:SetCfgValues()" .. "\n" .. "\tCfg.HUD_HudStyle = " .. style[i] .. "\n" .. "\tCfg.HUD_Armor_Icon_Setting = {987,30,0.72,}" .. "\n" .. "\tCfg.HUD_Armor_Text_Setting = {934,30,0.55,}" .. "\n" .. "\tCfg.HUD_Health_Icon_Setting = {987,69,0.72,}" .. "\n" .. "\tCfg.HUD_Health_Text_Setting = {934,69,0.55,}" .. "\n" .. "\tCfg.HUD_CurrentWeapon_Icon_Setting = {512,48,0.8,}" .. "\n" .. "\tCfg.HUD_Weapon1_Icon_Setting = {37,69,0.72,}" .. "\n" .. "\tCfg.HUD_Weapon1_Text_Setting = {90,69,0.55,}" .. "\n" .. "\tCfg.HUD_Weapon2_Icon_Setting  = {37,30,0.72,}" .. "\n" .. "\tCfg.HUD_Weapon2_Text_Setting = {90,30,0.55,}" .. "\n" .. "end" .. "\n")
          io.close(f)
        elseif defaultfile[i] == "Hud_Bar.cfg" then
          f:write("--[WARNING: Do NOT edit this file. Can not be deleted.]" .. [[


]] .. "function PainMenu:SetRefValues()" .. "\n" .. "\tref.SaveName = " .. string.format("%q", cfgdefvalue[1]) .. "\n" .. "\tref.Style = " .. string.format("%q", cfgdefvalue[2]) .. "\n" .. "\tref.Date = " .. string.format("%q", cfgdefvalue[3]) .. "\n" .. "\tref.Time = " .. string.format("%q", cfgdefvalue[4]) .. "\n" .. "\tref.Sort = " .. string.format("%q", cfgdefvalue[5]) .. "\n" .. "\tref.Anim = " .. string.format("%q", cfgdefvalue[6]) .. "\n" .. "end" .. [[


]] .. "function PainMenu:SetCfgValues()" .. "\n" .. "\tCfg.HUD_HudStyle = " .. style[i] .. "\n" .. "end" .. "\n")
          io.close(f)
        end
      end
      check[i] = false
    end
  end
end

function Hud:DrawQuickOptionsMenu()
  local w, h = R3D.ScreenSize()
  local menu = {
    "Hud Style",
    "Posionning System",
    "CallVote"
  }
  local cfgs = {
    Cfg.HUD_HudStyle,
    Cfg.PositioningSystem,
    nil
  }
  if (INP.Key(Keys.PgUp) == 2 or INP.Key(Keys.Insert) == 2 or INP.Key(Keys.Home) == 2 or INP.Key(Keys.NumDecimal) == 2) and self._DrawQuickOptions then
    if self._DrawQuickOptions == true then
      self._DrawQuickOptions = false
    end
  elseif INP.Key(FKeys[Cfg.KeyPrimaryQuickMenu]) == 1 or INP.Key(FKeys[Cfg.KeyAlternativeQuickMenu]) == 1 then
    if self._DrawQuickOptions == false then
      self._DrawQuickOptions = true
    elseif self._DrawQuickOptions == true then
      self._DrawQuickOptions = false
    end
  end
  if self._DrawQuickOptions == true then
    local submenua = {
      {},
      {
        "Weapons",
        "Scores",
        "AmmoList",
        "HUD",
        "Infos",
        "Misc"
      },
      {
        "Maps",
        "Kick Players",
        "Ban Players",
        "Game Mode"
      }
    }
    local submenuitemsa = {
      {},
      {
        0,
        1,
        2,
        3,
        4
      },
      {
        nil,
        nil,
        nil
      }
    }
    local submenub = {
      {},
      {"No Players"},
      {"No Players"},
      {
        "Free For All",
        "Voosh",
        "The Light Bearer",
        "People Can Fly",
        "Team Deathmatch",
        "Capture The Flag",
        "Last Man Standing",
        "Duel",
        "Clan Arena",
        "Instagib",
        "ICTF"
      },
      {
        "ProPlus",
        "Powerups",
        "Powerup Drop",
        "Weapons Stay",
        "Team Damage"
      }
    }
    local submenuitemsb = {
      {
        "ffa",
        "voosh",
        "tlb",
        "pcf",
        "tdm",
        "ctf",
        "lms",
        "duel",
        "ca",
        "ig",
        "ictf"
      },
      {
        "proplus",
        "powerups",
        "powerupdrop",
        "weaponsstay",
        "teamdamage"
      }
    }
    Hud:IfDefFavHudExist()
    local textsubma = {}
    local itemsubma = {}
    local cartnum = {}
    local textsubmb = {}
    local itemsubmb = {}
    local cartnumb = {}
    local p = 1
    for i, o in Game.PlayerStats, nil do
      local ps = Game.PlayerStats[o.ClientID]
      if o.ClientID ~= Player.ClientID then
        submenub[2][p] = o.Name
        submenub[3][p] = o.Name
        p = p + 1
      end
    end
    local files = FS.FindFiles("../Data/Levels/*", 0, 1)
    local g = 1
    for f = 1, table.getn(files) do
      if MPCfg.GameMode == "Capture The Flag" then
        if string.find(string.lower(files[f]), "ctf_") then
          submenub[1][1] = "Reload Map"
          submenub[1][g + 1] = string.lower(files[f])
          g = g + 1
        end
      elseif MPCfg.GameMode == "People Can Fly" then
        if string.find(string.lower(files[f]), "dmpcf_") then
          submenub[1][1] = "Reload Map"
          submenub[1][g + 1] = string.lower(files[f])
          g = g + 1
        end
      elseif string.find(string.lower(files[f]), "dm_") or string.find(string.lower(files[f]), "pro_") then
        submenub[1][1] = "Reload Map"
        submenub[1][g + 1] = string.lower(files[f])
        g = g + 1
      end
    end
    local hu = 1
    if self._DrawQuickOptionsMenu == menu[1] then
      ref = {}
      local allcfgfind = FS.FindFiles("../Bin/Configs/*.cfg", 1, 0)
      table.sort(allcfgfind, FavHudSortByDate)
      for c = 1, table.getn(allcfgfind) do
        DoFile("../Bin/Configs/" .. allcfgfind[c], false)
        PainMenu:SetRefValues()
        submenua[1][1] = "Save your Hud"
        submenua[1][hu + 1] = ref.SaveName
        submenuitemsa[1][hu + 1] = allcfgfind[c]
        hu = hu + 1
      end
    end
    if self._DrawQuickOptionsMenu == menu[self._MenuBright] then
      textsubma = submenua[self._MenuBright]
      itemsubma = submenuitemsa[self._MenuBright]
      for sg = 1, table.getn(textsubma) do
        cartnum[sg] = string.len(textsubma[sg])
      end
      if INP.Key(Keys.Num6) == 1 then
        if self.SubMenuAOpen == true then
          if self._DrawQuickOptionsSubMenuA == submenua[3][self._SubMenuABright] then
            self.SubMenuBOpen = true
            self._DrawQuickOptionsSubMenuB = submenub[self._SubMenuABright][1]
            self._SubMenuBBright = 1
          end
        else
          self.SubMenuAOpen = true
          self._DrawQuickOptionsSubMenuA = submenua[self._MenuBright][1]
          self._SubMenuABright = 1
        end
      end
      if INP.Key(Keys.Num4) == 1 then
        if self.SubMenuBOpen == true then
          self.SubMenuBOpen = false
          self.fasizeaw = 0
        else
          self.SubMenuAOpen = false
          self.fasizew = 0
        end
      end
      if self._DrawQuickOptionsSubMenuA == submenua[3][self._SubMenuABright] then
        textsubmb = submenub[self._SubMenuABright]
        for sh = 1, table.getn(textsubmb) do
          cartnumb[sh] = string.len(textsubmb[sh])
        end
      end
    end
    if INP.Key(Keys.Num8) == 1 then
      if self.SubMenuAOpen == false then
        self._MenuBright = self._MenuBright - 1
        if 1 > self._MenuBright then
          self._MenuBright = table.getn(menu)
        end
        self._DrawQuickOptionsMenu = menu[self._MenuBright]
      elseif self.SubMenuAOpen == true and self.SubMenuBOpen == false then
        self._SubMenuABright = self._SubMenuABright - 1
        if 1 > self._SubMenuABright then
          self._SubMenuABright = table.getn(textsubma)
        end
        self._DrawQuickOptionsSubMenuA = textsubma[self._SubMenuABright]
      elseif self.SubMenuBOpen == true then
        self._SubMenuBBright = self._SubMenuBBright - 1
        if 1 > self._SubMenuBBright then
          self._SubMenuBBright = table.getn(textsubmb)
        end
        self._DrawQuickOptionsSubMenuB = textsubmb[self._SubMenuBBright]
      end
    end
    if INP.Key(Keys.Num2) == 1 then
      if self.SubMenuAOpen == false then
        self._MenuBright = self._MenuBright + 1
        if self._MenuBright > table.getn(menu) then
          self._MenuBright = 1
        end
        self._DrawQuickOptionsMenu = menu[self._MenuBright]
      elseif self.SubMenuAOpen == true and self.SubMenuBOpen == false then
        self._SubMenuABright = self._SubMenuABright + 1
        if self._SubMenuABright > table.getn(textsubma) then
          self._SubMenuABright = 1
        end
        self._DrawQuickOptionsSubMenuA = textsubma[self._SubMenuABright]
      elseif self.SubMenuBOpen == true then
        self._SubMenuBBright = self._SubMenuBBright + 1
        if self._SubMenuBBright > table.getn(textsubmb) then
          self._SubMenuBBright = 1
        end
        self._DrawQuickOptionsSubMenuB = textsubmb[self._SubMenuBBright]
      end
    end
    if INP.Key(FKeys[Cfg.KeyPrimaryQuickMenuValidate]) == 1 or INP.Key(FKeys[Cfg.KeyAlternativeQuickMenuValidate]) == 1 then
      if self.SubMenuAOpen == true and self.SubMenuBOpen == false then
        if self._DrawQuickOptionsMenu == menu[1] then
          if textsubma[self._SubMenuABright] == "Save your Hud" then
            PMENU.ShowMenu()
            PMENU.PauseSounds()
            PainMenu:AskForFavoriteHudName("Type Name for the favorite.", "PainMenu:AddFavoriteHud()", "PainMenu:ActivateScreen(FavoriteHud); PainMenu:CheckItems()")
            self._DrawQuickOptions = false
          else
            DoFile("../Bin/Configs/" .. itemsubma[self._SubMenuABright], false)
            PainMenu:SetCfgValues()
            Cfg:Save()
          end
        end
        if self._DrawQuickOptionsMenu == menu[2] then
          self._DrawQuickOptions = false
          Cfg.PositioningSystem = self._SubMenuABright - 1
        end
      end
      if self.SubMenuBOpen == true then
        self._DrawQuickOptions = false
        if self._DrawQuickOptionsSubMenuA == submenua[3][1] then
          if textsubmb[self._SubMenuBBright] == "Reload Map" then
            Console:Cmd_CALLVOTE("reloadmap")
          else
            Console:Cmd_CALLVOTE("map " .. textsubmb[self._SubMenuBBright])
          end
        end
        if self._DrawQuickOptionsSubMenuA == submenua[3][2] then
          Console:Cmd_CALLVOTE("kick " .. textsubmb[self._SubMenuBBright])
        end
        if self._DrawQuickOptionsSubMenuA == submenua[3][3] then
          Console:Cmd_CALLVOTE("bankick " .. textsubmb[self._SubMenuBBright])
        end
        if self._DrawQuickOptionsSubMenuA == submenua[3][4] then
          Console:Cmd_CALLVOTE("gamemode " .. submenuitemsb[1][self._SubMenuBBright])
        end
      end
    end
    if self.SubMenuAOpen == false then
      self.mposh = 0
    end
    local textfrposth = 0
    local textfbposth = 0
    local textfyposth = 0
    local quadsize = 22 * h / 768 * table.getn(menu)
    local qmax = 18
    local quadsizea = 22 * h / 768 * table.getn(textsubma)
    local quadsizeb = 22 * h / 768 * table.getn(textsubmb)
    local centermenu = (h - (quadsize + qmax)) / 2
    local mposh = centermenu - self.mposh
    local centersubmenua = (h - (quadsizea + qmax)) / 2
    local centersubmenub = (h - (quadsizeb + qmax)) / 2
    HUD.DrawQuadRGBA(nil, 0, 0, w, h, 0, 0, 0, 200)
    for fa = 1, table.getn(menu) do
      if fa == table.getn(menu) then
        HUD.DrawQuadRGBA(nil, (w - 190 * w / 1024 - self.fasizew - self.fasizeaw) / 2, mposh, 190 * w / 1024, quadsize + qmax, 0, 255, 0, 100)
      end
    end
    local alt = 12
    local alb = 8.5
    local centertomark = 0
    HUD.SetFont("Impact", 18)
    for ai = 1, table.getn(menu) do
      HUD.PrintXY((w - 160 * w / 1024 - self.fasizew - self.fasizeaw) / 2, mposh + alt + textfrposth, menu[ai], "Impact", 255, 255, 255, 18)
      Hud:QuadTrans(self._matArrowMenu, (w + (160 * w / 1024 - self.fasizew - self.fasizeaw)) / 2, mposh + alt + textfrposth, 0.38, false, 255)
      if self._DrawQuickOptionsMenu == menu[ai] then
        local bsize = 184
        HUD.DrawQuadRGBA(nil, (w - (bsize * w / 1024 + self.fasizew + self.fasizeaw)) / 2, mposh + alb + textfrposth, bsize * w / 1024, 22 * h / 768, 0, 0, 255, 100)
        centertomark = textfrposth
      end
      textfrposth = textfrposth + 22 * h / 768
    end
    if self.SubMenuAOpen == true then
      self.fasizew = HUD.GetTextWidth(self.bstexta) + 30 * w / 1024
      if self._DrawQuickOptionsMenu == "CallVote" then
        self.fasizew = 139 * w / 1024
      end
      for fb = 1, table.getn(textsubma) do
        if fb == table.getn(textsubma) then
          HUD.DrawQuadRGBA(nil, (w + (178 * w / 1024 - self.fasizew - self.fasizeaw)) / 2, centersubmenua, self.fasizew, quadsizea + qmax, 255, 0, 0, 100)
        end
      end
      HUD.SetFont("Impact", 18)
      for bi = 1, table.getn(textsubma) do
        HUD.PrintXY((w + (208 * w / 1024 - self.fasizew - self.fasizeaw)) / 2, centersubmenua + alt + textfbposth, textsubma[bi], "Impact", 255, 255, 255, 18)
        if self._DrawQuickOptionsMenu == "CallVote" then
          Hud:QuadTrans(self._matArrowMenu, (w + 425 * w / 1024 - self.fasizew - self.fasizeaw) / 2, centersubmenua + alt + textfbposth, 0.38, false, 255)
        end
        if self._DrawQuickOptionsSubMenuA == textsubma[bi] then
          HUD.DrawQuadRGBA(nil, (w + (184 * w / 1024 - self.fasizew - self.fasizeaw)) / 2, centersubmenua + alb + textfbposth, self.fasizew - 6 * w / 1024, 22 * h / 768, 0, 0, 255, 100)
        end
        textfbposth = textfbposth + 22 * h / 768
      end
      self.mposh = centersubmenua + textfbposth - (centermenu + textfrposth - centertomark)
    end
    local maxcarta = 0
    for ik, ai in textsubma, nil do
      local check = HUD.GetTextWidth(textsubma[ik])
      if maxcarta < check then
        maxcarta = HUD.GetTextWidth(textsubma[ik])
        self.bstexta = textsubma[ik]
      end
    end
    if self.SubMenuBOpen == true then
      self.fasizeaw = HUD.GetTextWidth(self.bstextb) + 30 * w / 1024
      for fc = 1, table.getn(textsubmb) do
        if fc == table.getn(textsubmb) then
          HUD.DrawQuadRGBA(nil, (w + (443 * w / 1024 - self.fasizeaw - self.fasizew)) / 2, centersubmenub, self.fasizeaw, quadsizeb + qmax, 255, 255, 0, 100)
        end
      end
      HUD.SetFont("Impact", 18)
      for bi = 1, table.getn(textsubmb) do
        local nc = 0
        local txt = textsubmb[bi]
        if string.find(textsubmb[bi], "dm_") then
          nc = 4
          local fc = string.sub(string.sub(textsubmb[bi], nc), 1, 1)
          txt = string.gsub(string.sub(textsubmb[bi], nc), fc, string.upper)
        end
        if string.find(textsubmb[bi], "pro_") then
          nc = 5
          local fc = string.sub(string.sub(textsubmb[bi], nc), 1, 1)
          txt = string.gsub(string.sub(textsubmb[bi], nc), fc, string.upper)
        end
        if string.find(textsubmb[bi], "dmpcf_") then
          nc = 7
          local fc = string.sub(string.sub(textsubmb[bi], nc), 1, 1)
          txt = string.gsub(string.sub(textsubmb[bi], nc), fc, string.upper)
        end
        if string.find(textsubmb[bi], "ctf_") then
          nc = 5
          local fc = string.sub(string.sub(textsubmb[bi], nc), 1, 1)
          txt = string.gsub(string.sub(textsubmb[bi], nc), fc, string.upper)
        end
        HUD.PrintXY((w + (470 * w / 1024 - self.fasizeaw - self.fasizew)) / 2, centersubmenub + alt + textfyposth, txt, "Impact", 255, 255, 255, 18)
        if self._DrawQuickOptionsSubMenuB == textsubmb[bi] then
          HUD.DrawQuadRGBA(nil, (w + (449 * w / 1024 - self.fasizew - self.fasizeaw)) / 2, centersubmenub + alb + textfyposth, self.fasizeaw - 6 * w / 1024, 22 * h / 768, 0, 0, 255, 100)
        end
        textfyposth = textfyposth + 22 * h / 768
      end
    end
    local maxcartb = 0
    for ii, bi in textsubmb, nil do
      local check = HUD.GetTextWidth(textsubmb[ii])
      if maxcartb < check then
        maxcartb = HUD.GetTextWidth(textsubmb[ii])
        self.bstextb = textsubmb[ii]
      end
    end
  end
end

function Hud:StatsText(statsplayer)
  local txt = ""
  local totaldamage = 0
  local statsos = 0
  local w, h = R3D.ScreenSize()
  local center = Hud.StatsPos / 2
  if Game.Stats[statsplayer] ~= nil then
    HUD.SetFont("courbd", 20)
    local tat = " Attack Type      "
    local tht = " Hits "
    local tsh = " Shots "
    local tda = " Damage "
    local tef = " Efficiency "
    local twac = HUD.GetTextWidth(tda)
    local twab = HUD.GetTextWidth(tsh)
    local twaa = HUD.GetTextWidth(tht)
    local twad = HUD.GetTextWidth(tat)
    HUD.DrawQuadRGBA(nil, 0, 0, w, h, 0, 0, 0, 200)
    local twa = HUD.GetTextWidth(tat) + HUD.GetTextWidth(tht) + HUD.GetTextWidth(tsh) + HUD.GetTextWidth(tda) + HUD.GetTextWidth(tef)
    local txta = "Weapon Statistics for " .. Game.PlayerStats[statsplayer].Name
    local twb = HUD.GetTextWidth(txta)
    HUD.DrawQuadRGBA(nil, w / 2 - twa / 2, h / 2 - HUD.GetTextHeight() * 3.4 - center, twa, HUD.GetTextHeight() * 1.6, 50, 50, 50, 120)
    HUD.PrintXY(w / 2 - twb / 2, h / 2 - HUD.GetTextHeight() * 3 - center, txta, "courbd", 225, 255, 255, 20)
    HUD.DrawQuadRGBA(nil, w / 2 - twa / 2 + twad, h / 2 - HUD.GetTextHeight() * 1.5 - center, HUD.GetTextWidth(tht), HUD.GetTextHeight() * 1.3, 50, 50, 50, 120)
    HUD.DrawQuadRGBA(nil, w / 2 - twa / 2 + twad + twaa + twab, h / 2 - HUD.GetTextHeight() * 1.5 - center, HUD.GetTextWidth(tda), HUD.GetTextHeight() * 1.3, 50, 50, 50, 120)
    HUD.DrawQuadRGBA(nil, w / 2 - twa / 2, h / 2 - HUD.GetTextHeight() * 1.5 - center, twa, HUD.GetTextHeight() * 1.3, 50, 50, 50, 120)
    HUD.PrintXY(w / 2 - twa / 2, h / 2 - HUD.GetTextHeight() * 1.3 - center, tat, "courbd", 225, 255, 255, 20)
    HUD.PrintXY(w / 2 - twa / 2 + twad, h / 2 - HUD.GetTextHeight() * 1.3 - center, tht, "courbd", 225, 255, 255, 20)
    HUD.PrintXY(w / 2 - twa / 2 + twad + twaa, h / 2 - HUD.GetTextHeight() * 1.3 - center, tsh, "courbd", 225, 255, 255, 20)
    HUD.PrintXY(w / 2 - twa / 2 + twad + twaa + twab, h / 2 - HUD.GetTextHeight() * 1.3 - center, tda, "courbd", 225, 255, 255, 20)
    HUD.PrintXY(w / 2 - twa / 2 + twad + twaa + twab + twac, h / 2 - HUD.GetTextHeight() * 1.3 - center, tef, "courbd", 225, 255, 255, 20)
    local uppos = HUD.GetTextHeight() * 1.2 - HUD.GetTextHeight()
    HUD.DrawQuadRGBA(nil, w / 2 - twa / 2, h / 2 - uppos - center, HUD.GetTextWidth(tat), Hud.StatsPos + uppos, 70, 70, 70, 120)
    HUD.DrawQuadRGBA(nil, w / 2 - twa / 2 + twad, h / 2 - uppos - center, HUD.GetTextWidth(tht), Hud.StatsPos + uppos, 70, 70, 70, 180)
    HUD.DrawQuadRGBA(nil, w / 2 - twa / 2 + twad + twaa, h / 2 - uppos - center, HUD.GetTextWidth(tsh), Hud.StatsPos + uppos, 70, 70, 70, 120)
    HUD.DrawQuadRGBA(nil, w / 2 - twa / 2 + twad + twaa + twab, h / 2 - uppos - center, HUD.GetTextWidth(tda), Hud.StatsPos + uppos, 70, 70, 70, 180)
    HUD.DrawQuadRGBA(nil, w / 2 - twa / 2 + twad + twaa + twab + twac, h / 2 - uppos - center, HUD.GetTextWidth(tef), Hud.StatsPos + uppos, 70, 70, 70, 120)
    for i, attack_type in Game.Stats[statsplayer].PlayerWepStats, nil do
      local failed = false
      local attacktypetext = ""
      if attack_type.attacktype == 1 then
        attacktypetext = " Shotgun        "
      end
      if attack_type.attacktype == 2 then
        attacktypetext = " Grenade        "
      end
      if attack_type.attacktype == 3 then
        attacktypetext = " Rocket         "
      end
      if attack_type.attacktype == 4 then
        attacktypetext = " OutOfLevel     "
      end
      if attack_type.attacktype == 5 then
        attacktypetext = " MiniGun        "
      end
      if attack_type.attacktype == 6 then
        attacktypetext = " Fire           "
      end
      if attack_type.attacktype == 7 then
        attacktypetext = " Explosion      "
      end
      if attack_type.attacktype == 8 then
        attacktypetext = " Poison         "
      end
      if attack_type.attacktype == 9 then
        attacktypetext = " Bubble         "
      end
      if attack_type.attacktype == 10 then
        attacktypetext = " Stake          "
      end
      if attack_type.attacktype == 11 then
        attacktypetext = " Painkiller     "
      end
      if attack_type.attacktype == 12 then
        attacktypetext = " HitGround      "
      end
      if attack_type.attacktype == 13 then
        attacktypetext = " TeleFrag       "
      end
      if attack_type.attacktype == 14 then
        attacktypetext = " Suicide        "
      end
      if attack_type.attacktype == 15 then
        attacktypetext = " StickyBomb     "
      end
      if attack_type.attacktype == 16 then
        attacktypetext = " Step           "
      end
      if attack_type.attacktype == 17 then
        attacktypetext = " AIClose        "
      end
      if attack_type.attacktype == 18 then
        attacktypetext = " AIFar          "
      end
      if attack_type.attacktype == 19 then
        attacktypetext = " Shuriken       "
      end
      if attack_type.attacktype == 20 then
        attacktypetext = " Physics        "
      end
      if attack_type.attacktype == 21 then
        attacktypetext = " Stone          "
      end
      if attack_type.attacktype == 22 then
        attacktypetext = " Demon          "
      end
      if attack_type.attacktype == 23 then
        attacktypetext = " Electro        "
      end
      if attack_type.attacktype == 24 then
        attacktypetext = " PainkillerRotor"
      end
      if attack_type.attacktype == 25 then
        attacktypetext = " Fireball       "
      end
      if attack_type.attacktype == 26 then
        attacktypetext = " ItemCollision  "
      end
      if attack_type.attacktype == 27 then
        attacktypetext = " Tank           "
      end
      if attack_type.attacktype == 28 then
        attacktypetext = " Lava           "
      end
      if attack_type.attacktype == 29 then
        attacktypetext = " ConsoleKill    "
      end
      if attack_type.attacktype == 30 then
        attacktypetext = " Hurt_Pent      "
      end
      if attack_type.attacktype == 31 then
        attacktypetext = " Rifle          "
      end
      if attack_type.attacktype == 32 then
        attacktypetext = " FlameThrower   "
      end
      if attack_type.attacktype == 33 then
        attacktypetext = " Flag           "
      end
      if attack_type.attacktype == 34 then
        attacktypetext = " BoltStick      "
      end
      if attack_type.attacktype == 35 then
        attacktypetext = " HeaterBomb     "
      end
      local hitspace = "     "
      if 9 < attack_type.hits then
        hitspace = "    "
      end
      if attack_type.hits > 99 then
        hitspace = "   "
      end
      if attack_type.hits > 999 then
        hitspace = "  "
      end
      if attack_type.hits > 9999 then
        hitspace = " "
      end
      local shotspace = "      "
      if 9 < attack_type.shots then
        shotspace = "     "
      end
      if 99 < attack_type.shots then
        shotspace = "    "
      end
      if 999 < attack_type.shots then
        shotspace = "   "
      end
      if 9999 < attack_type.shots then
        shotspace = "  "
      end
      local damagepace = "       "
      if 9 < attack_type.damage then
        damagepace = "      "
      end
      if 99 < attack_type.damage then
        damagepace = "     "
      end
      if 999 < attack_type.damage then
        damagepace = "    "
      end
      if 9999 < attack_type.damage then
        damagepace = "   "
      end
      if attack_type.damage > 99999 then
        damagepace = "  "
      end
      local percentage = 0
      if attack_type.shots ~= 0 then
        percentage = attack_type.hits / attack_type.shots * 100
      end
      if 100 < percentage then
        percentage = 100
      end
      if not failed then
        local txtc = attacktypetext .. "   " .. attack_type.hits .. hitspace .. attack_type.shots .. shotspace .. math.floor(attack_type.damage) .. damagepace .. string.format("%02d", percentage) .. "%"
        HUD.PrintXY(w / 2 - twa / 2, h / 2 + statsos - center, txtc, "courbd", 225, 255, 255, 20)
        statsos = statsos + HUD.GetTextHeight()
        totaldamage = totaldamage + attack_type.damage
      else
      end
    end
    txt = " Total Damage Given: " .. tostring(math.floor(totaldamage))
    HUD.DrawQuadRGBA(nil, w / 2 - twa / 2, h / 2 + Hud.StatsPos - center, twa, HUD.GetTextHeight() * 1.3, 50, 50, 50, 120)
    HUD.PrintXY(w / 2 - twa / 2, h / 2 + HUD.GetTextHeight() * 0.25 + Hud.StatsPos - center, txt, "courbd", 225, 255, 255, 20)
  else
  end
  Hud.StatsPos = statsos
end
