XBOX = nil
XBOX_lev2 = nil
EditorFiles = true
if IsFinalBuild() or XBOX then
    EditorFiles = nil
end
local test1 = false
local test2 = false
local test3 = false
if test1 then
    local testfile
    local extractedlscripts = true
    testfile = io.open("../Data/LScripts/Loader.lua", "r")
    if not testfile then
        extractedlscripts = false
    else
        io.close(testfile)
    end
    if extractedlscripts then
        MsgBox("FILE: Data\\Lscripts\\loader.lua present, please remove this file. PK will now quit.")
        Exit(1)
    end
end
if test2 and path then
    MsgBox("Corrupt LScripts:1. PK will now quit.")
    Exit(1)
end
path = "../Data/LScripts/"
if test3 then
    checkfiles = {}
    checkfilesize = {}
    checkfiles[1] = "Loader.lua"
    checkfilesize[1] = 8532
    checkfiles[2] = "Main/Game.lua"
    checkfilesize[2] = 83130
    checkfiles[3] = "Main/GameMP.lua"
    checkfilesize[3] = 94113
    checkfiles[4] = "Main/Bot.lua"
    checkfilesize[4] = 33267
    checkfiles[5] = "Main/Utils.lua"
    checkfilesize[5] = 37512
    checkfiles[6] = "Classes/CPlayer.lua"
    checkfilesize[6] = 83744
    checkfiles[7] = "Classes/CItem.lua"
    checkfilesize[7] = 38601
    checkfiles[8] = "HUD/HUD.lua"
    checkfilesize[8] = 66683
    checkfiles[9] = "HUD/HUD2.lua"
    checkfilesize[9] = 28191
    checkfiles[10] = "HUD/HUD3.lua"
    checkfilesize[10] = 18603
    checkfiles[11] = "HUD/Console.lua"
    checkfilesize[11] = 81902
    checkfiles[12] = "HUD/Console2.lua"
    checkfilesize[12] = 72835
    checkfiles[13] = "Templates/Weapons/DriverElectro.lua"
    checkfilesize[13] = 29155
    checkfiles[14] = "Templates/Weapons/MiniGunRL.lua"
    checkfilesize[14] = 19757
    checkfiles[15] = "Templates/Weapons/Shotgun.lua"
    checkfilesize[15] = 18023
    checkfiles[16] = "Templates/Weapons/StakeGunGL.lua"
    checkfilesize[16] = 12395
    local quitting = false
    for i, checkfile in checkfiles, nil do
        if not quitting and FS.File_GetSize(path .. checkfile) ~= checkfilesize[i] then
            MsgBox("Corrupt LScripts:" .. checkfile .. " " .. checkfilesize[i] .. ". PK will now quit.")
            quitting = true
            Exit(1)
        end
    end
    checkfiles = nil
    checkfilesize = nil
end
FS.RegisterPack("../Data/" .. "PKPlusData.pak", "../Data/Textures/")
FS.RegisterPack("../Data/" .. "Locs.pak", "../Data/Locs/")
FS.RegisterPack("../Data/" .. "Mapview.pak", "../Data/Mapview/")
FS.RegisterPack("../Data/" .. "Waypoints.pak", "../Data/Waypoints/")
linker = "versionB.txt ../Data/PKPlusSounds ../Data/Locs PKPlusSounds.pak"
local file
local paksextracted = true
file = io.open("../Data/Locs/versionB.txt", "r")
if not file then
    paksextracted = false
else
    io.close(file)
end
if not paksextracted then
    FS.CreateDirectory("../Data/Locs")
    FS.ExtractPack("../Data/Locs.pak", "../Data/Locs")
end
local file
local paksextracted = true
file = io.open("../Data/Mapview/versionA.txt", "r")
if not file then
    paksextracted = false
else
    io.close(file)
end
if not paksextracted then
    FS.CreateDirectory("../Data/Mapview")
    FS.ExtractPack("../Data/Mapview.pak", "../Data/Mapview")
end
file = io.open("../Data/Waypoints/versionB.txt", "r")
if not file then
    paksextracted = false
else
    io.close(file)
end
if not paksextracted then
    FS.CreateDirectory("../Data/Waypoints")
    FS.ExtractPack("../Data/Waypoints.pak", "../Data/Waypoints")
end
DoFile(path .. "Main/Utils.lua")
if XBOX_lev2 then
    DoFile(path .. "Main/Utils.xbox")
end
DoFile(path .. "Main/Cfg.lua")
DoFile(path .. "Main/Loc.lua")
DoFile(path .. "Main/Waypoint.lua")
DoFile(path .. "Main/Logfile.lua")
DoFile(path .. "Main/Mapview.lua")
DoFile(path .. "Main/Tweak.lua")
DoFile(path .. "Main/Definitions.lua")
DoFile(path .. "Main/Network.lua")
DoFile(path .. "Main/Profiler.lua")
DoFile(path .. "Main/eliza.lua")
if XBOX then
    DoFile(path .. "Classes/TypesXBOX/Vector.lua")
    DoFile(path .. "Classes/TypesXBOX/VectorA.lua")
    DoFile(path .. "Classes/TypesXBOX/Quaternion.lua")
    DoFile(path .. "Classes/TypesXBOX/Color.lua")
    DoFile(path .. "Classes/TypesXBOX/Collection.lua")
else
    DoFile(path .. "Classes/Types/Vector.lua")
    DoFile(path .. "Classes/Types/VectorA.lua")
    DoFile(path .. "Classes/Types/Quaternion.lua")
    DoFile(path .. "Classes/Types/Color.lua")
    DoFile(path .. "Classes/Types/Collection.lua")
end
ToLoadClasses = {
    "CObject",
    "CItem",
    "CActor",
    "CPlayer",
    "CProcess",
    "CLevel",
    "CLight",
    "CBillboard",
    "CSound",
    "CArea",
    "CBox",
    "CWeapon",
    "CAcousticEnv",
    "CMusicEnv",
    "CAction",
    "CSpawnPoint",
    "CParticleFX",
    "CEnvironment"
}
for i, v in ToLoadClasses, nil do
    DoFile(path .. "Classes/" .. v .. ".lua")
    if EditorFiles then
        DoFile(path .. "Classes/" .. v .. ".editor", false)
    end
    if XBOX_lev2 then
        DoFile(path .. "Classes/" .. v .. ".xbox", false)
    end
end
for i, v in ToLoadClasses, nil do
    Inherit(getfenv()[v], CObject)
end
ToLoadClasses = nil
DoFile(path .. "Classes/Ai/CAiBrain.lua")
DoFile(path .. "Classes/Entities/EMesh.lua")
DoFile(path .. "Classes/Entities/EVolumetric.lua")
DoFile(path .. "Main/GObjects.lua")
DoFile(path .. "Main/Game.lua")
DoFile(path .. "Main/GameMP.lua")
DoFile(path .. "Main/GameMPComms.lua")
DoFile(path .. "Main/GameMPUtils.lua")
DoFile(path .. "Main/GameMPStats.lua")
DoFile(path .. "Main/Languages.lua")
DoFile(path .. "Main/SaveGame.lua")
DoFile(path .. "Main/Cache.lua")
DoFile(path .. "Main/PiTaBOT.lua")
DoFile(path .. "HUD/Scoreboard.lua")
DoFile(path .. "HUD/HUD.lua")
DoFile(path .. "HUD/HUD2.lua")
DoFile(path .. "HUD/HUD3.lua")
DoFile(path .. "HUD/HUD4.lua")
DoFile(path .. "HUD/Levels.lua")
if not XBOX_lev2 then
    DoFile(path .. "HUD/PainMenu.lua")
end
DoFile(path .. "HUD/MagicBoard.lua")
DoFile(path .. "HUD/Console.lua")
DoFile(path .. "HUD/Console2.lua")
DoFile(path .. "Main/Bot.lua")
if EditorFiles then
    DoFile(path .. "Editor/EWayPoints.lua")
    DoFile(path .. "Editor/EFloors.lua")
end
DoFile(path .. "Editor/Editor.lua")
if loadfile(path .. "local.lua") then
    dofile(path .. "local.lua")
end
if Cfg.BrightAmmo then
    FS.RegisterPack("../Data/PKPlusItems.pak", "../Data/Textures/")
end
if Cfg.PicmipFX then
    FS.RegisterPack("../Data/PKPlusPicmip.pak", "../Data/Textures/")
end
if Cfg.BrightSkinsArmors then
    FS.RegisterPack("../Data/PKPlusArmors.pak", "../Data/Textures/")
end
