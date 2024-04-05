PSpectatorControler.player = -1
o.angX = 0
o.angY = 0
o.mode = 1
o._entCam = nil
o._lastCamPos = Vector:New(0, 0, 0)
o._currentCamPos = Vector:New(0, 0, 0)
o._newCamPos = Vector:New(0, 0, 0)
o._desiredCamPos = Vector:New(0, 0, 0)
o._lastCamAng = Vector:New(0, 0, 0)
o._currentCamAng = Vector:New(0, 0, 0)
o._newCamAng = Vector:New(0, 0, 0)
o._desiredCamAng = Vector:New(0, 0, 0)
o.averagetickcountang = 10
o.tickcountang = 1
o.averagetickcountpos = 10
o.tickcountpos = 1
o.cameraframes = 0
o.autocameraframes = 0
o.autocameraswitch = 0
o.autocameramode = 0
o.cameraposition = Vector:New(0, 0, 0)
o.goodstatic = 0
o.autoineyes = 0
CameraStates = {
  Float = 0,
  InEyes = 1,
  Pivot = 2,
  Static = 3,
  Follow = 4,
  Auto = 5,
  Mapview = 6
}

function PSpectatorControler:New()
  local p = Clone(self)
  return p
end

function PSpectatorControler:SetPlayerVisibility(e, enable, state)
  ENTITY.EnableDraw(e, enable, true)
end

function PSpectatorControler:Init()
  Hud.Enabled = false
  MOUSE.Lock(true)
  self._entCam = ENTITY.Create(ETypes.Mesh, "../Data/Items/granat.dat", "polySurfaceShape234", 1)
  ENTITY.PO_Create(self._entCam, BodyTypes.Sphere, 0.3, ECollisionGroups.InsideItems)
  ENTITY.PO_EnableGravity(self._entCam, false)
  ENTITY.PO_SetMovedByExplosions(self._entCam, false)
  ENTITY.PO_HideFromPrediction(self._entCam)
  ENTITY.SetPosition(self._entCam, Lev.Pos.X, Lev.Pos.Y, Lev.Pos.Z)
  self._lastCamPos:Set(Lev.Pos)
  ENTITY.PO_SetMissile(self._entCam, MPProjectileTypes.Spectator)
  Mapview:Load(Lev.Map)
  self._matMapView = MATERIAL.Create("Textures/Electro.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  local filename = string.gsub(Lev.Map, "(%a+).mpk", "%1")
  self._matMapView = MATERIAL.Create("../mapview/" .. filename .. ".tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoMiniIcon = MATERIAL.Create("HUD/minigun", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoRocketIcon = MATERIAL.Create("HUD/rocket", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoIcon = MATERIAL.Create("HUD/kolki", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoRocketIcon = MATERIAL.Create("HUD/rocket", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoIcon1 = MATERIAL.Create("HUD/bolty", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoIcon2 = MATERIAL.Create("HUD/kulki", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoIconED = MATERIAL.Create("HUD/ikona_szuriken", TextureFlags.NoLOD)
  self._matAmmoElectroIcon = MATERIAL.Create("HUD/ikona_electro", TextureFlags.NoLOD)
  self._matAmmoOpenIcon = MATERIAL.Create("HUD/painkiller_open", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoCloseIcon = MATERIAL.Create("HUD/painkiller_close", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matInfinity = MATERIAL.Create("HUD/infinity", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matAmmoIconRFT = MATERIAL.Create("HUD/rifle", TextureFlags.NoLOD)
  self._matAmmoElectroIcon = MATERIAL.Create("HUD/ikona_flamer", TextureFlags.NoLOD)
  self._matAmmoIconSG = MATERIAL.Create("HUD/shell", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matFreezerIcon = MATERIAL.Create("HUD/ikona_freezer", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matMapViewBluePlayerIcon = MATERIAL.Create("Textures/team_blue.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matMapViewRedPlayerIcon = MATERIAL.Create("Textures/team_red.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
  self._matMapViewRespawn = MATERIAL.Create("Textures/respawn.tga", TextureFlags.NoLOD + TextureFlags.NoMipMaps)
end

function PSpectatorControler:Delete()
  local ps = Game.PlayerStats[self.player]
  if ps and ps._Entity and ps._Entity ~= 0 and ps.Spectator == 0 then
    self:SetPlayerVisibility(ps._Entity, true)
  end
end

function PSpectatorControler:NextPlayer(tab, idx)
  local getnext
  for i, o in tab, nil do
    self:SetPlayerVisibility(o._Entity, true)
    if getnext and o.Spectator == 0 then
      return i, o
    end
    if idx == i then
      getnext = true
    end
  end
  for i, o in tab, nil do
    if o.Spectator == 0 then
      return i, o
    end
  end
end

function PSpectatorControler:PostRender(delta)
  if not Hud then
    return
  end
  local w, h = R3D.ScreenSize()
  if Cfg.DisableHud then
    return
  end
  local cameramode = "FLOATCAM"
  if MPCfg.GameMode == "Clan Arena" then
    cameramode = "EYECAM"
  else
    if self.mode == 0 then
      cameramode = "FLOATCAM"
    end
    if self.mode == 1 then
      cameramode = "EYECAM"
    end
    if self.mode == 2 then
      cameramode = "PIVOTCAM"
    end
    if self.mode == 3 then
      cameramode = "STATICCAM"
    end
    if self.mode == 4 then
      cameramode = "FOLLOWCAM"
    end
    if self.mode == 5 then
      cameramode = "AUTOCAM"
    end
  end
  local cmx = w / 2 - 1.5 * HUD.GetTextWidth(cameramode) / 2
  local cmy = h - 28 * h / 480
  HUD.PrintXY(cmx + 2, cmy + 2, cameramode, "Impact", 0, 0, 0, 36)
  HUD.PrintXY(cmx, cmy, cameramode, "Impact", 160, 160, 160, 36)
  if MPCfg.GameMode ~= "Last Man Standing" or MPCfg.GameState == GameStates.Playing or MPCfg.GameState ~= GameStates.Finished then
  end
  local ps = Game.PlayerStats[self.player]
  if ps then
    local pnx = w / 2 - 1.8 * HUD.GetTextWidth(HUD.StripColorInfo(ps.Name)) / 2
    local pny = 125 * h / 768
    HUD.PrintXY(-1, pny + 3, HUD.StripColorInfo(ps.Name), "Impact", 0, 0, 0, 60)
    HUD.PrintXY(-1, pny, ps.Name, "Impact", 255, 255, 255, 60)
    if Cfg.MapView then
      self:DrawMapview()
    end
    if MPCfg.GameMode ~= "Clan Arena" then
      getplayerentity = ps._Entity
      Hud:DrawScores(ps.ClientID)
    end
  end
  if Cfg.HUD_FragMessage and fragmessagestart < Game.currentTime and fragmessageend > Game.currentTime and fragmessageend > Game.currentTime then
    self:ClanArenaMessage(Hud.fname)
  end
  if self.player ~= -1 and self.mode == CameraStates.Follow or self.player ~= -1 and self.mode == CameraStates.Auto and self.autoineyes == 1 then
    self:SpectatorHUD()
  end
  if self.player ~= -1 and self.mode == CameraStates.InEyes or self.player ~= -1 and self.mode == CameraStates.Auto and self.autoineyes == 1 or MPCfg.GameMode == "Clan Arena" then
    Hud:QuadRGBA(Hud._matCrosshair, w / 2, h / 2, Hud.CrossScale, true, 255, 255, 255, Cfg.CrosshairTrans / 100 * 96)
    self:SpectatorHUD()
  end
end

function PSpectatorControler:Teleport(x, y, z, a)
  ENTITY.SetPosition(self._entCam, x, y, z)
  self._lastCamPos:Set(x, y, z)
  ENTITY.SetOrientation(self._entCam, a)
  CAM.SetAng(-a / (math.pi / 180) - 180, 0, 0)
end

function PSpectatorControler:InterpolatePosition()
  if self._newCamPos.X ~= self._desiredCamPos.X or self._newCamPos.Y ~= self._desiredCamPos.Y or self._newCamPos.Z ~= self._desiredCamPos.Z then
    self._lastCamPos:Set(self._newCamPos.X, self._newCamPos.Y, self._newCamPos.Z)
    self._newCamPos:Set(self._desiredCamPos.X, self._desiredCamPos.Y, self._desiredCamPos.Z)
    self.averagetickcountpos = self.averagetickcountpos - (self.averagetickcountpos - self.tickcountpos) / 100
    if self.averagetickcountpos == 0 then
      self.averagetickcountpos = 1
    end
    self.tickcountpos = 0
  end
  local diff = Vector:New(0, 0, 0)
  diff.X = self._newCamPos.X - self._lastCamPos.X
  diff.Y = self._newCamPos.Y - self._lastCamPos.Y
  diff.Z = self._newCamPos.Z - self._lastCamPos.Z
  self._currentCamPos.X = self._lastCamPos.X + diff.X / (self.averagetickcountpos * 1)
  self._currentCamPos.Y = self._lastCamPos.Y + diff.Y / (self.averagetickcountpos * 1)
  self._currentCamPos.Z = self._lastCamPos.Z + diff.Z / (self.averagetickcountpos * 1)
  self.tickcountpos = self.tickcountpos + 1
  CAM.SetPos(self._currentCamPos.X, self._currentCamPos.Y, self._currentCamPos.Z)
end

function PSpectatorControler:InterpolateAngle()
  if self._newCamAng.X ~= self._desiredCamAng.X or self._newCamAng.Y ~= self._desiredCamAng.Y or self._newCamAng.Z ~= self._desiredCamAng.Z then
    self._lastCamAng:Set(self._newCamAng.X, self._newCamAng.Y, self._newCamAng.Z)
    self._newCamAng:Set(self._desiredCamAng.X, self._desiredCamAng.Y, self._desiredCamAng.Z)
    self.averagetickcountang = self.averagetickcountang - (self.averagetickcountang - self.tickcountang) / 100
    if self.averagetickcountang == 0 then
      self.averagetickcountang = 1
    end
    self.tickcountang = 0
  end
  local diff = Vector:New(0, 0, 0)
  diff.X = self._newCamAng.X - self._lastCamAng.X
  diff.Y = self._newCamAng.Y - self._lastCamAng.Y
  diff.Z = self._newCamAng.Z - self._lastCamAng.Z
  self._currentCamAng.X = self._lastCamAng.X + diff.X / (self.averagetickcountang * 1)
  self._currentCamAng.Y = self._lastCamAng.Y + diff.Y / (self.averagetickcountang * 1)
  self._currentCamAng.Z = self._lastCamAng.Z + diff.Z / (self.averagetickcountang * 1)
  self.tickcountang = self.tickcountang + 1
  CAM.SetAng(self._currentCamAng.X, self._currentCamAng.Y, self._currentCamAng.Z)
end

function PSpectatorControler:Float()
  if not MOUSE.IsLocked() then
    return
  end
  local dx, dy = MOUSE.GetDelta()
  if Cfg.InvertMouse then
    dy = -dy
  end
  local ax, ay, az = CAM.GetAng()
  ax = ax + dx
  ay = ay + dy
  if 80 < ay then
    ay = 80
  end
  if ay < -80 then
    ay = -80
  end
  CAM.SetAng(ax, ay, az)
  self._desiredCamAng:Set(ax, ay, az)
  local ox, oy, oz = CAM.GetPos()
  local move = Vector:New(0, 0, 0)
  if INP.Action(Actions.Forward) then
    local x, y, z = CAM.GetForwardVector()
    move:Add(x, y, z)
  end
  if INP.Action(Actions.Backward) then
    local x, y, z = CAM.GetForwardVector()
    move:Sub(x, y, z)
  end
  if INP.Action(Actions.Right) then
    local x, y, z = CAM.GetRightVector()
    move:Add(x, y, z)
  end
  if INP.Action(Actions.Left) then
    local x, y, z = CAM.GetRightVector()
    move:Sub(x, y, z)
  end
  move:Normalize()
  ENTITY.SetVelocity(self._entCam, move.X * 15, move.Y * 15, move.Z * 15)
  local x, y, z = ENTITY.GetWorldPosition(self._entCam)
  local destPos = Vector:New(x, y, z)
  local diff = destPos:Copy()
  diff:Sub(self._lastCamPos)
  if diff:Len() < 3 then
    destPos.X = self._lastCamPos.X + diff.X * 0.33
    destPos.Y = self._lastCamPos.Y + diff.Y * 0.33
    destPos.Z = self._lastCamPos.Z + diff.Z * 0.33
  end
  self._lastCamPos = destPos
  CAM.SetPos(destPos.X, destPos.Y, destPos.Z)
  self._desiredCamPos:Set(destPos.X, destPos.Y, destPos.Z)
end

function PSpectatorControler:InEyes()
  local ps = Game.PlayerStats[self.player]
  if ps and ps._Entity and ps._Entity ~= 0 and ps.Spectator == 0 and ps._animproc then
    self:SetPlayerVisibility(ps._Entity, false, ps._animproc.State)
    local ap = ps._animproc
    local x, y, z = ENTITY.PO_GetPawnHeadPos(ps._Entity)
    local a = ENTITY.GetOrientation(ps._Entity)
    local ax = -a / (math.pi / 180) - 180
    local ay = ap._LastPitch / (math.pi / 180)
    local az = 0
    CAM.SetAng(ax, ay, az)
    self._desiredCamAng:Set(ax, ay, az)
    CAM.SetPos(x, y, z)
    self._desiredCamPos:Set(x, y, z)
  end
end

function PSpectatorControler:Pivot()
  if not MOUSE.IsLocked() then
    return
  end
  local dx, dy = MOUSE.GetDelta()
  if Cfg.InvertMouse then
    dy = -dy
  end
  local ps = Game.PlayerStats[self.player]
  if ps and ps._Entity and ps._Entity ~= 0 and ps.Spectator == 0 and ps._animproc then
    self:SetPlayerVisibility(ps._Entity, true, ps._animproc.State)
    local v = Vector:New(0, 0, 5)
    self.angX = self.angX + dy / 40
    self.angY = self.angY + dx / 40
    v:Rotate(self.angX, self.angY, 0)
    local px, py, pz = ENTITY.GetPosition(ps._Entity)
    py = py + 0.8
    local b, d, x, y, z = WORLD.LineTraceFixedGeom(px, py, pz, px + v.X, py + v.Y, pz + v.Z)
    if not b then
      x, y, z = px + v.X, py + v.Y, pz + v.Z
    else
      v:Normalize()
      x, y, z = x - v.X * 0.3, y - v.Y * 0.3, z - v.Z * 0.3
    end
    CAM.SetPos(x, y, z)
    CAM.SetAngRad(-self.angY, -self.angX, 0)
    self._desiredCamAng:Set(-self.angY, -self.angX, 0)
    self._desiredCamPos:Set(x, y, z)
  end
end

function PSpectatorControler:Follow()
  if not MOUSE.IsLocked() then
    return
  end
  local dx, dy = MOUSE.GetDelta()
  if Cfg.InvertMouse then
    dy = -dy
  end
  local ps = Game.PlayerStats[self.player]
  if ps and ps._Entity and ps._Entity ~= 0 and ps.Spectator == 0 and ps._animproc then
    self:SetPlayerVisibility(ps._Entity, true, ps._animproc.State)
    local v = Vector:New(0, 0, 4)
    local ap = ps._animproc
    local x, y, z = ENTITY.PO_GetPawnHeadPos(ps._Entity)
    local a = ENTITY.GetOrientation(ps._Entity)
    local ax = -a / (math.pi / 180) - 180
    local ay = ap._LastPitch / (math.pi / 180) - 60
    v:Rotate(ay * (math.pi / 180), -ax * (math.pi / 180), 0)
    local px, py, pz = ENTITY.GetPosition(ps._Entity)
    py = py + 0.8
    local b, d, x, y, z = WORLD.LineTraceFixedGeom(px, py, pz, px + v.X, py + v.Y, pz + v.Z)
    if not b then
      x, y, z = px + v.X, py + v.Y, pz + v.Z
    else
      v:Normalize()
      x, y, z = x - v.X * 0.3, y - v.Y * 0.3, z - v.Z * 0.3
    end
    CAM.SetPos(x, y, z)
    CAM.SetAngRad(ax * (math.pi / 180), 30 * (math.pi / 180), 0)
    self._desiredCamAng:Set(ax * (math.pi / 180), ay * (math.pi / 180) + 30 * (math.pi / 180), 0)
    self._desiredCamPos:Set(x, y, z)
  end
end

function PSpectatorControler:Static()
  if not MOUSE.IsLocked() then
    return
  end
  local dx, dy = MOUSE.GetDelta()
  if Cfg.InvertMouse then
    dy = -dy
  end
  local ps = Game.PlayerStats[self.player]
  if ps and ps._Entity and ps._Entity ~= 0 and ps.Spectator == 0 and ps._animproc then
    local psx, psy, psz = ENTITY.GetPosition(ps._Entity)
    local min = 100000000
    if self.cameraframes == 0 then
      local areas, cnt = GObjects:GetElementsWithFieldValue("_Name", "PlayerRespawn*")
      for i = 1, cnt do
        local area = areas[i]
        local p = area.Points[1]
        local b, d, x, y, z = WORLD.LineTraceFixedGeom(psx, psy, psz, p.X, p.Y, p.Z)
        if not b and min > Dist3D(psx, psy, psz, p.X, p.Y, p.Z) then
          self.cameraposition.X = p.X
          self.cameraposition.Y = p.Y
          self.cameraposition.Z = p.Z
          goodstatic = 1
          min = Dist3D(psx, psy, psz, self.cameraposition.X, self.cameraposition.Y, self.cameraposition.Z)
        end
      end
      self.cameraframes = 1
    end
    if 0 < self.cameraframes then
      self.cameraframes = self.cameraframes + 1
    end
    if self.cameraframes == 60 then
      self.cameraframes = 0
    end
    self:SetPlayerVisibility(ps._Entity, true, ps._animproc.State)
    px = self.cameraposition.X
    py = self.cameraposition.Y
    pz = self.cameraposition.Z
    py = py + 1
    CAM.SetPos(px, py, pz)
    local v = Vector:New(psx - px, psy - py, psz - pz)
    v.Y = v.Y + 0.8
    v:Normalize()
    local arm = self:Length2D(v.X, v.Z)
    if 0 >= v.X and v.X ~= 0 then
      self.angle = math.atan(v.Z / v.X) * (180 / math.pi) - 90
    end
    if 0 < v.X and v.X ~= 0 then
      self.angle = math.atan(v.Z / v.X) * (180 / math.pi) + 90
    end
    if arm ~= 0 then
      self.angle2 = -math.atan(v.Y / arm) * (180 / math.pi)
    end
    self.x = v.X
    self.y = v.Y
    self.z = v.Z
    if self and self.angle and self.angle2 then
      CAM.SetAngRad(self.angle / (180 / math.pi), self.angle2 / (180 / math.pi), 0)
      self._desiredCamAng:Set(self.angle / (180 / math.pi), self.angle2 / (180 / math.pi), 0)
      self._desiredCamPos:Set(px, py, pz)
    end
  end
end

function PSpectatorControler:Auto()
  if self.autocameraframes == 0 then
    self.goodstatic = 0
    self.autocameramode = math.random(4)
    if 0 < self.autocameramode then
      self:Static()
    end
    if self.autocameramode > 1 or self.goodstatic == 0 then
      self:InEyes()
    end
    if self.autocameramode > 3 then
      self:Follow()
    end
    self.autocameraswitch = math.random(10) * 60 + 125
    self.autocameraframes = 1
  end
  if 0 < self.autocameramode then
    self:Static()
    self.autoineyes = 0
  end
  if self.autocameramode > 1 then
    self:InEyes()
    self.autoineyes = 1
  end
  if self.autocameramode > 3 then
    self:Follow()
    self.autoineyes = 1
  end
  if self.autocameraframes > 0 then
    self.autocameraframes = self.autocameraframes + 1
  end
  if self.autocameraframes > self.autocameraswitch then
    self.autocameraframes = 0
  end
end

function PSpectatorControler:Tick3(delta)
  if MPCfg.GameMode == "Clan Arena" then
    self:InEyes()
  elseif self.mode == CameraStates.InEyes then
    self:InEyes()
  elseif self.mode == CameraStates.Pivot then
    self:Pivot()
  elseif self.mode == CameraStates.Follow then
    self:Follow()
  elseif self.mode == CameraStates.Static then
    self:Static()
  elseif self.mode == CameraStates.Auto then
    self:Auto()
  else
    self:Float()
  end
  self:CameraModeSwitch()
  self:ForceSpecCheck()
  if Cfg.CameraInterpolatePosition then
    self:InterpolatePosition()
  end
  if Cfg.CameraInterpolateAngle then
    self:InterpolateAngle()
  end
  if Cfg.ConfigMapView then
    self:MapViewConfigure()
  end
end

function PSpectatorControler:CameraModeSwitch()
  if INP.Action(Actions.Fire) then
    if not self._fire then
      Game:Print(self.player)
      self.player = self:NextPlayer(Game.PlayerStats, self.player)
      if MPCfg.GameMode == "Clan Arena" and MPCfg.GameState ~= GameStates.WarmUp then
        for i, psc in Game.PlayerStats, nil do
          if psc.ClientID ~= 255 then
            if Game.PlayerStats[self.player].Team ~= Cfg.Team then
              self.player = self:NextPlayer(Game.PlayerStats, self.player)
            else
              self.player = self.player
            end
          end
        end
      end
      if not self.player then
        self.player = -1
      end
      Game:Print(self.player)
    end
    self._fire = true
  else
    self._fire = nil
  end
  if MPCfg.GameMode ~= "Clan Arena" then
    if INP.Action(Actions.AltFire) then
      if not self._altfire then
        self.mode = CameraStates.Float
      end
      self._altfire = true
      for i, o in Game.PlayerStats, nil do
        self:SetPlayerVisibility(o._Entity, true)
      end
    else
      self._altfire = nil
    end
    if INP.Action(Actions.NextWeapon) then
      self.mode = self.mode + 1
      GObjects:ToKill(Game._procStats)
      Game._procStats = nil
      MPSTATS.Hide()
      if self.mode > 5 then
        self.mode = 0
      end
    end
    if INP.Action(Actions.PrevWeapon) then
      self.mode = self.mode - 1
      GObjects:ToKill(Game._procStats)
      Game._procStats = nil
      MPSTATS.Hide()
      if self.mode < 0 then
        self.mode = 5
      end
    end
  end
end

function PSpectatorControler:ForceSpecCheck()
  if (MPCfg.GameMode ~= "Last Man Standing" and MPCfg.GameMode ~= "Clan Arena" or MPCfg.GameState ~= GameStates.Playing and MPCfg.GameState ~= GameStates.Finished) and INP.Action(Actions.Jump) then
    INP.Reset()
    MPSTATS.Hide()
    if Game._procStats then
      GObjects:ToKill(Game._procStats)
      Game._procStats = nil
    end
    Game.PlayerSpectatorRequest(NET.GetClientID(), 0)
  end
end

function PSpectatorControler:Length2D(x, y)
  return math.sqrt(x * x + y * y)
end

function PSpectatorControler:Length3D(x, y, z)
  return math.sqrt(x * x + y * y + z * z)
end

function PSpectatorControler:ProHud(he, ar, am1, am2, cwi, art)
  local w, h = R3D.ScreenSize()
  local gray = R3D.RGB(120, 120, 70)
  local sizex, sizey = MATERIAL.Size(Hud._matHUDLeft)
  local showinf = 0.9
  local cupriammolist = {
    Hud._matAmmoOpenIconSH,
    Hud._matAmmoListShellIconSH,
    Hud._matAmmoListKolkiIconSH,
    Hud._matAmmoListRocketIconSH,
    Hud._matAmmoListSzurikenIconSH,
    Hud._matAmmoListrifleIconSH,
    Hud._matAmmoListBoltyIconSH
  }
  local cualtammolist = {
    Hud._matAmmoCloseIconSH,
    Hud._matAmmoListFreezerIconSH,
    Hud._matAmmoListRocketIconSH,
    Hud._matAmmoListMiniIconSH,
    Hud._matAmmoListElectroIconSH,
    Hud._matAmmoListikonaIconSH,
    Hud._matAmmoListKulkiIconSH
  }
  local cupriammolistnumwar = {
    0,
    CPlayer.s_SubClass.AmmoWarning[Shotgun],
    CPlayer.s_SubClass.AmmoWarning[Stakes],
    CPlayer.s_SubClass.AmmoWarning[Grenades],
    CPlayer.s_SubClass.AmmoWarning[Shurikens],
    CPlayer.s_SubClass.AmmoWarning[Rifle],
    CPlayer.s_SubClass.AmmoWarning[Bolt]
  }
  local cualtammolistnumwar = {
    0,
    CPlayer.s_SubClass.AmmoWarning[IceBullets],
    CPlayer.s_SubClass.AmmoWarning[Grenades],
    CPlayer.s_SubClass.AmmoWarning[MiniGun],
    CPlayer.s_SubClass.AmmoWarning[Electro],
    CPlayer.s_SubClass.AmmoWarning[FlameThrower],
    CPlayer.s_SubClass.AmmoWarning[HeaterBomb]
  }
  local cunumcharact = {
    "%03d",
    "%03d",
    "%04d",
    "%03d",
    "%04d",
    "%04d",
    "%04d"
  }
  local color = {
    {
      204,
      102,
      0
    },
    {
      153,
      153,
      153
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
        255,
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
  local colorh = {
    255,
    0,
    0
  }
  if 25 < he and he <= 50 then
    colorh = {
      255,
      102,
      0
    }
  elseif 50 < he and he <= 100 then
    colorh = {
      0,
      204,
      0
    }
  elseif 100 < he then
    colorh = {
      0,
      204,
      255
    }
  end
  Hud:QuadRGBA(Hud._matHealthSH, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 13 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false, colorh[1], colorh[2], colorh[3], 255)
  Hud:DrawDigitsText1(Cfg.HUDSize * 52 * w / 1024, (768 + Cfg.HUDSize * 15 - Cfg.HUDSize * sizey) * h / 768, string.sub(string.format("%03d", he), -3), 0.9 * Cfg.HUDSize, CPlayer.HealthWarning)
  if art == 0 then
    Hud:QuadRGBA(Hud._matArmorNormalSH, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 48 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false, 0, 0, 0, 125)
  elseif art == 1 then
    Hud:QuadRGBA(Hud._matArmorNormalSH, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 48 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false, color[1][1], color[1][2], color[1][3], 255)
  elseif art == 2 then
    Hud:QuadRGBA(Hud._matArmorNormalSH, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 48 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false, color[2][1], color[2][2], color[2][3], 255)
  elseif art == 3 then
    Hud:QuadRGBA(Hud._matArmorNormalSH, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 48 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false, color[3][1], color[3][2], color[3][3], 255)
  end
  Hud:DrawDigitsText1(Cfg.HUDSize * 52 * w / 1024, (768 + Cfg.HUDSize * 51 - Cfg.HUDSize * sizey) * h / 768, string.sub(string.format("%03d", ar), -3), 0.9 * Cfg.HUDSize, CPlayer.ArmorWarning)
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
  local i = cwi
  if type(i) == "number" and i <= 7 and 1 <= i and cwi == i then
    Hud:QuadRGBA(cupriammolist[i], (1024 - 57 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 13 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false, prcolor[i][1], prcolor[i][2], prcolor[i][3], 255)
    Hud:QuadRGBA(cualtammolist[i], (1024 - 57 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 48 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false, alcolor[i][1], alcolor[i][2], alcolor[i][3], 255)
    Hud:DrawDigitsText1((1024 - 117 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 15 - Cfg.HUDSize * sizey) * h / 768, string.sub(string.format(cunumcharact[i], am1), -3), showinf * Cfg.HUDSize, cupriammolistnumwar[i])
    Hud:DrawDigitsText1((1024 - 117 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 51 - Cfg.HUDSize * sizey) * h / 768, string.sub(string.format(cunumcharact[i], am2), -3), showinf * Cfg.HUDSize, cualtammolistnumwar[i])
  end
end

function PSpectatorControler:SpectatorHUD()
  if not Hud then
    return
  end
  local w, h = R3D.ScreenSize()
  local ps = Game.PlayerStats[self.player]
  if ps then
    local trans = HUD.GetTransparency()
    local sizex, sizey = MATERIAL.Size(Hud._matHUDLeft)
    local he = 0
    local armor = 0
    local ammo1 = 0
    local ammo2 = 0
    local currentweaponindex = 0
    local armortype = 0
    local font = "Impact"
    local pd = Game.PlayerData[ps.ClientID]
    if pd ~= nil then
      he = math.floor(pd.Health)
      armor = math.floor(pd.Armour)
      ammo1 = pd.Ammo1
      ammo2 = pd.Ammo2
      currentweaponindex = pd.Weapon
      armortype = pd.ArmorType
    end
    local ammo1warning, ammo2warning
    if Cfg.HUD_HudStyle ~= 0 then
      self:ProHud(he, armor, ammo1, ammo2, currentweaponindex, armortype)
    else
      if currentweaponindex == 2 then
        ammo1warning = CPlayer.s_SubClass.AmmoWarning[Shotgun]
        ammo2warning = CPlayer.s_SubClass.AmmoWarning[IceBullets]
      end
      if currentweaponindex == 3 then
        ammo1warning = CPlayer.s_SubClass.AmmoWarning[Stakes]
        ammo2warning = CPlayer.s_SubClass.AmmoWarning[Grenades]
      end
      if currentweaponindex == 4 then
        ammo1warning = CPlayer.s_SubClass.AmmoWarning[Shotgun]
        ammo2warning = CPlayer.s_SubClass.AmmoWarning[MiniGun]
      end
      if currentweaponindex == 5 then
        ammo1warning = CPlayer.s_SubClass.AmmoWarning[Shurikens]
        ammo2warning = CPlayer.s_SubClass.AmmoWarning[Electro]
      end
      if currentweaponindex == 6 then
        ammo1warning = CPlayer.s_SubClass.AmmoWarning[Rifle]
        ammo2warning = nil
      end
      if currentweaponindex == 7 then
        ammo1warning = CPlayer.s_SubClass.AmmoWarning[Bolt]
        ammo2warning = CPlayer.s_SubClass.AmmoWarning[HeaterBomb]
      end
      Hud:DrawDigitsText(Cfg.HUDSize * 52 * w / 1024, (768 + Cfg.HUDSize * 16 - Cfg.HUDSize * sizey) * h / 768, string.sub(string.format("%03d", he), -3), 0.9 * Cfg.HUDSize, CPlayer.HealthWarning)
      Hud:DrawDigitsText(Cfg.HUDSize * 52 * w / 1024, (768 + Cfg.HUDSize * 50 - Cfg.HUDSize * sizey) * h / 768, string.sub(string.format("%03d", armor), -3), 0.9 * Cfg.HUDSize, nil)
      Hud:DrawDigitsText((1024 - 118 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 16 - Cfg.HUDSize * sizey) * h / 768, string.sub(string.format("%03d", ammo1), -3), 0.9 * Cfg.HUDSize, ammo1warning)
      Hud:DrawDigitsText((1024 - 118 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 50 - Cfg.HUDSize * sizey) * h / 768, string.sub(string.format("%03d", ammo2), -3), 0.9 * Cfg.HUDSize, ammo2warning)
      if currentweaponindex == 1 then
        Hud:Quad(self._matAmmoOpenIcon, (1024 - 62 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 12 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
        Hud:Quad(self._matAmmoCloseIcon, (1024 - 62 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 50 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
      elseif Currentweaponindex == 2 then
        Hud:Quad(self._matAmmoIconSG, (1024 - 52 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 11 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
        Hud:Quad(self._matFreezerIcon, (1024 - 55 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 46 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
      elseif currentweaponindex == 3 then
        Hud:Quad(self._matAmmoIcon, (1024 - 52 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 11 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
        Hud:Quad(self._matAmmoRocketIcon, (1024 - 52 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 49 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
      elseif currentweaponindex == 4 then
        Hud:Quad(self._matAmmoMiniIcon, (1024 - 52 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 49 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
        Hud:Quad(self._matAmmoRocketIcon, (1024 - 52 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 17 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
      elseif currentweaponindex == 5 then
        Hud:Quad(self._matAmmoIconED, (1024 - 56 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 11 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
        Hud:Quad(self._matAmmoElectroIcon, (1024 - 52 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 42 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
      elseif currentweaponindex == 6 then
        Hud:Quad(self._matAmmoIconRFT, (1024 - 56 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 12 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
        Hud:Quad(self._matAmmoElectroIcon, (1024 - 52 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 47 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
      elseif currentweaponindex == 7 then
        Hud:Quad(self._matAmmoIcon1, (1024 - 52 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 11 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
        Hud:Quad(self._matAmmoIcon2, (1024 - 52 * Cfg.HUDSize) * w / 1024, (768 + Cfg.HUDSize * 49 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
      end
      if armortype == 0 then
        Hud:Quad(Hud._matArmorNormal, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 49 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
      elseif armortype == 1 then
        Hud:Quad(Hud._matArmorGreen, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 49 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
      elseif armortype == 2 then
        Hud:Quad(Hud._matArmorYellow, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 49 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
      elseif armortype == 3 then
        Hud:Quad(Hud._matArmorRed, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 49 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
      end
      Hud:Quad(Hud._matHealth, Cfg.HUDSize * 17 * w / 1024, (768 + Cfg.HUDSize * 14 - Cfg.HUDSize * sizey) * h / 768, Cfg.HUDSize, false)
    end
  end
end

function PSpectatorControler:ClanArenaMessage(cames)
  local w, h = R3D.ScreenSize()
  if Cfg.HUD_HudStyle == 0 then
    fafontsizes = 26
    fafontcolortxt = {
      230,
      161,
      97
    }
    fafonttypo = "timesbd"
  else
    fafontsizes = 22
    fafontcolortxt = {
      255,
      255,
      255
    }
    fafonttypo = "Impact"
  end
  HUD.SetFont(fafonttypo, fafontsizes)
  HUD.PrintXY((w - HUD.GetTextWidth(HUD.StripColorInfo(cames))) / 2 + 1, 450 * h / 768 + 1, HUD.StripColorInfo(cames), fafonttypo, 15, 15, 15, fafontsizes)
  HUD.PrintXY((w - HUD.GetTextWidth(cames)) / 2, 450 * h / 768, cames, fafonttypo, fafontcolortxt[1], fafontcolortxt[2], fafontcolortxt[3], fafontsizes)
end

function PSpectatorControler:DrawMapview()
  if not Hud then
    return
  end
  local w, h = R3D.ScreenSize()
  local sizex, sizey = MATERIAL.Size(self._matMapView)
  if sizex == 0 then
    sizex = 1
  end
  if sizey == 0 then
    sizey = 1
  end
  local xscale = 1
  if w ~= 0 then
    xscale = w / 800
  end
  local yscale = 1
  if h ~= 0 then
    yscale = h / 600
  end
  if Cfg.ConfigMapView then
    HUD.PrintXY(w / 3, h / 1.5, "Scale (weapon1/2):" .. tostring(Mapview.globalscale) .. [[

Transx (weapon3/4): ]] .. tostring(Mapview.globaltranslatex) .. [[

Transy (weapon5/6):]] .. tostring(Mapview.globaltranslatey) .. [[

Translaterot (weapon7/8): ]] .. tostring(Mapview.globaltranslaterot * 180 / math.pi) .. [[

IMAGE Scale (weapon8/9):]] .. tostring(Mapview.imagescale) .. [[

IMAGE Transx (weapon10/11): ]] .. tostring(Mapview.imagetranslatex) .. [[

IMAGE Transy (weapon12/13):]] .. tostring(Mapview.imagetranslatey) .. [[

Scalex:]] .. tostring(xscale) .. "    sizex:" .. tostring(sizex) .. [[

Scaley:]] .. tostring(yscale) .. "    sizey:" .. tostring(sizey), "Impact", 255, 255, 255, 14 * yscale)
  end
  local ix = Mapview.imagetranslatex
  local iy = Mapview.imagetranslatey
  local iw = Mapview.imagescale * sizex
  local id = Mapview.imagescale * sizey
  HUD.DrawQuadRGBA(self._matMapView, xscale * ix, yscale * iy, xscale * iw, yscale * id, 255, 255, 255, 255)
  for id, ps in Game.PlayerStats, nil do
    if ps and ps._Entity and ps._Entity ~= 0 and ps.Spectator == 0 and ps._animproc then
      local psx, pspiey, psz = ENTITY.GetPosition(ps._Entity)
      local px = psx * Mapview.globalscale * Mapview.imagescale + Mapview.globaltranslatex * Mapview.imagescale
      local py = psz * Mapview.globalscale * Mapview.imagescale + Mapview.globaltranslatey * Mapview.imagescale
      if ix > px then
        Mapview.globaltranslatex = ix / Mapview.imagescale - psx * Mapview.globalscale
      end
      if iy > py then
        Mapview.globaltranslatey = iy / Mapview.imagescale - psz * Mapview.globalscale
      end
      if px > ix + iw then
        Mapview.globaltranslatex = (ix + iw) / Mapview.imagescale - psx * Mapview.globalscale
      end
      if py > Mapview.imagetranslatey + Mapview.imagescale * sizey then
        Mapview.globaltranslatey = (Mapview.imagetranslatey + Mapview.imagescale * sizey) / Mapview.imagescale - psz * Mapview.globalscale
      end
      px = psx * Mapview.globalscale * Mapview.imagescale + Mapview.globaltranslatex * Mapview.imagescale
      py = psz * Mapview.globalscale * Mapview.imagescale + Mapview.globaltranslatey * Mapview.imagescale
      if MPCfg.GameMode == "Clan Arena" and MPCfg.GameState ~= GameStates.WarmUp then
        if ps.Team == Cfg.Team and Cfg.Team == 0 then
          if 0 < yscale * py - yscale * 18 then
            HUD.PrintXY(xscale * px, yscale * py - yscale * 18, ps.Name, "Impact", 230, 161, 97, yscale * 16)
          end
          HUD.DrawQuadRGBA(self._matMapViewBluePlayerIcon, xscale * px - xscale * 20 / 2, yscale * py - yscale * 20 / 2, xscale * 20, yscale * 20, 255, 255, 255, 255)
        elseif ps.Team == Cfg.Team and Cfg.Team == 1 then
          if 0 < yscale * py - yscale * 18 then
            HUD.PrintXY(xscale * px, yscale * py - yscale * 18, ps.Name, "Impact", 230, 161, 97, yscale * 16)
          end
          HUD.DrawQuadRGBA(self._matMapViewRedPlayerIcon, xscale * px - xscale * 20 / 2, yscale * py - yscale * 20 / 2, xscale * 20, yscale * 20, 255, 255, 255, 255)
        end
      elseif ps.Team == 0 then
        if 0 < yscale * py - yscale * 18 then
          HUD.PrintXY(xscale * px, yscale * py - yscale * 18, ps.Name, "Impact", 230, 161, 97, yscale * 16)
        end
        HUD.DrawQuadRGBA(self._matMapViewBluePlayerIcon, xscale * px - xscale * 20 / 2, yscale * py - yscale * 20 / 2, xscale * 20, yscale * 20, 255, 255, 255, 255)
      else
        if 0 < yscale * py - yscale * 18 then
          HUD.PrintXY(xscale * px, yscale * py - yscale * 18, ps.Name, "Impact", 230, 161, 97, yscale * 16)
        end
        HUD.DrawQuadRGBA(self._matMapViewRedPlayerIcon, xscale * px - xscale * 20 / 2, yscale * py - yscale * 20 / 2, xscale * 20, yscale * 20, 255, 255, 255, 255)
      end
    end
  end
  if Cfg.MapViewShowRespawns then
    local areas, cnt = GObjects:GetElementsWithFieldValue("_Name", "PlayerRespawn*")
    for i = 1, cnt do
      local area = areas[i]
      local p = area.Points[1]
      local px = p.X * Mapview.globalscale * Mapview.imagescale + Mapview.globaltranslatex * Mapview.imagescale
      local py = p.Z * Mapview.globalscale * Mapview.imagescale + Mapview.globaltranslatey * Mapview.imagescale
      HUD.DrawQuadRGBA(self._matMapViewRespawn, xscale * px - xscale * 20 / 2, yscale * py - yscale * 20, xscale * 20, yscale * 20, 255, 255, 255, 255)
    end
  end
end

function PSpectatorControler:MapViewConfigure()
  if INP.Action(Actions.Weapon1) then
    Mapview.globalscale = Mapview.globalscale - 0.001
  end
  if INP.Action(Actions.Weapon2) then
    Mapview.globalscale = Mapview.globalscale + 0.001
  end
  if INP.Action(Actions.Weapon3) then
    Mapview.globaltranslatex = Mapview.globaltranslatex - 1
  end
  if INP.Action(Actions.Weapon4) then
    Mapview.globaltranslatex = Mapview.globaltranslatex + 1
  end
  if INP.Action(Actions.Weapon5) then
    Mapview.globaltranslatey = Mapview.globaltranslatey - 1
  end
  if INP.Action(Actions.Weapon6) then
    Mapview.globaltranslatey = Mapview.globaltranslatey + 1
  end
  if INP.Action(Actions.Weapon7) then
    Mapview.globaltranslaterot = Mapview.globaltranslaterot - math.pi / 200
  end
  if INP.Action(Actions.Weapon8) then
    Mapview.globaltranslaterot = Mapview.globaltranslaterot + math.pi / 200
  end
  if Mapview.globaltranslaterot >= math.pi then
    Mapview.globaltranslaterot = math.pi
  end
  if Mapview.globaltranslaterot <= -math.pi then
    Mapview.globaltranslaterot = -math.pi
  end
  if INP.Action(Actions.Weapon9) then
    Mapview.imagescale = Mapview.imagescale - 0.01
  end
  if INP.Action(Actions.Weapon10) then
    Mapview.imagescale = Mapview.imagescale + 0.01
  end
  if INP.Action(Actions.Weapon11) then
    Mapview.imagetranslatex = Mapview.imagetranslatex - 1
  end
  if INP.Action(Actions.Weapon12) then
    Mapview.imagetranslatex = Mapview.imagetranslatex + 1
  end
  if INP.Action(Actions.Weapon13) then
    Mapview.imagetranslatey = Mapview.imagetranslatey - 1
  end
  if INP.Action(Actions.Weapon14) then
    Mapview.imagetranslatey = Mapview.imagetranslatey + 1
  end
  Mapview:Save(Lev.Map)
end
