debug = nil
Game = {
    Active = false,
    AddOn = false,
    bot = {},
    TPart = 0,
    Counter = 0,
    currentTime = 0,
    Paused = false,
    Players = {},
    NewComers = {},
    GameCount = {},
    GMode = GModes.SingleGame,
    CheckPoint = 0,
    Difficulty = Difficulties.Insomnia,
    LevelStarted = false,
    EndOfLevelActive = false,
    LevelTime = 0,
    BodyCountTotal = 0,
    TotalActors = 0,
    TotalSouls = 0,
    TotalMoney = 0,
    TotalAmmo = 0,
    TotalArmor = 0,
    TotalDestroyed = 0,
    TotalHolyItems = 0,
    TotalSecrets = 0,
    PlayerDestroyedItems = 0,
    PlayerAmmoFound = 0,
    PlayerCoinsFound = 0,
    PlayerMoneyFound = 0,
    PlayerMoney = 0,
    KilledInDemonMode = 0,
    MaxKilledInDemonMode = 0,
    CameraFromPlayer = true,
    IsDemon = false,
    FlashDemon = false,
    BulletTime = false,
    TPP = false,
    LastPlayerHealth = 0,
    LevelStarted = false,
    GameInProgress = false,
    Demon_HowManyCorpses = 66,
    Demon_Counter = 0,
    DemonMorphCount = 0,
    TotalDemonMorphCount = 0,
    TimeLimit = 0,
    PlayerStats = {},
    PlayerData = {},
    LevelsStats = {},
    Stats = {},
    CurrLevel = 0,
    CurrChapter = 0,
    GCIcons = {
        nil,
        nil,
        nil
    },
    GCCount = 0,
    GCIconsDraw = false,
    GCIconsColor = {
        255,
        255,
        255
    },
    CardsAvailable = {
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false
    },
    CardsSelected = {
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false
    },
    GoldenCardsUseLeft = 1,
    GoldenCardsUseCount = 0,
    InitialHealth = 100,
    HealthCapacity = 100,
    InitialAmmo = 100,
    HealthRegen = false,
    ArmorRegen = false,
    SpeedFactor = 1,
    ReloadSpeedFactor = 1,
    DamageFactor = 1,
    AmmoFoundFactor = 1,
    TreasureFoundFactor = 1,
    SoulHealthFactor = 1,
    SoulStayFactor = 1,
    SoulCatchDistance = 0,
    ConfuseEnemies = false,
    PlayerDamageFactor = 1,
    PlayerNoDamage = false,
    PlayerRegenerateWhenDying = false,
    StealHealth = false,
    GoldenEnableTime = 30,
    GoldenEnabled = false,
    GoldenEnabledStart = 0,
    GoldenEnabledLeft = 0,
    BulletTimeSlowdown = 0.25,
    PlayerJumpStrength = nil,
    FearCard = false,
    WeaponModCard = false,
    NoAmmoLoss = false,
    WeakEnemies = false,
    GoldenCardsUseUnlimited = false,
    BonusMPModel = false,
    BonusMPModel2 = false,
    Cheat_WeakEnemies = false,
    Cheat_AlwaysGib = false,
    Cheat_KeepBodies = false,
    Cheat_KeepDecals = false,
    MegaBossHealthMax = nil,
    MegaBossHealth = nil,
    _voteTimeLeft = 0,
    _voteCmd = "",
    _voteParams = "",
    _team1Score = 0,
    _team2Score = 0,
    _lastCamPos = Vector:New(0, 0, 0),
    SwitchFire = {
        false,
        false,
        false,
        false,
        false
    },
    _ColorTeamR = {
        0,
        0,
        0
    },
    _ColorTeamB = {
        0,
        0,
        0
    },
    _MeConsoleOpened = true,
    _MeConsoleClosed = false,
    _SomeConsoleClosed = false,
    _SomeConsoleOpened = false,
    _ConsoleClientID = nil,
    ChatData = {},
    _ChatData = {},
    FlagEntityData = {},
    _ChatIcon = Cfg.ChatIcon,
    SetStatsShow = false,
    ServerCheckModUser = "999:nil"
}
LevelStartState = nil
Lev = nil
MX = 0
MY = 0
OMX = 0
OMY = 0
PX = 1000
PY = 1000
PZ = 1000

function Game:InitTemplates(clearOnly)
    if self._onSwitch then
        self._onSwitch = nil
        return
    end
    TemplatesPaths = {}
    Templates = {}
    AiStates = {}
    if not clearOnly then
        if Game.GMode == GModes.SingleGame then
            setmetatable(Templates, {__index = LoadObjIndex})
        end
        Game:Print(
            "-------> INIT TEMPLATES preload templates " ..
                Game.GMode .. " " .. GetCallStackInfo(2) .. " " .. GetCallStackInfo(3)
        )
        PreloadTemplates("../Data/LScripts/Templates")
        Game:Print("-------> INIT TEMPLATES preload finished " .. Game.GMode)
    else
        Game:Print("-------> INIT TEMPLATES clear only " .. GetCallStackInfo(2) .. " " .. GetCallStackInfo(3))
    end
end

function Game:Init(nolevel)
    if GetPainkillerVersionString() ~= "1.4" or GetEngineVersionString() ~= "1.4" then
        MsgBox("Critical error: bad engine version or exe version; the game will not run")
        return
    end
    Cfg:Load()
    Tweak:Load()
    ENTITY.ReloadDecalSystem()
    math.randomseed(INP.GetTime())
    if not nolevel then
        self:NewLevel("NoName", "", "", 0.3, true)
        Lev:Apply()
        EDITOR.OnMsg("SelectObject", Lev._Name)
    end
    if not IsDedicatedServer() then
        Hud:LoadData()
        Editor:Init()
        INP.LoadBindings()
    else
        CONSOLE.AddMessage = DSConsole_AddMessage
        CONSOLE.SetCurrentText = DSConsole_SetCurrText
    end
    MOUSE.SetSensitivity(Cfg.MouseSensitivity)
    R3D.SetCameraFOV(Cfg.FOV)
    WORLD.SetWorldSpeed(1)
    CAM.EnableInterpolation(Cfg.CameraInterpolation)
    SOUND.SetSoundSpeedRandomizer(Cfg.DisturbSound3DFreq)
    table.foreachi(
        SoundsProperties,
        function(i, v)
            SOUND.SetSoundProperties(v[1], v[2], v[3] * 1000)
        end
    )
    SoundsProperties = nil
    self:ApplySettings()
    self:SetConstant()
    if PainMenu then
        for i = 1, table.getn(PainMenu.movSndTracks) do
            if PainMenu.movSndTracks[i] == Cfg.Language then
                PainMenu.movSndTrack = i - 1
            end
        end
    end
    self.BonusMPModel = PMENU.GetRegistryBonus1()
    self.GoldenCardsUseUnlimited = PMENU.GetRegistryBonus2()
    self.BonusMPModel2 = PMENU.GetRegistryBonus3()
end

function Game:ApplySettings()
    MOUSE.SetSensitivity(Cfg.MouseSensitivity)
    SOUND.ApplySoundSettings(Cfg.MasterVolume, Cfg.MusicVolume, Cfg.SfxVolume, Cfg.SpeakersSetup, Cfg.SoundPan)
end

function Game:NewLevel(name, map, wpm, scale)
    self:Clear()
    Hud.MedalNoMercy = 0
    Hud.MedalGood = 0
    Hud.MedalSweet = 0
    Hud.MedalStylish = 0
    Hud.LAmmosPlaySound = {
        {false, false},
        {false, false},
        {false, false},
        {false, false},
        {false, false},
        {false, false},
        {false, false}
    }
    Lev = CLevel:New(map, wpm, scale)
    Lev._Name = name
    Lev._Class = "CLevel"
    Lev.BaseObj = "CLevel"
    getfenv()[name] = Lev
end

function Game:CreatePlayerSP()
    local e = CreatePlayer("player_box", false)
    Player = self:AddPlayer(e, "Player", "player_box")
    Player.ClientID = ServerID
    if Game.PlayerEnabledWeapons then
        Player.EnabledWeapons = Game.PlayerEnabledWeapons
    end
    Game.PlayerEnabledWeapons = nil
    MDL.SetAnim(Player._Entity, "idle", true)
    if Lev then
        ENTITY.SetPosition(Player._Entity, Lev.Pos.X, Lev.Pos.Y, Lev.Pos.Z)
    end
    ENTITY.PO_SetMovedByExplosions(Player._Entity, false)
    Player.LevelBodyCount = 0
    Player.Ammo = Clone(CPlayer.s_SubClass.Ammo)
end

function Game:AddPlayer(entity, name, model)
    local obj = GObjects:Add("Player" .. TempObjName(), CPlayer:New())
    obj._Entity = entity
    obj.Visible = false
    obj.Model = model
    table.insert(self.Players, obj)
    MDL.SetAnim(entity, "idle", true)
    obj.PlayerSpeed = GetPlayerSpeed()
    ENTITY.EnableDeathZoneTest(entity, true)
    if entity then
        EntityToObject[entity] = obj
    end
    return obj
end

function Game:Clear(doNotReloadTemplates)
    R3D.SetCameraFOV(Cfg.FOV)
    LEVEL_RELEASING = true
    Cached = nil
    if Player then
        for i, v in Player.Weapons, nil do
            v:Delete()
        end
    end
    WORLD.EnableDemonFX(false)
    WORLD.SetupFog(0)
    Game.BulletTime = false
    Game._BTimeProc = nil
    Game.IsDemon = false
    Game._DemonProc = nil
    GObjects:Clear()
    if not IsDedicatedServer() then
        Editor.SelObj = nil
    end
    EntityToObject = {}
    setmetatable(EntityToObject, {__mode = "vk"})
    ActiveSounds = {}
    MsgQueue = {}
    self:InitTemplates(doNotReloadTemplates)
    self.TotalActors = 0
    self.TotalSouls = 0
    self.TotalMoney = 0
    self.TotalAmmo = 0
    self.TotalArmor = 0
    self.TotalDestroyed = 0
    self.TotalHolyItems = 0
    self.TotalSecrets = 0
    self.PlayerDestroyedItems = 0
    self.PlayerAmmoFound = 0
    self.PlayerCoinsFound = 0
    self.PlayerMoneyFound = 0
    self.KilledInDemonMode = 0
    self.MaxKilledInDemonMode = 0
    self.BodyCountTotal = 0
    self.Demon_Counter = self.Demon_HowManyCorpses
    self.DemonMorphCount = 0
    self.TotalDemonMorphCount = 0
    self.Players = {}
    self.PlayerStats = {}
    self.PlayerData = {}
    self.ChatData = {}
    self._ChatData = {}
    self.FlagEntityData = {}
    self.TimeLimit = 0
    self.GoldenCardsUseCount = 0
    self.EndOfLevelActive = false
    MPCfg.GameState = GameStates.Playing
    Player = nil
    self._spectatorRecordingPlayer = nil
    MPSTATS.ClearAll()
    MPSTATS.Hide()
    self._procStats = nil
    if Game.GMode == GModes.SingleGame then
        Game.MegaBossHealth = nil
    end
    WORLD.EnableOcclude(true)
    LEVEL_RELEASING = false
    for i = 1, table.getn(self.GCIcons) do
        if self.GCIcons[i] then
            MATERIAL.Release(self.GCIcons[i])
        end
    end
    self.CheckPoint = 0
    self.GCIcons = {
        nil,
        nil,
        nil
    }
    self.GCCount = 0
    Game._countTimerInt = nil
    Game._BlockedPlay = nil
    Hud.r_closestEnemy = nil
    Hud._nearestEnemy = nil
    Hud._nearestCheckPoint = nil
    Hud._nearestIsCheckpoint = false
    Hud._lastTime = 0
    self._team1Score = 0
    self._team2Score = 0
    self._voteTimeLeft = 0
    self._voteCmd = ""
    self._voteParams = ""
    ParticleFXArray = {}
    self.CameraFromPlayer = true
    collectgarbage(0)
end

function Game:Close()
    self:Clear(true)
    Hud:Clear()
end

function Game:UpdateTimer(delta)
    local fdelta = delta * 30 + self.TPart
    self.Loops = math.floor(fdelta)
    self.TPart = fdelta - self.Loops
    if self.LevelStarted == true then
        self.LevelTime = self.LevelTime + delta
    end
    self.Counter = self.Counter + 1
    if self.Counter > 30000 then
        self.Counter = 0
    end
end

function Game:Tick(delta)
    if self.WaitForServer then
        return
    end
    luaProfiler_LOGIC1()
    DELTA = delta
    MX, MY = MOUSE.GetPos()
    Game:UpdateTimer(delta)
    if not MOUSE.IsLocked() then
        Editor:Tick(delta)
        for i, o in self.Players, nil do
            if o ~= Player then
                o:ServerTick(delta)
            end
        end
    else
        if Player then
            if self.CameraFromPlayer then
                PX, PY, PZ = Player.Pos:Get()
            end
            Player:ClientTick(delta)
        end
        if Game.GMode ~= GModes.MultiplayerClient then
            for i, o in self.Players, nil do
                o:ServerTick(delta)
            end
        end
    end
    if Game.GMode ~= GModes.SingleGame then
        if self.Active then
            if Game:IsServer() then
                self:OnMultiplayerServerTick(delta)
            end
            if Game.GMode == GModes.MultiplayerServer or Game.GMode == GModes.MultiplayerClient then
                self:OnMultiplayerClientTick(delta)
            end
            self:OnMultiplayerCommonTick(delta)
        end
    elseif self.GoldenEnabled == false then
        self.GoldenEnabledLeft = self.GoldenEnabledLeft - delta / INP.GetTimeMultiplier()
        if self.GCIconsDraw == true and self.GoldenEnabledLeft <= 0 then
            self.GCIconsDraw = false
            self.GoldenEnabledStart = 0
            self.GoldenEnabledLeft = 0
        end
        if
            INP.Action(Actions.UseCards) and 0 < self.Difficulty and self.IsDemon == false and
                self.GoldenEnabledStart == 0
         then
            self:EnableGoldenCards()
            INP.RemoveAction(Actions.UseCards)
            self.GCIconsDraw = true
        end
    else
        self.GoldenEnabledLeft = self.GoldenEnabledLeft - delta / INP.GetTimeMultiplier()
        if self.GoldenEnabledLeft <= 0 then
            self:ResetGoldenCardsVars()
            self.GoldenEnabled = false
            self.GoldenEnabledStart = 0
            self.GCIconsDraw = false
            SOUND.Play2D("items/item-quad-timeout", 100, true)
        elseif self.GoldenEnabledLeft < 3 and self.GoldenEnabledLeft > 2.5 then
            self.GCIconsDraw = false
        elseif self.GoldenEnabledLeft < 2 and self.GoldenEnabledLeft > 1.5 then
            self.GCIconsDraw = false
        elseif self.GoldenEnabledLeft < 1 and self.GoldenEnabledLeft > 0.5 then
            self.GCIconsDraw = false
        else
            self.GCIconsDraw = true
        end
    end
    if self.Active then
        GObjects:Tick(delta)
        for i = 0, self.Loops - 1 do
            self.currentTime = self.currentTime + 1
            GObjects:Update()
            for i, v in ActiveSounds, nil do
                if v[9] < self.currentTime then
                    table.remove(ActiveSounds, i)
                end
            end
        end
    else
        GObjects:Synchronize(delta)
        GObjects:DeleteKilled()
    end
    luaProfiler_LOGIC4a()
    for i = 0, self.Loops - 1 do
        self:Update()
    end
    SOUND.SetPlayerPos(CAM.GetPos())
    SOUND.SetPlayerOrientation(CAM.GetForwardVector())
    if Game.GMode == GModes.SingleGame and INP.UIAction(UIActions.Scoreboard) then
        Hud._showSPStats = true
    else
        Hud._showSPStats = false
    end
    Hud:Tick(delta)
    if INP.UIAction(UIActions.QuickSave) and Player and not Player._died then
        if self.Difficulty < 3 then
            SaveGame:Save(0, "Quick")
        else
            CONSOLE_AddMessage(Languages.Texts[684])
        end
    end
    if INP.UIAction(UIActions.QuickLoad) then
        local slot = SaveGame:FindLastSave("Quick")
        if slot then
            SaveGame:Load(slot)
        end
    end
    if SaveRequest then
        if Hud._showCheckPointInfo == false then
            Hud._showCheckPointInfo = true
        else
            SaveGame:Save(SaveRequest.Slot, SaveRequest.SType, nil, SaveRequest.Demo)
            Hud._showCheckPointInfo = false
        end
    end
    if LoadRequest then
        local demoname
        if LoadRequest.Demo then
            demoname = LoadRequest.Slot
        end
        SaveGame:Load(LoadRequest.Slot, LoadRequest.LoadOnly, LoadRequest.Demo)
        if demoname then
            CONSOLE.DemoPlay(demoname)
        end
    end
    if StringToDo then
        dostring(StringToDo)
        StringToDo = nil
    end
    if not IsFinalBuild() then
        if Editor.Enabled and INP.Key(Keys.F) == 1 then
            Game:SwitchPlayerToPhysics()
        end
        if INP.Key(Keys.F3) == 1 then
            local a = INP.GetTimeMultiplier()
            INP.SetTimeMultiplier(a * 0.5)
        end
        if INP.Key(Keys.F4) == 1 then
            local a = INP.GetTimeMultiplier()
            INP.SetTimeMultiplier(a * 2)
        end
        if INP.Key(Keys.K9) == 1 then
            self:EnableDemon(true)
        end
        if INP.Key(Keys.K0) == 1 then
            self:EnableDemon(false)
        end
        if INP.Key(Keys.G) == 1 and INP.Key(Keys.RightShift) == 2 then
            if Hud.Enabled then
                Hud.Enabled = false
            else
                Hud.Enabled = true
            end
        end
        if INP.Key(Keys.V) == 1 and INP.Key(Keys.RightShift) == 2 then
            local count = 0
            for i, v in Actors, nil do
                if 0 < v.Health and v._AIBrain and v.OnDamage then
                    v:OnDamage(9999, nil, AttackTypes.Demon)
                    count = count + 1
                end
            end
            Game:Print("----- KILLED " .. count .. " MONSTERS -------")
        end
        if debug then
            self.POS = 0
            if INP.Key(Keys.R) == 1 then
                if self.freezeUpdate then
                    Game:Print("unfreeze logic")
                    self.freezeUpdate = nil
                else
                    Game:Print("freeze logic")
                    self.freezeUpdate = 1
                end
            end
        end
    end
    if Game.GMode ~= GModes.SingleGame then
        if INP.UIAction(UIActions.SayToAll) then
            CONSOLE.Activate(not CONSOLE.IsActive(), ConsoleMode.SayAll)
        end
        if INP.UIAction(UIActions.SayToTeam) then
            CONSOLE.Activate(not CONSOLE.IsActive(), ConsoleMode.SayTeam)
        end
        if 0 < Game._voteTimeLeft then
            Game._voteTimeLeft = Game._voteTimeLeft - delta
            if 0 >= Game._voteTimeLeft then
                Game._voteTimeLeft = 0
                Game:CheckVotingStatus()
            end
        end
    end
    if INP.UIAction(UIActions.Screenshot) then
        Game:Print("screenshot saved in Data/Screenshots")
        INP.TakeScreenshot()
    end
    if debugGC then
        collectgarbage(0)
    end
    luaProfiler_LOGIC5()
    OMX, OMY = MX, MY
end

function Game:Update()
    if Player and Player.SoulsCount >= self.Demon_Counter and not Lucifer_001 then
        self.Demon_Counter = self.Demon_HowManyCorpses
        Player.SoulsCount = 0
        self:EnableDemon(true)
        Game.DemonMorphCount = Game.DemonMorphCount + 1
    elseif
        Game.FlashDemon and Player and Player.SoulsCount >= Game.Demon_Counter - 2 and
            Player.SoulsCount < Game.Demon_Counter
     then
        Game:EnableDemon(true, 0.7, nil, nil, 0.2, true)
        Game.FlashDemon = false
    end
end

Game.TPPView = 0

function Game:Tick2(delta)
    if Player and self.CameraFromPlayer and MOUSE.IsLocked() then
        Game:UpdateViewFromPlayer()
        if self.TPP and Player.ForwardVector then
            local x, y, z = ENTITY.GetPosition(Player._Entity)
            local fv = Player.ForwardVector
            if Game.TPPView == 0 then
                CAM.SetPos(x - fv.X * 5, y - fv.Y * 5, z - fv.Z * 5)
            else
                CAM.SetPos(x + fv.X * 5, y + fv.Y * 5, z + fv.Z * 5)
            end
            CAM.LookAt(x, y + 1.5, z)
        end
    end
    if self.Active then
        GObjects:Tick2(delta)
    end
    if Player and MOUSE.IsLocked() then
        Player:ClientTick2(delta)
    end
    SCREEN_WIDTH, SCREEN_HEIGHT = R3D.ScreenSize()
    self:ExecMsgQueue()
end

function Game:Render(delta)
    if Cfg.DisableHud then
        return
    end
    if IsDedicatedServer() then
        return
    end
    if self.WaitForServer then
        return
    end
    GObjects:Render(delta)
end

function Game:PostRender(delta)
    if IsDedicatedServer() then
        return
    end
    if self.WaitForServer then
        return
    end
    if Cfg.DisableHud then
        return
    end
    if MPCfg.GameState == GameStates.WarmUp then
        local w, h = R3D.ScreenSize()
        if Cfg.HUD_HudStyle == 0 then
            wufontsizes = 26
            wufontcolortxt = {
                230,
                161,
                97
            }
            wufonttypo = "timesbd"
        else
            wufontsizes = 26
            wufontcolortxt = {
                200,
                200,
                200
            }
            wufonttypo = "Impact"
        end
        HUD.SetFont(wufonttypo, wufontsizes)
        HUD.PrintXY(
            (w - HUD.GetTextWidth("Warm Up")) / 2 + 1,
            601 * h / 768,
            "Warm Up",
            wufonttypo,
            15,
            15,
            15,
            wufontsizes
        )
        HUD.PrintXY(
            (w - HUD.GetTextWidth("Warm Up")) / 2,
            600 * h / 768,
            "Warm Up",
            wufonttypo,
            wufontcolortxt[1],
            wufontcolortxt[2],
            wufontcolortxt[3],
            wufontsizes
        )
    end
    GObjects:PostRender(delta)
    if debug and debugMarek then
        Hud:Render(delta)
        Editor:Render(delta)
        if self.TICKOBJCNTa then
            HUD.PrintXY(
                0,
                43,
                "TICKOBJCNT = " ..
                    self.TICKOBJCNTi + self.TICKOBJCNTr + self.TICKOBJCNTa ..
                        ", items = " ..
                            self.TICKOBJCNTi .. " actors = " .. self.TICKOBJCNTa .. " other = " .. self.TICKOBJCNTr
            )
        end
        if self.UPDATEOBJCNTa then
            HUD.PrintXY(
                0,
                82,
                "UPDATEOBJCNT = " ..
                    self.UPDATEOBJCNTi + self.UPDATEOBJCNTa + self.UPDATEOBJCNTr ..
                        ", items = " ..
                            self.UPDATEOBJCNTi ..
                                " actors = " .. self.UPDATEOBJCNTa .. " other = " .. self.UPDATEOBJCNTr
            )
        end
    elseif MOUSE.IsLocked() then
        if Player then
            Player:ClientRender(delta)
        end
        Hud:Render(delta)
    else
        Editor:Render(delta)
    end
    if ShowWorkInProgress then
        local w, h = R3D.ScreenSize()
        local mw, mh = MATERIAL.Size(self.WorkInProgressImg)
        HUD.SetFont("tahomabd", 16)
        local tw = HUD.GetTextWidth("WORK IN PROGRESS")
        HUD.PrintXY(w - tw - 9, 7, "WORK IN PROGRESS", "tahomabd", 0, 0, 0, 16)
        HUD.PrintXY(w - tw - 10, 6, "WORK IN PROGRESS", "tahomabd", 160, 160, 160, 16)
    end
    if self.GCIconsDraw == true and 0 < self.GCCount then
        local w, h = R3D.ScreenSize()
        local mw = 55 * w / 1024
        local mh = 92 * h / 768
        local width = self.GCCount * 60 * w / 1024
        local left = 512 * w / 1024 - width / 2
        HUD.DrawQuadRGBA(
            self.GCIcons[1],
            left,
            h - 96 * h / 768,
            mw,
            mh,
            self.GCIconsColor[1],
            self.GCIconsColor[2],
            self.GCIconsColor[3],
            180
        )
        if self.GCIcons[2] then
            HUD.DrawQuadRGBA(
                self.GCIcons[2],
                left + width / self.GCCount,
                h - 96 * h / 768,
                mw,
                mh,
                self.GCIconsColor[1],
                self.GCIconsColor[2],
                self.GCIconsColor[3],
                180
            )
        end
        if self.GCIcons[3] then
            HUD.DrawQuadRGBA(
                self.GCIcons[3],
                left + width * 2 / self.GCCount,
                h - 96 * h / 768,
                mw,
                mh,
                self.GCIconsColor[1],
                self.GCIconsColor[2],
                self.GCIconsColor[3],
                180
            )
        end
    end
end

function Game:Print(str)
    if IsFinalBuild() then
        return
    end
    EDITOR.OutputText(string.format("%.2f", self.currentTime / 30) .. ": " .. str)
end

function Game:SaveLevel(name, dontDeleteDirectory)
    FS.CreateDirectory("../Data/Levels")
    local path = "../Data/Levels/" .. name .. "/"
    FS.CreateDirectory(path)
    FS.CreateDirectory(path .. "Templates")
    if not dontDeleteDirectory then
        FS.DeleteFiles(path)
    end
    getfenv()[Lev._Name] = nil
    getfenv()[name] = Lev
    Lev._Name = name
    SaveObject(path .. Lev._Name .. "." .. Lev._Class, Lev)
    for i, o in GObjects.Elements, nil do
        if o._Class ~= "CPlayer" then
            FS.CreateDirectory(path .. o._Class)
            SaveObject(path .. o._Class .. "/" .. o._Name .. "." .. o._Class, o)
        end
    end
    self:ResetTimer()
end

function Game:IsFxObject(ext)
    if
        ext == "CBillboard" or ext == "CLight" or ext == "CParticleFX" or ext == "CEnvironment" or ext == "CSound" or
            ext == "CAcousticEnv"
     then
        return true
    end
    return false
end

function Game:LoadObjectsDirectory(path)
    local dirs = FS.FindFiles(path .. "C*", 0, 1)
    for i = 1, table.getn(dirs) do
        self:LoadObjectsDirectory(path .. dirs[i] .. "/")
    end
    local files = FS.FindFiles(path .. "*.C*", 1, 0)
    for i = 1, table.getn(files) do
        local fname, ext = ParseFileName(files[i])
        if string.len(fname) <= 2 then
            MsgBox("Warning!!! Object's name is too short: " .. files[i])
        end
        if ext ~= "CLevel" then
            local fx = self:IsFxObject(ext)
            local o = LoadObj(path .. files[i])
            if o and Game.GMode == GModes.DedicatedServer and fx then
                o = nil
            end
            if
                o and Game.GMode == GModes.MultiplayerClient and o.BaseObj ~= "Teleport.CBox" and o._Class ~= "CArea" and
                    not fx and
                    not o.VisibleOnMPClient
             then
                o._DeleteAfterCache = true
            end
            if o and Game:IsServer() then
                if Cfg.GameMode == "Clan Arena" and o.RespawnTime then
                    o = nil
                end
                if Cfg.GameMode == "Instagib" and o.RespawnTime then
                    o = nil
                end
                if Cfg.GameMode == "ICTF" and o.RespawnTime and o.BaseObj ~= "Flag.CItem" then
                    o = nil
                end
                if Cfg.GameMode == "Voosh" and o.DisabledInVoosh then
                    o = nil
                end
                if o and Cfg.GameMode ~= "The Light Bearer" and o.LightBearerOnly then
                    o = nil
                end
                if o and not Cfg.Powerups and o.PowerUp then
                    o = nil
                end
            end
            if o then
                if o.OnInitTemplate then
                    o:OnInitTemplate()
                end
                GObjects:Add(fname, o)
            end
            PMENU.LoadingProgress()
        end
    end
end

function Game:SetupMapEntities(path)
    local files = FS.FindFiles(path .. "MapEntities/*.E*", 1, 0)
    for i = 1, table.getn(files) do
        local fname, ext = ParseFileName(files[i])
        o = Clone(getfenv()[ext])
        DoFile(path .. "MapEntities/" .. files[i])
        o._Entity = WORLD.FindEntityByName(fname)
        o:Apply()
        o = nil
    end
end

function Game:CountObjectsDirectory(path)
    local count = 0
    local dirs = FS.FindFiles(path .. "C*", 0, 1)
    for i = 1, table.getn(dirs) do
        count = count + self:CountObjectsDirectory(path .. dirs[i] .. "/")
    end
    local files = FS.FindFiles(path .. "*.C*", 1, 0)
    for i = 1, table.getn(files) do
        local fname, ext = ParseFileName(files[i])
        if ext ~= "CLevel" then
            local fx = self:IsFxObject(ext)
            if
                Game.GMode == GModes.SingleGame or Game.GMode == GModes.MultiplayerServer or
                    Game.GMode == GModes.MultiplayerClient and fx or
                    Game.GMode == GModes.DedicatedServer and not fx
             then
                count = count + 1
            end
        end
    end
    return count
end

function Game:CountTemplates(path)
    local count = 0
    local files = FS.FindFiles(path .. "/*.C*", 1, 0)
    count = count + table.getn(files)
    local dirs = FS.FindFiles(path .. "/*.*", 0, 1)
    for i = 1, table.getn(dirs) do
        count = count + Game:CountTemplates(path .. "/" .. dirs[i])
    end
    return count
end

function Game:CountLevelElems(name)
    local count = 1
    local path = "../Data/Levels/" .. name .. "/"
    local files = FS.FindFiles(path .. "*.CLevel", 1, 0)
    if 0 >= table.getn(files) then
        return 0
    end
    count = count + self:CountTemplates("../Data/Levels/" .. name .. "/Templates")
    count = count + self:CountObjectsDirectory(path)
    return count
end

function Game_GetLevelMapSize(name)
    local path = "../Data/Levels/" .. name .. "/"
    o = Clone(CLevel)
    o.Map = ""
    DoFile(path .. name .. ".CLevel", false)
    return FS.File_GetSize("../Data/Maps/" .. o.Map)
end

function Game:LoadLevel(name)
    local path = "../Data/Levels/" .. name .. "/"
    local files = FS.FindFiles(path .. "*.CLevel", 1, 0)
    if 0 >= table.getn(files) then
        CONSOLE_AddMessage("Level '" .. name .. "' not found!!!")
        local maplist = "Available maps: "
        for file in files, nil do
            maplist = maplist .. file .. ", "
        end
        CONSOLE_AddMessage(maplist)
        return 0
    end
    if not Game:IsServer() then
        NET.SendVariable(ServerID, "CLIENTID", NET.GetClientID() .. ":" .. "MOD13")
    end
    self.Active = false
    self._numberOfDynLigths = 0
    local currLevel, currChapter = Levels_GetLevelByDir(name)
    if currLevel then
        self.CurrLevel = currLevel
        self.CurrChapter = currChapter
    else
        self.CurrLevel = 0
        self.CurrChapter = 0
    end
    if self.GMode == GModes.SingleGame then
        MPCfg.GameMode = ""
    end
    PMENU.ActivateLoadingScreen(false)
    PMENU.ActivateLoadingScreen(true, self.CurrLevel, Levels_GetSketchByDir(name), name)
    PMENU.SetLoadingScreenOverall(Game:CountLevelElems(name), 10)
    local files = FS.FindFiles(path .. "*.CLevel", 1, 0)
    if 0 < table.getn(files) then
        local fname, ext = ParseFileName(files[1])
        self:NewLevel(fname, "", "", 3)
        Lev = LoadObj(path .. files[1])
        PMENU.LoadingProgress()
        getfenv()[fname] = Lev
        PreloadTemplates("../Data/Levels/" .. Lev._Name .. "/Templates", true)
        self:LoadObjectsDirectory(path, mpmode)
    else
        self:NewLevel(name, "", "", 3)
    end
    WORLD.LateVBsBegin()
    Lev:Apply()
    if not PrecacheDisabled then
        Cache:PrecacheLevel(name)
    end
    if string.find(name, "C6L", 1, true) == 1 then
        Lev.AddOn = true
    end
    if Lev.AddOn then
        Game.AddOn = true
    else
        Game.AddOn = false
    end
    if Game.AddOn then
        Levels = LevelsAddOn
    else
        Levels = LevelsMain
    end
    for i, o in GObjects.Elements, nil do
        if o._DeleteAfterCache then
            GObjects:ToKill(o)
        end
    end
    GObjects:DeleteKilled()
    GObjects:Apply()
    WORLD.LateVBsEnd()
    self:SetupMapEntities(path)
    PMENU.ActivateLoadingScreen(false)
    GObjects:AfterLoad()
    Game:ApplySettings()
    if not IsDedicatedServer() then
        EDITOR.OnMsg("SelectObject", Lev._Name)
        Editor.SelObj = nil
        Editor.ToSelObj = nil
        Hud.Enabled = true
    end
    WORLD.UpdateAllEntities()
    if 0 < self.Difficulty then
        Game:EnableSilverCards()
    end
    self:CountMoneyAndActorsOnLevel()
    Game:ResetGoldenCardsVars()
    self.LevelTime = 0
    self.LevelStarted = true
    if self.GMode == GModes.SingleGame then
        PHYSICS.WarmUp(10)
        self.GameInProgress = true
    else
        self.GameInProgress = false
    end
    self.GoldenCardsUseCount = 0
    PX, PY, PZ = Lev.Pos.X, Lev.Pos.Y, Lev.Pos.Z
    AddObject(Templates["FadeInOut.CProcess"]:New(true, 2))
    Lev:StartMusic()
    for i, o in GObjects.Elements, nil do
        if o._Class == "CSound" then
            o:Play(true)
        end
    end
    if not Editor.Enabled and Game.GMode == GModes.SingleGame then
        PlaySound2D("misc/startlevel")
    end
    self:ResetTimer()
    INP.Reset()
    if self.GMode == GModes.MultiplayerClient then
        self.WaitForServer = true
        WORLD.SetGameVisible(false)
    end
    if Game.GMode == GModes.SingleGame then
        WORLD.SetGameVisible(true)
    end
    Game._BlockedPlay = nil
    if Game.GMode == GModes.SingleGame then
        WORLD.ApplyTweaks()
    end
    Game:Print(">> Level '" .. name .. "' loaded!")
    R3D.KeepDecals(Game.Cheat_KeepDecals)
    if XBOX then
        TemplatesPaths = {}
    end
end

function Game:ResetTimer()
    INP.ResetTimer()
end

MsgQueue = {}

function Game:ExecMsgQueue()
    for i, o in MsgQueue, nil do
        local msg = o[1]
        local arg = o[2]
        if msg == "COLLISION_WITH_OTHER_ENTITY" then
            local obj = EntityToObject[arg[1]]
            if obj then
                if not obj._ToKill and obj.OnCollision then
                    obj:OnCollision(
                        arg[2],
                        arg[3],
                        arg[4],
                        arg[5],
                        arg[6],
                        arg[7],
                        arg[8],
                        arg[9],
                        arg[10],
                        arg[11],
                        arg[12],
                        arg[13],
                        arg[14],
                        arg[15],
                        arg[16]
                    )
                end
            else
                local e_other = arg[8]
                if Lev.OnCollision and arg[15] > arg[16] then
                    Lev:OnCollision(arg[2], arg[3], arg[4], e_other, arg[9], arg[1])
                end
            end
        end
        if msg == "EXPLODEMESH" and Lev.OnExplodeMesh then
            Lev:OnExplodeMesh(arg[1], arg[2], arg[3], arg[4])
        end
        if msg == "IN_DEATH_ZONE" then
            local entity = arg[1]
            ENTITY.EnableDeathZoneTest(entity, false)
            local obj = EntityToObject[entity]
            if obj and obj.InDeathZone then
                obj:InDeathZone(arg[2], arg[3], arg[4], arg[5])
            end
        end
        if msg == "BROKEN_GLASS" then
            Game:OnBrokenGlass(arg[1], arg[2], arg[3], arg[4])
        end
        if msg == "REGION_ENTERED" then
            local obj = EntityToObject[arg[1]]
            if obj and obj.OnEnter then
                obj:OnEnter(arg[2])
            end
        end
        if msg == "REGION_LEFT" then
        end
        if msg == "PLAYER_HIT_GROUND" then
            local obj = EntityToObject[arg[1]]
            if obj and obj.OnHitGround then
                obj:OnHitGround(arg[2])
            end
        end
        if msg == "BREAKABLE_BROKEN" then
            local obj = EntityToObject[arg[1]]
            if obj and obj.OnBreak then
                obj:OnBreak()
                obj.OnBreak = nil
            end
        end
    end
    MsgQueue = {}
end

function Game_GetMsg(msg, ...)
    if Game.GMode == GModes.MultiplayerClient then
        if msg == "COLLISION_WITH_OTHER_ENTITY" then
            local tmp = EntityToObject[arg[1]]
            if not tmp then
                local str = ENTITY.GetSynchroString(arg[1])
                if str ~= "" then
                    tmp = FindObj(str)
                end
            end
            if tmp and tmp.Client_OnCollision then
                x1, y1, z1, v1 = ENTITY.GetVelocity(arg[1])
                x, y, z, v2 = ENTITY.GetVelocity(arg[8])
                arg[15] = v1
                arg[16] = v2
                x1, y1, z1 = x1 - x, y1 - y, z1 - z
                arg[14] = math.sqrt(x1 * x1 + y1 * y1 + z1 * z1)
                arg[11], arg[12], arg[13] = x1, y1, z1
                tmp:Client_OnCollision(
                    arg[2],
                    arg[3],
                    arg[4],
                    arg[5],
                    arg[6],
                    arg[7],
                    arg[8],
                    arg[9],
                    arg[10],
                    arg[11],
                    arg[12],
                    arg[13],
                    arg[14],
                    arg[15],
                    arg[16]
                )
            end
        elseif msg == "ENTITY_CREATE" then
            local str = Text2Tab(arg[2], ":")
            local tmp = FindObj(str[1])
            if tmp and tmp.Client_OnCreateEntity then
                tmp:Client_OnCreateEntity(arg[1], str[2])
            end
        elseif msg == "ENTITY_DELETE" then
            local str = Text2Tab(arg[2], ":")
            local tmp = FindObj(str[1])
            if tmp and tmp.Client_OnDeleteEntity then
                tmp:Client_OnDeleteEntity(arg[1], str[2])
            end
            local o = EntityToObject[arg[1]]
            if o then
                EntityToObject[arg[1]] = nil
            end
        elseif msg == "PO_CREATE" then
            local str = Text2Tab(arg[3], ":")
            local tmp = FindObj(str[1])
            if tmp and tmp.Client_OnCreatePO then
                tmp:Client_OnCreatePO(arg[1], arg[2], str[2])
            end
        elseif msg == "REGION_ENTERED" then
            local obj = EntityToObject[arg[1]]
            if obj and obj.OnEnter then
                obj:OnEnter(arg[2])
            end
        end
        return
    end
    if not Game.Active then
        return
    end
    if msg == "EXPLOSION" then
        local obj = EntityToObject[arg[1]]
        if obj and not obj._ToKill and obj.Health and (not obj._Exploded or obj._Exploded ~= arg[5]) then
            obj._Exploded = arg[5]
            local damage = arg[8]
            if
                0 < damage and obj.OnDamage and
                    (not obj._GotInstantExplosion or Game.Counter ~= obj._GotInstantExplosion)
             then
                local killer
                if arg[6] then
                    if Game.GMode == GModes.SingleGame then
                        killer = EntityToObject[arg[6]]
                    else
                        killer = Game:FindPlayerByClientID(arg[6])
                    end
                end
                local weapon_type = arg[7]
                if obj ~= Player and killer ~= Player and weapon_type == AttackTypes.StickyBomb then
                    damage = damage * 0.5
                end
                obj:OnDamage(damage, killer, weapon_type, arg[2], arg[3], arg[4], nil, nil, nil, nil, msg)
            end
        end
        return
    end
    if msg == "COLLISION_WITH_OTHER_ENTITY" then
        local x1, y1, z1, v1, x, y, z, v2
        if Game.GMode == GModes.SingleGame then
            x1, y1, z1, v1 = PHYSICS.GetHavokBodyVelocity(arg[9])
            x, y, z, v2 = PHYSICS.GetHavokBodyVelocity(arg[10])
        else
            x1, y1, z1, v1 = ENTITY.GetVelocity(arg[1])
            x, y, z, v2 = ENTITY.GetVelocity(arg[8])
        end
        arg[15] = v1
        arg[16] = v2
        x1, y1, z1 = x1 - x, y1 - y, z1 - z
        arg[14] = math.sqrt(x1 * x1 + y1 * y1 + z1 * z1)
        arg[11], arg[12], arg[13] = x1, y1, z1
    end
    table.insert(MsgQueue, {msg, arg})
end

function Game:OnPlay(firstTime)
    if Game._BlockedPlay then
        return
    end
    if not Player and self.GMode == GModes.SingleGame then
        self:CreatePlayerSP()
    end
    self.Active = true
    if firstTime then
        if Player and self.GMode == GModes.SingleGame then
            local tml = "PlayerLight.CLight"
            if Lev.PlayerLightTemplate then
                tml = Lev.PlayerLightTemplate
            end
            Lev._r_FlashLight = AddObject(tml, nil, nil, nil, true)
        end
        self._EarthQuakeProc = AddObject("TStomp.CProcess", nil, nil, nil, true)
    end
    if Lev.OnPlay then
        CLevel.OnPlay(Lev, firstTime)
        Lev:OnPlay(firstTime)
        if Player and Player.Health < 999 and self.InitialHealth ~= 100 then
            Player.Health = self.InitialHealth
        end
        if Player and self.InitialAmmo ~= 100 then
            Player.Ammo = Clone(CPlayer.s_SubClass._666Ammo)
        end
    end
    if firstTime then
        if Lev.Actions then
            Lev:LaunchAction(Lev.Actions.OnPlay)
        end
        table.foreachi(
            GObjects.Elements,
            function(i, v)
                if v and v.Actions and v.Actions.OnPlay then
                    v:LaunchAction(v.Actions.OnPlay)
                end
            end
        )
    end
    table.foreachi(
        GObjects.Elements,
        function(i, v)
            if v and v.OnPlay then
                v:OnPlay(firstTime)
            end
        end
    )
    local clearWeapons = false
    if not Game.PlayerEnabledWeapons and Player then
        Game.PlayerEnabledWeapons = Player.EnabledWeapons
        clearWeapons = true
    end
    LevelStartState = {}
    LevelStartState = self:GetCurrentLevelState()
    if LevelStartState.PlayerEnabledWeapons then
        LevelStartState.PlayerEnabledWeapons[10] = nil
    end
    if clearWeapons then
        Game.PlayerEnabledWeapons = nil
    end
    if firstTime then
        SaveGame:Save(0, "StartLevel")
    end
end

function Game:GetCurrentLevelState()
    local new = {}
    new.PlayerEnabledWeapons = Clone(Game.PlayerEnabledWeapons)
    new.CardsAvailable = Clone(Game.CardsAvailable)
    new.CardsSelected = Clone(Game.CardsSelected)
    new.PlayerMoney = Game.PlayerMoney
    new.LevelStarted = Game.LevelStarted
    new.GameInProgress = Game.GameInProgress
    new.LevelsStats = Clone(Game.LevelsStats)
    new.CurrLevel = Game.CurrLevel
    new.CurrChapter = Game.CurrChapter
    new.Difficulty = Game.Difficulty
    new.Timestamp = os.date("%Y%m%d%H%M%S")
    new.HudEnabled = Hud.Enabled
    new.AddOn = Game.AddOn
    return new
end

function Game:SetCurrentLevelState(state)
    Game.PlayerEnabledWeapons = {}
    Game.CardsAvailable = {}
    Game.CardsSelected = {}
    Game.PlayerEnabledWeapons = Clone(state.PlayerEnabledWeapons)
    Game.CardsAvailable = Clone(state.CardsAvailable)
    Game.CardsSelected = Clone(state.CardsSelected)
    Game.PlayerMoney = state.PlayerMoney
    Game.LevelStarted = state.LevelStarted
    Game.GameInProgress = state.GameInProgress
    Game.LevelsStats = Clone(state.LevelsStats)
    Game.CurrLevel = state.CurrLevel
    Game.CurrChapter = state.CurrChapter
    Game.Difficulty = state.Difficulty
    Hud.Enabled = state.HudEnabled
    Game.AddOn = state.AddOn
end

function Game:CountMoneyAndActorsOnLevel()
    local toLaunchCount = 0
    local actors = 0
    for i, v in GObjects.Elements, nil do
        if v._Class == "CSpawnPoint" then
            if not Templates[v.SpawnTemplate] then
                MsgBox("Template: " .. v.SpawnTemplate .. " not exist.")
            elseif
                not Templates[v.SpawnTemplate].NotCountable and not v.NotCountable and
                    Templates[v.SpawnTemplate]._Class == "CActor"
             then
                self.TotalActors = self.TotalActors + v.GroupCount * v.GroupSize
                if Templates[v.SpawnTemplate].throwHeart then
                    self.TotalSouls = self.TotalSouls + v.GroupCount * v.GroupSize
                end
            end
        end
        if v._Class == "CActor" and not v.NotCountable and 0 < v.Health then
            self.TotalActors = self.TotalActors + 1
            actors = actors + 1
            if v.throwHeart then
                self.TotalSouls = self.TotalSouls + 1
            end
        end
        if v.BaseObj == "SecretArea.CBox" then
            self.TotalSecrets = self.TotalSecrets + 1
        elseif not IsFinalBuild() and v._Class == "CBox" then
            if v.ToLaunch then
                for o, w in v.ToLaunch, nil do
                    local t = rawget(getfenv(), w)
                    if t then
                        local t2 = Templates[t.SpawnTemplate]
                        if t2 and not t2.NotCountable and t.GroupCount then
                            toLaunchCount = toLaunchCount + t.GroupCount * t.GroupSize
                        end
                    end
                end
            end
            if v.Actions and type(v.Actions) == "table" then
                for ii, vv in v.Actions, nil do
                    if type(vv) == "table" then
                        for o, w in vv, nil do
                            local name = string.gsub(w, "Launch:", "")
                            local t = rawget(getfenv(), name)
                            if t then
                                local t2 = Templates[t.SpawnTemplate]
                                if t2 and not t2.NotCountable and t.GroupCount then
                                    toLaunchCount = toLaunchCount + t.GroupCount * t.GroupSize
                                end
                            end
                        end
                    end
                end
            end
        end
        if v._Class == "CItem" then
            if v.isHolyItem then
                self.TotalHolyItems = self.TotalHolyItems + 1
                self.TotalMoney = self.TotalMoney + v.Value * self.TreasureFoundFactor
            elseif v.Value then
                self.TotalMoney = self.TotalMoney + v.Value * self.TreasureFoundFactor
            elseif v.AmmoAdd or v.BaseObj == "MegaPack.CItem" then
                self.TotalAmmo = self.TotalAmmo + 1
            elseif v.ArmorAdd then
                self.TotalArmor = self.TotalArmor + 1
            elseif v.DestroyPack then
                if not v.NotCountable then
                    self.TotalDestroyed = self.TotalDestroyed + 1
                end
                local amount = 0
                if v.Destroy and v.Destroy.Treasures then
                    for j, w in v.Destroy.Treasures, nil do
                        if w[2] == "g" then
                            amount = amount + 2 * w[1]
                        else
                            if w[2] ~= "s" then
                                Game:Print(
                                    "WARNING: " ..
                                        v._Name ..
                                            " gold type: " ..
                                                w[2] .. ", adding: " .. w[1] .. ". Overall gold count may be wrong."
                                )
                            end
                            amount = amount + 1 * w[1]
                        end
                        self.TotalMoney = self.TotalMoney + amount * self.TreasureFoundFactor
                    end
                end
            end
        end
    end
end

function Game:ReloadTemplates()
end

function Game:OnBrokenGlass(x, y, z, frm)
    if not frm or self._lastfrm ~= frm then
        PlaySound3D("impacts/glass_crack", x, y, z, 100, 150)
        PlaySound3D("impacts/glass_pause_" .. math.random(1, 3), x, y, z, 100, 150)
        AddPFX("FX_BrokenGlass", 1, Vector:New(x, y, z))
        self._lastfrm = frm
    end
end

function Game:SwitchPlayerToPhysics(onlyEnable)
    if not Player and self.GMode == GModes.SingleGame then
        self:CreatePlayerSP()
    end
    if not Player then
        MOUSE.Lock(not MOUSE.IsLocked())
        return
    end
    local po = ENTITY.PO_IsEnabled(Player._Entity)
    if onlyEnable and po then
        return
    end
    if not po and not Player._died then
        local x, y, z = CAM.GetPos()
        ENTITY.PO_SetPawnHeadPos(Player._Entity, x, y, z)
        ENTITY.SetVelocity(Player._Entity, 0, 0, 0)
        if Player:GetCurWeapon() then
            WORLD.AddEntity(Player:GetCurWeapon()._Entity)
        end
        Player.Pos:Set(ENTITY.GetPosition(Player._Entity))
        ENTITY.EnableDeathZoneTest(Player._Entity, true)
    else
        ENTITY.EnableDeathZoneTest(Player._Entity, false)
        PX, PY, PZ = 0, -400, 0
        ENTITY.SetPosition(Player._Entity, 0, -400, 0)
        if Player:GetCurWeapon() then
            WORLD.RemoveEntity(Player:GetCurWeapon()._Entity)
        end
    end
    ENTITY.PO_Enable(Player._Entity, not po)
    if R3D.IsFullscreen() then
        INP.Reinit(true)
    else
        INP.Reinit(not po)
    end
    MOUSE.Lock(not po)
end

function Game_Tick(delta)
    Game:Tick(delta)
end

function Game_Tick2(delta)
    Game:Tick2(delta)
    if Player then
        ENTITY.RemoveRagdollFromIntersectionSolver(Player._Entity)
    end
end

function Game_Tick3(delta)
    if Game.Active then
        GObjects:Tick3(delta)
    end
end

function Game_Render(delta)
    Game:Render(delta)
end

function Game_PostRender(delta)
    Game:PostRender(delta)
    if Player then
        ENTITY.AddToIntersectionSolver(Player._Entity)
    end
end

CL = 0

function Game_GC()
    if Game.GMode == GModes.SingleGame then
        collectgarbage(30000)
    elseif Game.GMode == GModes.DedicatedServer then
        collectgarbage(30000)
    else
        collectgarbage(15000)
    end
end

function Game:SetConstant()
    collectgarbage(0)
    table.setconstant(TXT)
    table.setconstant(Keys)
    table.setconstant(Actions)
    table.setconstant(MenuItemTypes)
    table.setconstant(AttackTypes)
    table.setconstant(Color)
    table.setconstant(Quaternion)
    table.setconstant(Vector)
    table.setconstant(VectorA)
    table.setconstant(CLight)
    table.setconstant(CBillboard)
    table.setconstant(CSound)
    if IsDedicatedServer() then
        table.setconstant(Editor)
        table.setconstant(EWayPoints)
        table.setconstant(EFloors)
        table.setconstant(NewGameMenu)
        table.setconstant(GameMenu)
        table.setconstant(MultiplayerMenu)
        table.setconstant(InternetGameMenu)
        table.setconstant(LANGameMenu)
        table.setconstant(FavoritesGameMenu)
        table.setconstant(StartGameMenu)
        table.setconstant(CreateServerMenu)
        table.setconstant(VideoOptions)
        table.setconstant(AdvancedVideoOptions)
        table.setconstant(SoundOptions)
        table.setconstant(HUDConfig)
        table.setconstant(ControlsConfig)
        table.setconstant(WeaponsConfig)
        table.setconstant(PlayerOptions)
        table.setconstant(LoadGameMenu)
        table.setconstant(SaveGameMenu)
        table.setconstant(DeleteGameMenu)
        table.setconstant(LoadSaveMenu)
    end
end

function Game:ResetSilverCardsVars()
    self.GoldenCardsUseLeft = 1
    self.InitialHealth = 100
    self.InitialAmmo = 100
    self.HealthCapacity = 100
    self.Demon_HowManyCorpses = 66
    self.PlayerRegenerateWhenDying = false
    self.StealHealth = false
    self.AmmoFoundFactor = 1
    self.TreasureFoundFactor = 1
    self.SoulHealthFactor = 1
    self.SoulStayFactor = 1
    self.SoulCatchDistance = 0
    self.FearCard = false
    self.HealthRegen = false
    self.ArmorRegen = false
end

function Game:EnableSilverCards()
    self:ResetSilverCardsVars()
    local cards = MagicCards.permCards
    if Game.CardsSelected[cards[1].index] then
        self.SoulCatchDistance = 10
    end
    if Game.CardsSelected[cards[2].index] then
        self.SoulStayFactor = 1.5
    end
    if Game.CardsSelected[cards[3].index] then
        self.SoulHealthFactor = 2
    end
    if Game.CardsSelected[cards[4].index] then
        self.Demon_HowManyCorpses = 50
        self.Demon_Counter = self.Demon_HowManyCorpses
    end
    if Game.CardsSelected[cards[5].index] then
        self.InitialHealth = 150
    end
    if Game.CardsSelected[cards[6].index] then
        self.HealthCapacity = 150
        self.InitialHealth = 150
    end
    if Game.CardsSelected[cards[7].index] then
        self.AmmoFoundFactor = 2
    end
    if Game.CardsSelected[cards[8].index] then
        self.TreasureFoundFactor = 2
    end
    if Game.CardsSelected[cards[9].index] then
        self.GoldenCardsUseLeft = 2
    end
    if Game.CardsSelected[cards[10].index] then
        self.GoldenCardsUseLeft = 3
    end
    if Game.CardsSelected[cards[11].index] then
    end
    if Game.CardsSelected[cards[12].index] then
        self.PlayerRegenerateWhenDying = true
    end
    if Game.CardsSelected[cards[13].index] then
        self.StealHealth = true
    end
    if Game.CardsSelected[cards[14].index] then
        self.HealthRegen = true
    end
    if Game.CardsSelected[cards[15].index] then
        self.ArmorRegen = true
    end
    if Game.CardsSelected[cards[16].index] then
        self.FearCard = true
    end
    if Game.CardsSelected[cards[17].index] then
        self.InitialAmmo = 666
    end
end

function Game:ResetGoldenCardsVars()
    if self.SpeedFactor ~= 1 then
        local speed, jump = GetPlayerSpeed()
        if Player then
            SetPlayerSpeed(Player.PlayerSpeed, jump * self.SpeedFactor)
        end
    end
    self.GoldenEnableTime = 30
    self.SpeedFactor = 1
    self.ReloadSpeedFactor = 1
    self.DamageFactor = 1
    self.PlayerNoDamage = false
    self.ConfuseEnemies = false
    self.PlayerDamageFactor = 1
    self.BulletTimeSlowdown = 0.25
    if Player and Player.HasWeaponModifier == true and self.WeaponModCard then
        Player.HasWeaponModifier = false
        Player._WeaponModifierCounter = 0
        self.WeaponModCard = false
    end
    self.NoAmmoLoss = false
    self.WeakEnemies = false
end

function Game:EnableGoldenCards()
    self:ResetGoldenCardsVars()
    local cards = MagicCards.timeCards
    local doSth = false
    for i = 1, table.getn(cards) do
        if Game.CardsSelected[cards[i].index] then
            doSth = true
        end
    end
    if doSth == false then
        return
    end
    Game:RestoreGoldenIcons(true)
    if 1 > self.GoldenCardsUseLeft and self.GoldenCardsUseUnlimited == false then
        SOUND.Play2D("misc/card-cannot_use", 100, true)
        self.GoldenEnabledStart = INP.GetTime()
        self.GoldenEnabledLeft = 1
        self.GCIconsColor = {
            255,
            0,
            0
        }
        self.GCIconsDraw = true
        return
    end
    if self.GoldenCardsUseUnlimited == false then
        self.GoldenCardsUseLeft = self.GoldenCardsUseLeft - 1
    end
    self.GoldenCardsUseCount = self.GoldenCardsUseCount + 1
    self.GoldenEnabledStart = INP.GetTime()
    self.GoldenEnabled = true
    self.GCIconsColor = {
        255,
        255,
        255
    }
    self.GCCount = 0
    SOUND.Play2D("specials/bullet-time/bullet-time-start", 100, true)
    if Game.CardsSelected[cards[11].index] then
        self.GoldenEnableTime = self.GoldenEnableTime + 10
    end
    if Game.CardsSelected[cards[12].index] then
    end
    if Game.CardsSelected[cards[1].index] then
        self.SpeedFactor = 1.5
        local speed, jump = GetPlayerSpeed()
        SetPlayerSpeed(Player.PlayerSpeed * self.SpeedFactor, jump / self.SpeedFactor)
    end
    if Game.CardsSelected[cards[2].index] then
        self.ReloadSpeedFactor = 0.5
    end
    if Game.CardsSelected[cards[3].index] then
        self.DamageFactor = 2
    end
    if Game.CardsSelected[cards[4].index] then
        self.DamageFactor = 4
    end
    if Game.CardsSelected[cards[5].index] then
        self.ConfuseEnemies = true
    end
    if Game.CardsSelected[cards[6].index] then
        self.PlayerDamageFactor = 0.5
    end
    if Game.CardsSelected[cards[7].index] then
        self.PlayerNoDamage = true
    end
    if Game.CardsSelected[cards[8].index] then
        self.BulletTimeSlowdown = 1 / 2
        Game:EnableBulletTime(true)
    end
    if Game.CardsSelected[cards[9].index] then
        self.BulletTimeSlowdown = 1 / 4
        Game:EnableBulletTime(true)
    end
    if Game.CardsSelected[cards[10].index] then
        self.BulletTimeSlowdown = 1 / 8
        Game:EnableBulletTime(true)
    end
    if Game.CardsSelected[cards[13].index] and Player.HasWeaponModifier == false then
        Player.HasWeaponModifier = true
        Player._WeaponModifierCounter = 9999999
        self.WeaponModCard = true
    end
    if Game.CardsSelected[cards[14].index] then
        self.NoAmmoLoss = true
    end
    if Game.CardsSelected[cards[15].index] then
        Game.WeakEnemies = true
    end
    if Game.CardsSelected[cards[16].index] then
        Game:EnableDemon(true)
    end
    if Game.CardsSelected[cards[17].index] and Player then
        if Player.Health < Game.HealthCapacity then
            Player.Health = Game.HealthCapacity
        end
        local t
        local atype = Player.ArmorType
        if atype == ArmorTypes.Weak then
            t = Templates["ArmorWeak.CItem"]
        end
        if atype == ArmorTypes.Medium then
            t = Templates["ArmorMedium.CItem"]
        end
        if atype == ArmorTypes.Strong then
            t = Templates["ArmorStrong.CItem"]
        end
        if t then
            Player.Armor = t.ArmorAdd
        end
        CONSOLE_AddMessage(TXT.Cheats.PKHealth)
    end
    self.GoldenEnabledLeft = self.GoldenEnableTime
    Game:RestoreGoldenIcons()
end

function Game:RestoreGoldenIcons(force)
    local cards = MagicCards.timeCards
    self.GCCount = 0
    for i = 1, table.getn(cards) do
        if Game.CardsSelected[cards[i].index] then
            self.GCCount = self.GCCount + 1
            if self.GCIcons[self.GCCount] and force then
                MATERIAL.Release(self.GCIcons[self.GCCount])
                self.GCIcons[self.GCCount] = nil
            end
            if self.GCIcons[self.GCCount] == nil or force then
                self.GCIcons[self.GCCount] =
                    MATERIAL.Create(cards[i].texture, TextureFlags.NoLOD + TextureFlags.NoMipMaps)
            end
        end
    end
end

function Game:EnableBulletTime(enable)
    if Game.GMode ~= GModes.SingleGame then
        return
    end
    if enable then
        if Game.IsDemon or Game.BulletTime then
            return
        end
        if not Game.BulletTime then
            Game.BulletTime = true
            local bt = Tweak.BulletTime
            Game._BTimeProc =
                AddObject(
                Templates["PBulletTimeControler.CProcess"]:New(
                    Game.BulletTimeSlowdown,
                    bt.FadeInTime,
                    self.GoldenEnableTime - bt.FadeInTime - bt.FadeOutTime,
                    bt.FadeOutTime
                ),
                nil,
                nil,
                nil,
                true
            )
        end
    else
        GObjects:ToKill(Game._BTimeProc)
        Game.BulletTime = false
        Game._BTimeProc = nil
    end
end

function Game:EnableDemon(enable, tm, disableBulletTime, bulletTimeSpeed, fadeTime, dontCount)
    if Game.GMode ~= GModes.SingleGame then
        return
    end
    if enable then
        Game:EnableDemon(false)
        if Player and Player._Entity then
            Game.IsDemon = true
            if not dontCount then
                Game.TotalDemonMorphCount = Game.TotalDemonMorphCount + 1
            end
            local dem = GObjects:Add(TempObjName(), CloneTemplate("DemonFX.CProcess"))
            if tm then
                dem.EffectTime = tm
            end
            local fin = 1
            local fout = 0.2
            if not disableBulletTime then
                local d = Templates["DemonFX.CProcess"]
                local s = 0.5
                if bulletTimeSpeed then
                    s = bulletTimeSpeed
                end
                fin = d.FadeInTime
                fout = d.FadeOutTime
                if fadeTime then
                    fin = fadeTime
                    fout = fadeTime
                end
                Game._BTimeProc =
                    AddObject(
                    Templates["PBulletTimeControler.CProcess"]:New(
                        s,
                        fin + fout,
                        dem.EffectTime - (fin + fout) * 2,
                        fin + fout
                    ),
                    nil,
                    nil,
                    nil,
                    true
                )
                Game.BulletTime = true
            end
            dem.prevSlot = Player:GetCurWeaponSlotIndex()
            dem.FadeInTime = fin
            dem.FadeOutTime = fout
            Player.EnabledWeapons[10] = "DemonGun"
            RawCallMethod(CPlayer.WeaponChangeConfirmation, Player._Entity, 10)
            Game._DemonProc = dem
            return dem
        end
    else
        if Player then
            Player.EnabledWeapons[10] = nil
        end
        GObjects:ToKill(Game._DemonProc)
        Game:EnableBulletTime(false)
        Game.IsDemon = false
        Game._DemonProc = nil
    end
end

function Game:UpdateLevelStats()
    if not Lev then
        return
    end
    local lname = string.gsub(Lev._Name, "%s+", "_")
    Game:Print("UpdateLevelStats: " .. lname)
    if not self.LevelsStats[lname] then
        Game:MakeEmptyLevelStats(lname)
    end
    local stats = self.LevelsStats[lname]
    if stats.GameplayTime <= Game.LevelTime then
        stats.GameplayTime = Game.LevelTime
        stats.TimeDiff = Game.Difficulty
    end
    if stats.Difficulty <= Game.Difficulty then
        stats.Difficulty = Game.Difficulty
    end
    if stats.MonstersKilled <= Game.BodyCountTotal then
        stats.MonstersKilled = Game.BodyCountTotal
        stats.MonstersDiff = Game.Difficulty
    end
    if stats.SoulsCollected <= Player.TotalSoulsCount then
        stats.SoulsCollected = Player.TotalSoulsCount
        stats.SoulsDiff = Game.Difficulty
    end
    if stats.ArmorsFound <= Player.ArmorFound then
        stats.ArmorsFound = Player.ArmorFound
        stats.ArmorsDiff = Game.Difficulty
    end
    if stats.GoldFound < Game.PlayerMoneyFound - Player.BonusItems then
        stats.GoldFound = Game.PlayerMoneyFound - Player.BonusItems
        stats.BonusItems = Player.BonusItems
        stats.GoldDiff = Game.Difficulty
    elseif stats.GoldFound == Game.PlayerMoneyFound - Player.BonusItems and stats.BonusItems < Player.BonusItems then
        stats.BonusItems = Player.BonusItems
        stats.GoldDiff = Game.Difficulty
    end
    if stats.HolyItemsFound <= Player.HolyItems then
        stats.HolyItemsFound = Player.HolyItems
        stats.HolyDiff = Game.Difficulty
    end
    if stats.AmmoFound <= Game.PlayerAmmoFound then
        stats.AmmoFound = Game.PlayerAmmoFound
        stats.AmmoDiff = Game.Difficulty
    end
    if stats.ObjectsDestroyed <= Game.PlayerDestroyedItems then
        stats.ObjectsDestroyed = Game.PlayerDestroyedItems
        stats.ObjectsDiff = Game.Difficulty
    end
    if stats.SecretsFound <= Player.SecretsFound then
        stats.SecretsFound = Player.SecretsFound
        stats.SecretsDiff = Game.Difficulty
    end
    stats.TotalMonsters = Game.TotalActors
    stats.TotalSouls = Game.TotalSouls
    stats.TotalArmors = Game.TotalArmor
    stats.TotalGold = Game.TotalMoney
    stats.TotalHolyItems = Game.TotalHolyItems
    stats.TotalAmmo = Game.TotalAmmo
    stats.TotalObjects = Game.TotalDestroyed
    stats.TotalSecrets = Game.TotalSecrets
    stats.Finished = true
end

function Game:MakeEmptyLevelStats(lname)
    if not self.LevelsStats[lname] and lname ~= "" then
        self.LevelsStats[lname] = {
            GameplayTime = 0,
            Difficulty = 0,
            MonstersKilled = 0,
            SoulsCollected = 0,
            ArmorsFound = 0,
            GoldFound = 0,
            BonusItems = 0,
            HolyItemsFound = 0,
            AmmoFound = 0,
            ObjectsDestroyed = 0,
            SecretsFound = 0,
            TotalMonsters = 0,
            TotalSouls = 0,
            TotalArmors = 0,
            TotalGold = 0,
            TotalHolyItems = 0,
            TotalAmmo = 0,
            TotalObjects = 0,
            TotalSecrets = 0,
            TimeDiff = 0,
            MonstersDiff = 0,
            SoulsDiff = 0,
            ArmorsDiff = 0,
            GoldDiff = 0,
            HolyDiff = 0,
            AmmoDiff = 0,
            ObjectsDiff = 0,
            SecretsDiff = 0,
            Finished = false
        }
    end
end

function Game:ClearLevelsStats(all)
    if all then
        self.LevelsStats = {}
        self.PlayerMoney = 0
        MBOARD.SetCashCheat(0)
        for i = 1, table.getn(Game.CardsAvailable) do
            Game.CardsAvailable[i] = false
            Game.CardsSelected[i] = false
        end
        self.GoldenCardsUseUnlimited = false
        self.BonusMPModel = false
        self.BonusMPModel2 = false
        self.Cheat_WeakEnemies = false
        self.Cheat_AlwaysGib = false
        self.Cheat_KeepBodies = false
        self.Cheat_KeepDecals = false
        return
    end
    local i, o = next(self.LevelsStats, nil)
    while i do
        o.Finished = false
        i, o = next(self.LevelsStats, i)
    end
end

function Game:Pause(p)
    if self.GMode ~= GModes.SingleGame and not NET.IsPlayingRecording() and not CONSOLE.DemoIsPlaying() then
        return
    end
    Game.Paused = p
    if p then
        PMENU.PauseSounds()
    else
        PMENU.ResumeSounds()
    end
end

function DBG_EnableTrace()
    function trace(event)
        local dbi = debugl.getinfo(2, "Sn")

        if dbi.what == "C" and dbi.name ~= "next" then
            EDITOR.OutputText(dbi.namewhat .. "." .. dbi.name)
        end
    end

    debugl.sethook(trace, "r")
end

function Game:UpdateViewFromPlayer()
    if not (Player and Player._Entity) or NET.IsPlayingRecording() or CONSOLE.DemoIsPlaying() then
        return
    end
    local mdx, mdy = MOUSE.GetDelta()
    local crx, cry = CAM.GetRawRotation()
    if Cfg.InvertMouse then
        mdy = -mdy
    end
    local destPos = Vector:New(PX, PY, PZ)
    if ENTITY.PO_IsEnabled(Player._Entity) then
        destPos.X, destPos.Y, destPos.Z = ENTITY.PO_GetPawnHeadPos(Player._Entity)
        destPos.Y = destPos.Y - PLAYER.GetCameraFix(Player._Entity)
    else
        destPos.X, destPos.Y, destPos.Z = ENTITY.GetPosition(Player._Entity)
    end
    crx = crx + mdx
    cry = cry + mdy
    CAM.SetPos(destPos.X, destPos.Y, destPos.Z)
    crx = math.mod(crx, 360)
    cry = math.mod(cry, 360)
    if 80 < cry then
        cry = 80
    end
    if cry < -80 then
        cry = -80
    end
    CAM.SetAng(crx, cry, 0)
end

function Game:RecordPlayers()
    if Game.GMode == GModes.MultiplayerClient or Game.GMode == GModes.MultiplayerServer then
        for i, o in self.Players, nil do
            if o.ClientID == NET.GetClientID() then
                if Game.GMode == GModes.MultiplayerServer then
                    CONSOLE.DemoRecordPlayer(o._Entity, (o._yaw + math.pi / 2) * (65535 / math.pi), o.Health, o.Armor)
                end
                if Game.GMode == GModes.MultiplayerClient then
                    CONSOLE.DemoRecordPlayer(o._Entity, (o._yaw + math.pi / 2) * (65535 / math.pi), o.Health, o.Armor)
                end
            end
        end
    elseif Player then
        local o = Player
        CONSOLE.DemoRecordPlayer(o._Entity, (o._yaw + math.pi / 2) * (65535 / math.pi), o.Health, o.Armor)
    else
        CONSOLE.DemoRecordPlayer(-1, 0, 0, 0)
    end
end

function Game_DemoGetMapName()
    if Lev then
        return Lev._Name
    else
        return ""
    end
end

function Game_DemoLoadLevel(name)
    WORLD.SwitchToState(2)
    PMENU.ActivateLoadingScreen(true, Game.CurrLevel, Levels_GetSketchByDir(name))
    PMENU.ActivateLoadingScreen(true)
    Game:NewLevel(name, "", "", 3)
    Lev = LoadObj("../Data/Levels/" .. name .. "/" .. name .. ".CLevel")
    getfenv()[name] = Lev
    PreloadTemplates("../Data/Levels/" .. Lev._Name .. "/Templates", true)
    WORLD.Release(true)
    WORLD.LateVBsBegin()
    WORLD.LoadMap("../Data/Maps/" .. Lev.Map, Lev._Name, Lev.Scale, Lev.Overbright, Lev.RTCubeMap)
    local p = Lev.Physics
    WORLD.Init(
        p.ActiveMeshesMassScale,
        p.DefaultMeshFriction,
        p.DefaultMeshRestitution,
        p.Deactivator.Delay,
        p.Deactivator.MaxPosDiff,
        true
    )
    Lev:SetupMap()
    Game:SetupMapEntities("../Data/Levels/" .. Lev._Name .. "/")
    Cache:PrecacheLevel(name)
    WORLD.LateVBsEnd()
    WORLD.UpdateAllEntities()
    CAM.SetAng(Lev.Ang.X, Lev.Ang.Y, Lev.Ang.Z)
    CAM.SetPos(Lev.Pos.X, Lev.Pos.Y, Lev.Pos.Z)
    if not Game.IsDemon then
        R3D.SetCameraFOV(Cfg.FOV)
    end
    Game.Active = true
    Game._BlockedPlay = true
    MOUSE.Lock(true)
    PMENU.ActivateLoadingScreen(false)
    INP.ResetTimer()
    CONSOLE_AddMessage(TXT.Menu.GameLoaded)
    PMENU.Activate(false)
    Game.PlayerEnabledWeapons = nil
    Game:Print("Level loaded")
    Game.CameraFromPlayer = false
    GlobalAIDisable()
    Game:AfterWorldSynchronization(Lev.Map, Lev._Name)
    Game._procSpec = GObjects:Add(TempObjName(), Templates["PSpectatorControler.CProcess"]:New())
    Game._procSpec:Init()
    if Game._procStats then
        GObjects:ToKill(Game._procStats)
        Game._procStats = nil
    end
end
