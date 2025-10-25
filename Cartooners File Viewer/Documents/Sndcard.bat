@ECHO OFF
REM This script assumes the following:
REM 1. Cartooners to be in its parent directory.
REM 2. All of Cartooners's sounddrivers (*.smb files) to be present in its directory.
REM
REM It will replace any sounddriver (*.smb file) in Cartooners's directory with another driver as specified by the command line argument and launch Cartooners.
REM a = Adlib
REM c = CMS Board (Create Music Systems)
REM p = PC-Speaker
REM r = Roland MT 32/LAPC Board

 IF "%1%" == "" GOTO NoArgument
 IF %1% == a GOTO Adlib
 IF %1% == c GOTO CMS
 IF %1% == p GOTO PCSpeaker
 IF %1% == r GOTO Roland
GOTO EndScript

:Adlib
 DEL ..\*.smb
 COPY adtoon.smb ..\
 ECHO Adlib
GOTO StartCartooners

:CMS
 DEL ..\*.smb
 COPY cstoon.smb ..\
 ECHO CMS
GOTO StartCartooners

:Roland
 DEL ..\*.smb
 COPY mttoon.smb ..\
 ECHO Roland
GOTO StartCartooners

:PCSpeaker
 DEL ..\*.smb
 ECHO PC-Speaker
GOTO StartCartooners

:StartCartooners
 ECHO Done.
 CD ..
 cartoons.exe
GOTO EndScript

:NoArgument
ECHO No sound option specified.

:EndScript
