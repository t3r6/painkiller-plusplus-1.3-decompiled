# Painkiller game PK++ 1.3 mod source code

This repository contains the decompiled scripts from the Painkiller++ 1.3 mod.

The Lua files were decompiled with [unluac](https://sourceforge.net/projects/unluac/) (version `unluac_2023_12_24.jar`) and linted with [lua-beautifier](https://codebeautify.org/lua-beautifier).

## How to use

1. Install [PK++ 1.3](https://www.moddb.com/mods/pk/downloads/pk-13-open-beta) full package.
2. Copy the `LScripts` folder from this repository into the `Painkiller/Data` directory.
3. Make custom changes in scripts.
4. Run a game to test the changes.
5. [Pack](https://t3r6.github.io/pkdocs/guides/modding/pk-unpack/) the modified files back to `PKPlus.pak`.

## The list of decompiled files

```
Loader.lua
Classes/CItem.lua
Classes/CParticleFX.lua
Classes/CPlayer.lua
HUD/Console.lua
HUD/Console2.lua
HUD/HUD.lua
HUD/HUD2.lua
HUD/HUD3.lua
HUD/HUD4.lua
HUD/Levels.lua
HUD/MagicBoard.lua
HUD/PainMenu.lua
HUD/Scoreboard.lua
HUD/Specmode.lua
Main/Bot.lua
Main/Cache.lua
Main/Cfg.lua
Main/Definitions.lua
Main/Eliza.lua
Main/Game.lua
Main/GameMP.lua
Main/GameMPComms.lua
Main/GameMPStats.lua
Main/GameMPUtils.lua
Main/GObjects.lua
Main/Languages.lua
Main/Loc.lua
Main/Logfile.lua
Main/Mapview.lua
Main/Network.lua
Main/Profiler.lua
Main/SaveGame.lua
Main/Tweak.lua
Main/Utils.lua
Main/Waypoint.lua
Templates/Weapons/Rocket.lua
```

## Code references

* [PK++ 1.2](https://sourceforge.net/projects/pkplusplus/files/) original source code
* [PK++ 1.2.5 Revised](https://github.com/threshersow/painkiller-plus-plus) source code

## Feature requests

I'm not planning to work on this code but if someone is going to make a new Promod for Painkiller or release PK++ 1.4, please consider adding these features:

* Map auto download
* Race mode (trick jump mode)
* Mutator menu like in Unreal Tournament (it will allow to have small mods on a server, like grapple-hook mod)
* Server support for some Painkiller Overdose scripts, like the one used on DM_Sphere (technically the scripts of this map are not supported by Painkiller servers)
* Optional double-jump on ramps feature Like in Quake 2 (very hard to implement)
* [Autohop](https://t3r6.github.io/pkdocs/guides/trickjumping/pk-autohop/) serverside and clientside feature
* [Pressed directional keys](https://t3r6.github.io/pkdocs/guides/trickjumping/pk-hud-movement-compass/)
* Improve bot code. The improved bot code be taken from the [unofficial Painkiller Overdose patch](https://www.moddb.com/games/painkiller-overdose/downloads/painkiller-overdose-86-1u)
* Weapon skins from Painkiller Overdose and other mods
* Option to change colors of the Painkiller weapon ray
* More player skins
* Optimize code and fix bugs (there are a lot of bugs in 1.3, especially outside the FFA and Duel modes; CTF is mostly unplayable in 1.3)

## Credits

Devteam: Blowfish (PK++ 1.2 code), OriOn (code), B6 (maps), PrimeviL (gfx), sk1p, HV, kenzu (betatest)
