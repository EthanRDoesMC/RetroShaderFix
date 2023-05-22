# Retro Shader Fix

**Retro Shader Fix** (or **RSF**) is a series of patches for older versions of No Man’s Sky. As drivers for graphics cards have updated, the shaders of older NMS versions have begun to stop working (largely owing to Hello Games being a small indie studio, hah!) and so, in order to play them, one has had to downgrade their graphics drivers to a version that the shaders compile correctly on.

As of right now, I have written patches for as recent as version 1.38, but they could be made for versions as new as 1.77 — if needed — and theoretically could be developed for any version of No Man’s Sky that needs them. 

These patches are designed to modify as little as possible. Every change is documented in the shader files, and each change was thoroughly tested individually to make sure that no unnecessary changes were made. 

If you encounter any shader errors, please let me know! The `SHADERERRORDUMP.txt` file in `/GAMEDATA` is extremely helpful for fixing broken shaders. (Ironically enough, the more broken a shader is, the more easily I can fix it.)

## How to install
Get the pak(s) you need from the [Releases](https://github.com/EthanRDoesMC/RetroShaderFix/releases) page.
- For version 1.10 and older, place the .pak in `/GAMEDATA/PCBANKS`. Then, go back to `/GAMEDATA` and delete `/SHADERCACHE`. You're done!
- For version 1.12 and newer, go to `/GAMEDATA/PCBANKS` and delete (or rename) `DISABLEMODS.TXT`. Then, in the same folder, create a new folder called `MODS`. Place the .pak in there, then head back to `/GAMEDATA` and delete `/SHADERCACHE`. You're done!

Note: If you're using other mods, and the patch stops working, then you'll need to make sure that the patch is the last file in the MODS folder *when sorted alphabetically*. This especially applies with RaYRoD's Overhaul; just keep adding `z` to the beginning of the patch's file name until it's last in order, ie `zzAtlasRises.AMDTextureArray.pak`, keep adding z's. :P

## How to build
Run `Build.bat` in the `/Source` folder. The `.pak`s will be in each respective folder.

## Quick Links
- NMS “retro” versions installation guide on https://nomansskyretro.com/

# TL;DR
- If you have AMD:
  - On 1.0x Release versions, get Release.AMDFragData.pak
  - On 1.1x Foundations versions, get Foundations.AMDTextureArray.pak
  - On 1.2x Pathfinder versions, get Pathfinder.AMDTextureArray.pak
  - For versions 1.0x - 1.2x, **also** get Universal.AMDSpaceMapHorizon.pak
  - On 1.3x Atlas Rises versions, get AtlasRises.AMDTextureArray.pak
- If you have NVIDIA:
  - on 1.1x Foundations versions, get Foundations.NVIDIAFragData.pak
  - on 1.2x Pathfinder versions, get Pathfinder.NVIDIAFragData.pak
- On versions older than 1.12, make sure your paks are in PCBANKS, not MODS
- If the fix stops working after installing other mods, make sure the fix is the last thing to load
  - adding a few "z"s to the beginning of the file name should do it

- - - -
# NVIDIA FragData Shader Fix
This patch, for No Man’s Sky Foundations 1.10 through No Man’s Sky Pathfinder 1.24, fixes the errors that result in only the game’s UI being rendered. It is not needed for 1.09 and earlier, or 1.30 and later. 
It updates the DEFINES shader to not use `gl_FragData` (which has been deprecated), fixes a syntax error, and updates another shader affected by those changes. 
It was developed by taking code from NMS 1.38 that resolves the issue, so there shouldn’t be any side effects. 

**Files affected:** `/SHADERS/CODE/COMMON/DEFINES.SHADER.H.BIN`, `/SHADERS/CODE/FULLSCREEN/COMPRESSFRAGMENT.SHADER.H.BIN`

**Paks:** `(Foundations/Pathfinder).NVIDIAFragData.pak`

*Make sure to download the appropriate pak for your version of the game!*

# AMD Shader Fixes
## Space Map Horizon Fix
This patch fixes an issue in the SpaceMap pipeline that causes the “horizon” of the space map (the red “radar” effect) to not render correctly. 

This patch can be applied to any version from 1.03 to 1.24. The same file works for all of them. 1.30 and later use a completely different space map, so they don't need it.

**Files affected:** `/PIPELINES/PIPELINESPACEMAP.BIN`

**Pak:** `Universal.AMDSpaceMapHorizon.pak`

## Invisible Terrain and Textures Fix

| Before | After |
| ---  | --- |
| ![Before the fix. No terrain visible. Other objects missing textures.](https://raw.githubusercontent.com/EthanRDoesMC/RetroShaderFix/main/docs/AMDTerrainBefore.png) | ![After the fix. Terrain visible. No missing textures.](https://raw.githubusercontent.com/EthanRDoesMC/RetroShaderFix/main/docs/AMDTerrainAfter.png) |

### Release 1.03-1.09
This patch is more akin to the NVIDIA shader patch in terms of changes made, plus a missing GLSL extension. It fixes invisible terrain, incorrect coloring, and missing textures. 

**Files affected:** `/SHADERS/CODE/COMMON/DEFINES.SHADER.H.BIN`, `/SHADERS/CODE/FULLSCREEN/COMPRESSFRAGMENT.SHADER.H.BIN`.

**Pak:** `Release.AMDFragData.pak`

### Texture Array Fix (1.10-1.24)
This patch adds a single missing GLSL extension to the DEFINES shader. It fixes invisible terrain and other missing textures. 

**Files affected:** `/SHADERS/CODE/COMMON/DEFINES.SHADER.H.BIN`.

**Paks:** `(Foundations/Pathfinder).AMDTextureArray.pak`

*Make sure to download the appropriate pak for your version of the game!*

### Texture Array and Hexadecimal Literal Fix (1.30-1.38)
This patch adds a single missing GLSL extension to the DEFINES shader and removes some compute code that only works on the PS4, as the new AMD drivers throw a syntax error even though the code never runs on PC.

**Files affected:** `/SHADERS/CODE/COMMON/DEFINES.SHADER.H.BIN`

**Pak:** `AtlasRises.AMDTextureArray.pak`
