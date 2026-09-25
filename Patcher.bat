@echo off
color 2
if exist "properties\PATCH" goto pause
title PVZ main.pak Mod Patcher

:begin
cls
echo.
echo This will Extract main.pak and patch PVZ so that it can now be 
echo MODdable. To exit, close this window. To continue, please
pause
cls
goto extract

:extract
start PATCH.exe
del properties\resources.xml
del properties\LawnStrings.txt
quickbms patchmain.exe main.pak .
del images\PopCap_Logo.jpg
copy PopCap_Logo.jpg images
ren main.pak main_backup.pak
cls
goto cleanup

:pause
title PVZ main.pak Mod Unpatcher
echo.
echo  Patch is already done. You must unpatch PVZ
echo  before patching again.
:repeat
echo.
echo  Do you want to unpatch?
echo.
echo  To cancel, close this window.
echo  To continue unpatching, please
pause
cls
goto unpatch

cls
echo.
echo Please choose the right answer.
echo.
goto repeat

:cleanup
del PopCap_Logo.jpg
del patchmain.exe
del PATCH.exe
del quickbms.exe
cls
echo.
echo Patching is now Complete! To unpatch, run the Patcher again.
echo.
pause
goto cancel

:cancel
echo.
echo  Goodbye! And Watch your brains!
echo.
pause
exit

:unpatch
cls
ren main_backup.pak main.pak
del properties\PATCH
cls
echo.
echo  I need help unpatching. Please delete these folders located
echo  in the PVZ directory.
echo.
echo  compiled
echo  data
echo  images
echo  particles
echo  reanim
echo  sounds
echo  src
echo.
echo Sorry for the inconvenience.
echo.
pause
cls
goto cancel







