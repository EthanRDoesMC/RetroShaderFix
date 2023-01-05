Pushd .\AMDFragData\Release
..\..\psarc.exe --xml=AMDFragData.xml
Pushd ..\..


Pushd .\AMDSpaceMapHorizon
..\psarc.exe --xml=AMDSpaceMapHorizon.xml
Pushd ..


Pushd .\AMDTextureArray

Pushd .\Foundations
..\..\psarc.exe --xml=AMDTextureArrayFoundations.xml
Pushd ..

Pushd .\Pathfinder
..\..\psarc.exe --xml=AMDTextureArrayPathfinder.xml
Pushd ..

Pushd .\AtlasRises
..\..\psarc.exe --xml=AMDTextureArrayAR.xml
Pushd ..

Pushd ..


Pushd .\NVIDIAFragData

Pushd .\Foundations
..\..\psarc.exe --xml=NVIDIAFragDataFoundations.xml
Pushd ..

Pushd .\Pathfinder
..\..\psarc.exe --xml=NVIDIAFragDataPathfinder.xml
Pushd ..

Pushd ..