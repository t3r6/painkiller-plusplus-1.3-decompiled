Hud = {}

function Hud:DrawScoreboard()
  if not Hud then
    return
  end
  local w, h = R3D.ScreenSize()
  local largefont = math.floor(0.1 * h)
  if Cfg.ScoreboardFontSize == nil then
    Cfg.ScoreboardFontSize = 20
  end
  local mediumactualfont = Cfg.ScoreboardFontSize
  local smallfont = 24
  local font = "Impact"
  local bigfont = "Impact"
  local linespacing = 1.2
  local fontfactor = h / 600
  mediumfont = mediumactualfont * fontfactor
  local vspace = mediumfont * linespacing - mediumfont
  local xborder = 0
  local yborder = 0
  local redscorepanel = {
    x = 0.05,
    y = 0.15,
    w = 0.445,
    d = 0.1
  }
  local bluescorepanel = {
    x = 0.5,
    y = 0.15,
    w = 0.445,
    d = 0.1
  }
  local redteampanel = {
    x = 0.05,
    y = 0.26,
    w = 0.445,
    d = 0.3
  }
  local blueteampanel = {
    x = 0.5,
    y = 0.26,
    w = 0.445,
    d = 0.3
  }
  local spec1teampanel = {
    x = 0.05,
    y = 0.57,
    w = 0.445,
    d = 0.2
  }
  local spec2teampanel = {
    x = 0.5,
    y = 0.57,
    w = 0.445,
    d = 0.2
  }
  local ffateampanel = {
    x = 0.1,
    y = 0.15,
    w = 0.8,
    d = 0.4
  }
  local specteampanel = {
    x = 0.1,
    y = 0.56,
    w = 0.8,
    d = 0.2
  }
  local scorefraction = {
    score = 0.05,
    ping = 0.35,
    count = 0.65
  }
  local panelfraction = {
    score = 0.05,
    net = 0.2,
    ping = 0.3,
    time = 0.45,
    state = 0.55,
    name = 0.625
  }
  local timedate = {x = 0.05, y = 0.8}
  local botcount = 0
  local playercount = 0
  local bluecount = 0
  local redcount = 0
  local speccount = 0
  for i, ps in Game.PlayerStats, nil do
    if ps.Spectator == 0 then
      playercount = playercount + 1
    end
    if ps.Team == 0 and ps.Spectator == 0 then
      bluecount = bluecount + 1
    end
    if ps.Team == 1 and ps.Spectator == 0 then
      redcount = redcount + 1
    end
    if ps.ClientID >= 666 and ps.Spectator == 0 then
      botcount = botcount + 1
    end
    if ps.Spectator == 1 then
      speccount = speccount + 1
    end
  end
  local maxplayercount = redcount
  if bluecount > redcount then
    maxplayercount = bluecount
  end
  if 5 < maxplayercount then
    redteampanel.d = redteampanel.d + (maxplayercount - 5) * linespacing * mediumfont / h
  end
  if 5 < maxplayercount then
    blueteampanel.d = blueteampanel.d + (maxplayercount - 5) * linespacing * mediumfont / h
  end
  if 5 < maxplayercount then
    spec1teampanel.y = spec1teampanel.y + (maxplayercount - 5) * linespacing * mediumfont / h
  end
  if 5 < maxplayercount then
    spec2teampanel.y = spec2teampanel.y + (maxplayercount - 5) * linespacing * mediumfont / h
  end
  if 2 < speccount then
    spec1teampanel.d = spec1teampanel.d + (speccount - 2) * linespacing * mediumfont / h
  end
  if 2 < speccount then
    spec2teampanel.d = spec2teampanel.d + (speccount - 2) * linespacing * mediumfont / h
  end
  if 8 < playercount then
    ffateampanel.d = ffateampanel.d + (playercount - 8) * linespacing * mediumfont / h
  end
  if 8 < playercount then
    specteampanel.y = specteampanel.y + (playercount - 8) * linespacing * mediumfont / h
  end
  if 4 < speccount then
    specteampanel.d = specteampanel.d + (speccount - 4) * linespacing * mediumfont / h
  end
  local trans = HUD.GetTransparency()
  HUD.PrintXY(w * timedate.x, h * timedate.y, "PK++ MOD Client - " .. os.date("%d/%m/%y %X", os.time()), font, 255, 255, 255, smallfont)
  if (not MPGameRules[MPCfg.GameMode] or not MPGameRules[MPCfg.GameMode].Teams) and MPCfg.GameMode ~= "Duel" then
    HUD.DrawQuadRGBA(Hud._matBluePix, w * ffateampanel.x, h * ffateampanel.y, w * ffateampanel.w, h * ffateampanel.d, 255, 255, 255, 960)
    HUD.DrawQuadRGBA(Hud._matBluePix, w * ffateampanel.x, h * ffateampanel.y, w * ffateampanel.w, mediumfont, 255, 255, 255, 960)
    HUD.DrawQuadRGBA(Hud._matBluePix, w * ffateampanel.x, h * ffateampanel.y, w * ffateampanel.w, mediumfont, 255, 255, 255, 960)
    local ffascoredelta = 0
    HUD.PrintXY(w * ffateampanel.x + w * panelfraction.score * ffateampanel.w, h * ffateampanel.y + ffascoredelta + vspace, "Score", font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * ffateampanel.x + w * panelfraction.net * ffateampanel.w, h * ffateampanel.y + ffascoredelta + vspace, "NET", font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * ffateampanel.x + w * panelfraction.ping * ffateampanel.w, h * ffateampanel.y + ffascoredelta + vspace, "Ping", font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * ffateampanel.x + w * panelfraction.time * ffateampanel.w, h * ffateampanel.y + ffascoredelta + vspace, "Time", font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * ffateampanel.x + w * panelfraction.name * ffateampanel.w, h * ffateampanel.y + ffascoredelta + vspace, "Name", font, 255, 255, 255, mediumactualfont)
    ffascoredelta = ffascoredelta + mediumfont * linespacing
    local idlist = {}
    for i, ps in Game.PlayerStats, nil do
      if ps.Spectator == 0 then
        idlist[i] = ps.ClientID
      end
    end
    for a in idlist, nil do
      for b in idlist, nil do
        if Game.PlayerStats[idlist[a]].Score > Game.PlayerStats[idlist[b]].Score then
          local temp = idlist[a]
          idlist[a] = idlist[b]
          idlist[b] = temp
        end
      end
    end
    for pie, ID in idlist, nil do
      if Game.PlayerStats[ID].Spectator == 0 then
        if Player and Player.ClientID == ID then
          HUD.DrawQuadRGBA(Hud._matBluePix, w * ffateampanel.x, h * ffateampanel.y + ffascoredelta, w * ffateampanel.w, mediumfont, 255, 255, 255, 960)
        end
        HUD.PrintXY(w * ffateampanel.x + w * panelfraction.score * ffateampanel.w, h * ffateampanel.y + ffascoredelta + vspace, Game.PlayerStats[ID].Score, font, 255, 255, 255, mediumactualfont)
        HUD.PrintXY(w * ffateampanel.x + w * panelfraction.net * ffateampanel.w, h * ffateampanel.y + ffascoredelta + vspace, Game.PlayerStats[ID].Score - Game.PlayerStats[ID].Deaths, font, 255, 255, 255, mediumactualfont)
        if Cfg.ScoreboardShowPacketLoss then
          HUD.PrintXY(w * ffateampanel.x + w * panelfraction.ping * ffateampanel.w, h * ffateampanel.y + ffascoredelta + vspace, Game.PlayerStats[ID].Ping .. " (" .. Game.PlayerStats[ID].PacketLoss .. ")", font, 255, 255, 255, mediumactualfont)
        else
          HUD.PrintXY(w * ffateampanel.x + w * panelfraction.ping * ffateampanel.w, h * ffateampanel.y + ffascoredelta + vspace, Game.PlayerStats[ID].Ping, font, 255, 255, 255, mediumactualfont)
        end
        HUD.PrintXY(w * ffateampanel.x + w * panelfraction.time * ffateampanel.w, h * ffateampanel.y + ffascoredelta + vspace, string.format("%02d", (INP.GetTime() - MPSTATS.GetPlayerTime(ID)) / 60), font, 255, 255, 255, mediumactualfont)
        local playerstate = ""
        if Game.PlayerStats[ID].State == 0 and (MPCfg.GameState == GameStates.WarmUp or MPCfg.GameState == GameStates.Counting) then
          playerstate = "(-)"
        end
        if Game.PlayerStats[ID].State == 1 and (MPCfg.GameState == GameStates.WarmUp or MPCfg.GameState == GameStates.Counting) then
          playerstate = "(R)"
        end
        if Game.PlayerStats[ID].State == 2 and (MPCfg.GameState == GameStates.WarmUp or MPCfg.GameState == GameStates.Counting) then
          playerstate = "(B)"
        end
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
        HUD.PrintXY(w * ffateampanel.x + w * panelfraction.state * ffateampanel.w, h * ffateampanel.y + ffascoredelta + vspace, playerstate, font, 255, 255, 255, mediumactualfont)
        HUD.PrintXY(w * ffateampanel.x + w * panelfraction.name * ffateampanel.w, h * ffateampanel.y + ffascoredelta + vspace, Game.PlayerStats[ID].Name, font, 255, 255, 255, mediumactualfont)
        ffascoredelta = ffascoredelta + mediumfont * linespacing
      end
    end
    local numberofspecsffa = 0
    for id, ps in Game.PlayerStats, nil do
      if ps.Spectator == 1 then
        numberofspecsffa = numberofspecsffa + 1
      end
    end
    HUD.DrawQuadRGBA(Hud._matGreenPix, w * specteampanel.x, h * specteampanel.y, w * specteampanel.w, h * specteampanel.d, 255, 255, 255, 960)
    HUD.DrawQuadRGBA(Hud._matGreenPix, w * specteampanel.x, h * specteampanel.y, w * specteampanel.w, mediumfont, 255, 255, 255, 960)
    local specscoredelta = 0
    HUD.PrintXY(w * specteampanel.x + w * panelfraction.score * specteampanel.w, h * specteampanel.y + specscoredelta + vspace, "Score", font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * specteampanel.x + w * panelfraction.net * specteampanel.w, h * specteampanel.y + specscoredelta + vspace, "NET", font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * specteampanel.x + w * panelfraction.ping * specteampanel.w, h * specteampanel.y + specscoredelta + vspace, "Ping", font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * specteampanel.x + w * panelfraction.time * specteampanel.w, h * specteampanel.y + specscoredelta + vspace, "Time", font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * specteampanel.x + w * panelfraction.name * specteampanel.w, h * specteampanel.y + specscoredelta + vspace, "Name", font, 255, 255, 255, mediumactualfont)
    specscoredelta = specscoredelta + mediumfont * linespacing
    for id, ps in Game.PlayerStats, nil do
      if ps.Spectator == 1 then
        HUD.PrintXY(w * specteampanel.x + w * panelfraction.score * specteampanel.w, h * specteampanel.y + specscoredelta + vspace, ps.Score, font, 255, 255, 255, mediumactualfont)
        HUD.PrintXY(w * specteampanel.x + w * panelfraction.net * specteampanel.w, h * specteampanel.y + specscoredelta + vspace, ps.Score - ps.Deaths, font, 255, 255, 255, mediumactualfont)
        if Cfg.ScoreboardShowPacketLoss then
          HUD.PrintXY(w * specteampanel.x + w * panelfraction.ping * specteampanel.w, h * specteampanel.y + specscoredelta + vspace, ps.Ping .. " (" .. ps.PacketLoss .. ")", font, 255, 255, 255, mediumactualfont)
        else
          HUD.PrintXY(w * specteampanel.x + w * panelfraction.ping * specteampanel.w, h * specteampanel.y + specscoredelta + vspace, ps.Ping, font, 255, 255, 255, mediumactualfont)
        end
        HUD.PrintXY(w * specteampanel.x + w * panelfraction.time * specteampanel.w, h * specteampanel.y + specscoredelta + vspace, string.format("%02d", (INP.GetTime() - MPSTATS.GetPlayerTime(ps.ClientID)) / 60), font, 255, 255, 255, mediumactualfont)
        HUD.PrintXY(w * specteampanel.x + w * panelfraction.name * specteampanel.w, h * specteampanel.y + specscoredelta + vspace, ps.Name, font, 255, 255, 255, mediumactualfont)
        specscoredelta = specscoredelta + mediumfont * linespacing
      end
    end
  else
    HUD.DrawQuadRGBA(Hud._matBluePix, w * redscorepanel.x, h * redscorepanel.y, w * redscorepanel.w, h * redscorepanel.d, 255, 255, 255, 960)
    HUD.DrawQuadRGBA(Hud._matRedPix, w * bluescorepanel.x, h * bluescorepanel.y, w * bluescorepanel.w, h * bluescorepanel.d, 255, 255, 255, 960)
    HUD.DrawQuadRGBA(Hud._matBluePix, w * redscorepanel.x, h * redscorepanel.y, w * redscorepanel.w, h * redscorepanel.d, 255, 255, 255, 960)
    HUD.DrawQuadRGBA(Hud._matRedPix, w * bluescorepanel.x, h * bluescorepanel.y, w * bluescorepanel.w, h * bluescorepanel.d, 255, 255, 255, 960)
    HUD.DrawQuadRGBA(Hud._matBluePix, w * redscorepanel.x, h * redscorepanel.y, w * redscorepanel.w, h * redscorepanel.d, 255, 255, 255, 960)
    HUD.DrawQuadRGBA(Hud._matRedPix, w * bluescorepanel.x, h * bluescorepanel.y, w * bluescorepanel.w, h * bluescorepanel.d, 255, 255, 255, 960)
    HUD.DrawQuadRGBA(Hud._matBluePix, w * redteampanel.x, h * redteampanel.y, w * redteampanel.w, h * redteampanel.d, 255, 255, 255, 960)
    HUD.DrawQuadRGBA(Hud._matRedPix, w * blueteampanel.x, h * blueteampanel.y, w * blueteampanel.w, h * blueteampanel.d, 255, 255, 255, 960)
    HUD.DrawQuadRGBA(Hud._matGreenPix, w * spec1teampanel.x, h * spec1teampanel.y, w * spec1teampanel.w, h * spec1teampanel.d, 255, 255, 255, 960)
    HUD.DrawQuadRGBA(Hud._matGreenPix, w * spec2teampanel.x, h * spec2teampanel.y, w * spec2teampanel.w, h * spec2teampanel.d, 255, 255, 255, 960)
    local bluescore = 0
    local blueping = 0
    local bluecount = 0
    for id, ps in Game.PlayerStats, nil do
      if ps.Spectator == 0 and ps.Team == 1 then
        bluescore = bluescore + ps.Score
        blueping = blueping + ps.Ping
        bluecount = bluecount + 1
      end
    end
    if bluecount ~= 0 then
      blueping = math.floor(blueping / bluecount)
    end
    local redscore = 0
    local redping = 0
    local redcount = 0
    for id, ps in Game.PlayerStats, nil do
      if ps.Spectator == 0 and ps.Team == 0 then
        redscore = redscore + ps.Score
        redping = redping + ps.Ping
        redcount = redcount + 1
      end
    end
    if redcount ~= 0 then
      redping = math.floor(redping / redcount)
    end
    bluescore = Game._team2Score
    redscore = Game._team1Score
    local dueller1 = -1
    local dueller2 = -1
    for i, ps in Game.PlayerStats, nil do
      if ps.Spectator == 0 and dueller1 ~= -1 then
        dueller2 = ps.ClientID
      end
      if ps.Spectator == 0 and dueller1 == -1 then
        dueller1 = ps.ClientID
      end
    end
    if MPCfg.GameMode == "Duel" and 0 <= dueller1 then
      bluescore = Game.PlayerStats[dueller1].Score
      blueping = Game.PlayerStats[dueller1].Ping
      bluecount = 1
    end
    if MPCfg.GameMode == "Duel" and 0 <= dueller2 then
      redscore = Game.PlayerStats[dueller2].Score
      redping = Game.PlayerStats[dueller2].Ping
      redcount = 1
    end
    HUD.PrintXY(w * redscorepanel.x + w * scorefraction.score * redscorepanel.w, h * redscorepanel.y + h * redscorepanel.d * 0.1, redscore, bigfont, 255, 255, 255, largefont)
    HUD.PrintXY(w * redscorepanel.x + w * scorefraction.ping * redscorepanel.w, h * redscorepanel.y + largefont / 1.5, "Av. Ping: " .. redping, font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * redscorepanel.x + w * scorefraction.count * redscorepanel.w, h * redscorepanel.y + largefont / 1.5, "Players: " .. redcount, font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * bluescorepanel.x + w * scorefraction.score * bluescorepanel.w, h * bluescorepanel.y + h * bluescorepanel.d * 0.1, bluescore, bigfont, 255, 255, 255, largefont)
    HUD.PrintXY(w * bluescorepanel.x + w * scorefraction.ping * bluescorepanel.w, h * bluescorepanel.y + largefont / 1.5, "Av. Ping: " .. blueping, font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * bluescorepanel.x + w * scorefraction.count * bluescorepanel.w, h * bluescorepanel.y + largefont / 1.5, "Players: " .. bluecount, font, 255, 255, 255, mediumactualfont)
    local redscoredelta = 0
    HUD.DrawQuadRGBA(Hud._matGreenPix, w * redteampanel.x, h * redteampanel.y, w * redteampanel.w, mediumfont, 255, 255, 255, 960)
    HUD.PrintXY(w * redteampanel.x + w * panelfraction.score * redteampanel.w, h * redteampanel.y + redscoredelta + vspace, "Score", font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * redteampanel.x + w * panelfraction.net * redteampanel.w, h * redteampanel.y + redscoredelta + vspace, "NET", font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * redteampanel.x + w * panelfraction.ping * redteampanel.w, h * redteampanel.y + redscoredelta + vspace, "Ping", font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * redteampanel.x + w * panelfraction.time * redteampanel.w, h * redteampanel.y + redscoredelta + vspace, "Time", font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * redteampanel.x + w * panelfraction.name * redteampanel.w, h * redteampanel.y + redscoredelta + vspace, "Name", font, 255, 255, 255, mediumactualfont)
    redscoredelta = redscoredelta + mediumfont * linespacing
    local redidlist = {}
    for i, ps in Game.PlayerStats, nil do
      if ps.Spectator == 0 then
        redidlist[i] = ps.ClientID
      end
    end
    for a in redidlist, nil do
      for b in redidlist, nil do
        if Game.PlayerStats[redidlist[a]].Score > Game.PlayerStats[redidlist[b]].Score then
          local temp = redidlist[a]
          redidlist[a] = redidlist[b]
          redidlist[b] = temp
        end
      end
    end
    for pie, ID in redidlist, nil do
      if Game.PlayerStats[ID].Spectator == 0 and Game.PlayerStats[ID].Team == 0 and MPCfg.GameMode ~= "Duel" or MPCfg.GameMode == "Duel" and Game.PlayerStats[ID].ClientID == dueller2 then
        if Player and Player.ClientID == ID then
          HUD.DrawQuadRGBA(Hud._matBluePix, w * redteampanel.x, h * redteampanel.y + redscoredelta, w * redteampanel.w, mediumfont, 255, 255, 255, 960)
        end
        HUD.PrintXY(w * redteampanel.x + w * panelfraction.score * redteampanel.w, h * redteampanel.y + redscoredelta + vspace, Game.PlayerStats[ID].Score, font, 255, 255, 255, mediumactualfont)
        HUD.PrintXY(w * redteampanel.x + w * panelfraction.net * redteampanel.w, h * redteampanel.y + redscoredelta + vspace, Game.PlayerStats[ID].Score - Game.PlayerStats[ID].Deaths, font, 255, 255, 255, mediumactualfont)
        if Cfg.ScoreboardShowPacketLoss then
          HUD.PrintXY(w * redteampanel.x + w * panelfraction.ping * redteampanel.w, h * redteampanel.y + redscoredelta + vspace, Game.PlayerStats[ID].Ping .. " (" .. Game.PlayerStats[ID].PacketLoss .. ")", font, 255, 255, 255, mediumactualfont)
        else
          HUD.PrintXY(w * redteampanel.x + w * panelfraction.ping * redteampanel.w, h * redteampanel.y + redscoredelta + vspace, Game.PlayerStats[ID].Ping, font, 255, 255, 255, mediumactualfont)
        end
        HUD.PrintXY(w * redteampanel.x + w * panelfraction.time * redteampanel.w, h * redteampanel.y + redscoredelta + vspace, string.format("%02d", (INP.GetTime() - MPSTATS.GetPlayerTime(ID)) / 60), font, 255, 255, 255, mediumactualfont)
        HUD.PrintXY(w * redteampanel.x + w * panelfraction.name * redteampanel.w, h * redteampanel.y + redscoredelta + vspace, Game.PlayerStats[ID].Name, font, 255, 255, 255, mediumactualfont)
        local playerstate = ""
        if Game.PlayerStats[ID].State == 0 and (MPCfg.GameState == GameStates.WarmUp or MPCfg.GameState == GameStates.Counting) then
          playerstate = "-"
        elseif Game.PlayerStats[ID].State == 1 and (MPCfg.GameState == GameStates.WarmUp or MPCfg.GameState == GameStates.Counting) then
          playerstate = "R"
        elseif Game.PlayerStats[ID].State == 2 and (MPCfg.GameState == GameStates.WarmUp or MPCfg.GameState == GameStates.Counting) then
          playerstate = "B"
        end
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
        HUD.PrintXY(w * redteampanel.x + w * panelfraction.state * redteampanel.w, h * redteampanel.y + redscoredelta + vspace, playerstate, font, 255, 255, 255, mediumactualfont)
        redscoredelta = redscoredelta + mediumfont * linespacing
      end
    end
    local bluescoredelta = 0
    HUD.DrawQuadRGBA(Hud._matGreenPix, w * blueteampanel.x, h * blueteampanel.y, w * blueteampanel.w, mediumfont, 255, 255, 255, 960)
    HUD.PrintXY(w * blueteampanel.x + w * panelfraction.score * blueteampanel.w, h * blueteampanel.y + bluescoredelta + vspace, "Score", font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * blueteampanel.x + w * panelfraction.net * blueteampanel.w, h * blueteampanel.y + bluescoredelta + vspace, "NET", font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * blueteampanel.x + w * panelfraction.ping * blueteampanel.w, h * blueteampanel.y + bluescoredelta + vspace, "Ping", font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * blueteampanel.x + w * panelfraction.time * blueteampanel.w, h * blueteampanel.y + bluescoredelta + vspace, "Time", font, 255, 255, 255, mediumactualfont)
    HUD.PrintXY(w * blueteampanel.x + w * panelfraction.name * blueteampanel.w, h * blueteampanel.y + bluescoredelta + vspace, "Name", font, 255, 255, 255, mediumactualfont)
    bluescoredelta = bluescoredelta + mediumfont * linespacing
    local blueidlist = {}
    for i, ps in Game.PlayerStats, nil do
      if ps.Spectator == 0 then
        blueidlist[i] = ps.ClientID
      end
    end
    for a in blueidlist, nil do
      for b in blueidlist, nil do
        if Game.PlayerStats[blueidlist[a]].Score > Game.PlayerStats[blueidlist[b]].Score then
          local temp = blueidlist[a]
          blueidlist[a] = blueidlist[b]
          blueidlist[b] = temp
        end
      end
    end
    for pie, ID in blueidlist, nil do
      if Game.PlayerStats[ID].Spectator == 0 and Game.PlayerStats[ID].Team == 1 and MPCfg.GameMode ~= "Duel" or MPCfg.GameMode == "Duel" and Game.PlayerStats[ID].ClientID == dueller1 then
        if Player and Player.ClientID == ID then
          HUD.DrawQuadRGBA(Hud._matRedPix, w * blueteampanel.x, h * blueteampanel.y + bluescoredelta, w * blueteampanel.w, mediumfont, 255, 255, 255, 960)
        end
        HUD.PrintXY(w * blueteampanel.x + w * panelfraction.score * blueteampanel.w, h * blueteampanel.y + bluescoredelta + vspace, Game.PlayerStats[ID].Score, font, 255, 255, 255, mediumactualfont)
        HUD.PrintXY(w * blueteampanel.x + w * panelfraction.net * blueteampanel.w, h * blueteampanel.y + bluescoredelta + vspace, Game.PlayerStats[ID].Score - Game.PlayerStats[ID].Deaths, font, 255, 255, 255, mediumactualfont)
        if Cfg.ScoreboardShowPacketLoss then
          HUD.PrintXY(w * blueteampanel.x + w * panelfraction.ping * blueteampanel.w, h * blueteampanel.y + bluescoredelta + vspace, Game.PlayerStats[ID].Ping .. " (" .. Game.PlayerStats[ID].PacketLoss .. ")", font, 255, 255, 255, mediumactualfont)
        else
          HUD.PrintXY(w * blueteampanel.x + w * panelfraction.ping * blueteampanel.w, h * blueteampanel.y + bluescoredelta + vspace, Game.PlayerStats[ID].Ping, font, 255, 255, 255, mediumactualfont)
        end
        HUD.PrintXY(w * blueteampanel.x + w * panelfraction.time * blueteampanel.w, h * blueteampanel.y + bluescoredelta + vspace, string.format("%02d", (INP.GetTime() - MPSTATS.GetPlayerTime(ID)) / 60), font, 255, 255, 255, mediumactualfont)
        HUD.PrintXY(w * blueteampanel.x + w * panelfraction.name * blueteampanel.w, h * blueteampanel.y + bluescoredelta + vspace, Game.PlayerStats[ID].Name, font, 255, 255, 255, mediumactualfont)
        local playerstate = ""
        if Game.PlayerStats[ID].State == 0 and (MPCfg.GameState == GameStates.WarmUp or MPCfg.GameState == GameStates.Counting) then
          playerstate = "-"
        elseif Game.PlayerStats[ID].State == 1 and (MPCfg.GameState == GameStates.WarmUp or MPCfg.GameState == GameStates.Counting) then
          playerstate = "R"
        elseif Game.PlayerStats[ID].State == 2 and (MPCfg.GameState == GameStates.WarmUp or MPCfg.GameState == GameStates.Counting) then
          playerstate = "B"
        end
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
        HUD.PrintXY(w * blueteampanel.x + w * panelfraction.state * blueteampanel.w, h * blueteampanel.y + bluescoredelta + vspace, playerstate, font, 255, 255, 255, mediumactualfont)
        bluescoredelta = bluescoredelta + mediumfont * linespacing
      end
    end
    local numberofspecs = 0
    for id, ps in Game.PlayerStats, nil do
      if ps.Spectator == 1 then
        numberofspecs = numberofspecs + 1
      end
    end
    if 0 < numberofspecs then
      HUD.DrawQuadRGBA(Hud._matGreenPix, w * spec1teampanel.x, h * spec1teampanel.y, w * spec1teampanel.w, mediumfont, 255, 255, 255, 960)
      HUD.DrawQuadRGBA(Hud._matGreenPix, w * spec2teampanel.x, h * spec2teampanel.y, w * spec2teampanel.w, mediumfont, 255, 255, 255, 960)
      local odd = 0
      odd = 1
      local spec1scoredelta = 0
      HUD.PrintXY(w * spec1teampanel.x + w * panelfraction.score * spec1teampanel.w, h * spec1teampanel.y + spec1scoredelta + vspace, "Score", font, 255, 255, 255, mediumactualfont)
      HUD.PrintXY(w * spec1teampanel.x + w * panelfraction.net * spec1teampanel.w, h * spec1teampanel.y + spec1scoredelta + vspace, "NET", font, 255, 255, 255, mediumactualfont)
      HUD.PrintXY(w * spec1teampanel.x + w * panelfraction.ping * spec1teampanel.w, h * spec1teampanel.y + spec1scoredelta + vspace, "Ping", font, 255, 255, 255, mediumactualfont)
      HUD.PrintXY(w * spec1teampanel.x + w * panelfraction.time * spec1teampanel.w, h * spec1teampanel.y + spec1scoredelta + vspace, "Time", font, 255, 255, 255, mediumactualfont)
      HUD.PrintXY(w * spec1teampanel.x + w * panelfraction.name * spec1teampanel.w, h * spec1teampanel.y + spec1scoredelta + vspace, " Name", font, 255, 255, 255, mediumactualfont)
      spec1scoredelta = spec1scoredelta + mediumfont * linespacing
      for id, ps in Game.PlayerStats, nil do
        if ps.Spectator == 1 then
          if Player and Player.ClientID == ps.ClientID then
            HUD.DrawQuadRGBA(Hud._matGreenPix, w * spec1teampanel.x, h * spec1teampanel.y + spec1scoredelta, w * spec1teampanel.w, mediumfont, 255, 255, 255, 960)
          end
          HUD.PrintXY(w * spec1teampanel.x + w * panelfraction.score * spec1teampanel.w, h * spec1teampanel.y + spec1scoredelta + vspace, ps.Score, font, 255, 255, 255, mediumactualfont)
          HUD.PrintXY(w * spec1teampanel.x + w * panelfraction.net * spec1teampanel.w, h * spec1teampanel.y + spec1scoredelta + vspace, ps.Score - ps.Deaths, font, 255, 255, 255, mediumactualfont)
          if Cfg.ScoreboardShowPacketLoss then
            HUD.PrintXY(w * spec1teampanel.x + w * panelfraction.ping * spec1teampanel.w, h * spec1teampanel.y + spec1scoredelta + vspace, ps.Ping .. " (" .. ps.PacketLoss .. ")", font, 255, 255, 255, mediumactualfont)
          else
            HUD.PrintXY(w * spec1teampanel.x + w * panelfraction.ping * spec1teampanel.w, h * spec1teampanel.y + spec1scoredelta + vspace, ps.Ping, font, 255, 255, 255, mediumactualfont)
          end
          HUD.PrintXY(w * spec1teampanel.x + w * panelfraction.time * spec1teampanel.w, h * spec1teampanel.y + spec1scoredelta + vspace, string.format("%02d", (INP.GetTime() - MPSTATS.GetPlayerTime(ps.ClientID)) / 60), font, 255, 255, 255, mediumactualfont)
          HUD.PrintXY(w * spec1teampanel.x + w * panelfraction.name * spec1teampanel.w, h * spec1teampanel.y + spec1scoredelta + vspace, ps.Name, font, 255, 255, 255, mediumactualfont)
          spec1scoredelta = spec1scoredelta + mediumfont * linespacing
          odd = odd + 1
          if 1 < odd then
            odd = 0
          end
        end
      end
      if 1 < numberofspecs then
        odd = 0
        local spec2scoredelta = 0
        HUD.PrintXY(w * spec2teampanel.x + w * panelfraction.score * spec2teampanel.w, h * spec2teampanel.y + spec2scoredelta + vspace, "Score", font, 255, 255, 255, mediumactualfont)
        HUD.PrintXY(w * spec2teampanel.x + w * panelfraction.net * spec2teampanel.w, h * spec2teampanel.y + spec2scoredelta + vspace, "NET", font, 255, 255, 255, mediumactualfont)
        HUD.PrintXY(w * spec2teampanel.x + w * panelfraction.ping * spec2teampanel.w, h * spec2teampanel.y + spec2scoredelta + vspace, "Ping", font, 255, 255, 255, mediumactualfont)
        HUD.PrintXY(w * spec2teampanel.x + w * panelfraction.time * spec2teampanel.w, h * spec2teampanel.y + spec2scoredelta + vspace, "Time", font, 255, 255, 255, mediumactualfont)
        HUD.PrintXY(w * spec2teampanel.x + w * panelfraction.name * spec2teampanel.w, h * spec2teampanel.y + spec2scoredelta + vspace, "Name", font, 255, 255, 255, mediumactualfont)
        spec2scoredelta = spec2scoredelta + mediumfont * linespacing
        for id, ps in Game.PlayerStats, nil do
          if ps.Spectator == 1 and odd == 1 then
            if Player and Player.ClientID == ps.ClientID then
              HUD.DrawQuadRGBA(Hud._matGreenPix, w * spec2teampanel.x, h * spec2teampanel.y + spec2scoredelta, w * spec2teampanel.w, mediumfont, 255, 255, 255, 960)
            end
            HUD.PrintXY(w * spec2teampanel.x + w * panelfraction.score * spec2teampanel.w, h * spec2teampanel.y + spec2scoredelta + vspace, ps.Score, font, 255, 255, 255, mediumactualfont)
            HUD.PrintXY(w * spec2teampanel.x + w * panelfraction.net * spec2teampanel.w, h * spec2teampanel.y + spec2scoredelta + vspace, ps.Score - ps.Deaths, font, 255, 255, 255, mediumactualfont)
            if Cfg.ScoreboardShowPacketLoss then
              HUD.PrintXY(w * spec2teampanel.x + w * panelfraction.ping * spec2teampanel.w, h * spec2teampanel.y + spec2scoredelta + vspace, ps.Ping .. " (" .. ps.PacketLoss .. ")", font, 255, 255, 255, mediumactualfont)
            else
              HUD.PrintXY(w * spec2teampanel.x + w * panelfraction.ping * spec2teampanel.w, h * spec2teampanel.y + spec2scoredelta + vspace, ps.Ping, font, 255, 255, 255, mediumactualfont)
            end
            HUD.PrintXY(w * spec2teampanel.x + w * panelfraction.time * spec2teampanel.w, h * spec2teampanel.y + spec2scoredelta + vspace, string.format("%02d", (INP.GetTime() - MPSTATS.GetPlayerTime(ps.ClientID)) / 60), font, 255, 255, 255, mediumactualfont)
            HUD.PrintXY(w * spec2teampanel.x + w * panelfraction.name * spec2teampanel.w, h * spec2teampanel.y + spec2scoredelta + vspace, ps.Name, font, 255, 255, 255, mediumactualfont)
            spec2scoredelta = spec2scoredelta + mediumfont * linespacing
            odd = odd + 1
            if 1 < odd then
              odd = 0
            end
          end
        end
      end
    end
  end
end
