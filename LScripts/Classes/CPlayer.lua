CPlayer = {
  Name = "No Name",
  Model = "",
  IsMovedByExplosions = true,
  Weapons = {
    nil,
    nil,
    nil,
    nil,
    nil
  },
  ExplosiveFired = false,
  State = 0,
  EnabledWeapons = {
    "PainKiller",
    "Shotgun",
    "StakeGunGL",
    "MiniGunRL",
    "DriverElectro",
    "RifleFlameThrower",
    "BoltGunHeater"
  },
  ForwardVector = Vector:New(0, 0, 0),
  RightVector = Vector:New(0, 0, 0),
  Health = 1999,
  HealthWarning = 25,
  Armor = 0,
  ArmorWarning = 25,
  ArmorType = 0,
  ArmorRescueFactor = 0,
  ArmorFound = 0,
  FrozenArmor = false,
  WalkBobSpeed = 10,
  QuadedEnemies = 0,
  _CamDisplacement = 0,
  Money = 0,
  HolyItems = 0,
  BonusItems = 0,
  SecretsFound = 0,
  CurAction = 0,
  LastAction = 0,
  Comments = 0,
  MedalGood = 0,
  MedalGoodSound = 0,
  MedalStylish = false,
  MedalStylishNextStake = 0,
  _lava = -1,
  _waitingForFirstFire = false,
  ClientID = ServerID,
  LevelBodyCount = 0,
  HasQuad = false,
  HasWeaponModifier = false,
  HasPentagram = false,
  SoulsCount = 0,
  TotalSoulsCount = 0,
  MinimalHealth = 9999,
  WasHurt = false,
  _CurWeaponIndex = 1,
  _RunTime = 0,
  _JumpSndDelay = -1,
  _GroundSndDelay = -1,
  _LastStep = Vector:New(100, 0, 0),
  _LastStepTime = -1,
  _LastPos = Vector:New(100, 0, 0),
  _Leg = 1,
  _Walking = false,
  _WalkTime = 0,
  _yaw = 0,
  _healthDecCnt = 0,
  _Class = "CPlayer",
  _slowDown = nil,
  _velocity = 0,
  _velocityx = 0,
  _velocityy = 0,
  _velocityz = 0,
  _groundx = 0,
  _groundy = 0,
  _groundz = 0,
  _orientation = 0,
  _slowDownTime = nil,
  _lastPosHit = Vector:New(0, 0, 0),
  _lastTimeHit = -100,
  _lastHealthInc = -1000,
  _lastTimeHitInc = 0,
  _col = 0,
  _lastTimePlayedSoundHit = 0,
  minTimeBetweenHit = 15,
  sndHit = {
    "impacts/bullet-body",
    "impacts/bullet-body2"
  },
  collisionMinSpeed = 25,
  collisionMaxSpeed = 75,
  collisionDamageModif = 1,
  s_SubClass = {
    Ammo = {
      Shotgun = 999,
      MiniGun = 999,
      Grenades = 999,
      Stakes = 999,
      IceBullets = 999,
      Shurikens = 999,
      Electro = 999,
      Rifle = 999,
      FlameThrower = 999,
      Bolt = 999,
      HeaterBomb = 999
    },
    MPAmmo = {
      Shotgun = 0,
      MiniGun = 0,
      Grenades = 0,
      Stakes = 0,
      IceBullets = 0,
      Shurikens = 0,
      Electro = 0,
      Rifle = 0,
      FlameThrower = 0,
      Bolt = 0,
      HeaterBomb = 0
    },
    MPStartAmmo = {
      [1] = {},
      [2] = {Shotgun = 20, IceBullets = 0},
      [3] = {Stakes = 10, Grenades = 0},
      [4] = {Grenades = 5, MiniGun = 0},
      [5] = {Shurikens = 25, Electro = 0},
      [6] = {Rifle = 25, FlameThrower = 0},
      [7] = {Bolt = 50, HeaterBomb = 0}
    },
    MPStartAmmoCA = {
      [1] = {},
      [2] = {Shotgun = 15, IceBullets = 15},
      [3] = {Stakes = 10, Grenades = 50},
      [4] = {Grenades = 50, MiniGun = 150},
      [5] = {Shurikens = 50, Electro = 100},
      [6] = {Rifle = 150, FlameThrower = 0},
      [7] = {Bolt = 25, HeaterBomb = 21}
    },
    AmmoWarning = {
      Shotgun = 5,
      MiniGun = 10,
      Grenades = 5,
      Stakes = 5,
      IceBullets = 5,
      Shurikens = 5,
      Electro = 10,
      Rifle = 10,
      FlameThrower = 10,
      Bolt = 5,
      HeaterBomb = 10
    },
    MaxAmmo = {
      Shotgun = 100,
      MiniGun = 250,
      Grenades = 100,
      Stakes = 100,
      IceBullets = 100,
      Shurikens = 200,
      Electro = 250,
      Rifle = 250,
      FlameThrower = 500,
      Bolt = 500,
      HeaterBomb = 250
    },
    MPMaxAmmo = {
      Shotgun = 100,
      MiniGun = 250,
      Grenades = 100,
      Stakes = 100,
      IceBullets = 100,
      Shurikens = 200,
      Electro = 250,
      Rifle = 250,
      FlameThrower = 0,
      Bolt = 500,
      HeaterBomb = 250
    },
    CAAmmo = {
      Shotgun = 15,
      MiniGun = 150,
      Grenades = 50,
      Stakes = 10,
      IceBullets = 15,
      Shurikens = 50,
      Electro = 100,
      Rifle = 150,
      FlameThrower = 0,
      Bolt = 25,
      HeaterBomb = 21
    },
    IGAmmo = {
      Shotgun = 0,
      MiniGun = 0,
      Grenades = 0,
      Stakes = 999,
      IceBullets = 0,
      Shurikens = 0,
      Electro = 0,
      Rifle = 0,
      FlameThrower = 0,
      Bolt = 0,
      HeaterBomb = 0
    },
    _666Ammo = {
      Shotgun = 666,
      MiniGun = 666,
      Grenades = 666,
      Stakes = 666,
      IceBullets = 666,
      Shurikens = 666,
      Electro = 666,
      Rifle = 666,
      FlameThrower = 666,
      Bolt = 666,
      HeaterBomb = 666
    },
    SoundsDefinitions = {
      path = "multiplayer/player",
      dist1 = 10,
      dist2 = 50,
      Death = {
        dist1 = 15,
        dist2 = 75,
        samples = {
          "manplayer_death1",
          "manplayer_death2",
          "manplayer_death3",
          "manplayer_death4",
          "manplayer_death5",
          "manplayer_death6",
          "manplayer_death7"
        }
      },
      Death_Gib = {
        dist1 = 15,
        dist2 = 75,
        samples = {
          "manplayer_telefrag2"
        }
      },
      Death_Telefrag = {
        dist1 = 10,
        dist2 = 30,
        samples = {
          "manplayer_telefrag1",
          "manplayer_telefrag2",
          "manplayer_telefrag3"
        }
      },
      Hurt_Small = {
        samples = {
          "manplayer_hurt_small1",
          "manplayer_hurt_small2",
          "manplayer_hurt_small3",
          "manplayer_hurt_small4",
          "manplayer_hurt_small5"
        }
      },
      Hurt_Medium = {
        samples = {
          "manplayer_hurt_medium1",
          "manplayer_hurt_medium2",
          "manplayer_hurt_medium3",
          "manplayer_hurt_medium4"
        }
      },
      Hurt_Big = {
        samples = {
          "manplayer_hurt_big1",
          "manplayer_hurt_big2",
          "manplayer_hurt_big3"
        }
      },
      Hurt_OnHitGround = {
        samples = {
          "manplayer_jump_end-hurt1",
          "manplayer_jump_end-hurt2"
        }
      },
      Hurt_Pent = {
        samples = {
          "$/actor/leper_monk/lepper-odrzut"
        }
      },
      Hurt_Lava = {
        samples = {
          "$/actor/evilmonkv3/evil-fire-hit"
        }
      },
      Body_Falls = {
        dist1 = 10,
        dist2 = 30,
        samples = {
          "manplayer_bodyfalls"
        }
      },
      Jump = {
        dist1 = 10,
        dist2 = 30,
        samples = {
          "manplayer_jump_1",
          "manplayer_jump_2"
        }
      },
      Jump_Double = {
        dist1 = 10,
        dist2 = 30,
        samples = {
          "manplayer_double_1",
          "manplayer_double_2"
        }
      },
      Jump_End = {
        dist1 = 10,
        dist2 = 30,
        samples = {
          "manplayer-jump_end1",
          "manplayer-jump_end2"
        }
      }
    }
  }
}
Inherit(CPlayer, CActor)

function CPlayer:New()
  local p = Clone(CPlayer)
  return p
end

Model2Player = {
  ["mp-model-demon"] = "Demon.CPlayer",
  ["mp-model-fallenangel"] = "FallenAngel.CPlayer",
  ["mp-model-knight"] = "Knight.CPlayer",
  ["mp-model-beast"] = "Beast.CPlayer",
  ["mp-model-painkiller"] = "Painkiller.CPlayer",
  ["mp-model-player6"] = "HellKing.CPlayer",
  ["mp-model-player7"] = "Commando.CPlayer"
}

function CPlayer:SndEnt(id, entity)
  if Game.GMode == GModes.SingleGame then
    CObject.SndEnt(self, id, entity)
  else
    local model = ENTITY.GetFileName(entity)
    local tml = Model2Player[model]
    if tml then
      CObject.SndEnt(Templates[tml], id, entity)
    else
      CObject.SndEnt(self, id, entity)
    end
  end
end

function CPlayer:AddWeapon(slot)
  if not self.Weapons[slot] then
    local w = CloneTemplate(self.EnabledWeapons[slot] .. ".CWeapon")
    if not w then
      MsgBox("?????")
    end
    w.ObjOwner = self
    w:Apply()
    w:ForceAnim("idle", true, nil, 0)
    self.Weapons[slot] = w
  end
  return self.Weapons[slot]
end

function CPlayer:Apply(old)
  if self.Model ~= "" and (not old or self.Model ~= old.Model) then
    ENTITY.Release(self._Entity)
    self._Entity = CreatePlayer(self.Model, true)
    ENTITY.EnableDraw(self._Entity, true)
    EntityToObject[self._Entity] = self
    ENTITY.SetPosition(self._Entity, self.Pos.X, self.Pos.Y, self.Pos.Z)
  end
  self:ForceAnim(self.Animation)
end

function CPlayer:Delete()
  Log("CPlayer:Delete():.." .. self._Name .. "\n")
  self:FreeBlockedObjects()
  Log("CPlayer:Delete #1():.." .. self._Name .. "\n")
  self._Entity = nil
  CActor.Delete(self)
  Log("CPlayer:Delete #2():.." .. self._Name .. "\n")
  for i = 1, 7 do
    if self.Weapons[i] then
      self.Weapons[i]:Delete()
    end
  end
  Log("CPlayer:Delete #3():.." .. self._Name .. "\n")
end

function CPlayer:SelectBestWeapon(priorityList)
  for i, o in priorityList, nil do
    if o == 0 then
      return -1, -1
    end
    local slot = tonumber(string.sub(tostring(o), 1, 1))
    local fire = tonumber(string.sub(tostring(o), 2, 2))
    if self.EnabledWeapons[slot] then
      local ammoname = Weapon2Ammo[o]
      if ammoname == "Full" or 0 < self.Ammo[ammoname] then
        return slot, fire
      end
    end
  end
  return -1, -1
end

function CPlayer:TryToSelectNextWeaponWithAmmo(slot, fire)
  local newslot = slot
  if fire then
    local weapon = tonumber(tostring(slot) .. tostring(fire))
    local ammoname = Weapon2Ammo[weapon]
    if ammoname == "Full" or self.Ammo[ammoname] > 0 then
      return newslot
    end
    for i, o in Cfg.WeaponPriority, nil do
      if o == 0 then
        return newslot
      end
      local slot = tonumber(string.sub(tostring(o), 1, 1))
      local fire = tonumber(string.sub(tostring(o), 2, 2))
      if self.EnabledWeapons[slot] then
        local ammoname = Weapon2Ammo[o]
        if ammoname == "Full" or self.Ammo[ammoname] > 0 then
          return slot, fire
        end
      end
    end
  end
  return newslot
end

function CPlayer:Client_OnTakeWeapon(slot)
  Hud._weaponspri[slot] = true
  if Cfg.AutoChangeWeapon then
    for i, o in Cfg.WeaponPriority, nil do
      if o == 0 then
        return
      end
      local sl = tonumber(string.sub(tostring(o), 1, 1))
      local ammoname = Weapon2Ammo[o]
      if ammoname == "Full" or 0 < self.Ammo[ammoname] then
        if self._CurWeaponIndex == sl then
          return
        end
        if slot == sl then
          CPlayer.WeaponChangeRequest(self._Entity, slot)
          return
        end
      end
    end
  end
end

function CPlayer:ClientTick(delta)
  if self._died or not self._Entity then
    return
  end
  local ax, ay, az = CAM.GetAngRad()
  ax = math.mod(math.pi * 2 + math.mod(ax, math.pi * 2), math.pi * 2)
  ay = ay + math.pi / 2
  ax = ax * (65535 / (math.pi * 2))
  ay = ay * (65535 / math.pi)
  if Game.GMode ~= GModes.SingleGame and Game._procStats then
    CPlayer:SetupAction(self.ClientID, 0, ax, ay)
    return
  end
  self:Synchronize()
  if 0 < self._JumpSndDelay then
    self._JumpSndDelay = self._JumpSndDelay - delta
  end
  if 0 < self._GroundSndDelay then
    self._GroundSndDelay = self._GroundSndDelay - delta
  end
  local action = INP.GetActionStatus(self._Entity)
  local nextSlot = -1
  local fire = 0
  local checkSwitchedFire = true
  if INP.Action(Actions.SelectBestWeapon1) or INP.Action(Actions.FireBestWeapon1) then
    nextSlot, fire = self:SelectBestWeapon(Cfg.BestWeapons1)
  end
  if INP.Action(Actions.SelectBestWeapon2) or INP.Action(Actions.FireBestWeapon2) then
    nextSlot, fire = self:SelectBestWeapon(Cfg.BestWeapons2)
  end
  if nextSlot ~= -1 and (INP.Action(Actions.FireBestWeapon1) or INP.Action(Actions.FireBestWeapon2)) then
    action = ReplaceBitFlag(action, Actions.Fire, 0)
    action = ReplaceBitFlag(action, Actions.AltFire, 0)
    if fire == 1 then
      action = AddBitFlag(action, Actions.Fire)
    end
    if fire == 2 then
      action = AddBitFlag(action, Actions.AltFire)
    end
    checkSwitchedFire = false
  end
  if checkSwitchedFire and (IsBitFlag(action, Actions.Fire) or IsBitFlag(action, Actions.AltFire)) then
    local curSlot = self._CurWeaponIndex
    if nextSlot ~= -1 then
      curSlot = nextSlot
    end
    if not (not Cfg.SwitchFire[curSlot] or Game.SwitchFire[curSlot]) or Game.SwitchFire[curSlot] and not Cfg.SwitchFire[curSlot] then
      if IsBitFlag(action, Actions.Fire) then
        action = ReplaceBitFlag(action, Actions.Fire, Actions.AltFire)
      elseif IsBitFlag(action, Actions.AltFire) then
        action = ReplaceBitFlag(action, Actions.AltFire, Actions.Fire)
      end
    end
  end
  local cw = self:GetCurWeapon()
  if (not (cw and cw._zoom) or not (0 < cw._zoom)) and (INP.Action(Actions.NextWeapon) or INP.Action(Actions.PrevWeapon)) then
    local slot = self._CurWeaponIndex
    if INP.Action(Actions.NextWeapon) then
      repeat
        slot = slot + 1
        if 7 < slot then
          slot = 1
        end
      until self.EnabledWeapons[slot]
      nextSlot = slot
    elseif INP.Action(Actions.PrevWeapon) then
      repeat
        slot = slot - 1
        if slot < 1 then
          slot = 7
        end
      until self.EnabledWeapons[slot]
      nextSlot = slot
    end
  end
  if Game.GMode ~= GModes.SingleGame and Cfg.NoAmmoSwitch and nextSlot == -1 then
    local fire
    if IsBitFlag(action, Actions.Fire) then
      fire = 1
    end
    if IsBitFlag(action, Actions.AltFire) then
      fire = 2
    end
    if fire then
      nextSlot = self:TryToSelectNextWeaponWithAmmo(self._CurWeaponIndex, fire)
    end
  end
  if nextSlot ~= -1 then
    action = AddBitFlag(action, Slot2Action[nextSlot])
  end
  if self._waitingForFirstFire then
    if not IsBitFlag(action, Actions.Fire) then
      self._waitingForFirstFire = false
    end
    action = ReplaceBitFlag(action, Actions.Fire, 0)
    action = ReplaceBitFlag(action, Actions.AltFire, 0)
  end
  if cw then
    if not IsFinalBuild() and INP.Key(Keys.G) == 2 or Game.TPP or Cfg.ViewWeaponModel == false or cw._zoom and 0 < cw._zoom then
      ENTITY.EnableDraw(self:GetCurWeapon()._Entity, false, true)
    else
      ENTITY.EnableDraw(self:GetCurWeapon()._Entity, true, true)
    end
  end
  local ax, ay, az = CAM.GetAngRad()
  ax = math.mod(math.pi * 2 + math.mod(ax, math.pi * 2), math.pi * 2)
  ay = ay + math.pi / 2
  ax = ax * (65535 / (math.pi * 2))
  ay = ay * (65535 / math.pi)
  CPlayer:SetupAction(self.ClientID, action, ax, ay)
  if Game._loonyProc then
    self.ForwardVector:Set(CAM.GetForwardVector())
    self.RightVector:Set(CAM.GetRightVector())
  end
  if Game.GMode == GModes.MultiplayerClient then
    local fv = self.ForwardVector
    local rv = self.RightVector
    ENTITY.PO_SetAction(self._Entity, self.CurAction)
    PLAYER.ExecMultiPlayerAction(self._Entity, 0, fv.X, fv.Y, fv.Z, rv.X, rv.Y, rv.Z)
  end
  local cw = self:GetCurWeapon()
  if cw then
    if Game.Active and Game.GMode == GModes.MultiplayerClient and (nextSlot == -1 or nextSlot == self._CurWeaponIndex and cw._ActionState == "Idle") then
      WEAPON_PREDICTION = true
      cw:InterpretAction()
      WEAPON_PREDICTION = nil
    end
    cw:ClientTick(delta)
  end
end

function CPlayer:ServerTick(delta)
  if self._sendRagdollImpulse then
    local a = self._sendRagdollImpulse
    if LastExplosion and (a == AttackTypes.Explosion or a == AttackTypes.Grenade or a == AttackTypes.Rocket) then
      CPlayer.RagdollSelfExplosion(self._OldEntity, unpack(LastExplosion))
    end
    self._OldEntity = nil
    self._sendRagdollImpulse = nil
  end
  if self._died then
    if Game.GMode ~= GModes.SingleGame and self._timeToRespawn then
      self._timeToRespawn = self._timeToRespawn - delta
      if self._timeToRespawn <= 0 then
        Game.PlayerRespawnRequest(self.ClientID)
      end
    end
    return
  end
  if not self._Entity then
    return
  end
  if MPTEST or MPCfg.GameState ~= GameStates.Playing or MPCfg.GameMode == "Voosh" then
    self.Ammo.Shotgun = 666
    self.Ammo.MiniGun = 666
    self.Ammo.Grenades = 666
    self.Ammo.Stakes = 666
    self.Ammo.IceBullets = 666
    self.Ammo.Shurikens = 666
    self.Ammo.Electro = 666
    self.Ammo.Rifle = 666
    self.Ammo.FlameThrower = 666
    self.Ammo.Bolt = 666
    self.Ammo.HeaterBomb = 666
  end
  if MPCfg.GameMode == "People Can Fly" then
    self.Ammo.MiniGun = 0
    self.Ammo.Grenades = 999
  end
  if MPCfg.GameMode == "Instagib" or MPCfg.GameMode == "ICTF" then
    self.Ammo.MiniGun = 0
    self.Ammo.Stakes = 999
  end
  if self._frjump and self._frjump == 0 then
    self._frjump = 1
    local vx, vy, vz = ENTITY.GetVelocity(self._Entity)
    local jump = 8 * Tweak.MultiPlayerMove.JumpStrength
    if vy < jump and PLAYER.FloorCheck(self._Entity) then
      Game:Print("FRJ")
      ENTITY.SetVelocity(self._Entity, vx, jump, vz)
    end
  end
  ENTITY.PO_SetAction(self._Entity, self.CurAction)
  local fv = self.ForwardVector
  local rv = self.RightVector
  if Game.GMode ~= GModes.SingleGame then
    PLAYER.ExecMultiPlayerAction(self._Entity, 0, fv.X, fv.Y, fv.Z, rv.X, rv.Y, rv.Z)
  else
    PLAYER.ExecAction(self._Entity, 0, fv.X, fv.Y, fv.Z, rv.X, rv.Y, rv.Z)
  end
  self:InterpretAction(delta)
  PLAYER.SetMPByte(self._Entity, self.State)
end

function CPlayer:TryToChangeWeapon(slot)
  if not slot then
    return
  end
  if MPCfg.GameMode == "Voosh" or MPCfg.GameMode == "People Can Fly" then
    return
  end
  local specialFire = false
  if ENTITY.PO_IsActionState(self._Entity, Actions.FireBestWeapon1) or ENTITY.PO_IsActionState(self._Entity, Actions.FireBestWeapon2) or ENTITY.PO_IsActionState(self._Entity, Actions.ForwardRocketJump) or ENTITY.PO_IsActionState(self._Entity, Actions.RocketJump) then
    specialFire = true
  end
  if Game.IsDemon then
    return
  end
  if self.EnabledWeapons[slot] and slot ~= self._CurWeaponIndex then
    local cw = self:GetCurWeapon()
    if not cw or cw.ShotTimeOut < 0 then
      local prev = self._CurWeaponIndex
      if self._SwitchToWeapon then
        prev = self._SwitchToWeapon
      end
      self._SwitchToWeapon = nil
      self.WeaponChangeConfirmation(self.ClientID, self._Entity, slot)
      if specialFire and slot ~= prev then
        self._SwitchToWeapon = prev
        Game:Print("1 Pozniej przelaczyc na: " .. self._SwitchToWeapon)
      end
    elseif not self._SwitchToWeapon and not specialFire and slot ~= self._CurWeaponIndex then
      self._SwitchToWeapon = slot
      Game:Print("2 Pozniej przelaczyc na:" .. self._SwitchToWeapon)
    end
  end
end

function CPlayer:InterpretAction(delta)
  if not Game.Active then
    return
  end
  local prevWeap = self._CurWeaponIndex
  if ENTITY.PO_IsActionState(self._Entity, Actions.ForwardRocketJump) then
    self:TryToChangeWeapon(4)
  elseif ENTITY.PO_IsActionState(self._Entity, Actions.RocketJump) then
    self:TryToChangeWeapon(4)
  elseif ENTITY.PO_IsActionState(self._Entity, Actions.Weapon1) then
    self:TryToChangeWeapon(1)
  elseif ENTITY.PO_IsActionState(self._Entity, Actions.Weapon2) then
    self:TryToChangeWeapon(2)
  elseif ENTITY.PO_IsActionState(self._Entity, Actions.Weapon3) then
    self:TryToChangeWeapon(3)
  elseif ENTITY.PO_IsActionState(self._Entity, Actions.Weapon4) then
    self:TryToChangeWeapon(4)
  elseif ENTITY.PO_IsActionState(self._Entity, Actions.Weapon5) then
    self:TryToChangeWeapon(5)
  elseif ENTITY.PO_IsActionState(self._Entity, Actions.Weapon6) then
    self:TryToChangeWeapon(6)
  elseif ENTITY.PO_IsActionState(self._Entity, Actions.Weapon7) then
    self:TryToChangeWeapon(7)
  end
  if prevWeap == self._CurWeaponIndex and not ENTITY.PO_IsActionState(self._Entity, Actions.FireBestWeapon1) and not ENTITY.PO_IsActionState(self._Entity, Actions.FireBestWeapon2) and self._SwitchToWeapon and not self._frjump then
    self:TryToChangeWeapon(self._SwitchToWeapon)
  end
  local cw = self:GetCurWeapon()
  if cw then
    if cw.ShotTimeOut <= 0 and not self._frjump and (ENTITY.PO_IsActionState(self._Entity, Actions.ForwardRocketJump) or ENTITY.PO_IsActionState(self._Entity, Actions.RocketJump)) and cw.BaseObj == "MiniGunRL.CWeapon" then
      self._frjump = 0
    end
    if self._frjump and self._frjump == 1 then
      if ENTITY.PO_IsActionState(self._Entity, Actions.ForwardRocketJump) then
        self.ForwardVector.X = -self.ForwardVector.X
        self.ForwardVector.Z = -self.ForwardVector.Z
      end
      ENTITY.PO_AddAction(self._Entity, Actions.Fire)
    end
    cw:InterpretAction()
    if self._frjump and self._frjump == 1 then
      self._frjump = nil
      if ENTITY.PO_IsActionState(self._Entity, Actions.ForwardRocketJump) then
        self.ForwardVector.X = -self.ForwardVector.X
        self.ForwardVector.Z = -self.ForwardVector.Z
      end
    end
  end
end

function CPlayer:Tick(delta)
  if self._died then
    return
  end
  local cw = self:GetCurWeapon()
  if cw then
    cw:Tick(delta)
  end
  if Game.GMode == GModes.SingleGame then
    self._groundx, self._groundy, self._groundz = ENTITY.PO_GetPawnFloorPos(self._Entity)
    local jumped = ENTITY.PO_JumpedInLastAction(self._Entity)
    if self._JumpSndDelay <= 0 and jumped then
      PlaySound2D("hero/hero_jump_" .. math.random(1, 2), nil, nil, true)
      self._JumpSndDelay = 0.5
    end
  end
end

function CPlayer:ClientTick2(delta)
  self:Steps(delta)
  if not self._died then
    local cw = self:GetCurWeapon()
    if cw then
      cw:ClientTick2(delta)
    end
  end
  if Game._EarthQuakeProc and Game._EarthQuakeProc._noEquake and (self._CurWeaponIndex ~= 6 or not self:GetCurWeapon()._altfire) then
    CAM.SetPositionDisplacement(0, self._CamDisplacement, 0)
  end
end

function CPlayer:RagdollSelfExplosion(e, x, y, z, explosionStrength, explosionRange)
  if Game.GMode == GModes.MultiplayerClient then
    Game:Print(x .. "," .. y .. "," .. z .. "," .. explosionStrength .. "," .. explosionRange)
    Game:Print("Name:")
    Game:Print(ENTITY.GetFileName(e))
    MDL.RagdollSelfExplosion(e, x, y, z, explosionStrength, explosionRange)
    Game:Print("MDL.RagdollSelfExplosion - exit")
  end
end

Network:RegisterMethod("CPlayer.RagdollSelfExplosion", NCallOn.AllClients, NMode.Reliable, "efffuu")

function CPlayer:Update()
  if not self._died then
    if Game:IsServer() then
      if self._lava < 0 then
        local is, e = self:IsOnGround()
        if is and e then
          if string.find(ENTITY.GetName(e), "fire_hurt") then
            self:OnDamage(5, nil, AttackTypes.Lava)
            self._lava = 10
          end
          if string.find(ENTITY.GetName(e), "lava_hurt") then
            self:OnDamage(10, nil, AttackTypes.Lava)
            self._lava = 10
          end
          if string.find(ENTITY.GetName(e), "acid_hurt") then
            self:OnDamage(15, nil, AttackTypes.Lava)
            self._lava = 10
          end
        end
      else
        self._lava = self._lava - 1
      end
    end
    if Game.GMode ~= GModes.SingleGame and self.Health > 100 then
      if self._healthDecCnt >= 30 then
        self.Health = self.Health - 1
        self._healthDecCnt = 0
      else
        self._healthDecCnt = self._healthDecCnt + 1
      end
    end
    if Game.GMode == GModes.SingleGame and self.Health < 75 and 10 < INP.GetTime() - self._lastTimeHitInc and Game.HealthRegen and INP.GetTime() - self._lastHealthInc >= 0.3 then
      self.Health = self.Health + 1
      self._lastHealthInc = INP.GetTime()
    end
    if Game.GMode == GModes.SingleGame and 75 > self.Armor and self.ArmorType ~= 0 and 10 < INP.GetTime() - self._lastTimeHitInc and Game.ArmorRegen and INP.GetTime() - self._lastHealthInc >= 0.3 then
      self.Armor = self.Armor + 1
      self._lastHealthInc = INP.GetTime()
    end
    local cw = self:GetCurWeapon()
    if cw then
      cw:Update()
    end
    if Game.GMode == GModes.SingleGame then
      if cw == nil then
        local mx = 1
        for i, o in self.EnabledWeapons, nil do
          mx = i
        end
        cw = self:AddWeapon(mx)
        WORLD.AddEntity(cw._Entity)
        self._CurWeaponIndex = mx
      end
      if self._jammed then
        self._jammed = self._jammed - 1
        if 0 > self._jammed then
          self._jammed = nil
        end
      end
      if self._poisoned then
        self._poisoned = self._poisoned - 1
        self._poisonedTime = self._poisonedTime - 1
        if 0 >= self._poisonedTime then
          self._poisonedTime = self._poison.Freq
          if self._poison.DamageHp then
            self:OnDamage(self._poison.DamageHp, nil, AttackTypes.Poison)
          end
          if self._poison.SlowDown then
            self._slowDown = true
            SetPlayerSpeed(self.PlayerSpeed * self._poison.SlowDown)
          end
        end
        if 0 > self._poisoned then
          self._slowDown = nil
          SetPlayerSpeed(self.PlayerSpeed)
          self._poisoned = nil
          self._poisonedTime = nil
          self._poison = nil
        end
      end
      if Game._loonyProc then
      else
        self._velocityx, self._velocityy, self._velocityz, self._velocity = ENTITY.GetVelocity(self._Entity)
      end
      self._orientation = ENTITY.GetOrientation(self._Entity)
      if self.EnergySucker then
        for i, o in GObjects.UpdateListItems, nil do
          if o.BaseObj == "Energy.CItem" or o.BaseObj == "Energyred.CItem" then
            local diff = o.Pos:Copy()
            diff:Sub(PX, PY + 1.5, PZ)
            o.Pos.X = o.Pos.X - diff.X * 0.4
            o.Pos.Y = o.Pos.Y - diff.Y * 0.4
            o.Pos.Z = o.Pos.Z - diff.Z * 0.4
          end
        end
      end
    end
  end
end

function CPlayer:Synchronize()
  if self._died or not self._Entity then
    return
  end
  self.Pos:Set(ENTITY.GetPosition(self._Entity))
  self.angle = ENTITY.GetOrientation(self._Entity)
end

function CPlayer:ClientRender(delta)
  if not Hud.Enabled then
    return
  end
  if MPTEST or MPCfg.GameState ~= GameStates.Playing or MPCfg.GameMode == "Voosh" then
    self.Ammo.Shotgun = 666
    self.Ammo.MiniGun = 666
    self.Ammo.Grenades = 666
    self.Ammo.Stakes = 666
    self.Ammo.IceBullets = 666
    self.Ammo.Shurikens = 666
    self.Ammo.Electro = 666
    self.Ammo.Rifle = 666
    self.Ammo.FlameThrower = 666
    self.Ammo.Bolt = 666
    self.Ammo.HeaterBomb = 666
  end
  if MPCfg.GameMode == "People Can Fly" then
    self.Ammo.MiniGun = 0
    self.Ammo.Grenades = 999
  end
  if MPCfg.GameMode == "Instagib" or MPCfg.GameMode == "ICTF" then
    self.Ammo.MiniGun = 0
    self.Ammo.Stakes = 999
  end
  if Game.Active and not self._died and not self.Visible then
    local cw = self:GetCurWeapon()
    if cw then
      cw:ClientRender(delta)
    end
  end
  if self._DrawColorQuad then
    if self._poisoned or self._jammed then
      self._col = self._col + delta
      if self._col > 1 then
        self._col = 1
      end
    else
      self._col = self._col - delta
      if 0 > self._col then
        self._DrawColorQuad = nil
        self._col = 0
      end
    end
    self._ColorOfQuad.A = self._QuadAlphaMax * self._col
    local w, h = R3D.ScreenSize()
    HUD.DrawQuad(0, 0, 0, w, h, self._ColorOfQuad:Compose())
  end
end

function CPlayer:Render(delta)
  if not Hud.Enabled then
    return
  end
  if Game.Active and not self._died and not self.Visible then
    local cw = self:GetCurWeapon()
    if cw and cw.Render then
      cw:Render(delta)
    end
  end
end

function CPlayer:PostRender(delta)
  local w, h = R3D.ScreenSize()
  if self.TickCount then
    local Color = Color:New(80, 80, 180)
    self.TickCount = self.TickCount + delta * 2 * math.pi / (2 * math.pi / 30)
    Color.A = 60 * (1 - (1 + math.cos(self.TickCount)) / 2)
    local w, h = R3D.ScreenSize()
    local cpic = Color.A
    if Cfg.NoPickupFX then
      cpic = 0
    end
    HUD.DrawQuadRGBA(0, 0, 0, w, h, Color.R, Color.G, Color.B, cpic)
    if self.TickCount > math.pi * 2 then
      self.TickCount = nil
    end
  end
  if self.TickCountDamage then
    local Color = Color:New(210, 0, 0)
    self.TickCountDamage = self.TickCountDamage + delta * 2 * math.pi / (2 * math.pi / 30)
    Color.A = 80 * (1 - (1 + math.cos(self.TickCountDamage)) / 2)
    local cdam = Color.A
    if Cfg.NoDamageFX then
      cdam = 0
    end
    HUD.DrawQuadRGBA(0, 0, 0, w, h, Color.R, Color.G, Color.B, cdam)
    if self.TickCountDamage > math.pi * 2 then
      self.TickCountDamage = nil
    end
  end
end

function CPlayer:PickupFX()
  if not self._died then
    if not self.TickCount then
      self.TickCount = 0
    elseif self.TickCount > math.pi then
      self.TickCount = 2 * math.pi - self.TickCount
    end
  end
end

function CPlayer:FreeBlockedObjects()
  self._died = true
  for i, o in GObjects.Elements, nil do
    if o._blockedBy == self then
      if o.UnbindItem then
        o:UnbindItem()
      end
      o._blockedBy = nil
    end
  end
end

function CPlayer:OnDamage(damage, killer, attack_type, x, y, z, nx, ny, nz)
  if MPCfg.GameState ~= GameStates.Playing and MPCfg.GameState ~= GameStates.WarmUp then
    if attack_type == AttackTypes.OutOfLevel and MPCfg.GameState ~= GameStates.Finished then
      local exist, x, y, z, a, pt = self:FindFreeRespawnPoint(self._lastRespawnPoint, true)
      self._lastRespawnPoint = pt
      ENTITY.KillAllChildren(self._Entity)
      ENTITY.EnableDeathZoneTest(self._Entity, true)
      self.Health = 100
      self:Respawn(x, y, z, a)
    end
    return
  end
  if (not (not MPCfg.ProPlus and Cfg.FallingDamage) or MPCfg.GameMode == "Clan Arena" or MPCfg.GameMode == "Instagib" or MPCfg.GameMode == "ICTF") and MPCfg.GameState == GameStates.Playing and attack_type == AttackTypes.HitGround then
    return
  end
  if not Cfg.WarmupDamage and MPCfg.GameState ~= GameStates.Playing and attack_type ~= AttackTypes.ConsoleKill then
    return
  end
  if killer ~= nil and self.ClientID ~= killer.ClientID then
    if MPGameRules[MPCfg.GameMode].Teams then
      if Game.PlayerStats[self.ClientID].Team ~= Game.PlayerStats[killer.ClientID].Team then
        Game:AddToStats(killer.ClientID, attack_type, 1, 0, damage)
      end
    else
      Game:AddToStats(killer.ClientID, attack_type, 1, 0, damage)
    end
  end
  local kID = 250
  if killer and killer.ClientID then
    kID = killer.ClientID
  end
  if self.HasPentagram and attack_type ~= AttackTypes.OutOfLevel and attack_type ~= AttackTypes.ConsoleKill then
    self._score = nil
    if Game.GMode ~= GModes.SingleGame then
      self.Client_OnDamage(self.ClientID, self._Entity, self.Health, self.Armor, AttackTypes.Hurt_Pent, damage, kID)
    end
    return
  end
  if GOD and (not IsFinalBuild() or attack_type ~= AttackTypes.OutOfLevel) or not (not Game.IsDemon or Lucifer_001) and attack_type ~= AttackTypes.OutOfLevel or Game.PlayerNoDamage == true and attack_type ~= AttackTypes.OutOfLevel then
    self._score = nil
    return
  end
  if 0 < damage then
    self.WasHurt = true
  end
  if Game.GMode == GModes.SingleGame then
    if Game.Difficulty == 0 and 1 < damage then
      damage = 1
    elseif Game.Difficulty == 1 and 1 < damage then
      damage = damage * 0.5
    elseif Game.Difficulty == 3 then
      damage = damage * 1.5
    end
    damage = damage * Game.PlayerDamageFactor
    if 0 < damage and damage < 1 then
      damage = 1
    end
  elseif attack_type ~= AttackTypes.OutOfLevel and attack_type ~= AttackTypes.TeleFrag then
    if MPCfg.GameMode == "People Can Fly" then
      local is, e = self:IsOnGround()
      if is then
        self._score = nil
        return
      end
    end
    if MPGameRules[MPCfg.GameMode].Teams and not MPCfg.TeamDamage and killer and MPCfg.GameState == GameStates.Playing then
      local ks = Game.PlayerStats[killer.ClientID]
      local ps = Game.PlayerStats[self.ClientID]
      if ps ~= ks and ps.Team == ks.Team then
        self._score = nil
        return
      end
    end
  end
  if not self._died then
    if self == killer then
      if MPCfg.GameMode == "People Can Fly" or MPCfg.GameMode == "Clan Arena" then
        self._score = nil
        return
      end
      damage = damage / 2
    end
    if not self.FrozenArmor then
      local rf = self.ArmorRescueFactor
      local save = rf * damage
      if Game.GMode ~= GModes.SingleGame then
        save = math.ceil(rf * damage)
      end
      if save >= self.Armor then
        save = self.Armor
        self.ArmorType = 0
        self.ArmorRescueFactor = 0
      end
      self.Armor = self.Armor - save
      if Game.GMode == GModes.SingleGame then
        damage = damage - save
      else
        damage = math.ceil(damage - save)
      end
    end
    local gib = 0
    self.Health = self.Health - damage
    if self.Health <= 0 then
      if Game.GMode == GModes.SingleGame and Game.PlayerRegenerateWhenDying == true and attack_type ~= AttackTypes.OutOfLevel then
        self.Health = 33
        Game.PlayerRegenerateWhenDying = false
        SOUND.Play2D("specials/resurrection", 100, true)
      else
        if self.Health < -40 and not Tweak.GlobalData.DisableGibs then
          gib = 1
          self._gibbed = true
        end
        self.Health = 0
        SetPlayerSpeed(self.PlayerSpeed)
      end
    end
    if self.Health < self.MinimalHealth then
      self.MinimalHealth = self.Health
    end
    if 254 < damage then
      damage = 254
    end
    if self.Health > 0 then
      self.Client_OnDamage(self.ClientID, self._Entity, self.Health, self.Armor, attack_type, damage, kID)
      if Game:IsServer() and self.ClientID ~= kID then
        Game:SendHitSound(kID)
      end
    else
      self._timeToRespawn = Tweak.Multiplayer.PlayerAutorespawnTime
      local score = 1
      if MPCfg.GameState == GameStates.Playing then
        if self._score then
          score = self._score
          self._score = nil
        end
        if MPCfg.GameMode == "The Light Bearer" then
          if self.HasQuad then
            score = 10
          end
          if killer and killer.HasQuad then
            killer.QuadedEnemies = killer.QuadedEnemies + 1
            score = killer.QuadedEnemies
          end
        end
      else
        gib = 0
        score = 0
      end
      CPlayer:Common_UpdateStats(true, self.ClientID, kID, attack_type, score)
      if Game.GMode ~= GModes.SingleGame then
        ENTITY.PO_Enable(self._Entity, false)
        ENTITY.RemoveFromIntersectionSolver(self._Entity)
        ENTITY.SetTimeToDie(self._Entity, 3)
        if MPCfg.GameState == GameStates.Playing and MPCfg.GameMode ~= "Clan Arena" and MPCfg.GameMode ~= "Instagib" and MPCfg.GameMode ~= "ICTF" then
          local px, py, pz = ENTITY.GetCenter(self._Entity)
          local pack = AddObject("SoulMP.CItem", 1, Vector:New(px, py, pz), nil, true)
          ENTITY.SetVelocity(pack._Entity, FRand(-5, 5), 15, FRand(-5, 5))
          pack:GetPlayerState(self)
        end
      end
      self:FreeBlockedObjects()
      local oe = self._Entity
      CPlayer.Client_OnDeath(self.ClientID, kID, attack_type, gib, score, damage)
      if Game:IsServer() and self.ClientID ~= kID then
        Game:SendDeathSound(kID)
      end
      if gib == 1 then
        ENTITY.Release(oe)
      else
        self._sendRagdollImpulse = attack_type
        self._OldEntity = oe
      end
      local o = EntityToObject[oe]
      if o then
        EntityToObject[oe] = nil
        o._Entity = nil
      end
    end
    if Game.GMode == GModes.SingleGame then
      if nx then
        self._lastPosHit = Vector:New(x, y, z)
        self._lastTimeHit = Game.currentTime
        self._lastTimeHitInc = INP.GetTime()
        if self._lastBlood + 2 < Game.currentTime then
          if 15 > math.random(100) then
            self:BloodFX(x, y, z, nx, ny, nz)
            self._lastBlood = Game.currentTime
          end
          AddPFX("BodyBlood", 0.3, Vector:New(x, y, z), Quaternion:New_FromNormal(nx, ny, nz))
        end
      else
        self._lastPosHit = Vector:New(self.Pos.X, self.Pos.Y, self.Pos.Z)
        self._lastTimeHit = Game.currentTime
      end
    end
  end
end

function CPlayer:FindFreeRespawnPoint(last, always)
  Game:Print("FindFreeRespawnPoint")
  local areas, cnt = GObjects:GetElementsWithFieldValue("_Name", "PlayerRespawn*")
  if MPCfg.GameMode == "Capture The Flag" or MPCfg.GameMode == "ICTF" then
    local na = {}
    cnt = 0
    for i, a in areas, nil do
      if a.Team == self.Team then
        table.insert(na, a)
        cnt = cnt + 1
      end
    end
    areas = na
  end
  if cnt == 1 then
    last = nil
  end
  if 0 < cnt then
    local a = math.random(1, cnt)
    Game:Print(a .. "/" .. cnt)
    for i = a, cnt do
      local area = areas[i]
      if (always or not area._busyTime) and (not last or last ~= i) then
        area._busyTime = Tweak.Multiplayer.RespawnPointBusyTime
        local p = area.Points[1]
        Game:Print(area._Name)
        local toclose = false
        for k, ps in Game.PlayerStats, nil do
          if Cfg.SafeRespawn and ps and ps._Entity and ps.Spectator == 0 then
            local psx, psy, psz = ENTITY.PO_GetPawnHeadPos(ps._Entity)
            if Dist3D(psx, psy, psz, p.X, p.Y, p.Z) < 4 then
              toclose = true
            end
          end
        end
        if not toclose then
          return true, p.X, p.Y, p.Z, p.A, i
        end
      end
    end
    for i = 1, a - 1 do
      local area = areas[i]
      if (always or not area._busyTime) and (not last or last ~= i) then
        area._busyTime = Tweak.Multiplayer.RespawnPointBusyTime
        local p = area.Points[1]
        Game:Print(area._Name)
        local toclose = false
        for k, ps in Game.PlayerStats, nil do
          if Cfg.SafeRespawn and ps and ps._Entity and ps.Spectator == 0 then
            local psx, psy, psz = ENTITY.PO_GetPawnHeadPos(ps._Entity)
            if Dist3D(psx, psy, psz, p.X, p.Y, p.Z) < 4 then
              toclose = true
            end
          end
        end
        if not toclose then
          return true, p.X, p.Y, p.Z, p.A, i
        end
      end
    end
  end
  return false, 0, 10, 0, 0, -1
end

function CPlayer:Respawn(x, y, z, a)
  ENTITY.PO_Enable(self._Entity, true)
  ENTITY.SetOrientation(self._Entity, a)
  ENTITY.SetPosition(self._Entity, x, y, z)
  ENTITY.SetVelocity(self._Entity, 0, 0, 0)
  ENTITY.UnregisterAllChildren(self._Entity)
  ENTITY.EnableDeathZoneTest(self._Entity, true)
  if ENTITY.PO_IsPinned(self._Entity) then
    Game:Print("!!!!!!!!!!!!!!!!!!!!!!!!! ZAPINOWANY !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    ENTITY.PO_SetPinned(self._Entity, false)
  end
  self:ForceAnim("idle", true, nil, 0)
end

function CPlayer:ResetStatusAfterDeath()
  if Player == self then
    ENTITY.EnableDemonic(self._Entity, false, true)
  end
  if self._procDemonFX then
    GObjects:ToKill(self._procDemonFX)
    self._procDemonFX = nil
  end
  self._died = true
  self.QuadedEnemies = 0
  self._score = nil
  self:DeactivateWeapon()
  self.Health = 0
  local pcs = GObjects:GetElementsWithFieldValue("BaseObj", "TDeathPlayer*")
  for i, p in pcs, nil do
    if p.ObjOwner == self then
      GObjects:ToKill(p)
    end
  end
end

function CPlayer:ResetStatus(weapon)
  Log("ResetStatus")
  self:ResetStatusAfterDeath()
  self._died = false
  self.Health = 100
  self._diedInDeathZone = nil
  self.Ammo = Clone(CPlayer.s_SubClass.MPAmmo)
  self._sendRagdollImpulse = nil
  self._gibbed = nil
  self.Pinned = nil
  self.CurAction = 0
  self.Armor = 0
  self.ArmorType = 0
  self.ArmorRescueFactor = 0
  self.FrozenArmor = false
  for i = 1, 6 do
    if self.Weapons[i] then
      WORLD.RemoveEntity(self.Weapons[i]._Entity)
    end
  end
  if MPCfg.GameMode == "Voosh" then
    self.Ammo = Clone(CPlayer.s_SubClass.Ammo)
    self.EnabledWeapons = {
      "PainKiller",
      "Shotgun",
      "StakeGunGL",
      "MiniGunRL",
      "DriverElectro",
      "RifleFlameThrower",
      "BoltGunHeater"
    }
  elseif MPCfg.GameMode == "People Can Fly" then
    self.Ammo = Clone(CPlayer.s_SubClass.Ammo)
    self.EnabledWeapons = {
      nil,
      nil,
      nil,
      "MiniGunRL",
      nil
    }
    local a = Templates["ArmorStrong.CItem"]
    self.Armor = a.ArmorAdd
    self.ArmorType = a.ArmorType
    self.ArmorRescueFactor = a.RescueFactor
  elseif MPCfg.GameMode == "Clan Arena" then
    self.Ammo = Clone(CPlayer.s_SubClass.CAAmmo)
    self.EnabledWeapons = {
      "PainKiller",
      "Shotgun",
      "StakeGunGL",
      "MiniGunRL",
      "DriverElectro",
      nil,
      nil
    }
    local a = Templates["ArmorStrong.CItem"]
    self.Armor = a.ArmorAdd
    self.ArmorType = a.ArmorType
    self.ArmorRescueFactor = a.RescueFactor
  elseif MPCfg.GameMode == "Instagib" then
    self.Ammo = Clone(CPlayer.s_SubClass.IGAmmo)
    self.EnabledWeapons = {
      nil,
      nil,
      "StakeGunGL",
      nil,
      nil
    }
  elseif MPCfg.GameMode == "ICTF" then
    self.Ammo = Clone(CPlayer.s_SubClass.IGAmmo)
    self.EnabledWeapons = {
      nil,
      nil,
      "StakeGunGL",
      nil,
      nil
    }
  else
    self.EnabledWeapons = {"PainKiller"}
    self:AddWeapon(1)
  end
  if MPCfg.GameMode == "Clan Arena" then
    if weapon then
      self.EnabledWeapons[weapon] = CPlayer.EnabledWeapons[weapon]
      local cw = self:AddWeapon(weapon)
      self._CurWeaponIndex = weapon
      if self == Player then
        WORLD.AddEntity(cw._Entity)
      end
      for i, o in CPlayer.s_SubClass.MPStartAmmoCA[weapon], nil do
        self.Ammo[i] = o
      end
    end
  elseif weapon then
    self.EnabledWeapons[weapon] = CPlayer.EnabledWeapons[weapon]
    local cw = self:AddWeapon(weapon)
    self._CurWeaponIndex = weapon
    if self == Player then
      WORLD.AddEntity(cw._Entity)
    end
    for i, o in CPlayer.s_SubClass.MPStartAmmo[weapon], nil do
      self.Ammo[i] = o
    end
  end
  if MPCfg.GameState == GameStates.WarmUp then
    if MPCfg.GameMode == "Clan Arena" then
      self.EnabledWeapons = {
        "PainKiller",
        "Shotgun",
        "StakeGunGL",
        "MiniGunRL",
        "DriverElectro",
        nil,
        nil
      }
      self:AddWeapon(1)
      self:AddWeapon(2)
      self:AddWeapon(3)
      self:AddWeapon(4)
      self:AddWeapon(5)
    elseif MPCfg.GameMode == "ICTF" or MPCfg.GameMode == "Instagib" then
      self.EnabledWeapons = {
        nil,
        nil,
        "StakeGunGL",
        nil,
        nil
      }
      self:AddWeapon(3)
    else
      self.EnabledWeapons = {
        "PainKiller",
        "Shotgun",
        "StakeGunGL",
        "MiniGunRL",
        "DriverElectro",
        "RifleFlameThrower",
        "BoltGunHeater"
      }
      self:AddWeapon(1)
      self:AddWeapon(2)
      self:AddWeapon(3)
      self:AddWeapon(4)
      self:AddWeapon(5)
      self:AddWeapon(6)
      self:AddWeapon(7)
    end
  end
  if MPTEST then
    self.Health = 255
    self.EnabledWeapons = {
      "PainKiller",
      "Shotgun",
      "StakeGunGL",
      "MiniGunRL",
      "DriverElectro",
      "RifleFlameThrower",
      "BoltGunHeater"
    }
    self:AddWeapon(1)
    self:AddWeapon(2)
    self:AddWeapon(3)
    self:AddWeapon(4)
    self:AddWeapon(5)
    self:AddWeapon(6)
    self:AddWeapon(7)
    local a = Templates["ArmorStrong.CItem"]
    self.Armor = a.ArmorAdd
    self.ArmorType = a.ArmorType
    self.ArmorRescueFactor = a.RescueFactor
  end
  if Player and self == Player then
    self._waitingForFirstFire = true
  end
  self._frjump = nil
  self.State = 3
  if MPCfg.GameState == GameStates.WarmUp then
    self.Health = 100
    local a = Templates["ArmorStrong.CItem"]
    self.Armor = a.ArmorAdd
    self.ArmorType = a.ArmorType
    self.ArmorRescueFactor = a.RescueFactor
  end
  if Game:IsServer() and MPCfg.GameState == GameStates.WarmUp then
    self:OnDamage(0, nil, 20)
  end
end

function CPlayer:InDeathZone(x, y, z, zone)
  if string.find(zone, "wat", 1, true) then
    AddObject("FX_splash.CActor", 1, Vector:New(x, y + 0.5, z), nil, true)
    PlaySound3D("impacts/water-splash" .. math.random(1, 3), x, y, z, 20, 40)
  end
  if not self._died then
    self._diedInDeathZone = true
    self.Health = 0
    self:OnDamage(999, nil, AttackTypes.OutOfLevel)
  end
end

function CPlayer:CheckTeleFrag(x, y, z)
  if not x then
    x, y, z = ENTITY.GetPosition(self._Entity)
  end
  for i, o in Game.Players, nil do
    local px, py, pz = ENTITY.GetPosition(o._Entity)
    if ENTITY.PO_IsEnabled(o._Entity) and self ~= o and Dist3D(x, y, z, px, py, pz) < 1.2 then
      o:OnDamage(o.Health * 3, self, AttackTypes.TeleFrag)
    end
  end
end

function CPlayer:EditTick(delta)
end

function CPlayer:Trace(length)
  local cx, cy, cz = ENTITY.PO_GetPawnHeadPos(self._Entity)
  local dx, dy, dz
  if type(length) == "table" then
    dx, dy, dz = length.X, length.Y, length.Z
  else
    local fv = self.ForwardVector
    dx, dy, dz = cx + fv.X * length, cy + fv.Y * length, cz + fv.Z * length
  end
  ENTITY.RemoveFromIntersectionSolver(self._Entity)
  local b, d, x, y, z, nx, ny, nz, he, e = WORLD.LineTrace(cx, cy, cz, dx, dy, dz)
  ENTITY.AddToIntersectionSolver(self._Entity)
  return b, d, x, y, z, nx, ny, nz, he, e
end

function CPlayer:TraceToPoint(dx, dy, dz)
  local cx, cy, cz = ENTITY.PO_GetPawnHeadPos(self._Entity)
  ENTITY.RemoveFromIntersectionSolver(self._Entity)
  local b, d, x, y, z, nx, ny, nz, he, e = WORLD.LineTrace(cx, cy, cz, dx, dy, dz)
  ENTITY.AddToIntersectionSolver(self._Entity)
  return b, d, x, y, z, nx, ny, nz, he, e
end

function CPlayer:GetCurWeaponSlotIndex()
  return self._CurWeaponIndex
end

function CPlayer:GetCurWeapon()
  return self.Weapons[self._CurWeaponIndex]
end

function CPlayer:IsOnGround()
  if not self._Entity then
    return false
  end
  local x, y, z = ENTITY.GetPosition(self._Entity)
  ENTITY.RemoveFromIntersectionSolver(self._Entity)
  local isFloor, d, x, y, z, nx, ny, nz, he, e = WORLD.LineTrace(x, y + 0.5, z, x, y - 0.6, z)
  ENTITY.AddToIntersectionSolver(self._Entity)
  return isFloor, e
end

function CPlayer:Steps(delta)
  if self._died then
    return
  end
  self._Walking = false
  local x, y, z = ENTITY.GetWorldPosition(self._Entity)
  if Game.CameraFromPlayer and PLAYER.FloorCheck(self._Entity) and (INP.Action(2) or INP.Action(4) or INP.Action(8) or INP.Action(16)) then
    local vx, vy, vz, vl = ENTITY.GetVelocity(self._Entity)
    if 2 < Vector:New(0, 0, 0):Dist2D(vx, 0, vz) then
      self._Walking = true
    end
  end
  if 0 < self._JumpSndDelay then
    self._Walking = false
    self._LastStepTime = -1
  end
  if ENTITY.PO_IsEnabled(Player._Entity) and self._Walking then
    self._WalkTime = self._WalkTime + delta
    if self._WalkTime > 0.2 then
      self._CamDisplacement = math.sin((self._WalkTime - 0.2) * self.WalkBobSpeed) * Cfg.HeadBob / 500
    end
  else
    self._CamDisplacement = self._CamDisplacement * 0.8
    self._WalkTime = 0
  end
  if self._Walking and 0 > self._LastStepTime then
    local vx, vy, vz, vl = ENTITY.GetVelocity(self._Entity)
    if Game.GMode == GModes.SingleGame and (self:IsOnGround() or ENTITY.PO_IsOnLadder(self._Entity)) then
      local ae = Lev.Acoustics
      if Lev._r_CurAcEnv then
        ae = Lev._r_CurAcEnv
      end
      local snd = "_R"
      if self._Leg == 2 then
        snd = "_L"
      end
      CAcousticEnv:Snd2D(ae.Player._GroundName .. snd)
      if ae.Player.Spurs then
        PlaySound2D("MOVEMENT/ostrogi/ostroga" .. math.random(1, 7))
      end
      if self._Leg == 1 then
        self._Leg = 2
      else
        self._Leg = 1
      end
      PlayLogicSound("STEP", self.Pos.X, self.Pos.Y, Player.Pos.Z, 8, 12, self)
    end
    self._LastStepTime = 0.5
  end
  self._LastStep:Set(x, y, z)
  if self._Walking then
    self._LastStepTime = self._LastStepTime - delta
  end
end

function CPlayer:OnHitGround(speed)
  if Game._loonyProc then
    return
  end
  if MPCfg.GameMode == "People Can Fly" then
    return
  end
  if Game.GMode == GModes.MultiplayerClient then
    return
  end
  if speed < -self.collisionMinSpeed then
    speed = math.abs(speed)
    local d = 100
    if Game.GMode == GModes.SingleGame then
      self.collisionMinSpeed = 25
      self.collisionMaxSpeed = 70
      d = 255
    end
    if speed < self.collisionMaxSpeed then
      d = (speed - self.collisionMinSpeed) / (self.collisionMaxSpeed - self.collisionMinSpeed) * d
    end
    d = d * self.collisionDamageModif
    Game:Print("Hit Ground - Speed: " .. -speed .. ", Damage: " .. d)
    self:OnDamage(d, nil, AttackTypes.HitGround)
  else
    local minspd = -12
    if Game.GMode == GModes.SingleGame then
      minspd = -8
    end
    if self._GroundSndDelay <= 0 and speed < minspd then
      CPlayer:SndEnt("Jump_End", self._Entity)
      self._GroundSndDelay = 0.7
    end
  end
end

function CPlayer:DeactivateWeapon()
  local cw = self:GetCurWeapon()
  if cw then
    cw._ActionState = "Idle"
    cw._fire = false
    cw._altfire = false
    cw._combo = false
    cw:ForceAnim("idle", true, nil, 0)
    ENTITY.EnableDraw(cw._Entity, false, true)
    WORLD.RemoveEntity(cw._Entity)
    if cw.OnChangeWeapon then
      cw:OnChangeWeapon()
    end
  end
end

function CPlayer:CheckMaxAmmo()
  local ma = CPlayer.s_SubClass.MPMaxAmmo
  if Game.GMode == GModes.SingleGame then
    ma = CPlayer.s_SubClass.MaxAmmo
    local cards = MagicCards.permCards
    if Game.CardsSelected[cards[17].index] then
      ma = CPlayer.s_SubClass._666Ammo
    end
  end
  if self.Ammo.Shotgun and self.Ammo.Shotgun > ma.Shotgun then
    self.Ammo.Shotgun = ma.Shotgun
  end
  if self.Ammo.Grenades and self.Ammo.Grenades > ma.Grenades then
    self.Ammo.Grenades = ma.Grenades
  end
  if self.Ammo.MiniGun and self.Ammo.MiniGun > ma.MiniGun then
    self.Ammo.MiniGun = ma.MiniGun
  end
  if self.Ammo.Stakes and self.Ammo.Stakes > ma.Stakes then
    self.Ammo.Stakes = ma.Stakes
  end
  if self.Ammo.IceBullets and self.Ammo.IceBullets > ma.IceBullets then
    self.Ammo.IceBullets = ma.IceBullets
  end
  if self.Ammo.Shurikens and self.Ammo.Shurikens > ma.Shurikens then
    self.Ammo.Shurikens = ma.Shurikens
  end
  if self.Ammo.Electro and self.Ammo.Electro > ma.Electro then
    self.Ammo.Electro = ma.Electro
  end
  if self.Ammo.Rifle and self.Ammo.Rifle > ma.Rifle then
    self.Ammo.Rifle = ma.Rifle
  end
  if self.Ammo.FlameThrower and self.Ammo.FlameThrower > ma.FlameThrower then
    self.Ammo.FlameThrower = ma.FlameThrower
  end
  if self.Ammo.Bolt and self.Ammo.Bolt > ma.Bolt then
    self.Ammo.Bolt = ma.Bolt
  end
  if self.Ammo.HeaterBomb and self.Ammo.HeaterBomb > ma.HeaterBomb then
    self.Ammo.HeaterBomb = ma.HeaterBomb
  end
  for i, o in self.Ammo, nil do
    self.Ammo[i] = math.floor(o)
  end
end

function CPlayer:SetupAction(clientID, action, pitch, yaw)
  pitch = pitch / (65535 / (math.pi * 2))
  yaw = yaw / (65535 / math.pi) - math.pi / 2
  local player = Game:FindPlayerByClientID(clientID)
  if not player then
    return
  end
  local q = Quaternion:New_FromEuler(yaw, pitch, 0)
  local fx, fy, fz = q:InverseTransformVector(0, 0, 1)
  fz = -fz
  local q = Quaternion:New_FromEuler(0, pitch, 0)
  local rx, ry, rz = q:TransformVector(1, 0, 0)
  if not Cfg.AllowForwardRJ then
    action = RemoveBitFlag(action, Actions.ForwardRocketJump)
  end
  if player then
    player.CurAction = action
    player.ForwardVector:Set(fx, fy, fz)
    player.RightVector:Set(rx, ry, rz)
    player._yaw = yaw
  end
end

function CPlayer_SetupAction(clientID, action, pitch, yaw)
  pitch = pitch / (65535 / (math.pi * 2))
  yaw = yaw / (65535 / math.pi) - math.pi / 2
  local player = Game:FindPlayerByClientID(clientID)
  if not player then
    return
  end
  local q = Quaternion:New_FromEuler(yaw, pitch, 0)
  local fx, fy, fz = q:InverseTransformVector(0, 0, 1)
  fz = -fz
  local q = Quaternion:New_FromEuler(0, pitch, 0)
  local rx, ry, rz = q:TransformVector(1, 0, 0)
  if not Cfg.AllowForwardRJ then
    action = RemoveBitFlag(action, Actions.ForwardRocketJump)
  end
  if player then
    player.CurAction = action
    player.ForwardVector:Set(fx, fy, fz)
    player.RightVector:Set(rx, ry, rz)
    player._yaw = yaw
  end
end

function CPlayer:AddHealth(entity, health)
  local player = EntityToObject[entity]
  if player and not player._died then
    player.Health = player.Health + health
    if player.Health > 250 then
      player.Health = 250
    end
  end
end

Network:RegisterMethod("CPlayer.AddHealth", NCallOn.ServerAndSingleClient, NMode.Reliable, "eu")

function CPlayer:Client_OnDamage(entity, health, armor, attack_type, damage, killerID)
  if not entity then
    return
  end
  Log("*Client_OnDamage: " .. entity .. "\n")
  local player = EntityToObject[entity]
  if Game.GMode ~= GModes.SingleGame and attack_type == AttackTypes.Hurt_Pent then
    CPlayer:SndEnt("Hurt_Pent", entity)
    return
  end
  if player then
    player.Health = health
    player.Armor = armor
    if player == Player then
      if Game.GMode == GModes.SingleGame and attack_type == AttackTypes.AIClose then
        if not player._procHit then
          player._procHit = GObjects:Add(TempObjName(), CloneTemplate("TPlayerHit.CProcess"))
        end
        player._procHit:Add(1, math.random(-5, 5), math.random(-3, 3))
      end
      if attack_type == AttackTypes.Lava then
        PlaySound2D("actor/evilmonkv3/evil-fire-hit", nil, nil, true)
      end
      if not player.TickCountDamage then
        player.TickCountDamage = 0
      elseif player.TickCountDamage > math.pi then
        player.TickCountDamage = 2 * math.pi - player.TickCountDamage
      end
      if Game.GMode == GModes.SingleGame and (not player._oldSND or not SOUND2D.IsPlaying(player._oldSND)) then
        if attack_type and attack_type == AttackTypes.AIFar and player._lastTimePlayedSoundHit + player.minTimeBetweenHit < Game.currentTime then
          local snd = player.sndHit[math.random(1, 2)]
          PlaySound2D(snd, nil, nil, true)
          player._lastTimePlayedSoundHit = Game.currentTime
        end
        player._oldSND = PlaySound2D("hero/hero_hurt_" .. math.random(1, 4), nil, nil, true)
      end
    end
  end
  if Player and Player.ClientID == killerID and (player == nil or player ~= Player) then
    if Cfg.CrosshairHit then
      Hud:CrosshairHit()
    end
    if Cfg.HitSound then
      local newsoundda = ""
      local soundda = ""
      local hitplayer = Cfg.HitSoundTeamVolume
      local ps = Game:FindPlayerStatsByEntity(entity)
      if ps and Game.PlayerStats[Player.ClientID].Team == ps.Team and MPGameRules[MPCfg.GameMode].Teams then
        newsoundda = "../Sounds/hitsoundteam"
        soundda = "../Sounds/hitsoundteam"
      else
        hitplayer = Cfg.HitSoundVolume
        newsoundda = "../Sounds/hitsoundnew"
        soundda = "../Sounds/hitsound"
      end
      if Cfg.Newhitsound == false then
        PlaySound2D(soundda, hitplayer, nil, true)
      else
        PlaySound2D(newsoundda, hitplayer, nil, true)
      end
    end
    if attack_type == AttackTypes.Stake then
      if not Player.MedalStylish and Player.MedalStylishNextStake == 0 then
        Player.MedalStylish = true
      end
      if Player.MedalStylishNextStake == 1 then
        if not Cfg.NoMPComments then
          SOUND.Play2D("multiplayer/lucifer/Lucifer_good05", 100, true)
        end
        Player.MedalStylishNextStake = 0
        Player.MedalStylish = false
        Hud.MedalStylishIconStart = Game.currentTime * 2
        Hud.MedalStylishIconEnd = Game.currentTime * 2 + 180
        Hud.MedalStylish = Hud.MedalStylish + 1
      end
    end
  end
  if (not player or Player ~= player) and attack_type == AttackTypes.Lava then
    local x, y, z = ENTITY.GetPosition(entity)
    PlaySound3D("actor/evilmonkv3/evil-fire-hit", x, y, z, 20, 40)
  end
  if Game.GMode ~= GModes.SingleGame then
    local fx = true
    if Cfg.LowQualityMultiplayerSFX then
      fx = false
      if math.random(0, 100) > 30 then
        fx = true
      end
    end
    if fx then
      local x, y, z = ENTITY.GetPosition(entity)
      CActor:BloodFX(x, y + 1.7, z, FRand(-1, 1), 0, FRand(-1, 1))
    end
    if attack_type == AttackTypes.HitGround then
      CPlayer:SndEnt("Hurt_OnHitGround", entity)
    elseif 50 <= damage then
      CPlayer:SndEnt("Hurt_Big", entity)
    elseif 20 <= damage then
      CPlayer:SndEnt("Hurt_Medium", entity)
    elseif 0 <= damage then
      CPlayer:SndEnt("Hurt_Small", entity)
    end
  end
end

Network:RegisterMethod("CPlayer.Client_OnDamage", NCallOn.ServerAndAllClients, NMode.ReliableForSingle, "ebbbbb")

function CPlayer:Common_UpdateStats(checkOnly, deadID, killerID, attack_type, score)
  if MPCfg.GameState ~= GameStates.Playing then
    return
  end
  local ds = Game.PlayerStats[deadID]
  local ks = Game.PlayerStats[killerID]
  local b_ds, b_ks, b_team1Score, b_team2Score
  if ds then
    b_ds = {
      ds.Score,
      ds.Kills,
      ds.Deaths
    }
  end
  if ks then
    b_ks = {
      ks.Score,
      ks.Kills,
      ks.Deaths
    }
  end
  b_team1Score = Game._team1Score
  b_team2Score = Game._team2Score
  if ds then
    if ds == ks then
      attack_type = AttackTypes.Suicide
    end
    local txt = TXT.Multiplayer.PlayerDeathComments[attack_type]
    if txt and table.getn(txt) > 0 then
      txt = txt[math.random(1, table.getn(txt))]
      txt = string.gsub(txt, "$PLAYER", ds.Name)
      if ks then
        txt = string.gsub(txt, "$KILLER", ks.Name)
        if Cfg.HUD_FragMessage_Status then
          local checkattacktype = {
            [1] = 1,
            [2] = 2,
            [3] = 3,
            [5] = 5,
            [10] = 10,
            [11] = 11,
            [19] = 19,
            [23] = 23,
            [24] = 24,
            [31] = 31,
            [34] = 34,
            [35] = 35
          }
          if attack_type == checkattacktype[attack_type] and not checkOnly then
            local timing = Cfg.HUD_FragMessage_Status_Timing
            table.insert(Hud.KillerPlayerName, 1, ks.Name)
            table.insert(Hud.DeadPlayerName, 1, ds.Name)
            table.insert(Hud.AttackType, 1, attack_type)
            table.insert(Hud.AttackTypeEnd, 1, Game.currentTime * 2 + timing)
            if table.getn(Hud.KillerPlayerName) == 5 then
              table.remove(Hud.KillerPlayerName, 5)
              table.remove(Hud.DeadPlayerName, 5)
              table.remove(Hud.AttackType, 5)
              table.remove(Hud.AttackTypeEnd, 5)
            end
          end
        end
      end
      if not checkOnly then
        if MPCfg.GameMode ~= "Clan Arena" and not Cfg.HUD_FragMessage_Status then
          CONSOLE_AddMessage(txt)
        end
        if ds ~= ks and 1 < score then
          if MPCfg.GameMode == "People Can Fly" then
            if score == 2 then
              CONSOLE_AddMessage(Languages.Texts[697])
            end
            if score == 3 then
              CONSOLE_AddMessage(Languages.Texts[698])
            end
            if score == 5 then
              CONSOLE_AddMessage(Languages.Texts[699])
            end
            if score == 10 then
              CONSOLE_AddMessage(Languages.Texts[700])
            end
          else
            CONSOLE_AddMessage(score .. "!!!")
          end
        end
      end
    end
    ds.Deaths = ds.Deaths + 1
    local ps = ds
    if ks and ks ~= ds then
      ps = ks
    end
    local oldScore = ps.Score
    if ks and ks ~= ds then
      if MPGameRules[MPCfg.GameMode].Teams and (attack_type == AttackTypes.TeleFrag or MPCfg.TeamDamage) and ks.Team == ds.Team then
        ks.Score = ks.Score - 1
        ks.Kills = ks.Kills + 1
      else
        ks.Score = ks.Score + score
        ks.Kills = ks.Kills + 1
      end
    else
      ds.Score = ds.Score - 1
    end
    if MPCfg.GameMode == "Capture The Flag" or MPCfg.GameMode == "ICTF" then
      if ds then
        Game.PlayerStats[deadID].Score = b_ds[1]
      end
      if ks then
        Game.PlayerStats[killerID].Score = b_ks[1]
      end
    end
    if ps.Team == 0 then
      Game._team1Score = Game._team1Score + (ps.Score - oldScore)
    else
      Game._team2Score = Game._team2Score + (ps.Score - oldScore)
    end
  end
  if MPCfg.GameMode == "Capture The Flag" or MPCfg.GameMode == "ICTF" then
    if ks and attack_type == AttackTypes.Flag then
      ks.Score = ks.Score + score
      local fscore = 0
      if ks.Team == 0 then
        Game._team1Score = Game._team1Score + score
        fscore = Game._team1Score
      else
        Game._team2Score = Game._team2Score + score
        fscore = Game._team2Score
      end
      if Game:IsServer() and fscore >= MPCfg.CaptureLimit then
        Game.SetGameState(GameStates.Finished)
        StringToDo = "Game.EndOfMatch()"
      end
    end
  elseif MPCfg.GameMode == "Last Man Standing" then
    if checkOnly and Game:IsServer() then
      if ds and ds.Deaths >= MPCfg.LMSLives then
        Game.PlayerSpectatorRequest(deadID, 1)
        ds = nil
      end
      local active_players = 0
      for i, o in Game.PlayerStats, nil do
        if o.Spectator == 0 then
          active_players = active_players + 1
        end
      end
      if active_players <= 1 then
        Game.SetGameState(GameStates.Finished)
        StringToDo = "Game.EndOfMatch()"
      end
    end
  elseif MPCfg.GameMode == "Clan Arena" then
    local killertxt = {
      "Feel the pain!",
      "Loser!",
      "Owned!",
      "Be better next time...",
      "Shame on you!"
    }
    killertxt = killertxt[math.random(1, table.getn(killertxt))]
    if checkOnly and Game:IsServer() then
      if ds and ds.Deaths >= 1 then
        Game.PlayerSpectatorRequest(deadID, 1)
        if ks then
          SendNetMethod(Game.ConsoleClientMessage, deadID, true, true, killerID, killertxt, 0)
          NET.SendVariable(killerID, "FGMN", ds.Name)
          NET.SendVariable(deadID, "FGMN", killertxt)
        end
        SendNetMethod(Game.ConsoleClientMessage, deadID, true, true, ServerID, "You are now in spectator", 0)
        if attack_type == 4 or attack_type == 7 or attack_type == 28 then
          SendNetMethod(Game.ConsoleClientMessage, deadID, true, true, ServerID, "You are proven that life is short.", 0)
        end
        for i, ps in Game.PlayerStats, nil do
          SendNetMethod(Game.ConsoleClientMessage, ps.ClientID, true, true, ServerID, ds.Name .. " is now in spectator", 0)
        end
        ds.CASpec = true
        ds = nil
      end
      local bluecount = 0
      local redcount = 0
      for i, ps in Game.PlayerStats, nil do
        if ps.Team == 0 and ps.Spectator == 0 then
          bluecount = bluecount + 1
        end
        if ps.Team == 1 and ps.Spectator == 0 then
          redcount = redcount + 1
        end
      end
      if redcount == 0 or bluecount == 0 then
        Game.SetGameState(GameStates.Finished)
        StringToDo = "Game.EndOfMatch()"
      end
    end
  elseif ks and 0 < MPCfg.FragLimit then
    local score = 0
    if MPGameRules[MPCfg.GameMode].Teams then
      local tscores = {
        Game._team1Score,
        Game._team2Score
      }
      score = tscores[ks.Team + 1]
    else
      score = ks.Score
    end
    if score >= MPCfg.FragLimit and checkOnly and Game:IsServer() then
      Game.SetGameState(GameStates.Finished)
      StringToDo = "Game.EndOfMatch()"
    end
  end
  if checkOnly then
    if ds and Game.PlayerStats[deadID] then
      Game.PlayerStats[deadID].Score = b_ds[1]
      Game.PlayerStats[deadID].Kills = b_ds[2]
      Game.PlayerStats[deadID].Deaths = b_ds[3]
    end
    if ks and Game.PlayerStats[killerID] then
      Game.PlayerStats[killerID].Score = b_ks[1]
      Game.PlayerStats[killerID].Kills = b_ks[2]
      Game.PlayerStats[killerID].Deaths = b_ks[3]
    end
    Game._team1Score = b_team1Score
    Game._team2Score = b_team2Score
  else
    if ds then
      MPSTATS.Update(ds.ClientID, ds.Name, ds.Score, ds.Kills, ds.Deaths, ds.Ping, ds.PacketLoss, ds.Team, ds.State, ds.Spectator)
    end
    if ks then
      MPSTATS.Update(ks.ClientID, ks.Name, ks.Score, ks.Kills, ks.Deaths, ks.Ping, ks.PacketLoss, ks.Team, ks.State, ks.Spectator)
    end
    if Cfg.PitabotEnabled then
      if ks and ds and ds ~= ks and ds.Name ~= nil and attack_type ~= nil and ks.Name ~= nil and ds.Score ~= nil and ks.Score ~= nil then
        PBLogEvent(ds.Name, attack_type, {
          ks.Name,
          ds.Score,
          ks.Score
        })
      elseif ds and ds.Name ~= nil and attack_type ~= nil and ds.Score ~= nil then
        PBLogEvent(ds.Name, attack_type, {
          ds.Score
        })
      end
    end
  end
end

function CPlayer:BindPoint(ox, oy, oz)
  local a = -self.angle
  local x = self.Pos.X + (math.cos(a) * ox - math.sin(a) * oz)
  local z = self.Pos.Z + (math.sin(a) * ox + math.cos(a) * oz)
  local y = self.Pos.Y + oy
  return x, y, z
end

function CPlayer:Client_OnDeath(deadID, killerID, attack_type, gib, score, damage)
  local ds = Game.PlayerStats[deadID]
  local ks = Game.PlayerStats[killerID]
  if Player and ds and Cfg.BrightSkins_DeadBody and deadID ~= Player.ClientID then
    MDL.SetMeshLighting(ds._Entity, "*", false, 102, 102, 102)
  end
  if Player and Player.ClientID == killerID and deadID ~= Player.ClientID and Cfg.KillSound then
    if Cfg.Newhitsound == false then
      PlaySound2D("../Sounds/killsound", Cfg.KillSoundVolume, nil, true)
    else
      PlaySound2D("../Sounds/killsoundnew", Cfg.KillSoundVolume, nil, true)
    end
  end
  if Player and Player.ClientID == killerID and deadID ~= Player.ClientID and Cfg.HUD_FragMessage and MPCfg.GameMode ~= "Clan Arena" then
    if ds then
      Hud.fname = Game.PlayerStats[deadID].Name
    end
    fragmessagestart = Game.currentTime
    fragmessageend = Game.currentTime + 60
  end
  Game:Print("Client_OnDeath")
  attack_type = attack_type or 255
  local ds = Game.PlayerStats[deadID]
  local ks = Game.PlayerStats[killerID]
  local deadEntity
  if ds then
    deadEntity = ds._Entity
  end
  CPlayer:Common_UpdateStats(false, deadID, killerID, attack_type, score)
  local player = Game:FindPlayerByClientID(deadID)
  if player then
    player:ResetStatusAfterDeath()
    deadEntity = player._Entity
    if gib == 1 then
      player._gibbed = true
    end
    if player == Player then
      if Game.GMode ~= GModes.SingleGame then
        if Game._procStats then
          GObjects:ToKill(Game._procStats)
        end
        Game._procStats = GObjects:Add(TempObjName(), Templates["EndOfMatch.CProcess"]:New())
      else
        Game:EnableBulletTime(false)
        Game:EnableDemon(false)
        if Lev.CustomOnPlayerDeath then
          Lev:CustomOnPlayerDeath()
        end
        local p = GObjects:Add(TempObjName(), CloneTemplate("TDeathPlayer.CProcess"))
        p.ObjOwner = player
      end
    end
  end
  if ds then
    ds._Entity = nil
  end
  local x, y, z = ENTITY.GetPosition(deadEntity)
  CActor:BloodFX(x, y + 1.7, z, FRand(-1, 1), 0, FRand(-1, 1))
  ENTITY.PO_Enable(deadEntity, false)
  ENTITY.EnableDraw(deadEntity, false)
  if Game.GMode ~= GModes.SingleGame then
    ENTITY.KillAllChildren(deadEntity, ETypes.Sound)
    ENTITY.KillAllChildrenByName(deadEntity, "fx_weaponmodifier")
    if not Cfg.LowQualityMultiplayerSFX then
      if gib == 0 then
        ENTITY.RecreateRagdollIfNone(deadEntity)
        MDL.SetRagdollCollisionGroup(deadEntity, ECollisionGroups.Particles)
        if not IsDedicatedServer() then
          MDL.EnableRagdoll(deadEntity, true, ECollisionGroups.Particles)
        end
        ENTITY.EnableDraw(deadEntity, true)
      else
        ENTITY.RemoveRagdoll(deadEntity)
        if not IsDedicatedServer() then
          local ge = MDL.MakeGib(deadEntity, ECollisionGroups.Particles)
          ENTITY.PO_SetMass(ge, 80)
          MDL.SetMaterial(ge, "palskinned_bloody")
          WORLD.Explosion2(x, y + 1, z, 3000 * FRand(0.8, 1.2), 2, nil, AttackTypes.Grenade, 0)
          ENTITY.SetTimeToDie(ge, 3)
          local parts = {
            {"r_l_arm", -1},
            {"r_p_arm", 1},
            {"n_l_bio", -1},
            {"n_p_bio", 1},
            {"k_head", -1},
            {"k_chest", 1},
            {"root", -1}
          }
          if not Cfg.NoGibs then
            for i, v in parts, nil do
              local pfx = AddPFX("FX_gib_blood", 0.3)
              ENTITY.RegisterChild(ge, pfx)
              PARTICLE.SetParentOffset(pfx, 0, 0, 0, v[1], nil, nil, nil, 0, 0, math.pi / 2 * v[2])
            end
          end
          local x, y, z = MDL.TransformPointByJoint(deadEntity, MDL.GetJointIndex(deadEntity, "k_chest"), 0, 0, 0)
          if not Cfg.NoGibs then
            AddPFX("gibExplosion", 0.4, Vector:New(x, y, z))
          end
        end
      end
    else
      ENTITY.EnableDraw(deadEntity, false)
      local x, y, z = MDL.TransformPointByJoint(deadEntity, MDL.GetJointIndex(deadEntity, "k_chest"), 0, 0, 0)
      if not Cfg.NoGibs then
        AddPFX("gibExplosion", 0.5, Vector:New(x, y, z))
      end
    end
  end
  if Player and (Player.ClientID == deadID or Player.ClientID == killerID) then
    if Player.ClientID == deadID then
      if 0 < Player.MedalGood then
        Player.MedalGood = 0
      end
      if 0 < Player.Comments then
        Player.Comments = 0
      end
      Player.Comments = Player.Comments - 1
      if Player.Comments == -5 and not Cfg.NoMPComments then
        SOUND.Play2D("multiplayer/lucifer/Lucifer_bad0" .. math.random(1, 4), 100, true)
      end
      if Player.Comments == -10 then
        if not Cfg.NoMPComments then
          SOUND.Play2D("multiplayer/lucifer/Lucifer_verybad0" .. math.random(1, 2), 100, true)
        end
        Player.Comments = -5
      end
      if Player.MedalStylish then
        Player.MedalStylishNextStake = 0
        Player.MedalStylish = false
      end
    end
    if Player.ClientID == killerID and Player.ClientID ~= deadID then
      if 0 > Player.Comments then
        Player.Comments = 0
      end
      Player.Comments = Player.Comments + 1
      if Cfg.HUD_Show_Medals then
        Player.MedalGood = Player.MedalGood + 1
        if Player.MedalGood == 1 then
          Player.MedalGoodSound = Game.currentTime / 30 + 2
        end
        if Player.MedalGood == 2 then
          if Game.currentTime / 30 <= Player.MedalGoodSound then
            if not Cfg.NoMPComments then
              SOUND.Play2D("multiplayer/lucifer/Lucifer_good03", 100, true)
            end
            Hud.MedalGoodIconStart = Game.currentTime * 2
            Hud.MedalGoodIconEnd = Game.currentTime * 2 + 180
            Player.MedalGood = 0
            Hud.MedalGood = Hud.MedalGood + 1
          else
            Player.MedalGoodSound = Game.currentTime / 30 + 2
            Player.MedalGood = 1
          end
        end
        if attack_type == AttackTypes.PainkillerRotor then
          if not Cfg.NoMPComments then
            SOUND.Play2D("multiplayer/lucifer/Lucifer_good02", 100, true)
          end
          Hud.MedalSweetIconStart = Game.currentTime * 2
          Hud.MedalSweetIconEnd = Game.currentTime * 2 + 180
          Hud.MedalSweet = Hud.MedalSweet + 1
        end
        if attack_type == AttackTypes.Stake then
          if not Player.MedalStylish and Player.MedalStylishNextStake == 0 then
            Player.MedalStylish = true
          end
          if Player.MedalStylishNextStake == 1 then
            if not Cfg.NoMPComments then
              SOUND.Play2D("multiplayer/lucifer/Lucifer_good05", 100, true)
            end
            Player.MedalStylishNextStake = 0
            Player.MedalStylish = false
            Hud.MedalStylishIconStart = Game.currentTime * 2
            Hud.MedalStylishIconEnd = Game.currentTime * 2 + 180
            Hud.MedalStylish = Hud.MedalStylish + 1
          end
        end
      end
      if Player.Comments == 5 and not Cfg.HUD_Show_Medals and not Cfg.NoMPComments then
        SOUND.Play2D("multiplayer/lucifer/Lucifer_good0" .. math.random(1, 5), 100, true)
      end
      if Player.Comments == 10 then
        if not Cfg.HUD_Show_Medals then
          if not Cfg.NoMPComments then
            SOUND.Play2D("multiplayer/lucifer/Lucifer_excellent0" .. math.random(1, 2), 100, true)
          end
        else
          if not Cfg.NoMPComments then
            SOUND.Play2D("multiplayer/lucifer/Lucifer_excellent02", 100, true)
          end
          Hud.MedalNoMercyIconStart = Game.currentTime * 2
          Hud.MedalNoMercyIconEnd = Game.currentTime * 2 + 180
          Hud.MedalNoMercy = Hud.MedalNoMercy + 1
        end
        Player.Comments = 5
      end
    end
  end
  if ds and ds._animproc then
    ds._animproc:Reset()
  end
  if Game.GMode == GModes.SingleGame then
    PlaySound2D("hero/hero_death" .. math.random(1, 2), nil, nil, true)
  elseif gib == 1 then
    CPlayer:SndEnt("Death_Gib", deadEntity)
  elseif attack_type == AttackTypes.TeleFrag then
    CPlayer:SndEnt("Death_Telefrag", deadEntity)
  else
    CPlayer:SndEnt("Death", deadEntity)
  end
  if player then
    player._Entity = nil
  end
  ENTITY.KillAllChildren(deadEntity)
end

Network:RegisterMethod("CPlayer.Client_OnDeath", NCallOn.ServerAndAllClients, NMode.Reliable, "bbbbbb")

function CPlayer:WeaponChangeRequest(entity, slot)
  local player = EntityToObject[entity]
  if not player or not player:GetCurWeapon() then
    return
  end
  player:TryToChangeWeapon(slot)
  Game:Print(player.EnabledWeapons[slot] .. ".CWeapon")
end

Network:RegisterMethod("CPlayer.WeaponChangeRequest", NCallOn.Server, NMode.Reliable, "eb")

function CPlayer:WeaponChangeConfirmation(entity, slot)
  local player = EntityToObject[entity]
  if not player then
    return
  end
  local cw = player:GetCurWeapon()
  Game:Print("WeaponChangeConfirmation " .. slot)
  player._SwitchToWeapon = nil
  if not Game.IsDemon and player == Player then
    PlaySound2D("misc/weapon-hide", nil, nil, true)
    PlaySound2D("misc/weapon-show", nil, nil, true)
  end
  local lastWeapon = cw
  player._LastWeaponIndex = player._CurWeaponIndex
  player:DeactivateWeapon()
  cw = player:AddWeapon(slot)
  if Player and Player.MedalStylish and lastWeapon == Player.Weapons[3] and lastWeapon ~= cw then
    Player.MedalStylishNextStake = 0
    Player.MedalStylish = false
  end
  if lastWeapon and lastWeapon ~= cw then
    lastWeapon:OnChangeWeapon()
    lastWeapon._ActionState = "Idle"
    lastWeapon._fire = false
    lastWeapon._altfire = false
    lastWeapon._combo = false
    lastWeapon.ShotTimeOut = -1
    lastWeapon._lastTime = nil
  end
  cw._lastTime = nil
  player._CurWeaponIndex = slot
  if player == Player then
    WORLD.AddEntity(cw._Entity)
  end
  player.State = slot
end

Network:RegisterMethod("CPlayer.WeaponChangeConfirmation", NCallOn.ServerAndSingleClient, NMode.Reliable, "eb")
