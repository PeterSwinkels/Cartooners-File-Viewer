REM This script assumes the following:
REM 1. Cartooners to be in its parent directory.
REM 2. Backups of Cartooners's original music files to be present in its directory.
REM
REM It will erase any *.mus file in Cartooners music directory and copy any *.mus file from its directory to there and launch Cartooners.

@ECHO OFF
DEL ..\music\*.mus
COPY *.mus ..\music
CD ..
cartoons.exe