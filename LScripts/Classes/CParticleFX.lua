CParticleFX = {
  Pos = Vector:New(0, 0, 0),
  Rot = Quaternion:New(),
  Scale = 1,
  Effect = "Default",
  _Class = "CParticleFX",
  _Entity = 0
}
Inherit(CParticleFX, CObject)

function CParticleFX:OnClone(old)
  if old == CParticleFX then
    self.Pos = OppositeToCamera()
  else
    self.Pos.X = old.Pos.X - 0.5
    self.Pos.Z = old.Pos.Z - 0.5
  end
  self._Entity = 0
end

function CParticleFX:Delete()
  ENTITY.Release(self._Entity)
  self._Entity = nil
end

function CParticleFX:LoadData()
  ENTITY.Release(self._Entity)
  self._Entity = ENTITY.Create(ETypes.ParticleFX, "", self._Name .. ":Script")
  LoadParticleFX(self._Entity, self.Effect)
  WORLD.AddEntity(self._Entity)
  PARTICLE.SetEvolve(self._Entity, true)
end

function CParticleFX:Apply(old)
  if not old or old and old.Effect ~= self.Effect then
    self:LoadData()
  end
  ENTITY.SetScale(self._Entity, self.Scale)
  PARTICLE.SetEvolve(self._Entity, true)
  ENTITY.SetPosition(self._Entity, self.Pos.X, self.Pos.Y, self.Pos.Z)
  self.Rot:ToEntity(self._Entity)
  ENTITY.EnableDraw(self._Entity, self.Visible)
end

ParticleFXArray = {}

function LoadParticleFX(entity, name)
  if IsBlockedPFX(name) then
    name = "EvilMonkEye"
  end
  local fx
  ParticleFX = nil
  if not ParticleFXArray[name] then
    Game:Print("PFX: " .. name)
    DoFile("../Data/Textures/Scripts/Effects/" .. name .. ".pfx", false)
    DoFile("../Data/Scripts/Effects/" .. name .. ".pfx", false)
    ParticleFXArray[name] = ParticleFX
    fx = ParticleFX
    ParticleFX = nil
  else
    fx = ParticleFXArray[name]
  end
  if not fx then
    return
  end
  if fx.FixedTransform then
    PARTICLE.SetFixedTransform(entity, fx.FixedTransform)
  end
  for id, v in fx.Emitters, nil do
    local i = PARTICLE.AddEmitter(entity, v.File)
    PARTICLE.SetupEmitter(entity, i, v.Scale, v.Position[1], v.Position[2], v.Position[3], v.Rotation[1], v.Rotation[2], v.Rotation[3])
  end
end

function AddParticleFX(x, y, z, name)
  do return end
  local e = ENTITY.Create(ETypes.ParticleFX, ParticlesFX[name][2], name)
  ENTITY.SetScale(e, ParticlesFX[name][1])
  ENTITY.SetPosition(e, x, y, z)
  WORLD.AddEntity(e)
  return e
end

function AddPFX(effect, scale, pos, rot)
  if IsBlockedPFX(effect) then
    effect = "EvilMonkEye"
  end
  local e = ENTITY.Create(ETypes.ParticleFX, "", effect)
  LoadParticleFX(e, effect)
  if pos then
    ENTITY.SetPosition(e, pos.X, pos.Y, pos.Z)
  end
  if rot then
    rot:ToEntity(e)
  end
  if scale then
    ENTITY.SetScale(e, scale)
  end
  WORLD.AddEntity(e)
  return e
end

function IsBlockedPFX(effect)
  if effect == "dymm" and Cfg.NoSmoke then
    return true
  end
  if effect == "acidsmoke" and Cfg.NoSmoke then
    return true
  end
  if effect == "demonflame" and Cfg.NoFlames then
    return true
  end
  if effect == "Pochodnia_flame" and Cfg.NoFlames then
    return true
  end
  if effect == "Pochodnia_flame_re" and Cfg.NoFlames then
    return true
  end
  return false
end
