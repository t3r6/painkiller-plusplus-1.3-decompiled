function Console:Cmd_STATSALL(player)
  for i, ps in Game.PlayerStats, nil do
    CONSOLE_AddMessage(Game:StatsText(ps.ClientID))
  end
end

function Console:Cmd_STATSDUMP(filename)
  Game.DumpNextStats = true
  if Game:IsServer() then
    Console:Cmd_PRINTSTATSALL()
  else
    Game:Client2ServerCommand("CMD:UPDATESTATSALL")
  end
end

function Game:WriteStats(filename)
  if filename == nil then
    filename = "stats"
  end
  filename = os.date("%m-%d-%y", os.time()) .. "-" .. filename .. ".txt"
  local file = io.open(filename, "a")
  if not file then
    return
  end
  file:write("***PK STATS***" .. "\n" .. "\n")
  file:write("Date: " .. os.date("%m-%d-%y %X", os.time()) .. "\n")
  file:write("Map: " .. Lev._Name .. "" .. "\n")
  file:write("GameMode: " .. MPCfg.GameMode .. "" .. "\n" .. "\n")
  for i, ps in Game.PlayerStats, nil do
    local txt = Game:StatsText(ps.ClientID)
    file:write(txt)
  end
  file:write("***END OF STATS***" .. "\n" .. "\n")
  CONSOLE_AddMessage("Stats written to /Bin/" .. filename)
  io.close(file)
end

function Console:Cmd_PRINTSTATSALL()
  for i, ps in Game.PlayerStats, nil do
    CONSOLE_AddMessage(Game:StatsText(ps.ClientID))
  end
  if Game.DumpNextStats then
    Game.DumpNextStats = nil
    Game:WriteStats()
  end
end

function Console:Cmd_STATS(player)
  if Game:IsServer() then
    Console:Cmd_PRINTSTATSALL()
  else
    Game:Client2ServerCommand("CMD:UPDATESTATSALL")
  end
end

function Game:StatsText(statsplayer)
  local txt = ""
  local totaldamage = 0
  if Game.Stats[statsplayer] ~= nil then
    txt = txt .. "Weapon Statistics for " .. Game.PlayerStats[statsplayer].Name .. "\n" .. "\n"
    txt = txt .. "Attacktype        Hits  Shots  Damage  Efficiency" .. "\n"
    for i, attack_type in Game.Stats[statsplayer].PlayerWepStats, nil do
      local failed = false
      local attacktypetext = ""
      if attack_type.attacktype == 1 then
        attacktypetext = "Shotgun        "
      end
      if attack_type.attacktype == 2 then
        attacktypetext = "Grenade        "
      end
      if attack_type.attacktype == 3 then
        attacktypetext = "Rocket         "
      end
      if attack_type.attacktype == 4 then
        attacktypetext = "OutOfLevel     "
      end
      if attack_type.attacktype == 5 then
        attacktypetext = "MiniGun        "
      end
      if attack_type.attacktype == 6 then
        attacktypetext = "Fire           "
      end
      if attack_type.attacktype == 7 then
        attacktypetext = "Explosion      "
      end
      if attack_type.attacktype == 8 then
        attacktypetext = "Poison         "
      end
      if attack_type.attacktype == 9 then
        attacktypetext = "Bubble         "
      end
      if attack_type.attacktype == 10 then
        attacktypetext = "Stake          "
      end
      if attack_type.attacktype == 11 then
        attacktypetext = "Painkiller     "
      end
      if attack_type.attacktype == 12 then
        attacktypetext = "HitGround      "
      end
      if attack_type.attacktype == 13 then
        attacktypetext = "TeleFrag       "
      end
      if attack_type.attacktype == 14 then
        attacktypetext = "Suicide        "
      end
      if attack_type.attacktype == 15 then
        attacktypetext = "StickyBomb     "
      end
      if attack_type.attacktype == 16 then
        attacktypetext = "Step           "
      end
      if attack_type.attacktype == 17 then
        attacktypetext = "AIClose        "
      end
      if attack_type.attacktype == 18 then
        attacktypetext = "AIFar          "
      end
      if attack_type.attacktype == 19 then
        attacktypetext = "Shuriken       "
      end
      if attack_type.attacktype == 20 then
        attacktypetext = "Physics        "
      end
      if attack_type.attacktype == 21 then
        attacktypetext = "Stone          "
      end
      if attack_type.attacktype == 22 then
        attacktypetext = "Demon          "
      end
      if attack_type.attacktype == 23 then
        attacktypetext = "Electro        "
      end
      if attack_type.attacktype == 24 then
        attacktypetext = "PainkillerRotor"
      end
      if attack_type.attacktype == 25 then
        attacktypetext = "Fireball       "
      end
      if attack_type.attacktype == 26 then
        attacktypetext = "ItemCollision  "
      end
      if attack_type.attacktype == 27 then
        attacktypetext = "Tank           "
      end
      if attack_type.attacktype == 28 then
        attacktypetext = "Lava           "
      end
      if attack_type.attacktype == 29 then
        attacktypetext = "ConsoleKill    "
      end
      if attack_type.attacktype == 30 then
        attacktypetext = "Hurt_Pent      "
      end
      if attack_type.attacktype == 31 then
        attacktypetext = "Rifle          "
      end
      if attack_type.attacktype == 32 then
        attacktypetext = "FlameThrower   "
      end
      if attack_type.attacktype == 33 then
        attacktypetext = "Flag           "
      end
      if attack_type.attacktype == 34 then
        attacktypetext = "BoltStick      "
      end
      if attack_type.attacktype == 35 then
        attacktypetext = "HeaterBomb     "
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
      local shotspace = "     "
      if 9 < attack_type.shots then
        shotspace = "    "
      end
      if 99 < attack_type.shots then
        shotspace = "   "
      end
      if 999 < attack_type.shots then
        shotspace = "  "
      end
      if 9999 < attack_type.shots then
        shotspace = " "
      end
      local damagepace = "      "
      if 9 < attack_type.damage then
        damagepace = "     "
      end
      if 99 < attack_type.damage then
        damagepace = "    "
      end
      if 999 < attack_type.damage then
        damagepace = "   "
      end
      if 9999 < attack_type.damage then
        damagepace = "  "
      end
      if attack_type.damage > 99999 then
        damagepace = " "
      end
      local percentage = 0
      if attack_type.shots ~= 0 then
        percentage = attack_type.hits / attack_type.shots * 100
      end
      if 100 < percentage then
        percentage = 100
      end
      if not failed then
        txt = txt .. attacktypetext .. "   " .. attack_type.hits .. hitspace .. attack_type.shots .. shotspace .. math.floor(attack_type.damage) .. damagepace .. string.format("%02d", percentage) .. "%" .. "\n"
        totaldamage = totaldamage + attack_type.damage
      else
        txt = txt .. "failed due to blah"
      end
    end
    txt = txt .. "\n"
    txt = txt .. "Total Damage Given: " .. tostring(math.floor(totaldamage)) .. "\n"
  else
  end
  txt = txt .. "\n"
  return txt
end

function Console:Cmd_TEAMLOCK(enable)
  if enable == "1" then
    MPCfg.TeamLock = true
    CONSOLE_AddMessage("State: TeamLock is currently enabled.")
    return
  end
  if enable == "0" then
    MPCfg.TeamLock = false
    CONSOLE_AddMessage("State: TeamLock is currently disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: TeamLock [0/1]")
  CONSOLE_AddMessage("Help: Locks the game to new players.")
  if MPCfg.TeamLock then
    CONSOLE_AddMessage("State: TeamLock is currently enabled.")
  else
    CONSOLE_AddMessage("State: TeamLock is currently disabled.")
  end
end

function CONSOLE_AddMessage(txt, color)
  CONSOLE.AddMessage(txt, color)
  if Cfg.Logging then
    Logfile:Write(txt)
  end
end

function Console:Cmd_ALLUNREADY()
  if Game:IsServer() then
    for i, ps in Game.PlayerStats, nil do
      if ps and ps.Spectator == 0 then
        ps.State = 0
      end
    end
  end
end

function Console:Cmd_ALLREADY()
  if Game:IsServer() then
    for i, ps in Game.PlayerStats, nil do
      if ps and ps.Spectator == 0 then
        ps.State = 1
      end
    end
  end
end

function Console:Cmd_BREAKMATCH()
  if Game:IsServer() then
    for i, ps in Game.PlayerStats, nil do
      if ps and ps.Spectator == 0 then
        ps.State = 2
      end
    end
  end
end

function Console:Cmd_FORCESPECTATOR(clientid)
  if Game:IsServer() then
    clientid = tonumber(clientid)
    nr = 1
    if nr and (nr == 0 or nr == 1) and Game.GMode ~= GModes.SingleGame then
      local spec = true
      if nr == 0 then
        spec = false
      end
      if spec ~= NET.IsSpectator(clientid) and Game.PlayerStats[clientid] and not Game.PlayerStats[clientid].Bot then
        if NET.IsPlayingRecording() then
          if nr == 0 then
            GObjects:ToKill(Game._procSpec)
            Game._procSpec = nil
            Player = Game._spectatorRecordingPlayer
          elseif Game.PlayerStats[clientid] and not Game.PlayerStats[clientid].Bot then
            GObjects:ToKill(Game._procStats)
            Game._procStats = nil
            Game._procSpec = GObjects:Add(TempObjName(), PSpectatorControler:New())
            Game._procSpec:Init()
            Game._spectatorRecordingPlayer = Game.PlayerStats[clientid].Player
            Game.PlayerStats[clientid].Player = nil
          end
          NET.SetSpectator(clientid, 1)
        else
          Game.PlayerSpectatorRequest(clientid, 1)
        end
      end
    end
  end
end

function Console:Cmd_FORCEJOIN(clientid)
  if Game:IsServer() then
    clientid = tonumber(clientid)
    nr = 0
    if nr and (nr == 0 or nr == 1) and Game.GMode ~= GModes.SingleGame then
      local spec = true
      if nr == 0 then
        spec = false
      end
      if spec ~= NET.IsSpectator(clientid) and Game.PlayerStats[clientid] and not Game.PlayerStats[clientid].Bot then
        if NET.IsPlayingRecording() then
          if nr == 0 then
            GObjects:ToKill(Game._procSpec)
            Game._procSpec = nil
            Player = Game._spectatorRecordingPlayer
          elseif not Game.PlayerStats[clientid].Bot then
            GObjects:ToKill(Game._procStats)
            Game._procStats = nil
            Game._procSpec = GObjects:Add(TempObjName(), PSpectatorControler:New())
            Game._procSpec:Init()
            Game._spectatorRecordingPlayer = Game.PlayerStats[clientid].Player
            Game.PlayerStats[clientid].Player = nil
          end
          NET.SetSpectator(clientid, 0)
        else
          Game.PlayerSpectatorRequest(clientid, 0)
        end
      end
    end
  end
end

function Console:Cmd_DIRECTINPUT(enable)
  enable = tonumber(enable)
  if enable == 1 then
    Cfg.DirectInput = true
    INP.SetUseDInput(Cfg.DirectInput)
    CONSOLE_AddMessage("directinput is now enabled")
    return
  end
  if enable == 0 then
    Cfg.DirectInput = false
    INP.SetUseDInput(Cfg.DirectInput)
    CONSOLE_AddMessage("directinput is now disabled")
    return
  end
  CONSOLE_AddMessage("Syntax: directinput [1/0]")
  CONSOLE_AddMessage("Help: Toggles direct input versus windows input.")
  if Cfg.DirectInput then
    CONSOLE_AddMessage("State: directinput is currently on.")
  else
    CONSOLE_AddMessage("State: directinput is currently off.")
  end
end

function Console:Cmd_MAPVIEW(enable)
  if enable == "1" then
    Cfg.MapView = true
    CONSOLE_AddMessage("Mapview is now enabled")
    return
  end
  if enable == "0" then
    Cfg.MapView = false
    CONSOLE_AddMessage("Mapview is now disabled")
    return
  end
  CONSOLE_AddMessage("Syntax: mapview [1/0]")
  CONSOLE_AddMessage("Help: Enables the rendering of mapoverlay in specmode.")
  if Cfg.MapView then
    CONSOLE_AddMessage("State: mapview is currently on.")
  else
    CONSOLE_AddMessage("State: mapview is currently off.")
  end
end

function Console:Cmd_TEAMOVERLAY(enable)
  if enable == "1" then
    Cfg.TeamOverlay = true
    CONSOLE_AddMessage("TeamOverlay is now enabled")
    return
  end
  if enable == "0" then
    Cfg.TeamOverlay = false
    CONSOLE_AddMessage("TeamOverlay is now disabled")
    return
  end
  CONSOLE_AddMessage("Syntax: TeamOverlay [1/0]")
  CONSOLE_AddMessage("Help: Shows TeamOverlay.")
  if Cfg.TeamOverlay then
    CONSOLE_AddMessage("State: TeamOverlay is currently on.")
  else
    CONSOLE_AddMessage("State: TeamOverlay is currently off.")
  end
end

function Console:Cmd_HUD_AMMOLIST(enable)
  if enable == "0" then
    Cfg.HUD_AmmoList = 0
    CONSOLE_AddMessage("AmmoList is now 0, disabled.")
    return
  end
  if enable == "1" then
    Cfg.HUD_AmmoList = 1
    CONSOLE_AddMessage("AmmoList is now to right")
    return
  end
  if enable == "2" then
    Cfg.HUD_AmmoList = 2
    CONSOLE_AddMessage("AmmoList is now to left")
    return
  end
  if enable == "3" then
    Cfg.HUD_AmmoList = 3
    CONSOLE_AddMessage("AmmoList is now to middle")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_AMMOLIST [0/1/2]")
  CONSOLE_AddMessage("Help: Shows AmmoList.")
  CONSOLE_AddMessage("State: AmmoList is currently " .. tostring(Cfg.HUD_AmmoList))
end

function Console:Cmd_AUTORECORD(enable)
  if enable == "1" then
    Cfg.Autorecord = true
    CONSOLE_AddMessage("Autorecord is now enabled")
    return
  end
  if enable == "0" then
    Cfg.Autorecord = false
    CONSOLE_AddMessage("Autorecord is now disabled")
    return
  end
  CONSOLE_AddMessage("Syntax: autorecord [1/0]")
  CONSOLE_AddMessage("Help: Enables automatic recording of match demos.")
  if Cfg.Autorecord then
    CONSOLE_AddMessage("State: Autorecord is currently on.")
  else
    CONSOLE_AddMessage("State: Autorecord is currently off.")
  end
end

function Console:Cmd_OVERTIME(enable)
  if enable ~= nil then
    Cfg.Overtime = tonumber(enable)
    CONSOLE_AddMessage("State: overtime is now " .. tostring(tonumber(Cfg.Overtime)) .. " minutes.")
    return
  end
  CONSOLE_AddMessage("Syntax: overtime [n] (minutes)")
  CONSOLE_AddMessage("Help: Sets overtime in the even of a draw, in minutes.")
  CONSOLE_AddMessage("State: overtime is currently " .. tostring(tonumber(Cfg.Overtime)) .. " minutes.")
end

function Console:Cmd_TIME()
  local timestamp = os.date("%d-%m-%y-%X", os.time())
  CONSOLE_AddMessage("The local (client) time is currently " .. timestamp)
end

function Console:Cmd_FORCE_TEAMS_COLORS(enable)
  if enable == "1" then
    Cfg.FixedColors = false
    CONSOLE_AddMessage("FixedColors is now enabled")
    Game:ReloadBrightskins()
    return
  end
  if enable == "0" then
    Cfg.FixedColors = true
    CONSOLE_AddMessage("FixedColors is now disabled")
    Game:ReloadBrightskins()
    return
  end
  CONSOLE_AddMessage("Syntax: FixedColors [1/0]")
  CONSOLE_AddMessage("Help: Switches colours.")
  if not Cfg.FixedColors then
    CONSOLE_AddMessage("State: FixedColors is currently on.")
  else
    CONSOLE_AddMessage("State: FixedColors is currently off.")
  end
end

function Console:Cmd_BRIGHTSKINS(enable)
  if enable == "1" then
    Cfg.BrightSkins = true
    CONSOLE_AddMessage("BrightSkins is now enabled. Requires restart.")
    PainMenu:ReloadBrightskins()
    return
  end
  if enable == "0" then
    Cfg.BrightSkins = false
    CONSOLE_AddMessage("BrightSkins is now disabled. Requires restart.")
    PainMenu:ReloadBrightskins()
    return
  end
  CONSOLE_AddMessage("Syntax: BrightSkins [1/0]")
  CONSOLE_AddMessage("Help: Switches BrightSkins on/off.")
  if Cfg.BrightSkins then
    CONSOLE_AddMessage("State: BrightSkins is currently on.")
  else
    CONSOLE_AddMessage("State: BrightSkins is currently off.")
  end
end

function Console:Cmd_BRIGHTSKINENEMY(enable)
  if Cfg.BrightskinEnemy == nil then
    Cfg.BrightskinTeam = "Red"
  end
  if enable == "Red" or enable == "red" then
    Cfg.BrightskinEnemy = "Red"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Green" or enable == "green" then
    Cfg.BrightskinEnemy = "Green"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Blue" or enable == "blue" then
    Cfg.BrightskinEnemy = "Blue"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Cyan" or enable == "cyan" then
    Cfg.BrightskinEnemy = "Cyan"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Magenta" or enable == "magenta" then
    Cfg.BrightskinEnemy = "Magenta"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Yellow" or enable == "yellow" then
    Cfg.BrightskinEnemy = "Yellow"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "White" or enable == "white" then
    Cfg.BrightskinEnemy = "White"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Black" or enable == "black" then
    Cfg.BrightskinEnemy = "Black"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Orange" or enable == "orange" then
    Cfg.BrightskinEnemy = "Orange"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Pink" or enable == "pink" then
    Cfg.BrightskinEnemy = "Pink"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Purple" or enable == "purple" then
    Cfg.BrightskinEnemy = "Purple"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Grey" or enable == "grey" then
    Cfg.BrightskinEnemy = "Grey"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Brown" or enable == "brown" then
    Cfg.BrightskinEnemy = "Brown"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  CONSOLE_AddMessage("Syntax: BrightskinEnemy [Red/Green/Blue/Cyan/Magenta/Yellow/White/Black/Orange/Pink/Purple]")
  CONSOLE_AddMessage("Help: Switches enemy colours. Check FixedColors setting also.")
  CONSOLE_AddMessage("State: BrightskinEnemy is currently " .. Cfg.BrightskinEnemy .. ".")
end

function Console:Cmd_BRIGHTSKINTEAM(enable)
  if Cfg.BrightskinTeam == nil then
    Cfg.BrightskinTeam = "Blue"
  end
  if enable == "Red" or enable == "red" then
    Cfg.BrightskinTeam = "Red"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Green" or enable == "green" then
    Cfg.BrightskinTeam = "Green"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Blue" or enable == "blue" then
    Cfg.BrightskinTeam = "Blue"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Cyan" or enable == "cyan" then
    Cfg.BrightskinTeam = "Cyan"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Magenta" or enable == "magenta" then
    Cfg.BrightskinTeam = "Magenta"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Yellow" or enable == "yellow" then
    Cfg.BrightskinTeam = "Yellow"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "White" or enable == "white" then
    Cfg.BrightskinTeam = "White"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Black" or enable == "black" then
    Cfg.BrightskinTeam = "Black"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Orange" or enable == "orange" then
    Cfg.BrightskinTeam = "Orange"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Pink" or enable == "pink" then
    Cfg.BrightskinTeam = "Pink"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Purple" or enable == "purple" then
    Cfg.BrightskinTeam = "Purple"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Grey" or enable == "grey" then
    Cfg.BrightskinTeam = "Grey"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  if enable == "Brown" or enable == "brown" then
    Cfg.BrightskinTeam = "Brown"
    CONSOLE_AddMessage("Colours changed")
    Game:ReloadBrightskins()
    return
  end
  CONSOLE_AddMessage("Syntax: BrightskinTeam [Red/Green/Blue/Cyan/Magenta/Yellow/White/Black/Orange/Pink/Purple/Grey/Brown]")
  CONSOLE_AddMessage("Help: Switches team colours. Check FixedColors setting also.")
  CONSOLE_AddMessage("State: BrightskinTeam is currently " .. Cfg.BrightskinTeam .. ".")
end

function Console:Cmd_CONFIGUREMAPVIEW(enable)
  if enable == "1" then
    Cfg.ConfigMapView = true
    CONSOLE_AddMessage("ConfigMapView is now enabled")
    return
  end
  if enable == "0" then
    Cfg.ConfigMapView = false
    CONSOLE_AddMessage("ConfigMapView is now disabled")
    return
  end
  CONSOLE_AddMessage("Syntax: ConfigMapView [1/0]")
  CONSOLE_AddMessage("Help: Enables mapview configuration.")
  if Cfg.ConfigMapView then
    CONSOLE_AddMessage("State: ConfigMapView is currently on.")
  else
    CONSOLE_AddMessage("State: ConfigMapView is currently off.")
  end
end

function Console:Cmd_MAPVIEWSHOWRESPAWNS(enable)
  if enable == "1" then
    Cfg.MapViewShowRespawns = true
    CONSOLE_AddMessage("MapViewShowRespawns is now enabled")
    return
  end
  if enable == "0" then
    Cfg.MapViewShowRespawns = false
    CONSOLE_AddMessage("MapViewShowRespawns is now disabled")
    return
  end
  CONSOLE_AddMessage("Syntax: MapViewShowRespawns [1/0]")
  CONSOLE_AddMessage("Help: Shows respawns on mapview during configure.")
  if Cfg.MapViewShowRespawns then
    CONSOLE_AddMessage("State: MapViewShowRespawns is currently on.")
  else
    CONSOLE_AddMessage("State: MapViewShowRespawns is currently off.")
  end
end

function Console:Cmd_OLDSCOREBOARD(enable)
  if enable == "1" then
    Cfg.OldScoreboard = true
    CONSOLE_AddMessage("OldScoreboard is now enabled. Requires restart.")
    return
  end
  if enable == "0" then
    Cfg.OldScoreboard = false
    CONSOLE_AddMessage("OldScoreboard is now disabled. Requires restart.")
    return
  end
  CONSOLE_AddMessage("Syntax: OldScoreboard [1/0]")
  CONSOLE_AddMessage("Help: Shows the old crappy pcf scoreboard. <o/ matchsticks :(")
  if Cfg.OldScoreboard then
    CONSOLE_AddMessage("State: OldScoreboard is currently on.")
  else
    CONSOLE_AddMessage("State: OldScoreboard is currently off.")
  end
end

function Console:Cmd_ALTSCOREBOARD(enable)
  if enable == "1" then
    Cfg.AltScoreboard = true
    CONSOLE_AddMessage("AltScoreboard is now enabled. Requires restart.")
    return
  end
  if enable == "0" then
    Cfg.AltScoreboard = false
    CONSOLE_AddMessage("AltScoreboard is now disabled. Requires restart.")
    return
  end
  CONSOLE_AddMessage("Syntax: AltScoreboard [1/0]")
  CONSOLE_AddMessage("Help: Shows softer colours scoreboard")
  if Cfg.AltScoreboard then
    CONSOLE_AddMessage("State: AltScoreboard is currently on.")
  else
    CONSOLE_AddMessage("State: AltScoreboard is currently off.")
  end
end

function Console:Cmd_SHOWPING(enable)
  if enable == "1" then
    Cfg.ShowPing = true
    CONSOLE_AddMessage("ShowPing is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.ShowPing = false
    CONSOLE_AddMessage("ShowPing is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: ShowPing [1/0]")
  CONSOLE_AddMessage("Help: Shows the ping in player HUD")
  if Cfg.ShowPing then
    CONSOLE_AddMessage("State: ShowPing is currently on.")
  else
    CONSOLE_AddMessage("State: ShowPing is currently off.")
  end
end

function Console:Cmd_SIMPLEHUDSHADOW(enable)
  if enable == "1" then
    Cfg.SimplehudShadow = true
    CONSOLE_AddMessage("SimplehudShadow is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.SimplehudShadow = false
    CONSOLE_AddMessage("SimplehudShadow is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: SimplehudShadow [1/0]")
  CONSOLE_AddMessage("Help: Shows simple HUD Shadow")
  if Cfg.SimplehudShadow then
    CONSOLE_AddMessage("State: SimplehudShadow is currently on.")
  else
    CONSOLE_AddMessage("State: SimplehudShadow is currently off.")
  end
end

function Console:Cmd_COLOUREDICONS(enable)
  if enable == "1" then
    Cfg.ColouredIcons = true
    CONSOLE_AddMessage("ColouredIcons is now enabled. Requires restart.")
    return
  end
  if enable == "0" then
    Cfg.ColouredIcons = false
    CONSOLE_AddMessage("ColouredIcons is now disabled. Requires restart.")
    return
  end
  CONSOLE_AddMessage("Syntax: ColouredIcons [1/0]")
  CONSOLE_AddMessage("Help: Use of coloured icons")
  if Cfg.ColouredIcons then
    CONSOLE_AddMessage("State: ColouredIcons is currently on.")
  else
    CONSOLE_AddMessage("State: ColouredIcons is currently off.")
  end
end

function Console:Cmd_COLOREDICONS(enable)
  if enable == "1" then
    Cfg.ColouredIcons = true
    CONSOLE_AddMessage("ColouredIcons is now enabled. Requires restart.")
    return
  end
  if enable == "0" then
    Cfg.ColouredIcons = false
    CONSOLE_AddMessage("ColouredIcons is now disabled. Requires restart.")
    return
  end
  CONSOLE_AddMessage("Syntax: ColouredIcons [1/0]")
  CONSOLE_AddMessage("Help: Use of coloured icons")
  if Cfg.ColouredIcons then
    CONSOLE_AddMessage("State: ColouredIcons is currently on.")
  else
    CONSOLE_AddMessage("State: ColouredIcons is currently off.")
  end
end

function Console:Cmd_CAMERAINTERPOLATEPOSITION(enable)
  if enable == "1" then
    Cfg.CameraInterpolatePosition = true
    CONSOLE_AddMessage("CameraInterpolatePosition is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.CameraInterpolatePosition = false
    CONSOLE_AddMessage("CameraInterpolatePosition is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: CameraInterpolatePosition [1/0]")
  CONSOLE_AddMessage("Help: Smooths camera postion in spec")
  if Cfg.CameraInterpolatePosition then
    CONSOLE_AddMessage("State: CameraInterpolatePosition is currently on.")
  else
    CONSOLE_AddMessage("State: CameraInterpolatePosition is currently off.")
  end
end

function Console:Cmd_CAMERAINTERPOLATEANGLE(enable)
  if enable == "1" then
    Cfg.CameraInterpolateAngle = true
    CONSOLE_AddMessage("CameraInterpolateAngle is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.CameraInterpolateAngle = false
    CONSOLE_AddMessage("CameraInterpolateAngle is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: CameraInterpolateAngle [1/0]")
  CONSOLE_AddMessage("Help: Smooths camera angle in spec")
  if Cfg.CameraInterpolateAngle then
    CONSOLE_AddMessage("State: CameraInterpolateAngle is currently on.")
  else
    CONSOLE_AddMessage("State: CameraInterpolateAngle is currently off.")
  end
end

function Console:Cmd_SCOREBOARDSHOWPACKETLOSS(enable)
  if enable == "1" then
    Cfg.ScoreboardShowPacketLoss = true
    CONSOLE_AddMessage("ScoreboardShowPacketLoss is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.ScoreboardShowPacketLoss = false
    CONSOLE_AddMessage("ScoreboardShowPacketLoss is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: ScoreboardShowPacketLoss [1/0]")
  CONSOLE_AddMessage("Help: Shows packet loss information on the scoreboard")
  if Cfg.ScoreboardShowPacketLoss then
    CONSOLE_AddMessage("State: ScoreboardShowPacketLoss is currently on.")
  else
    CONSOLE_AddMessage("State: ScoreboardShowPacketLoss is currently off.")
  end
end

function Console:Cmd_BOTCHAT(enable)
  if enable == "1" then
    Cfg.BotChat = true
    CONSOLE_AddMessage("BotChat is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.BotChat = false
    CONSOLE_AddMessage("BotChat is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: BotNoBotChatChat [1/0]")
  CONSOLE_AddMessage("Help: Toggles bot talking.")
  if Cfg.BotChat then
    CONSOLE_AddMessage("State: BotChat is currently on.")
  else
    CONSOLE_AddMessage("State: BotChat is currently off.")
  end
end

function Console:Cmd_BOTATTACK(enable)
  if enable == "1" then
    Cfg.BotAttack = true
    CONSOLE_AddMessage("BotAttack is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.BotAttack = false
    CONSOLE_AddMessage("BotAttack is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: BotAttack [1/0]")
  CONSOLE_AddMessage("Help: Toggles bots attack.")
  if Cfg.BotAttack then
    CONSOLE_AddMessage("State: BotAttack is currently on.")
  else
    CONSOLE_AddMessage("State: BotAttack is currently off.")
  end
end

function Console:Cmd_SAFERESPAWN(enable)
  if enable == "1" then
    Cfg.SafeRespawn = true
    CONSOLE_AddMessage("SafeRespawn is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.SafeRespawn = false
    CONSOLE_AddMessage("SafeRespawn is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: SafeRespawn [1/0]")
  CONSOLE_AddMessage("Help: Toggles non telefrag respawns.")
  if Cfg.SafeRespawn then
    CONSOLE_AddMessage("State: SafeRespawn is currently on.")
  else
    CONSOLE_AddMessage("State: SafeRespawn is currently off.")
  end
end

function Console:Cmd_FORCESPEC(enable)
  if enable == "1" then
    Cfg.ForceSpec = true
    CONSOLE_AddMessage("ForceSpec is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.ForceSpec = false
    CONSOLE_AddMessage("ForceSpec is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: ForceSpec [1/0]")
  CONSOLE_AddMessage("Help: Toggles whether new connections are forced into spectator mode during a game.")
  if Cfg.ForceSpec then
    CONSOLE_AddMessage("State: ForceSpec is currently on.")
  else
    CONSOLE_AddMessage("State: ForceSpec is currently off.")
  end
end

function Console:Cmd_WARMUPDAMAGE(enable)
  if enable == "1" then
    Cfg.WarmupDamage = true
    CONSOLE_AddMessage("WarmupDamage is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.WarmupDamage = false
    CONSOLE_AddMessage("WarmupDamage is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: WarmupDamage [1/0]")
  CONSOLE_AddMessage("Help: Toggles damage in warmup.")
  if Cfg.WarmupDamage then
    CONSOLE_AddMessage("State: WarmupDamage is currently on.")
  else
    CONSOLE_AddMessage("State: WarmupDamage is currently off.")
  end
end

function Console:Cmd_TEAMOVERLAYX(enable)
  if enable ~= nil then
    Cfg.TeamOverlayX = tonumber(enable)
    CONSOLE_AddMessage("TeamOverlayX is now " .. tostring(Cfg.TeamOverlayX))
    return
  end
  CONSOLE_AddMessage("Syntax: TeamOverlayX [Fraction]")
  CONSOLE_AddMessage("Help: Sets the fraction of the screen-width where teamoverlay is drawn. Non-CPL compliant.")
  CONSOLE_AddMessage("State: TeamOverlayX is currently " .. tostring(Cfg.TeamOverlayX))
end

function Console:Cmd_TEAMOVERLAYY(enable)
  if enable ~= nil then
    Cfg.TeamOverlayY = tonumber(enable)
    CONSOLE_AddMessage("TeamOverlayY is now " .. tostring(Cfg.TeamOverlayY))
    return
  end
  CONSOLE_AddMessage("Syntax: TeamOverlayY [Fraction]")
  CONSOLE_AddMessage("Help: Sets the fraction of the screen-height where teamoverlay is drawn. Non-CPL compliant.")
  CONSOLE_AddMessage("State: TeamOverlayY is currently " .. tostring(Cfg.TeamOverlayY))
end

function Console:Cmd_TEAMOVERLAYW(enable)
  if enable ~= nil then
    Cfg.TeamOverlayW = tonumber(enable)
    CONSOLE_AddMessage("TeamOverlayW is now " .. tostring(Cfg.TeamOverlayW))
    return
  end
  CONSOLE_AddMessage("Syntax: TeamOverlayW [Fraction]")
  CONSOLE_AddMessage("Help: Sets the fraction of the screen-width which is teamoverlay width. Non-CPL compliant.")
  CONSOLE_AddMessage("State: TeamOverlayW is currently " .. tostring(Cfg.TeamOverlayW))
end

function Console:Cmd_SCOREBOARDFONTSIZE(enable)
  if enable ~= nil then
    Cfg.ScoreboardFontSize = math.floor(tonumber(enable))
    CONSOLE_AddMessage("ScoreboardFontSize is now " .. tostring(Cfg.ScoreboardFontSize))
    return
  end
  CONSOLE_AddMessage("Syntax: ScoreboardFontSize [integer]")
  CONSOLE_AddMessage("Help: Sets the scoreboard font size. Non-CPL compliant.")
  CONSOLE_AddMessage("State: ScoreboardFontSize is currently " .. tostring(Cfg.ScoreboardFontSize))
end

function Console:Cmd_TEAMOVERLAYFONTSIZE(enable)
  if enable ~= nil then
    Cfg.TeamOverlayFontSize = math.floor(tonumber(enable))
    CONSOLE_AddMessage("TeamOverlayFontSize is now " .. tostring(Cfg.TeamOverlayFontSize))
    return
  end
  CONSOLE_AddMessage("Syntax: TeamOverlayFontSize [integer]")
  CONSOLE_AddMessage("Help: Sets the teamoverlay font size. Non-CPL compliant.")
  CONSOLE_AddMessage("State: TeamOverlayFontSize is currently " .. tostring(Cfg.TeamOverlayFontSize))
end

function Console:Cmd_RESTARTMAP()
  Game:MapRestart()
end

function Console:Cmd_EXEC(enable)
  if enable ~= nil then
    local temp = CfgFile
    CfgFile = enable .. ".ini"
    Cfg:Load()
    CfgFile = temp
    CONSOLE_AddMessage("Bin\\" .. enable .. ".ini executed.")
    return
  end
  CONSOLE_AddMessage("Syntax: exec <filename>")
  CONSOLE_AddMessage("Help: Executes config file")
end

function Console:Cmd_WRITECONFIG(enable)
  if enable ~= nil then
    local temp = CfgFile
    CfgFile = enable .. ".ini"
    Cfg:Save()
    CfgFile = temp
    CONSOLE_AddMessage("Bin\\" .. enable .. ".ini written.")
    return
  end
  CONSOLE_AddMessage("Syntax: writeconfig <filename>")
  CONSOLE_AddMessage("Help: Writes config file")
end

function Console:Cmd_RCONPASS(enable)
  if enable ~= nil then
    Cfg.RconPass = tostring(enable)
    CONSOLE_AddMessage("RconPass is enabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: RconPass [password]")
  CONSOLE_AddMessage("Help: Sets the local rcon password.")
  if Cfg.RconPass == nil or Cfg.RconPass == "" then
    CONSOLE_AddMessage("State: Rcon is disabled.")
  else
    CONSOLE_AddMessage("State: Rcon is " .. tostring(Cfg.RconPass))
  end
end

function Console:Cmd_RCON(enable)
  if enable ~= nil and Cfg.RconPass ~= nil and Cfg.RconPass ~= "" then
    NET.SendVariable(NET.GetClientID(), "rcon", tostring(NET.GetClientID()) .. "," .. Cfg.RconPass .. "," .. enable)
    return
  end
  CONSOLE_AddMessage("Syntax: rcon [command] [parameters]")
  CONSOLE_AddMessage("Help: Sends rcon command to the server.")
  CONSOLE_AddMessage("State: Rcon is disabled")
end

function Console:Cmd_REFPASS(enable)
  if enable ~= nil then
    Cfg.RefPass = tostring(enable)
    CONSOLE_AddMessage("RefPass is enabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: RefPass [password]")
  CONSOLE_AddMessage("Help: Sets the local referee password.")
  if Cfg.RefPass == nil or Cfg.RefPass == "" then
    CONSOLE_AddMessage("State: RefPass is disabled.")
  else
    CONSOLE_AddMessage("State: RefPass is " .. tostring(Cfg.RefPass))
  end
end

function Console:Cmd_REF(enable)
  if enable ~= nil then
    if Cfg.RconPass ~= nil then
      NET.SendVariable(NET.GetClientID(), "ref", tostring(NET.GetClientID()) .. "," .. Cfg.RconPass .. "," .. enable)
      return
    else
      NET.SendVariable(NET.GetClientID(), "ref", tostring(NET.GetClientID()) .. "," .. "hello" .. "," .. enable)
      return
    end
  end
  CONSOLE_AddMessage("Syntax: ref [command] [parameters]")
  CONSOLE_AddMessage("Help: Sends referee command to the server.")
end

function Console:Cmd_REFEREE(enable)
  if enable ~= nil then
    enable = tonumber(enable)
    if enable and 0 <= enable and Game.PlayerStats[enable] and Game.PlayerStats[enable] ~= nil then
      Game.PlayerStats[enable].Referee = true
      Game.ConsoleMessageAll("Game.PlayerStats[tonumber(enable)].Name is now a referee.")
      return
    end
  else
    CONSOLE_AddMessage("Syntax: Referee [clientid]")
    CONSOLE_AddMessage("Help: Sets a player to referee status.")
  end
end

function Console:Cmd_RELOADWAYPOINTS()
  Waypoint.Position = {}
  Waypoint:Load(Lev.Map)
end

function Console:Cmd_ROCKETFACTOR(factor)
  CONSOLE_AddMessage("RocketFactor is a restricted command.")
  if factor ~= nil then
    Cfg.RocketFactor = tonumber(factor)
    return CONSOLE_AddMessage("Factor set")
  end
  CONSOLE_AddMessage("Syntax: rocketfactor [number]")
  CONSOLE_AddMessage("Help: Sets the scaling factor between horizontal and vertical rockets.")
  Game.ConsoleMessageAll("State: RocketFactor is currently " .. tostring(Cfg.RocketFactor))
end

function Console:Cmd_ROCKETFACTORORDER(factor)
  CONSOLE_AddMessage("RocketFactorOrder is a restricted command.")
  if factor ~= nil then
    Cfg.RocketFactorOrder = tonumber(factor)
    return CONSOLE_AddMessage("Factor set")
  end
  CONSOLE_AddMessage("Syntax: RocketFactorOrder [number]")
  CONSOLE_AddMessage("Help: Sets the exponent of the rocket direction factor.")
  Game.ConsoleMessageAll("State: RocketFactorOrder is currently " .. tostring(Cfg.RocketFactorOrder))
end

function Console:Cmd_ROCKETEXPLOSIONSTRENGTH(factor)
  CONSOLE_AddMessage("RocketExplosionStrength is a restricted command.")
  if factor ~= nil then
    Cfg.RocketExplosionStrength = tonumber(factor)
    return CONSOLE_AddMessage("RocketExplosionStrength set")
  end
  CONSOLE_AddMessage("Syntax: RocketExplosionStrength [number]")
  CONSOLE_AddMessage("Help: Sets the explosion impulse strength.")
  Game.ConsoleMessageAll("State: RocketExplosionStrength is currently " .. tostring(Cfg.RocketFactorOrder))
end

function Console:Cmd_PROPLUS(state)
  if tonumber(state) == 1 then
    Game:EnableProPlus()
    return
  end
  if tonumber(state) == 0 then
    Game:DisableProPlus()
    return
  end
  CONSOLE_AddMessage("Syntax: proplus [0/1]")
  CONSOLE_AddMessage("Help: Sets the server to proplus mode.")
  if MPCfg.ProPlus then
    Game.ConsoleMessageAll("State: Proplus is enabled.")
  else
    Game.ConsoleMessageAll("State: Proplus is disabled.")
  end
end

function Console:Cmd_TOGGLECONSOLE()
  if Console.Activated then
    CONSOLE.Activate(false)
    Console.Activated = false
  else
    CONSOLE.Activate(true)
    Console.Activated = true
  end
end

function Console:Cmd_SERVERPASSWORD(password)
  if password ~= nil then
    Cfg.ServerPassword = password
  end
  if password == nil then
    Cfg.ServerPassword = ""
  end
  CONSOLE_AddMessage("Syntax: ServerPassword [password]")
  CONSOLE_AddMessage("Help: Sets the server password.")
  if Cfg.ServerPassword == "" then
    CONSOLE_AddMessage("State: ServerPassword is disabled.")
  else
    CONSOLE_AddMessage("State: ServerPassword is now " .. tostring(Cfg.ServerPassword))
  end
end

function Console:Cmd_NOBLOOD(enable)
  if enable == "1" then
    Cfg.NoBlood = true
    CONSOLE_AddMessage("NoBlood is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoBlood = false
    CONSOLE_AddMessage("NoBlood is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NoBlood [1/0]")
  CONSOLE_AddMessage("Help: Toggles blood rendering. May require a restart for full effect.")
  if Cfg.NoBlood then
    CONSOLE_AddMessage("State: NoBlood is currently on.")
  else
    CONSOLE_AddMessage("State: NoBlood is currently off.")
  end
end

function Console:Cmd_NOEXPLOSIONS(enable)
  if enable == "1" then
    Cfg.NoExplosions = true
    CONSOLE_AddMessage("NoExplosions is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoExplosions = false
    CONSOLE_AddMessage("NoExplosions is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NoExplosions [1/0]")
  CONSOLE_AddMessage("Help: Toggles explosion rendering. May require a restart for full effect.")
  if Cfg.NoExplosions then
    CONSOLE_AddMessage("State: NoExplosions is currently on.")
  else
    CONSOLE_AddMessage("State: NoExplosions is currently off.")
  end
end

function Console:Cmd_NOGIBS(enable)
  if enable == "1" then
    Cfg.NoGibs = true
    CONSOLE_AddMessage("NoGibs is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoGibs = false
    CONSOLE_AddMessage("NoGibs is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NoGibs [1/0]")
  CONSOLE_AddMessage("Help: Toggles gibs rendering.")
  if Cfg.NoGibs then
    CONSOLE_AddMessage("State: NoGibs is currently on. May require a restart for full effect.")
  else
    CONSOLE_AddMessage("State: NoGibs is currently off.")
  end
end

function Console:Cmd_NOSMOKE(enable)
  if enable == "1" then
    Cfg.NoSmoke = true
    CONSOLE_AddMessage("NoSmoke is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoSmoke = false
    CONSOLE_AddMessage("NoSmoke is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NoSmoke [1/0]")
  CONSOLE_AddMessage("Help: Toggles smoke rendering.")
  if Cfg.NoSmoke then
    CONSOLE_AddMessage("State: NoSmoke is currently on. May require a restart for full effect.")
  else
    CONSOLE_AddMessage("State: NoSmoke is currently off.")
  end
end

function Console:Cmd_NOIMPACT(enable)
  if enable == "1" then
    Cfg.NoImpactFX = true
    CONSOLE_AddMessage("NoImpact is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoImpactFX = false
    CONSOLE_AddMessage("NoImpact is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NoImpact [1/0]")
  CONSOLE_AddMessage("Help: Toggles impact rendering.")
  if Cfg.NoImpactFX then
    CONSOLE_AddMessage("State: NoImpact is currently on.")
  else
    CONSOLE_AddMessage("State: NoImpact is currently off.")
  end
end

function Console:Cmd_NOSPAWNEFFECTS(enable)
  if enable == "1" then
    Cfg.NoSpawnEffects = true
    CONSOLE_AddMessage("NoSpawnEffects is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoSpawnEffects = false
    CONSOLE_AddMessage("NoSpawnEffects is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NoSpawnEffects [1/0]")
  CONSOLE_AddMessage("Help: Toggles spawn particle effects rendering.")
  if Cfg.NoSpawnEffects then
    CONSOLE_AddMessage("State: NoSpawnEffects is currently on. May require a restart for full effect.")
  else
    CONSOLE_AddMessage("State: NoSpawnEffects is currently off.")
  end
end

function Console:Cmd_NOFLAMES(enable)
  if enable == "1" then
    Cfg.NoFlames = true
    CONSOLE_AddMessage("NoFlames is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoFlames = false
    CONSOLE_AddMessage("NoFlames is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NoFlames [1/0]")
  CONSOLE_AddMessage("Help: Toggles flame particle effects rendering.")
  if Cfg.NoFlames then
    CONSOLE_AddMessage("State: NoFlames is currently on. May require a restart for full effect.")
  else
    CONSOLE_AddMessage("State: NoFlames is currently off.")
  end
end

function Console:Cmd_LOGGING(enable)
  if enable == "1" then
    Cfg.Logging = true
    CONSOLE_AddMessage("Logging is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.Logging = false
    CONSOLE_AddMessage("Logging is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: Logging [1/0]")
  CONSOLE_AddMessage("Help: Toggles Logging.")
  if Cfg.Logging then
    CONSOLE_AddMessage("State: Logging is currently on.")
  else
    CONSOLE_AddMessage("State: Logging is currently off.")
  end
end

function Console:Cmd_ROCKETLOGGING(enable)
  if enable == "1" then
    Cfg.RocketLogging = true
    CONSOLE_AddMessage("RocketLogging is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.RocketLogging = false
    CONSOLE_AddMessage("RocketLogging is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: RocketLogging [1/0]")
  CONSOLE_AddMessage("Help: Toggles RocketLogging.")
  if Cfg.RocketLogging then
    CONSOLE_AddMessage("State: RocketLogging is currently on.")
  else
    CONSOLE_AddMessage("State: RocketLogging is currently off.")
  end
end

function Console:Cmd_ROCKETFIX(enable)
  if enable == "1" then
    Cfg.RocketFix = true
    Tweak.MultiPlayerMove.AlternateRocketJump = false
    WORLD.ApplyTweaks()
    CONSOLE_AddMessage("RocketFix is now enabled.")
    Game:SendRocketFix()
    return
  end
  if enable == "0" then
    Cfg.RocketFix = false
    Tweak.MultiPlayerMove.AlternateRocketJump = true
    WORLD.ApplyTweaks()
    CONSOLE_AddMessage("RocketFix is now disabled.")
    Game:SendRocketFix()
    return
  end
  CONSOLE_AddMessage("Syntax: RocketFix [1/0]")
  CONSOLE_AddMessage("Help: Toggles PK++ RocketFix.")
  if Cfg.RocketFix then
    CONSOLE_AddMessage("State: RocketFix is currently on.")
  else
    CONSOLE_AddMessage("State: RocketFix is currently off.")
  end
end

function Console:Cmd_DEADBODYFIX(enable)
  CONSOLE_AddMessage("Command is disabled in this version.")
  do return end
  if enable == "1" then
    Cfg.DeadBodyFix = true
    CONSOLE_AddMessage("DeadBodyFix is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.DeadBodyFix = false
    CONSOLE_AddMessage("DeadBodyFix is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: DeadBodyFix [1/0]")
  CONSOLE_AddMessage("Help: Toggles PK++ DeadBodyFix.")
  if Cfg.DeadBodyFix then
    CONSOLE_AddMessage("State: DeadBodyFix is currently on.")
  else
    CONSOLE_AddMessage("State: DeadBodyFix is currently off.")
  end
end

function Console:Cmd_FREEZERFIX(enable)
  CONSOLE_AddMessage("Command is disabled in this version.")
  do return end
  if enable == "1" then
    Cfg.FreezerFix = true
    CONSOLE_AddMessage("FreezerFix is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.FreezerFix = false
    CONSOLE_AddMessage("FreezerFix is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: FreezerFix [1/0]")
  CONSOLE_AddMessage("Help: Toggles PK++ FreezerFix.")
  if Cfg.FreezerFix then
    CONSOLE_AddMessage("State: FreezerFix is currently on.")
  else
    CONSOLE_AddMessage("State: FreezerFix is currently off.")
  end
end

function Console:Cmd_FALLINGDAMAGE(enable)
  if enable == "1" then
    Cfg.FallingDamage = true
    CONSOLE_AddMessage("FallingDamage is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.FallingDamage = false
    CONSOLE_AddMessage("FallingDamage is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: FallingDamage [1/0]")
  CONSOLE_AddMessage("Help: Toggles FallingDamage.")
  if Cfg.FallingDamage then
    CONSOLE_AddMessage("State: FallingDamage is currently on.")
  else
    CONSOLE_AddMessage("State: FallingDamage is currently off.")
  end
end

function Console:Cmd_WEAPONPREDICTION(enable)
  CONSOLE_AddMessage("Command is disabled in this version.")
  do return end
  if enable == "1" then
    Cfg.WeaponPrediction = true
    CONSOLE_AddMessage("WeaponPrediction is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.WeaponPrediction = false
    CONSOLE_AddMessage("WeaponPrediction is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: WeaponPrediction [1/0]")
  CONSOLE_AddMessage("Help: Toggles WeaponPrediction.")
  if Cfg.WeaponPrediction then
    CONSOLE_AddMessage("State: WeaponPrediction is currently on.")
  else
    CONSOLE_AddMessage("State: WeaponPrediction is currently off.")
  end
end

function Console:Cmd_AUTOSCREENSHOT(enable)
  if enable == "1" then
    Cfg.AutoScreenshot = true
    CONSOLE_AddMessage("AutoScreenshot is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.AutoScreenshot = false
    CONSOLE_AddMessage("AutoScreenshot is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: AutoScreenshot [1/0]")
  CONSOLE_AddMessage("Help: Toggles AutoScreenshot.")
  if Cfg.AutoScreenshot then
    CONSOLE_AddMessage("State: AutoScreenshot is currently on.")
  else
    CONSOLE_AddMessage("State: AutoScreenshot is currently off.")
  end
end

function Console:Cmd_VERSION()
  CONSOLE_AddMessage("PK++ 1.2.1.64")
end

function Console:Cmd_BLOWFISH()
  Cfg.AltScoreboard = false
  Cfg.AmbientSounds = false
  Cfg.AmbientVolume = 0
  Cfg.AutoChangeWeapon = false
  Cfg.AutoScreenshot = false
  Cfg.AutoStatsDump = true
  Cfg.AutoTeamLock = false
  Cfg.Autorecord = false
  Cfg.Bloom = false
  Cfg.BotAttack = true
  Cfg.BotChat = false
  Cfg.BotCheckStubNose = true
  Cfg.BotEliza = false
  Cfg.BotFakePing = true
  Cfg.BotFindItems = true
  Cfg.BotMinPlayers = 2
  Cfg.BotQuickRespawn = true
  Cfg.BotSkill = 10
  Cfg.BrightSkins = true
  Cfg.Brightness = 1
  Cfg.BrightskinEnemy = "Cyan"
  Cfg.BrightskinTeam = "Blue"
  Cfg.CharacterShadow = "Off"
  Cfg.ColouredIcons = false
  Cfg.ConfigMapView = false
  Cfg.ConnectionSpeed = 5
  Cfg.Contrast = 1
  Cfg.Coronas = false
  Cfg.Credits = true
  Cfg.Crosshair = 3
  Cfg.CrosshairB = 0
  Cfg.CrosshairG = 255
  Cfg.CrosshairR = 0
  Cfg.CrosshairSize = 1
  Cfg.CrosshairTrans = 100
  Cfg.CustomCrosshairLocation = false
  Cfg.CustomCrosshairLocationX = 0.5
  Cfg.CustomCrosshairLocationY = 0.5
  Cfg.Decals = false
  Cfg.DecalsStayTime = 1000
  Cfg.DedicatedServer = false
  Cfg.DetailTextures = false
  Cfg.DisableHud = false
  Cfg.DisableMOTDRendering = false
  Cfg.DisturbSound3DFreq = 0.1
  Cfg.DuelQueue = true
  Cfg.DynamicLights = 0
  Cfg.EAXAcoustics = true
  Cfg.FOV = 110
  Cfg.FPS = true
  Cfg.FallingDamage = true
  Cfg.FixedColors = false
  Cfg.ForceModel = true
  Cfg.ForceSpec = false
  Cfg.FragLimit = 0
  Cfg.Fullscreen = true
  Cfg.Gamma = 1.11
  Cfg.GraphicsQuality = 0
  Cfg.HUDSize = 2
  Cfg.HUDTransparency = 33
  Cfg.HUD_AmmoList = 0
  Cfg.HUD_Show_CurrentWeapon_Icon = true
  Cfg.HUD_FragMessage = true
  Cfg.HeadBob = 0
  Cfg.HitSound = true
  Cfg.ImpureClientWarning = false
  Cfg.InvertMouse = false
  Cfg.ItemRespawnFix = true
  Cfg.LimitServerFPS = true
  Cfg.Logfile = "GameLog"
  Cfg.LogfileDaily = true
  Cfg.Logging = true
  Cfg.LowQualityMultiplayerSFX = true
  Cfg.MOTD = " ;Enjoy your stay;Have fun!; "
  Cfg.MapView = false
  Cfg.MapViewShowRespawns = false
  Cfg.MasterVolume = 100
  Cfg.MaxFpsMP = 125
  Cfg.MaxPlayers = 8
  Cfg.MaxSpectators = 4
  Cfg.MouseSensitivity = 30
  Cfg.Multisample = "x0"
  Cfg.MusicVolume = 0
  Cfg.NetcodeClientMaxBytesPerSecond = -1
  Cfg.NetcodeEnemyPredictionInterpolation = true
  Cfg.NetcodeEnemyPredictionInterpolationFactor = 0.66
  Cfg.NetcodeLocalPlayerSynchroEveryNFrames = 45
  Cfg.NetcodeMaxPlayerActionsPassed = 1
  Cfg.NetcodeMinUpstreamFrameSize = 0
  Cfg.NetcodeServerFramerate = 45
  Cfg.NetcodeStatsNumberToAverageFrom = 1
  Cfg.NetcodeStatsUpdateDelay = 1000
  Cfg.Newhitsound = false
  Cfg.NoAmmoSwitch = false
  Cfg.NoBlood = true
  Cfg.NoExplosions = true
  Cfg.NoFlames = true
  Cfg.NoGibs = true
  Cfg.NoGong = true
  Cfg.NoMPComments = true
  Cfg.NoSmoke = true
  Cfg.NoSpawnEffects = true
  Cfg.NoWarmup = false
  Cfg.OldScoreboard = false
  Cfg.Overtime = 2
  Cfg.ParticlesDetail = 1
  Cfg.PitabotEnabled = false
  Cfg.PlayerModel = 3
  Cfg.PowerupDrop = false
  Cfg.Powerups = false
  Cfg.PrecacheData = 0
  Cfg.ProPlus = false
  Cfg.Projectors = false
  Cfg.PublicServer = false
  Cfg.PureScripts = false
  Cfg.RenderSky = 0
  Cfg.Resolution = "800x600"
  Cfg.RestartMaps = true
  Cfg.ReverseStereo = false
  Cfg.RocketFix = true
  Cfg.RocketLogging = false
  Cfg.RocketsFromGun = true
  Cfg.SafeRespawn = false
  Cfg.ScoreboardFontSize = 20
  Cfg.ScoreboardShowPacketLoss = false
  Cfg.SfxVolume = 100
  Cfg.Shadows = 0
  Cfg.ShowDaydreamWarning = true
  Cfg.ShowPing = false
  Cfg.ShowTimer = true
  Cfg.ShowTimerCountUp = false
  Cfg.SmoothMouse = false
  Cfg.SoundFalloffSpeed = 6
  Cfg.SoundPan = 50
  Cfg.SoundProvider3D = "Miles Fast 2D Positional Audio"
  Cfg.SoundQuality = "Low"
  Cfg.SpeakersSetup = "Two Speakers"
  Cfg.StartupWeapon = 0
  Cfg.StopMatchOnTeamQuit = true
  Cfg.Team = 0
  Cfg.TeamDamage = true
  Cfg.TextureFiltering = "Bilinear"
  Cfg.TextureQuality = 0
  Cfg.TextureQualityArchitecture = 31
  Cfg.TextureQualityCharacters = 31
  Cfg.TextureQualitySkies = 31
  Cfg.TextureQualityWeapons = 31
  Cfg.TimeLimit = 15
  Cfg.ViewWeaponModel = false
  Cfg.WarmUpTime = 5
  Cfg.WarmupDamage = true
  Cfg.WarpEffects = false
  Cfg.WaterFX = 0
  Cfg.WeaponBob = 0
  Cfg.WeaponNormalMap = false
  Cfg.WeaponPrediction = true
  Cfg.WeaponRespawnTime = 15
  Cfg.WeaponSpecular = true
  Cfg.WeaponsStay = false
  Cfg.WeatherEffects = false
  Cfg.WheelSensitivity = 3
  Cfg.KeyPrimaryWeapon2 = "F"
  Cfg.KeyPrimaryWeapon3 = "R"
  Cfg.KeyPrimaryWeapon4 = "E"
  Cfg.KeyPrimaryWeapon5 = "C"
  Cfg.TeamOverlay = true
  Cfg.TeamOverlayFontSize = 16
  Cfg.TeamOverlayW = 0.3
  Cfg.TeamOverlayX = 0.7
  Cfg.TeamOverlayY = 0.6
  PainMenu:ApplyVideoSettings()
  INP.SetUseDInput(Cfg.DirectInput)
  INP.Reset()
  CONSOLE_AddMessage("Blowfish config executed.")
end

function Console:Cmd_DISABLEHUD(enable)
  if enable == "1" then
    Cfg.DisableHud = true
    CONSOLE_AddMessage("DisableHud is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.DisableHud = false
    CONSOLE_AddMessage("DisableHud is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: DisableHud [1/0]")
  CONSOLE_AddMessage("Help: Toggles DisableHud.")
  if Cfg.DisableHud then
    CONSOLE_AddMessage("State: DisableHud is currently on.")
  else
    CONSOLE_AddMessage("State: DisableHud is currently off.")
  end
end

function Console:Cmd_NODECALS(enable)
  if enable == "1" then
    Cfg.DecalsStayTime = 1000
    PainMenu:ApplyVideoSettings()
    INP.SetUseDInput(Cfg.DirectInput)
    INP.Reset()
    INP.SetUseDInput(Cfg.DirectInput)
    CONSOLE_AddMessage("NoDecals is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.DecalsStayTime = 1
    PainMenu:ApplyVideoSettings()
    INP.SetUseDInput(Cfg.DirectInput)
    INP.Reset()
    INP.SetUseDInput(Cfg.DirectInput)
    CONSOLE_AddMessage("NoDecals is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NoDecals [1/0]")
  CONSOLE_AddMessage("Help: Toggles NoDecals. 'On' means Cfg.DecalsStayTime = 1000.")
  if Cfg.DecalsStayTime == 1000 then
    CONSOLE_AddMessage("State: NoDecals is currently on.")
  else
    CONSOLE_AddMessage("State: NoDecals is currently off.")
  end
end

function Console:Cmd_PITABOTENABLED(enable)
  if enable == "1" then
    Cfg.PitabotEnabled = true
    CONSOLE_AddMessage("PitabotEnabled is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.PitabotEnabled = false
    CONSOLE_AddMessage("PitabotEnabled is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: PitabotEnabled [1/0]")
  CONSOLE_AddMessage("Help: Toggles Pitabot On/Off.")
  if Cfg.PitabotEnabled then
    CONSOLE_AddMessage("State: PitabotEnabled is currently on.")
  else
    CONSOLE_AddMessage("State: PitabotEnabled is currently off.")
  end
end

function Console:Cmd_MOTD(enable)
  if enable ~= nil then
    Cfg.MOTD = tostring(enable)
    CONSOLE_AddMessage("MOTD Set.")
    return
  end
  CONSOLE_AddMessage("Syntax: MOTD <text>")
  CONSOLE_AddMessage("Help: Sets MOTD.")
  CONSOLE_AddMessage("State: MOTD is currently " .. tostring(Cfg.MOTD))
end

function Console:Cmd_TEXTUREQUALITY(enable)
  if enable ~= nil then
    Cfg.TextureQuality = tonumber(enable)
    CONSOLE_AddMessage("TextureQuality Set.")
    PainMenu:ApplyVideoSettings()
    INP.SetUseDInput(Cfg.DirectInput)
    INP.Reset()
    return
  end
  CONSOLE_AddMessage("Syntax: TextureQuality <N>")
  CONSOLE_AddMessage("Help: Sets TextureQuality.")
  CONSOLE_AddMessage("State: TextureQuality is currently " .. tostring(Cfg.TextureQuality))
end

function Console:Cmd_TEXTUREQUALITYARCHITECTURE(enable)
  if enable ~= nil then
    Cfg.TextureQualityArchitecture = tonumber(enable)
    CONSOLE_AddMessage("TextureQualityArchitecture Set.")
    PainMenu:ApplyVideoSettings()
    INP.SetUseDInput(Cfg.DirectInput)
    INP.Reset()
    return
  end
  CONSOLE_AddMessage("Syntax: TextureQualityArchitecture <N>")
  CONSOLE_AddMessage("Help: Sets TextureQualityArchitecture.")
  CONSOLE_AddMessage("State: TextureQualityArchitecture is currently " .. tostring(Cfg.TextureQualityArchitecture))
end

function Console:Cmd_TEXTUREQUALITYCHARACTERS(enable)
  if enable ~= nil then
    Cfg.TextureQualityCharacters = tonumber(enable)
    CONSOLE_AddMessage("TextureQualityCharacters Set.")
    PainMenu:ApplyVideoSettings()
    INP.SetUseDInput(Cfg.DirectInput)
    INP.Reset()
    return
  end
  CONSOLE_AddMessage("Syntax: TextureQualityCharacters <N>")
  CONSOLE_AddMessage("Help: Sets TextureQualityCharacters.")
  CONSOLE_AddMessage("State: TextureQualityCharacters is currently " .. tostring(Cfg.TextureQualityCharacters))
end

function Console:Cmd_TEXTUREQUALITYSKIES(enable)
  if enable ~= nil then
    Cfg.TextureQualitySkies = tonumber(enable)
    CONSOLE_AddMessage("TextureQualitySkies Set.")
    PainMenu:ApplyVideoSettings()
    INP.SetUseDInput(Cfg.DirectInput)
    INP.Reset()
    return
  end
  CONSOLE_AddMessage("Syntax: TextureQualitySkies <N>")
  CONSOLE_AddMessage("Help: Sets TextureQualitySkies.")
  CONSOLE_AddMessage("State: TextureQualitySkies is currently " .. tostring(Cfg.TextureQualitySkies))
end

function Console:Cmd_TEXTUREQUALITYWEAPONS(enable)
  if enable ~= nil then
    Cfg.TextureQualityWeapons = tonumber(enable)
    CONSOLE_AddMessage("TextureQualityWeapons Set.")
    PainMenu:ApplyVideoSettings()
    INP.SetUseDInput(Cfg.DirectInput)
    INP.Reset()
    return
  end
  CONSOLE_AddMessage("Syntax: TextureQualityWeapons <N>")
  CONSOLE_AddMessage("Help: Sets TextureQualityWeapons.")
  CONSOLE_AddMessage("State: TextureQualityWeapons is currently " .. tostring(Cfg.TextureQualityWeapons))
end

function Console:Cmd_IMPURECLIENTWARNING(enable)
  if enable == "1" then
    Cfg.ImpureClientWarning = true
    CONSOLE_AddMessage("ImpureClientWarning is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.ImpureClientWarning = false
    CONSOLE_AddMessage("ImpureClientWarning is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: ImpureClientWarning [1/0]")
  CONSOLE_AddMessage("Help: Toggles ImpureClientWarning On/Off.")
  if Cfg.ImpureClientWarning then
    CONSOLE_AddMessage("State: ImpureClientWarning is currently on.")
  else
    CONSOLE_AddMessage("State: ImpureClientWarning is currently off.")
  end
end

function Console:Cmd_CAMERAYAW(enable)
  if not Game._procSpec then
    CONSOLE_AddMessage("Command only available in spectator mode")
    return
  end
  local ax, ay, az = CAM.GetAng()
  if enable ~= nil then
    enable = tonumber(enable)
    CAM.SetAng(enable, ay, 0)
    CONSOLE_AddMessage("Camera yaw is now: " .. tostring(enable) .. " degrees.")
    return
  end
  CONSOLE_AddMessage("Syntax: camerayaw [degrees]")
  CONSOLE_AddMessage("Help: Sets spectator camera yaw.")
  CONSOLE_AddMessage("Camera yaw is now: " .. tostring(ax) .. " degrees.")
end

function Console:Cmd_CAMERAPITCH(enable)
  if not Game._procSpec then
    CONSOLE_AddMessage("Command only available in spectator mode")
    return
  end
  local ax, ay, az = CAM.GetAng()
  if enable ~= nil then
    enable = tonumber(enable)
    CAM.SetAng(ax, enable, 0)
    CONSOLE_AddMessage("Camera pitch is now: " .. tostring(enable) .. " degrees.")
    return
  end
  CONSOLE_AddMessage("Syntax: camerapitch [degrees]")
  CONSOLE_AddMessage("Help: Sets spectator camera pitch.")
  CONSOLE_AddMessage("Camera pitch is now: " .. tostring(ay) .. " degrees.")
end

function Console:Cmd_SET(params, silent)
  if not params or params == "" then
    if not silent then
      CONSOLE.AddMessage("usage: set variable value")
    end
    return
  end
  local i = string.find(params, " ", 1, true)
  i = i or string.len(params) + 1
  local variable = string.sub(params, 1, i - 1)
  params = Trim(string.sub(params, i))
  Cfg[variable] = params
end

function Console:Cmd_SETS(params, silent)
  if not params or params == "" then
    if not silent then
      CONSOLE.AddMessage("usage: set variable value")
    end
    return
  end
  local i = string.find(params, " ", 1, true)
  i = i or string.len(params) + 1
  local variable = string.sub(params, 1, i - 1)
  params = Trim(string.sub(params, i))
  Cfg[variable] = tostring(params)
end

function Console:Cmd_SETN(params, silent)
  if not params or params == "" then
    if not silent then
      CONSOLE.AddMessage("usage: set variable value")
    end
    return
  end
  local i = string.find(params, " ", 1, true)
  i = i or string.len(params) + 1
  local variable = string.sub(params, 1, i - 1)
  params = Trim(string.sub(params, i))
  Cfg[variable] = tonumber(params)
end

function Console:Cmd_SETB(params, silent)
  if not params or params == "" then
    if not silent then
      CONSOLE.AddMessage("usage: set variable value")
    end
    return
  end
  local i = string.find(params, " ", 1, true)
  i = i or string.len(params) + 1
  local variable = string.sub(params, 1, i - 1)
  params = Trim(string.sub(params, i))
  if params == "true" then
    Cfg[variable] = true
  end
  if params == "false" then
    Cfg[variable] = false
  end
end

function Console:Cmd_GET(params, silent)
  if not params or params == "" then
    if not silent then
      CONSOLE.AddMessage("usage: get variable")
    end
    return
  end
  Console:OnCommand(tostring(Cfg[params]))
end

function Console:Cmd_AUD_HITSOUND(enable)
  if enable == "1" then
    Cfg.HitSound = true
    CONSOLE_AddMessage("HitSound is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HitSound = false
    CONSOLE_AddMessage("HitSound is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: HitSound [1/0]")
  CONSOLE_AddMessage("Help: Toggles HitSound.")
  if Cfg.HitSound then
    CONSOLE_AddMessage("State: HitSound is currently on.")
  else
    CONSOLE_AddMessage("State: HitSound is currently off.")
  end
end

function Console:Cmd_AUD_NOGONG(enable)
  if enable == "1" then
    Cfg.NoGong = true
    CONSOLE_AddMessage("NoGong is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoGong = false
    CONSOLE_AddMessage("NoGong is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NoGong [1/0]")
  CONSOLE_AddMessage("Help: Toggles NoGong.")
  if Cfg.NoGong then
    CONSOLE_AddMessage("State: NoGong is currently on.")
  else
    CONSOLE_AddMessage("State: NoGong is currently off.")
  end
end

function Console:Cmd_NOMPCOMMENTS(enable)
  if enable == "1" then
    Cfg.NoMPComments = true
    CONSOLE_AddMessage("NoMPComments is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoMPComments = false
    CONSOLE_AddMessage("NoMPComments is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NoMPComments [1/0]")
  CONSOLE_AddMessage("Help: Toggles NoMPComments.")
  if Cfg.NoMPComments then
    CONSOLE_AddMessage("State: NoMPComments is currently on.")
  else
    CONSOLE_AddMessage("State: NoMPComments is currently off.")
  end
end

function Console:Cmd_AUD_HITSOUND_VOLUME(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Set HitSound volume (0-100)")
  elseif type(val) == "number" and val <= 100 and 0 <= val then
    Cfg.HitSoundVolume = val
  end
  CONSOLE_AddMessage("current HitSound volume:  " .. Cfg.HitSoundVolume)
end

function Console:Cmd_AUD_KILLSOUND(enable)
  if enable == "1" then
    Cfg.KillSound = true
    CONSOLE_AddMessage("KillSound is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.KillSound = false
    CONSOLE_AddMessage("KillSound is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: KillSound [1/0]")
  CONSOLE_AddMessage("Help: Toggles KillSound.")
  if Cfg.KillSound then
    CONSOLE_AddMessage("State: KillSound is currently on.")
  else
    CONSOLE_AddMessage("State: KillSound is currently off.")
  end
end

function Console:Cmd_AUD_KILLSOUND_VOLUME(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Set KillSound volume (0-100)")
  elseif type(val) == "number" and val <= 100 and 0 <= val then
    Cfg.KillSoundVolume = val
  end
  CONSOLE_AddMessage("current KillSound volume:  " .. Cfg.KillSoundVolume)
end

function Console:Cmd_AUD_LOWAMMOSOUND(enable)
  if enable == "1" then
    Cfg.LowAmmoSound = true
    CONSOLE_AddMessage("LowAmmo Sound is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.LowAmmoSound = false
    CONSOLE_AddMessage("LowAmmo Sound is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: LowAmmo Sound [1/0]")
  CONSOLE_AddMessage("Help: Toggles LowAmmo Sound.")
  if Cfg.LowAmmoSound then
    CONSOLE_AddMessage("State: LowAmmo Sound is currently on.")
  else
    CONSOLE_AddMessage("State: LowAmmo Sound is currently off.")
  end
end

function Console:Cmd_AUD_LOWAMMOSOUND_VOLUME(enable)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Set LowAmmo Sound volume (0-100)")
  elseif type(val) == "number" and val <= 100 and val >= 0 then
    Cfg.LASoundVolume = val
  end
  CONSOLE_AddMessage("current LowAmmo Sound volume:  " .. Cfg.LASoundVolume)
end

function Console:Cmd_AUD_HITSOUND_TEAMMATE(enable)
  if enable == "1" then
    Cfg.HitsoundTeammate = true
    CONSOLE_AddMessage("Hitsound Teammate is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HitsoundTeammate = false
    CONSOLE_AddMessage("Hitsound Teammate is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: Hitsound Teammate [1/0]")
  CONSOLE_AddMessage("Help: Toggles Hitsound Teammate.")
  if Cfg.HitsoundTeammate then
    CONSOLE_AddMessage("State: Hitsound Teammate is currently on.")
  else
    CONSOLE_AddMessage("State: Hitsound Teammate is currently off.")
  end
end

function Console:Cmd_AUD_HITSOUND_TEAMMATE_VOLUME(enable)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Set Hitsound Teammate volume (0-100)")
  elseif type(val) == "number" and val <= 100 and val >= 0 then
    Cfg.HitSoundTeamVolume = val
  end
  CONSOLE_AddMessage("current Hitsound Teammate volume:  " .. Cfg.HitSoundTeamVolume)
end

function Console:Cmd_AUD_CUSTOMHUDSOUND(enable)
  if enable == "1" then
    Cfg.CustomHudSound = true
    CONSOLE_AddMessage("Custom Hud Sound is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.CustomHudSound = false
    CONSOLE_AddMessage("Custom Hud Sound is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: Custom Hud Sound [1/0]")
  CONSOLE_AddMessage("Help: Toggles Custom Hud Sound.")
  if Cfg.CustomHudSound then
    CONSOLE_AddMessage("State: Custom Hud Sound is currently on.")
  else
    CONSOLE_AddMessage("State: Custom Hud Sound is currently off.")
  end
end

function Console:Cmd_AUD_FLAGCARRIERSOUND(enable)
  if enable == "1" then
    Cfg.FlagCarrierSound = true
    CONSOLE_AddMessage("Flag Carrier Sound is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.FlagCarrierSound = false
    CONSOLE_AddMessage("Flag Carrier Sound is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: Flag Carrier Sound [1/0]")
  CONSOLE_AddMessage("Help: Toggles Flag Carrier Sound.")
  if Cfg.FlagCarrierSound then
    CONSOLE_AddMessage("State: Flag Carrier Sound is currently on.")
  else
    CONSOLE_AddMessage("State: Flag Carrier Sound is currently off.")
  end
end

function Console:Cmd_AUD_NOCHATBEEP(enable)
  if enable == "1" then
    Cfg.NoChatBeep = true
    CONSOLE_AddMessage("No Chat Beep is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoChatBeep = false
    CONSOLE_AddMessage("No Chat Beep is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: No Chat Beep [1/0]")
  CONSOLE_AddMessage("Help: Toggles No Chat Beep.")
  if Cfg.NoChatBeep then
    CONSOLE_AddMessage("State: No Chat Beep is currently on.")
  else
    CONSOLE_AddMessage("State: No Chat Beep is currently off.")
  end
end

function Console:Cmd_CONSOLEFONTSIZE(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Message font size value maxi 24, mini 16 (sets font size for the messages console)")
  elseif type(val) == "number" and val < 25 and 16 <= val then
    Cfg.HUD_ConsoleFontSize = val
    CONSOLE.SetMPMsgFont(Hud.mpMsgFont, Hud.mpMsgFontTex, Cfg.HUD_ConsoleFontSize)
  end
  CONSOLE_AddMessage("current message font size:  " .. Cfg.HUD_ConsoleFontSize)
end

function Console:Cmd_CONSOLEPOSITION(val)
  local w, h = R3D.ScreenSize()
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Message position  (sets position for the messages console, defaut position 0 px, PK++ setting " .. 565 * 768 / h .. " px)")
  elseif type(val) == "number" then
    if val <= 680 * h / 768 and 0 <= val then
      Cfg.HUD_ConsolePosition = val * 768 / h
      CONSOLE.SetMPMsgPosition(Hud.mpMsgPosition[1], Cfg.HUD_ConsolePosition)
    else
      if val > 680 * h / 768 then
        CONSOLE_AddMessage("maxi value: " .. 680 * h / 768 .. " px")
      end
      if val < 0 then
        CONSOLE_AddMessage("mini value: 0 px")
      end
    end
  end
  CONSOLE_AddMessage("current message position:  " .. Cfg.HUD_ConsolePosition * h / 768 .. " px")
end

function Console:Cmd_HUD_SHOW_CURRENTWEAPON_ICON(enable)
  if enable == "1" then
    Cfg.HUD_Show_CurrentWeapon_Icon = true
    CONSOLE_AddMessage("State: CurrentWeapon icon is currently enabled.")
    return
  end
  if enable == "0" then
    Cfg.HUD_Show_CurrentWeapon_Icon = false
    CONSOLE_AddMessage("State: CurrentWeapon icon is currently disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: currentweaponicon [0/1]")
  CONSOLE_AddMessage("Help: Show or hide a CurrentWeapon icon.")
  if Cfg.HUD_Show_CurrentWeapon_Icon then
    CONSOLE_AddMessage("State: CurrentWeapon icon is currently enabled.")
  else
    CONSOLE_AddMessage("State: CurrentWeapon icon is currently disabled.")
  end
end

function Console:Cmd_HUD_FRAGMESSAGEFONTSIZE(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Frag Message font size value maxi 30, mini 16 (sets font size for the frag message)")
  elseif type(val) == "number" and val < 31 and 16 <= val then
    Cfg.HUD_FragMessageFontSize = val
  end
  CONSOLE_AddMessage("current frag message font size:  " .. Cfg.HUD_FragMessageFontSize)
end

function Console:Cmd_CROSSHAIRNAMESFONTSIZE(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Crosshair Name font size value maxi 24, mini 16 (sets font size for the crosshair name)")
  elseif type(val) == "number" and val < 25 and 16 <= val then
    Cfg.CrosshairNamesFontSize = val
  end
  CONSOLE_AddMessage("current Crosshair Name font size:  " .. Cfg.CrosshairNamesFontSize)
end

function Console:Cmd_ENEMYINTERPOLATIONFACTOR(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Default value 0.66")
  elseif type(val) == "number" then
    Cfg.NetcodeEnemyPredictionInterpolationFactor = val
  end
  CONSOLE_AddMessage("current value:  " .. Cfg.NetcodeEnemyPredictionInterpolationFactor)
end

function Console:Cmd_HUD_AMMOLIST_MARKER_TRANS(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Change transparency (0-255)")
  elseif type(val) == "number" and val < 256 and 0 <= val then
    Cfg.HUD_Ammolist_Marker_Trans = val
  end
  CONSOLE_AddMessage("current transparency:  " .. Cfg.HUD_Ammolist_Marker_Trans)
end

function Console:Cmd_HUD_BAR_TRANS(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Change transparency (0-255)")
  elseif type(val) == "number" and val < 256 and 0 <= val then
    Cfg.HUD_Bar_Trans = val
  end
  CONSOLE_AddMessage("current transparency:  " .. Cfg.HUD_Bar_Trans)
end

function Console:Cmd_HUD_AMMOLIST_MARKER_RGB(r, g, b)
  r = tonumber(r)
  g = tonumber(g)
  b = tonumber(b)
  if r == nil or g == nil or b == nil then
    CONSOLE_AddMessage("Change RVB colors (0-255)")
    CONSOLE_AddMessage("Syntax: R: red, G: green, B: blue")
  elseif type(r) == "number" and type(g) == "number" and type(b) == "number" then
    if r < 256 and 0 <= r then
      Cfg.HUD_Ammolist_Marker_RGB[1] = r
    end
    if g < 256 and 0 <= g then
      Cfg.HUD_Ammolist_Marker_RGB[2] = g
    end
    if b < 256 and 0 <= b then
      Cfg.HUD_Ammolist_Marker_RGB[3] = b
    end
  end
  CONSOLE_AddMessage("current color:  " .. Cfg.HUD_Ammolist_Marker_RGB[1] .. "," .. Cfg.HUD_Ammolist_Marker_RGB[2] .. "," .. Cfg.HUD_Ammolist_Marker_RGB[3])
end

function Console:Cmd_HUD_AMMOLIST_COUNT_RGB(r, g, b)
  r = tonumber(r)
  g = tonumber(g)
  b = tonumber(b)
  if r == nil or g == nil or b == nil then
    CONSOLE_AddMessage("Change RVB colors (0-255)")
    CONSOLE_AddMessage("Syntax: R: red, G: green, B: blue")
  elseif type(r) == "number" and type(g) == "number" and type(b) == "number" then
    if r < 256 and 0 <= r then
      Cfg.HUD_Ammolist_Count_RGB[1] = r
    end
    if g < 256 and 0 <= g then
      Cfg.HUD_Ammolist_Count_RGB[2] = g
    end
    if b < 256 and 0 <= b then
      Cfg.HUD_Ammolist_Count_RGB[3] = b
    end
  end
  CONSOLE_AddMessage("current color:  " .. Cfg.HUD_Ammolist_Count_RGB[1] .. "," .. Cfg.HUD_Ammolist_Count_RGB[2] .. "," .. Cfg.HUD_Ammolist_Count_RGB[3])
end

function Console:Cmd_HUD_AMMOLIST_COUNT_TRANS(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Change transparency value maxi 255, value mini 0")
  elseif type(val) == "number" and val < 256 and 0 <= val then
    Cfg.HUD_Ammolist_Count_Trans = val
  end
  CONSOLE_AddMessage("current transparency:  " .. Cfg.HUD_Ammolist_Count_Trans)
end

function Console:Cmd_HUD_AMMOLIST_ICONS_TRANS(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Change transparency (0-255)")
  elseif type(val) == "number" and val < 256 and 0 <= val then
    Cfg.HUD_Ammolist_Icons_Trans = val
  end
  CONSOLE_AddMessage("current transparency:  " .. Cfg.HUD_Ammolist_Icons_Trans)
end

function Console:Cmd_HUD_COUNT_RGB(r, g, b)
  r = tonumber(r)
  g = tonumber(g)
  b = tonumber(b)
  if r == nil or g == nil or b == nil then
    CONSOLE_AddMessage("Change RVB colors (0-255)")
    CONSOLE_AddMessage("Syntax: R: red, G: green, B: blue")
  elseif type(r) == "number" and type(g) == "number" and type(b) == "number" then
    if r < 256 and 0 <= r then
      Cfg.HUD_Count_RGB[1] = r
    end
    if g < 256 and 0 <= g then
      Cfg.HUD_Count_RGB[2] = g
    end
    if b < 256 and 0 <= b then
      Cfg.HUD_Count_RGB[3] = b
    end
  end
  CONSOLE_AddMessage("current color:  " .. Cfg.HUD_Count_RGB[1] .. "," .. Cfg.HUD_Count_RGB[2] .. "," .. Cfg.HUD_Count_RGB[3])
end

function Console:Cmd_HUD_ICONS_TRANS(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Change transparency (0-255)")
  elseif type(val) == "number" and val < 256 and 0 <= val then
    Cfg.HUD_Icons_Trans = val
  end
  CONSOLE_AddMessage("current transparency:  " .. Cfg.HUD_Icons_Trans)
end

function Console:Cmd_HUD_COUNT_TRANS(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Change transparency (0-255)")
  elseif type(val) == "number" and val < 256 and 0 <= val then
    Cfg.HUD_Count_Trans = val
  end
  CONSOLE_AddMessage("current transparency:  " .. Cfg.HUD_Count_Trans)
end

function Console:Cmd_HUD_SCORES_COUNT_RGB(r, g, b)
  r = tonumber(r)
  g = tonumber(g)
  b = tonumber(b)
  if r == nil or g == nil or b == nil then
    CONSOLE_AddMessage("Change RVB colors (0-255)")
    CONSOLE_AddMessage("Syntax: R: red, G: green, B: blue")
  elseif type(r) == "number" and type(g) == "number" and type(b) == "number" then
    if r < 256 and 0 <= r then
      Cfg.HUD_Scores_Count_RGB[1] = r
    end
    if g < 256 and 0 <= g then
      Cfg.HUD_Scores_Count_RGB[2] = g
    end
    if b < 256 and 0 <= b then
      Cfg.HUD_Scores_Count_RGB[3] = b
    end
  end
  CONSOLE_AddMessage("current color:  " .. Cfg.HUD_Scores_Count_RGB[1] .. "," .. Cfg.HUD_Scores_Count_RGB[2] .. "," .. Cfg.HUD_Scores_Count_RGB[3])
end

function Console:Cmd_HUD_BAR_SWITCH(txt)
  if txt == nil then
    CONSOLE_AddMessage("Type yes for switch Hudbar Health<->Armor")
  elseif type(txt) == "string" and txt == "yes" then
    if Cfg.HUD_Switch_HudBar == 0 then
      Cfg.HUD_Switch_HudBar = 1
    elseif Cfg.HUD_Switch_HudBar == 1 then
      Cfg.HUD_Switch_HudBar = 0
    end
  end
  if Cfg.HUD_Switch_HudBar == 0 then
    CONSOLE_AddMessage("current position:  Health/Armor")
  elseif Cfg.HUD_Switch_HudBar == 1 then
    CONSOLE_AddMessage("current position:  Armor/Health")
  end
end

function Console:Cmd_HUD_SHOW_AMMO(enable)
  if enable == "1" then
    Cfg.HUD_Show_Ammo = true
    CONSOLE_AddMessage("Ammo is now showed.")
    return
  end
  if enable == "0" then
    Cfg.HUD_Show_Ammo = false
    CONSOLE_AddMessage("Ammo is now hided.")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_SHOW_AMMO_ICONS [1/0]")
  CONSOLE_AddMessage("Help: Show Ammo.")
  if Cfg.HUD_Show_Ammo then
    CONSOLE_AddMessage("State: Ammo is currently showed.")
  else
    CONSOLE_AddMessage("State: Ammo is currently hided.")
  end
end

function Console:Cmd_HUD_SHOW_HEALTH_ICON(enable)
  if enable == "1" then
    Cfg.HUD_Show_Health_Icon = true
    CONSOLE_AddMessage("Health Icon is now showed.")
    return
  end
  if enable == "0" then
    Cfg.HUD_Show_Health_Icon = false
    CONSOLE_AddMessage("Health Icon is now hided.")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_SHOW_HEALTH_ICON_SHOW [1/0]")
  CONSOLE_AddMessage("Help: Show Health Icon.")
  if Cfg.HUD_Show_Health_Icon then
    CONSOLE_AddMessage("State: Health Icon is currently showed.")
  else
    CONSOLE_AddMessage("State: Health Icon is currently hided.")
  end
end

function Console:Cmd_BRIGHTSKINSFULL(enable)
  if enable == "1" then
    Cfg.BrightSkinsFull = true
    CONSOLE_AddMessage("BrightSkinsFull is now enabled.")
    PainMenu:ReloadBrightskins()
    return
  end
  if enable == "0" then
    Cfg.BrightSkinsFull = false
    CONSOLE_AddMessage("BrightSkinsFull is now disabled.")
    PainMenu:ReloadBrightskins()
    return
  end
  CONSOLE_AddMessage("Syntax: BRIGHTSKINSFULL [1/0]")
  CONSOLE_AddMessage("Help: Enable or disable BrightSkinsFull.")
  if Cfg.BrightSkinsFull then
    CONSOLE_AddMessage("State: BrightSkinsFull is currently enabled.")
  else
    CONSOLE_AddMessage("State: BrightSkinsFull is currently disabled.")
  end
end

function Console:Cmd_TEAMMATEICON_RGB(enable, r, g, b)
  r = tonumber(r)
  g = tonumber(g)
  b = tonumber(b)
  local state = "disabled"
  if r == nil or g == nil or b == nil then
    CONSOLE_AddMessage("Change RGB colors (0-255)")
    CONSOLE_AddMessage("Syntax: enable(0/1), R: red, G: green, B: blue")
  elseif type(r) == "number" and type(g) == "number" and type(b) == "number" then
    if r < 256 and 0 <= r then
      Cfg.TeammateIcon_RGB[1] = r
    end
    if g < 256 and 0 <= g then
      Cfg.TeammateIcon_RGB[2] = g
    end
    if b < 256 and 0 <= b then
      Cfg.TeammateIcon_RGB[3] = b
    end
  end
  if enable == "1" then
    Cfg.TeammateIcon_RGB[4] = 1
    PainMenu:ReloadBrightskins()
  end
  if enable == "0" then
    Cfg.TeammateIcon_RGB[4] = 0
    PainMenu:ReloadBrightskins()
  end
  if Cfg.TeammateIcon_RGB[4] == 1 then
    state = "enabled"
  end
  CONSOLE_AddMessage("current state: " .. state)
  CONSOLE_AddMessage("current color:  " .. Cfg.TeammateIcon_RGB[1] .. "," .. Cfg.TeammateIcon_RGB[2] .. "," .. Cfg.TeammateIcon_RGB[3])
end

function Console:Cmd_TEAMMATEICON(enable)
  if enable == "2" then
    Cfg.TeammateIcon = 2
    CONSOLE_AddMessage("Teammate icon Pro enabled.")
    PainMenu:ReloadBrightskins()
    return
  end
  if enable == "1" then
    Cfg.TeammateIcon = 1
    CONSOLE_AddMessage("Teammate icon Classic enabled.")
    PainMenu:ReloadBrightskins()
    return
  end
  if enable == "0" then
    Cfg.TeammateIcon = 0
    CONSOLE_AddMessage("Teammate icon disabled.")
    PainMenu:ReloadBrightskins()
    return
  end
  CONSOLE_AddMessage("Syntax: TEAMMATEICON [2/1/0]")
  CONSOLE_AddMessage("Help: Enable or disable Teammate Icon.")
  if Cfg.TeammateIcon == 1 then
    CONSOLE_AddMessage("State: Teammate icon Clasic is currently enabled.")
  elseif Cfg.TeammateIcon == 2 then
    CONSOLE_AddMessage("State: Teammate icon Pro is currently enabled.")
  else
    CONSOLE_AddMessage("State: Teammate icon is currently disabled.")
  end
end

function Console:Cmd_NOPICKUPFX(enable)
  if enable == "1" then
    Cfg.NoPickupFX = true
    CONSOLE_AddMessage("Pickup FX rendering is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoPickupFX = false
    CONSOLE_AddMessage("Pickup FX rendering is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NOPICKUPFX [1/0]")
  CONSOLE_AddMessage("Help: Toggles Pickup FX rendering.")
  if Cfg.NoPickupFX then
    CONSOLE_AddMessage("State: Pickup FX rendering is currently enabled.")
  else
    CONSOLE_AddMessage("State: Pickup FX rendering is currently disabled.")
  end
end

function Console:Cmd_NODAMAGEFX(enable)
  if enable == "1" then
    Cfg.NoDamageFX = true
    CONSOLE_AddMessage("Damage FX rendering is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoDamageFX = false
    CONSOLE_AddMessage("Damage FX rendering is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NODAMAGEFX [1/0]")
  CONSOLE_AddMessage("Help: Toggles Damage FX rendering.")
  if Cfg.NoDamageFX then
    CONSOLE_AddMessage("State: Damage FX rendering is currently enabled.")
  else
    CONSOLE_AddMessage("State: Damage FX rendering is currently disabled.")
  end
end

function Console:Cmd_NOPOWERUPFX(enable)
  if enable == "1" then
    Cfg.NoPowerUpFX = true
    if Player._procDemonFX then
      Player._procDemonFX.TickCount = 9999 - Player._procDemonFX.FadeInTime - Player._procDemonFX.FadeOutTime
      Player._procDemonFX = nil
    end
    CONSOLE_AddMessage("PowerUp FX rendering is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoPowerUpFX = false
    if Player._procDemonFX == nil and Player.HasQuad then
      local obj = GObjects:Add(TempObjName(), CloneTemplate("DemonFX.CProcess"))
      obj.EffectTime = 9999
      obj._DrawWeapon = true
      obj.FOVMin = Cfg.FOV - 5
      obj.FOVMax = Cfg.FOV + 5
      Player._procDemonFX = obj
    end
    CONSOLE_AddMessage("PowerUp FX rendering is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NOPOWERUPFX [1/0]")
  CONSOLE_AddMessage("Help: Toggles PowerUp FX rendering.")
  if Cfg.NoPowerUpFX then
    CONSOLE_AddMessage("State: PowerUp FX rendering is currently enabled.")
  else
    CONSOLE_AddMessage("State: PowerUp FX rendering is currently disabled.")
  end
end

function Console:Cmd_NOMUZZLEFLASH(enable)
  if enable == "1" then
    Cfg.NoMuzzleFlashFX = true
    CONSOLE_AddMessage("Weapons muzzleflash rendering is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoMuzzleFlashFX = false
    CONSOLE_AddMessage("Weapons muzzleflash rendering is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NOMUZZLEFLASH [1/0]")
  CONSOLE_AddMessage("Help: Toggles weapons muzzleflash rendering.")
  if Cfg.NoMuzzleFlashFX then
    CONSOLE_AddMessage("State: Weapons muzzleflash rendering is currently enabled.")
  else
    CONSOLE_AddMessage("State: Weapons muzzleflash rendering is currently disabled.")
  end
end

function Console:Cmd_NOTRAILSTAKE(enable)
  if enable == "1" then
    Cfg.NoTrailStake = true
    CONSOLE_AddMessage("Stake's trail rendering is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoTrailStake = false
    CONSOLE_AddMessage("Stake's trail rendering is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NOTRAILSTAKE [1/0]")
  CONSOLE_AddMessage("Help: Toggles Stake's trail rendering.")
  if Cfg.NoTrailStake then
    CONSOLE_AddMessage("State: Stake's trail rendering is currently enabled.")
  else
    CONSOLE_AddMessage("State: Stake's trail rendering is currently disabled.")
  end
end

function Console:Cmd_NOTRAILFREEZER(enable)
  if enable == "1" then
    Cfg.NoTrailFreezer = true
    CONSOLE_AddMessage("Freezer's trail rendering is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoTrailFreezer = false
    CONSOLE_AddMessage("Freezer's trail rendering is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NOTRAILFREEZER [1/0]")
  CONSOLE_AddMessage("Help: Toggles Freezer's trail rendering.")
  if Cfg.NoTrailFreezer then
    CONSOLE_AddMessage("State: Freezer's trail rendering is currently enabled.")
  else
    CONSOLE_AddMessage("State: Freezer's trail rendering is currently disabled.")
  end
end

function Console:Cmd_NOTRAILGRENADE(enable)
  if enable == "1" then
    Cfg.NoTrailGrenade = true
    CONSOLE_AddMessage("Grenade's trail rendering is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoTrailGrenade = false
    CONSOLE_AddMessage("Grenade's trail rendering is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NOTRAILGRENADE [1/0]")
  CONSOLE_AddMessage("Help: Toggles Grenade's trail rendering.")
  if Cfg.NoTrailGrenade then
    CONSOLE_AddMessage("State: Grenade's trail rendering is currently enabled.")
  else
    CONSOLE_AddMessage("State: Grenade's trail rendering is currently disabled.")
  end
end

function Console:Cmd_NOTRAILROCKET(enable)
  if enable == "1" then
    Cfg.NoTrailRocket = true
    CONSOLE_AddMessage("Rocket's trail rendering is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoTrailRocket = false
    CONSOLE_AddMessage("Rocket's trail rendering is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NOTRAILROCKET [1/0]")
  CONSOLE_AddMessage("Help: Toggles Rocket's trail rendering.")
  if Cfg.NoTrailRocket then
    CONSOLE_AddMessage("State: Rocket's trail rendering is currently enabled.")
  else
    CONSOLE_AddMessage("State: Rocket's trail rendering is currently disabled.")
  end
end

function Console:Cmd_NOTRAILSHURIKEN(enable)
  if enable == "1" then
    Cfg.NoTrailShuriken = true
    CONSOLE_AddMessage("Shuriken's trail rendering is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoTrailShuriken = false
    CONSOLE_AddMessage("Shuriken's trail rendering is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NOTRAILSHURIKEN [1/0]")
  CONSOLE_AddMessage("Help: Toggles Shuriken's trail rendering.")
  if Cfg.NoTrailShuriken then
    CONSOLE_AddMessage("State: Shuriken's trail rendering is currently enabled.")
  else
    CONSOLE_AddMessage("State: Shuriken's trail rendering is currently disabled.")
  end
end

function Console:Cmd_NOTRAILBOLT(enable)
  if enable == "1" then
    Cfg.NoTrailBolt = true
    CONSOLE_AddMessage("Bolt's trail rendering is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoTrailBolt = false
    CONSOLE_AddMessage("Bolt's trail rendering is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NOTRAILBOLT [1/0]")
  CONSOLE_AddMessage("Help: Toggles Bolt's trail rendering.")
  if Cfg.NoTrailBolt then
    CONSOLE_AddMessage("State: Bolt's trail rendering is currently enabled.")
  else
    CONSOLE_AddMessage("State: Bolt's trail rendering is currently disabled.")
  end
end

function Console:Cmd_NOTRAILHEATER(enable)
  if enable == "1" then
    Cfg.NoTrailHeater = true
    CONSOLE_AddMessage("Heater's trail rendering is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoTrailHeater = false
    CONSOLE_AddMessage("Heater's trail rendering is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NOTRAILHEATER [1/0]")
  CONSOLE_AddMessage("Help: Toggles Heater's trail rendering.")
  if Cfg.NoTrailHeater then
    CONSOLE_AddMessage("State: Heater's trail rendering is currently enabled.")
  else
    CONSOLE_AddMessage("State: Heater's trail rendering is currently disabled.")
  end
end

function Console:Cmd_CROSSHAIRHIT(enable)
  if enable == "1" then
    Cfg.CrosshairHit = true
    CONSOLE_AddMessage("Crosshair Hit is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.CrosshairHit = false
    CONSOLE_AddMessage("Crosshair Hit is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: CROSSHAIRHIT [1/0]")
  CONSOLE_AddMessage("Help: Toggles Crosshair Hit.")
  if Cfg.CrosshairHit then
    CONSOLE_AddMessage("State: Crosshair Hit is currently enabled.")
  else
    CONSOLE_AddMessage("State: Crosshair Hit is currently disabled.")
  end
end

function Console:Cmd_CROSSHAIRHIT_RGB(r, g, b)
  r = tonumber(r)
  g = tonumber(g)
  b = tonumber(b)
  if r == nil or g == nil or b == nil then
    CONSOLE_AddMessage("Change RVB colors (0-255)")
    CONSOLE_AddMessage("Syntax: R: red, G: green, B: blue")
  elseif type(r) == "number" and type(g) == "number" and type(b) == "number" then
    if r < 256 and 0 <= r then
      Cfg.CrosshairHit_RGB[1] = r
    end
    if g < 256 and 0 <= g then
      Cfg.CrosshairHit_RGB[2] = g
    end
    if b < 256 and 0 <= b then
      Cfg.CrosshairHit_RGB[3] = b
    end
  end
  CONSOLE_AddMessage("current color:  " .. Cfg.CrosshairHit_RGB[1] .. "," .. Cfg.CrosshairHit_RGB[2] .. "," .. Cfg.CrosshairHit_RGB[3])
end

function Console:Cmd_CROSSHAIRHIT_TRANS(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Change transparency (0-255)")
  elseif type(val) == "number" and val < 256 and 0 <= val then
    Cfg.CrosshairHit_Trans = val
  end
  CONSOLE_AddMessage("current transparency:  " .. Cfg.CrosshairHit_Trans)
end

function Console:Cmd_HUD_BRIGHTSKINS_STYLE(enable)
  if enable == "1" then
    Cfg.HUD_Brightskins_Style = true
    CONSOLE_AddMessage("Brightskins Style is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HUD_Brightskins_Style = false
    CONSOLE_AddMessage("Brightskins Style is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_BRIGHTSKINS_STYLE [1/0]")
  CONSOLE_AddMessage("Help: Toggles Brightskins Style.")
  if Cfg.HUD_Brightskins_Style then
    CONSOLE_AddMessage("State: Brightskins Style is currently enabled.")
  else
    CONSOLE_AddMessage("State: Brightskins Style is currently disabled.")
  end
end

function Console:Cmd_HUD_PING_COLORED(enable)
  if enable == "1" then
    Cfg.HUD_Ping_Colored = true
    CONSOLE_AddMessage("Ping Colored is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HUD_Ping_Colored = false
    CONSOLE_AddMessage("Ping Colored is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_PING_COLORED [1/0]")
  CONSOLE_AddMessage("Help: Toggles Ping Colored.")
  if Cfg.HUD_Ping_Colored then
    CONSOLE_AddMessage("State: Ping Colored is currently enabled.")
  else
    CONSOLE_AddMessage("State: Ping Colored is currently disabled.")
  end
end

function Console:Cmd_NOCHATBEEP(enable)
  if enable == "1" then
    Cfg.NoChatBeep = true
    CONSOLE_AddMessage("No Chat Beep is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.NoChatBeep = false
    CONSOLE_AddMessage("No Chat Beep is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: NOCHATBEEP [1/0]")
  CONSOLE_AddMessage("Help: Toggles No Chat Beep.")
  if Cfg.NoChatBeep then
    CONSOLE_AddMessage("State: No Chat Beep is currently enabled.")
  else
    CONSOLE_AddMessage("State: No Chat Beep is currently disabled.")
  end
end

function Console:Cmd_HUD_AMMOLIST_MARKER_PRIMARY(enable)
  if enable == "1" then
    Cfg.HUD_Ammolist_Marker_Primary = true
    CONSOLE_AddMessage("Ammolist Marker Primary is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HUD_Ammolist_Marker_Primary = false
    CONSOLE_AddMessage("Ammolist Marker Primary is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_AMMOLIST_MARKER_PRIMARY [1/0]")
  CONSOLE_AddMessage("Help: Toggles Ammolist Marker Primary.")
  if Cfg.HUD_Ammolist_Marker_Primary then
    CONSOLE_AddMessage("State: Ammolist Marker Primary is currently enabled.")
  else
    CONSOLE_AddMessage("State: Ammolist Marker Primary is currently disabled.")
  end
end

function Console:Cmd_BRIGHTSKINSARMORS(enable)
  if enable == "1" then
    Cfg.BrightSkinsArmors = true
    CONSOLE_AddMessage("Bright Skins Armors is now enabled (Need reconnection).")
    if Game.LevelStarted == true then
      PMENU.ShowMenu()
      PMENU.PauseSounds()
      if Cfg.SimpleItems then
        PainMenu:NeedReconnection(0)
      else
        PainMenu:NeedRestartGame("ProSettings")
      end
      CONSOLE.Activate(false)
    else
      if not Cfg.SimpleItems then
        PainMenu:NeedRestartGame("ProSettings")
      end
      CONSOLE.Activate(false)
    end
    return
  end
  if enable == "0" then
    Cfg.BrightSkinsArmors = false
    CONSOLE_AddMessage("Bright Skins Armors is now disabled (Need reconnection).")
    if Game.LevelStarted == true then
      PMENU.ShowMenu()
      PMENU.PauseSounds()
      if Cfg.SimpleItems then
        PainMenu:NeedReconnection(0)
      else
        PainMenu:NeedRestartGame("ProSettings")
      end
      CONSOLE.Activate(false)
    else
      if not Cfg.SimpleItems then
        PainMenu:NeedRestartGame("ProSettings")
      end
      CONSOLE.Activate(false)
    end
    return
  end
  CONSOLE_AddMessage("Syntax: BRIGHTSKINSARMORS [1/0]")
  CONSOLE_AddMessage("Help: Toggles Bright Skins Armors.")
  if Cfg.BrightSkinsArmors then
    CONSOLE_AddMessage("State: Bright Skins Armors is currently enabled.")
  else
    CONSOLE_AddMessage("State: Bright Skins Armors is currently disabled.")
  end
end

function Console:Cmd_CHATICON(enable)
  if enable == "1" then
    Cfg.ChatIcon = true
    CONSOLE_AddMessage("Chat Icon is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.ChatIcon = false
    CONSOLE_AddMessage("Chat Icon is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: CHATICON [1/0]")
  CONSOLE_AddMessage("Help: Toggles Chat Icon.")
  if Cfg.ChatIcon then
    CONSOLE_AddMessage("State: Chat Icon is currently enabled.")
  else
    CONSOLE_AddMessage("State: Chat Icon is currently disabled.")
  end
end

function Console:Cmd_CHATICON_ANIM(enable)
  if enable == "1" then
    Cfg.ChatIcon_Anim = true
    CONSOLE_AddMessage("Chat Icon Animed is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.ChatIcon_Anim = false
    CONSOLE_AddMessage("Chat Icon Animed is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: CHATICON_ANIM [1/0]")
  CONSOLE_AddMessage("Help: Toggles Chat Icon Animed.")
  if Cfg.ChatIcon_Anim then
    CONSOLE_AddMessage("State: Chat Icon Animed is currently enabled.")
  else
    CONSOLE_AddMessage("State: Chat Icon Animed is currently disabled.")
  end
end

function Console:Cmd_HUD_FLAG_ICON(enable)
  if enable == "1" then
    Cfg.HUD_Flag_Icon = true
    CONSOLE_AddMessage("Flag Icon is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HUD_Flag_Icon = false
    CONSOLE_AddMessage("Flag Icon is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_FLAG_ICON [1/0]")
  CONSOLE_AddMessage("Help: Toggles Flag Icon.")
  if Cfg.HUD_Flag_Icon then
    CONSOLE_AddMessage("State: Flag Icon is currently enabled.")
  else
    CONSOLE_AddMessage("State: Flag Icon is currently disabled.")
  end
end

function Console:Cmd_HUD_FLAG_ICON_TRANS(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Change transparency (0-255)")
  elseif type(val) == "number" and val < 256 and 0 <= val then
    Cfg.HUD_Flag_Icon_Trans = val
  end
  CONSOLE_AddMessage("current transparency:  " .. Cfg.HUD_Flag_Icon_Trans)
end

function Console:Cmd_HUD_POWERUP_ICON(enable)
  if enable == "1" then
    Cfg.HUD_PowerUp_Icons = true
    CONSOLE_AddMessage("PowerUp Icon is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HUD_PowerUp_Icons = false
    CONSOLE_AddMessage("PowerUp Icon is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_POWERUP_ICON [1/0]")
  CONSOLE_AddMessage("Help: Toggles PowerUp Icon.")
  if Cfg.HUD_PowerUp_Icons then
    CONSOLE_AddMessage("State: PowerUp Icon is currently enabled.")
  else
    CONSOLE_AddMessage("State: PowerUp Icon is currently disabled.")
  end
end

function Console:Cmd_HUD_POWERUP_ICONS_TRANS(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Change transparency (0-255)")
  elseif type(val) == "number" and val < 256 and 0 <= val then
    Cfg.HUD_PowerUp_Icons_Trans = val
  end
  CONSOLE_AddMessage("current transparency:  " .. Cfg.HUD_PowerUp_Icons_Trans)
end

function Console:Cmd_HUD_MEDAL_GOOD_ICON(enable)
  if enable == "1" then
    Cfg.HUD_Medal_Good_Icon = true
    CONSOLE_AddMessage("Good Icon is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HUD_Medal_Good_Icon = false
    CONSOLE_AddMessage("Good Icon is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_MEDAL_GOOD_ICON [1/0]")
  CONSOLE_AddMessage("Help: Toggles Good Icon.")
  if Cfg.HUD_Medal_Good_Icon then
    CONSOLE_AddMessage("State: Good Icon is currently enabled.")
  else
    CONSOLE_AddMessage("State: Good Icon is currently disabled.")
  end
end

function Console:Cmd_HUD_MEDAL_NOMERCY_ICON(enable)
  if enable == "1" then
    Cfg.HUD_Medal_NoMercy_Icon = true
    CONSOLE_AddMessage("No Mercy Icon is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HUD_Medal_NoMercy_Icon = false
    CONSOLE_AddMessage("No Mercy Icon is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_MEDAL_NOMERCY_ICON [1/0]")
  CONSOLE_AddMessage("Help: Toggles No Mercy Icon.")
  if Cfg.HUD_Medal_NoMercy_Icon then
    CONSOLE_AddMessage("State: No Mercy Icon is currently enabled.")
  else
    CONSOLE_AddMessage("State: No Mercy Icon is currently disabled.")
  end
end

function Console:Cmd_HUD_MEDAL_STYLISH_ICON(enable)
  if enable == "1" then
    Cfg.HUD_Medal_Stylish_Icon = true
    CONSOLE_AddMessage("Stylish Icon is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HUD_Medal_Stylish_Icon = false
    CONSOLE_AddMessage("Stylish Icon is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_MEDAL_STYLISH_ICON [1/0]")
  CONSOLE_AddMessage("Help: Toggles Stylish Icon.")
  if Cfg.HUD_Medal_Stylish_Icon then
    CONSOLE_AddMessage("State: Stylish Icon is currently enabled.")
  else
    CONSOLE_AddMessage("State: Stylish Icon is currently disabled.")
  end
end

function Console:Cmd_HUD_MEDAL_SWEET_ICON(enable)
  if enable == "1" then
    Cfg.HUD_Medal_Sweet_Icon = true
    CONSOLE_AddMessage("Sweet Icon is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HUD_Medal_Sweet_Icon = false
    CONSOLE_AddMessage("Sweet Icon is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_MEDAL_SWEET_ICON [1/0]")
  CONSOLE_AddMessage("Help: Toggles Sweet Icon.")
  if Cfg.HUD_Medal_Sweet_Icon then
    CONSOLE_AddMessage("State: Sweet Icon is currently enabled.")
  else
    CONSOLE_AddMessage("State: Sweet Icon is currently disabled.")
  end
end

function Console:Cmd_HUD_MEDALS_ICONS_TRANS(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Change transparency (0-255)")
  elseif type(val) == "number" and val < 256 and 0 <= val then
    Cfg.HUD_Medals_Icons_Trans = val
  end
  CONSOLE_AddMessage("current transparency:  " .. Cfg.HUD_Medals_Icons_Trans)
end

function Console:Cmd_HUD_SHOW_MEDALS(enable)
  if enable == "1" then
    Cfg.HUD_Show_Medals = true
    CONSOLE_AddMessage("Show Medals is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HUD_Show_Medals = false
    CONSOLE_AddMessage("Show Medals is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_SHOW_MEDALS [1/0]")
  CONSOLE_AddMessage("Help: Toggles Show Medals.")
  if Cfg.HUD_Show_Medals then
    CONSOLE_AddMessage("State: Show Medals is currently enabled.")
  else
    CONSOLE_AddMessage("State: Show Medals is currently disabled.")
  end
end

function Console:Cmd_HUD_SHOW_PING(enable)
  if enable == "1" then
    Cfg.HUD_Show_Ping = true
    CONSOLE_AddMessage("Show ping is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HUD_Show_Ping = false
    CONSOLE_AddMessage("Show ping is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_SHOW_PING [1/0]")
  CONSOLE_AddMessage("Help: Toggles Show ping.")
  if Cfg.HUD_Show_Ping then
    CONSOLE_AddMessage("State: Show ping is currently enabled.")
  else
    CONSOLE_AddMessage("State: Show ping is currently disabled.")
  end
end

function Console:Cmd_HUD_SHOW_PACKETLOSS(enable)
  if enable == "1" then
    Cfg.HUD_Show_PacketLoss = true
    CONSOLE_AddMessage("Show Packet Loss is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HUD_Show_PacketLoss = false
    CONSOLE_AddMessage("Show Packet Loss is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_SHOW_PACKETLOSS [1/0]")
  CONSOLE_AddMessage("Help: Toggles Show Packet Loss.")
  if Cfg.HUD_Show_PacketLoss then
    CONSOLE_AddMessage("State: Show Packet Loss is currently enabled.")
  else
    CONSOLE_AddMessage("State: Show Packet Loss is currently disabled.")
  end
end

function Console:Cmd_HUD_SHOW_FPS(enable)
  if enable == "1" then
    Cfg.HUD_Show_FPS = true
    CONSOLE_AddMessage("Show FPS is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HUD_Show_FPS = false
    CONSOLE_AddMessage("Show FPS is now disabled.")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_SHOWFPS [1/0]")
  CONSOLE_AddMessage("Help: Toggles Show FPS.")
  if Cfg.HUD_Show_FPS then
    CONSOLE_AddMessage("State: Show FPS is currently enabled.")
  else
    CONSOLE_AddMessage("State: Show FPS is currently disabled.")
  end
end

function Console:Cmd_HUD_SHOW_SPEEDMETER(enable)
  if enable == "0" then
    Cfg.HUD_Show_Speedmeter = 0
    CONSOLE_AddMessage("Speedmeter disabled.")
    return
  end
  if enable == "1" then
    Cfg.HUD_Show_Speedmeter = 1
    CONSOLE_AddMessage("Speedmeter bar")
    return
  end
  if enable == "2" then
    Cfg.HUD_Show_Speedmeter = 2
    CONSOLE_AddMessage("Speedmeter text")
    return
  end
  if enable == "3" then
    Cfg.HUD_Show_Speedmeter = 3
    CONSOLE_AddMessage("Speedmeter text&bar")
    return
  end
  if enable == "1" then
    Cfg.HUD_Show_Speedmeter = 4
    CONSOLE_AddMessage("Speedmeter classic")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_SHOWSPEEDMETER [0/1/2]")
  CONSOLE_AddMessage("Help: Shows Speedmeter.")
  CONSOLE_AddMessage("State: Speedmeter is currently " .. tostring(Cfg.HUD_Show_Speedmeter))
end

function Console:Cmd_HUD_POWERUP_TIMER(enable)
  if enable == "1" then
    Cfg.HUD_PowerUp_Timer = true
    CONSOLE_AddMessage("PowerUp Timer is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HUD_PowerUp_Timer = false
    CONSOLE_AddMessage("PowerUp Timer is now disabled")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_POWERUP_TIMER [1/0]")
  CONSOLE_AddMessage("Help: Shows PowerUp Timer.")
  if Cfg.HUD_PowerUp_Timer then
    CONSOLE_AddMessage("State: PowerUp Timer is currently enabled.")
  else
    CONSOLE_AddMessage("State: PowerUp Timer is currently disabled.")
  end
end

function Console:Cmd_SIMPLEITEMS(enable)
  if enable == "1" then
    Cfg.SimpleItems = true
    CONSOLE_AddMessage("SimpleItems is now enabled.")
    if Game.LevelStarted == true then
      PMENU.ShowMenu()
      PMENU.PauseSounds()
      PainMenu:NeedReconnection(0)
      CONSOLE.Activate(false)
    else
      PainMenu:NeedReconnection(0)
      CONSOLE.Activate(false)
    end
    return
  end
  if enable == "0" then
    Cfg.SimpleItems = false
    CONSOLE_AddMessage("SimpleItems is now disabled")
    if Game.LevelStarted == true then
      PMENU.ShowMenu()
      PMENU.PauseSounds()
      PainMenu:NeedReconnection(0)
      CONSOLE.Activate(false)
    else
      PainMenu:NeedReconnection(0)
      CONSOLE.Activate(false)
    end
    return
  end
  CONSOLE_AddMessage("Syntax: SIMPLEITEMS [1/0]")
  CONSOLE_AddMessage("Help: Shows SimpleItems.")
  if Cfg.SimpleItems then
    CONSOLE_AddMessage("State: SimpleItems is currently enabled.")
  else
    CONSOLE_AddMessage("State: SimpleItems is currently disabled.")
  end
end

function Console:Cmd_BRIGHTSKINS_DEADBODY(enable)
  if enable == "1" then
    Cfg.BrightSkins_DeadBody = true
    CONSOLE_AddMessage("BrightSkins DeadBody is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.BrightSkins_DeadBody = false
    CONSOLE_AddMessage("BrightSkins DeadBody is now disabled")
    return
  end
  CONSOLE_AddMessage("Syntax: BRIGHTSKINS_DEADBODY [1/0]")
  CONSOLE_AddMessage("Help: Shows BrightSkins DeadBody.")
  if Cfg.BrightSkins_DeadBody then
    CONSOLE_AddMessage("State: BrightSkins DeadBody is currently enabled.")
  else
    CONSOLE_AddMessage("State: BrightSkins DeadBody is currently disabled.")
  end
end

function Console:Cmd_HUD_FRAGMESSAGE_STATUS(enable)
  if enable == "1" then
    Cfg.HUD_FragMessage_Status = true
    CONSOLE_AddMessage("FragMessage Status is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HUD_FragMessage_Status = false
    CONSOLE_AddMessage("FragMessage Status is now disabled")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_FRAGMESSAGE_STATUS [1/0]")
  CONSOLE_AddMessage("Help: Shows FragMessage Status.")
  if Cfg.HUD_FragMessage_Status then
    CONSOLE_AddMessage("State: FragMessage Status is currently enabled.")
  else
    CONSOLE_AddMessage("State: FragMessage Status is currently disabled.")
  end
end

function Console:Cmd_HUD_FRAGMESSAGE_STATUS_TIMING(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Set timing (120-480 milliseconds)")
  elseif type(val) == "number" and val < 481 and 120 <= val then
    Cfg.HUD_FragMessage_Status_Timing = val
  end
  CONSOLE_AddMessage("current timing:  " .. Cfg.HUD_FragMessage_Status_Timing)
end

function Console:Cmd_VID_GAMMA(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Set gamma (0-5)")
  elseif type(val) == "number" and val <= 5 and 0 <= val then
    Cfg.Gamma = val
    R3D.SetContrastGammaAndBrightness(Cfg.Contrast, val, Cfg.Brightness)
  end
  CONSOLE_AddMessage("current gamma:  " .. Cfg.Gamma)
end

function Console:Cmd_VID_CONTRAST(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Set contrast (0-1)")
  elseif type(val) == "number" and val <= 1 and 0 <= val then
    Cfg.Contrast = val
    R3D.SetContrastGammaAndBrightness(val, Cfg.Gamma, Cfg.Brightness)
  end
  CONSOLE_AddMessage("current contrast:  " .. Cfg.Contrast)
end

function Console:Cmd_VID_BRIGHTNESS(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Set brightness (0-1)")
  elseif type(val) == "number" and val <= 1 and 0 <= val then
    Cfg.Brightness = val
    R3D.SetContrastGammaAndBrightness(Cfg.Contrast, Cfg.Gamma, val)
  end
  CONSOLE_AddMessage("current brightness:  " .. Cfg.Brightness)
end

function Console:Cmd_AUD_MAINVOLUME(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Set main volume (0-100)")
  elseif type(val) == "number" and val <= 100 and 0 <= val then
    Cfg.MasterVolume = val
    SOUND.ApplySoundSettings(val, 100, Cfg.SfxVolume, Cfg.SpeakersSetup, Cfg.SoundPan, Cfg.ReverseStereo, Cfg.SoundProvider3D)
  end
  CONSOLE_AddMessage("current main volume:  " .. Cfg.MasterVolume)
end

function Console:Cmd_AUD_SFXVOLUME(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Set FX volume (0-100)")
  elseif type(val) == "number" and val <= 100 and 0 <= val then
    Cfg.SfxVolume = val
    SOUND.ApplySoundSettings(Cfg.MasterVolume, 100, val, Cfg.SpeakersSetup, Cfg.SoundPan, Cfg.ReverseStereo, Cfg.SoundProvider3D)
  end
  CONSOLE_AddMessage("current FX volume:  " .. Cfg.SfxVolume)
end

function Console:Cmd_AUD_MUSICVOLUME(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Set music volume (0-100)")
  elseif type(val) == "number" and val <= 100 and 0 <= val then
    Cfg.MusicVolume = val
    SOUND.StreamSetVolume(1, val)
  end
  CONSOLE_AddMessage("current music volume:  " .. Cfg.MusicVolume)
end

function Console:Cmd_AUD_AMBIENTVOLUME(val)
  val = tonumber(val)
  if val == nil then
    CONSOLE_AddMessage("Set ambient volume (0-100)")
  elseif type(val) == "number" and val <= 100 and 0 <= val then
    Cfg.AmbientVolume = val
    SOUND.StreamSetVolume(0, val)
  end
  CONSOLE_AddMessage("current ambient volume:  " .. Cfg.AmbientVolume)
end

function Console:Cmd_HUD_FRAGMESSAGE(enable)
  if enable == "1" then
    Cfg.HUD_FragMessage = true
    CONSOLE_AddMessage("FragMessage is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HUD_FragMessage = false
    CONSOLE_AddMessage("FragMessage is now disabled")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_FRAGMESSAGE [1/0]")
  CONSOLE_AddMessage("Help: Shows FragMessage.")
  if Cfg.HUD_FragMessage then
    CONSOLE_AddMessage("State: FragMessage is currently enabled.")
  else
    CONSOLE_AddMessage("State: FragMessage is currently disabled.")
  end
end

function Console:Cmd_HUD_TEAMCHATONLY(enable)
  if enable == "1" then
    Cfg.HUD_TeamChatOnly = true
    CONSOLE_AddMessage("Team Chat Only is now enabled.")
    return
  end
  if enable == "0" then
    Cfg.HUD_TeamChatOnly = false
    CONSOLE_AddMessage("Team Chat Only is now disabled")
    return
  end
  CONSOLE_AddMessage("Syntax: HUD_TEAMCHATONLY [1/0]")
  CONSOLE_AddMessage("Help: Shows Team Chat Only.")
  if Cfg.HUD_TeamChatOnly then
    CONSOLE_AddMessage("State: Team Chat Only is currently enabled.")
  else
    CONSOLE_AddMessage("State: Team Chat Only is currently disabled.")
  end
end
