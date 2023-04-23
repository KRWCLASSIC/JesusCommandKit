@echo off
:top
title Main Menu
chcp 65001
cls

set "select=r"
set "portal2path="

if not exist "C:\Program Files (x86)\Steam\steam.exe" (
    echo Steam isn't present in deafult directory, please install JCK manually or reinstall steam!
    timeout 3 >nul
    exit
)
cls

rem Locate Portal 2 folder
echo You dont need to add " signs!
set /p portal2path="Input Portal 2 path (Deafult: "C:\Program Files (x86)\Steam\steamapps\common\Portal 2"): "
if not defined portal2path (
    set portal2path="C:\Program Files (x86)\Steam\steamapps\common\Portal 2"
    goto val
) else (
    goto val
)

goto top
:val
if exist "%portal2path%" (
    goto boot
) else (
    cls
    echo Invalid or Incorrect Portal 2 path!
    timeout 3
    goto top
)
goto top

rem Booting procedure and boot logo/art
:boot
cls
echo                                 ▐▄▄▄ ▄▄· ▄ •▄ 
echo                                  ·██▐█ ▌▪█▌▄▌▪
echo                                ▪▄ ████ ▄▄▐▀▀▄·
echo                                ▐▌▐█▌▐███▌▐█.█▌
echo                                 ▀▀▀•·▀▀▀ ·▀  ▀
echo                  Version 0.1     For Portal 2     by KRWCLASSIC
echo.
echo.

rem Selection procedure
echo 1) Download and Install Jesus Command Kit (Numpad Version)
echo 2) Download and Install Jesus Command Kit (No Numpad Version)
echo 3) Download Both JCK's but don't install them
echo 4) Quit
echo.
cd %USERPROFILE%/Downloads
set /p select="Option: "

if %select%==1 goto 1
if %select%==2 goto 2
if %select%==3 goto 3
if %select%==4 goto 4
rem Restart procedure
if %select%==r goto r

rem Selection executables
rem "exit" line between of each tag is to make sure installer.bat window is getting closed when opening other *.bat file

:1
cls
curl -LJOS https://github.com/KRWCLASSIC/JesusCommandKit/raw/main/JCK.cfg >nul
curl -LJOS https://github.com/KRWCLASSIC/JesusCommandKit/raw/main/JCK-Unbind.cfg >nul
move /y JCK.cfg "%portal2path%\portal2\cfg" >nul
move /y JCK-Unbind.cfg "%portal2path%\portal2\cfg" >nul
cd "C:\Program Files (x86)\Steam\"
steam.exe -applaunch 620 -console -novid +exec JCK
exit

:2
cls
curl -LJOS https://github.com/KRWCLASSIC/JesusCommandKit/raw/main/JCKNN.cfg >nul
curl -LJOS https://github.com/KRWCLASSIC/JesusCommandKit/raw/main/JCKNN-Unbind.cfg >nul
move /y JCKNN.cfg "%portal2path%\portal2\cfg" >nul
move /y JCKNN-Unbind.cfg "%portal2path%\portal2\cfg" >nul
cd "C:\Program Files (x86)\Steam\"
steam.exe -applaunch 620 -console -novid +exec JCKNN
exit

:3
cls
curl -LJOS https://github.com/KRWCLASSIC/JesusCommandKit/raw/main/JCK.cfg >nul
curl -LJOS https://github.com/KRWCLASSIC/JesusCommandKit/raw/main/JCK-Unbind.cfg >nul
curl -LJOS https://github.com/KRWCLASSIC/JesusCommandKit/raw/main/JCKNN.cfg >nul
curl -LJOS https://github.com/KRWCLASSIC/JesusCommandKit/raw/main/JCKNN-Unbind.cfg >nul
move /y JCK.cfg "%portal2path%\portal2\cfg" >nul
move /y JCK-Unbind.cfg "%portal2path%\portal2\cfg" >nul
move /y JCKNN.cfg "%portal2path%\portal2\cfg" >nul
move /y JCKNN-Unbind.cfg "%portal2path%\portal2\cfg" >nul
cls
echo Downloaded and moved into game folder!
timeout 3 >nul
exit

:4
exit

rem Restart installer procedure
:r
goto top
exit