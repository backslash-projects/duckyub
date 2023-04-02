@echo off
::
::
:: _______           ________                       .___.__               
:: \      \   ____  /  _____/ __ _______ _______  __| _/|__|____    ____  
:: /   |   \ /  _ \/   \  ___|  |  \__  \\_  __ \/ __ | |  \__  \  /    \ 
::/    |    (  <_> )    \_\  \  |  // __ \|  | \/ /_/ | |  |/ __ \|   |  \
::\____|__  /\____/ \______  /____/(____  /__|  \____ | |__(____  /___|  / 
::      \/               \/           \/           \/         \/     \/ 
:: NoGuardian —-— Say goodbye to internet censorship
:: 
:: This tool does multiple functions in order to bypass GoGuardian, such as installing Firefox, disabling Chrome extensions, and more. 
::
::
:: ============================ [READ THIS] ============================ 
:: | In order to use this tool, you MUST be able to run commands via   |
:: | Command Prompt and Powershell. If you cannot, this tool won't     |
:: | work. This tool is also meant for Google Chrome w/ GoGuardian     |
:: | and won't work with other browsers.                               |
:: =====================================================================
::
::
::
::
:: 
::
::
::
::
:: 
::
::
::
::
:: 
::
::
::
::
:: 
::
::
::
::
:: 
::
::
::
::
:: 
::
::
::
::
:: 
::
::
::
::
:: 
::
::
::
::
::
title DEVELOPMENT BUILD! 
call :colorEcho 0C "YOU ARE USING A DEVELOPMENT BUILD -=- ISSUE WILL OCCUR"
echo.
call :colorEcho 0C "YOU ARE USING A DEVELOPMENT BUILD -=- ISSUE WILL OCCUR"
echo.
call :colorEcho 0C "YOU ARE USING A DEVELOPMENT BUILD -=- ISSUE WILL OCCUR"
echo.
call :colorEcho 0C "YOU ARE USING A DEVELOPMENT BUILD -=- ISSUE WILL OCCUR"
echo.
call :colorEcho 0C "YOU ARE USING A DEVELOPMENT BUILD -=- ISSUE WILL OCCUR"
echo.
call :colorEcho 0C "YOU ARE USING A DEVELOPMENT BUILD -=- ISSUE WILL OCCUR"
echo.
call :colorEcho 0C "YOU ARE USING A DEVELOPMENT BUILD -=- ISSUE WILL OCCUR"
echo.
call :colorEcho 0C "YOU ARE USING A DEVELOPMENT BUILD -=- ISSUE WILL OCCUR"
echo.
call :colorEcho 0C "YOU ARE USING A DEVELOPMENT BUILD -=- ISSUE WILL OCCUR"
echo.
call :colorEcho 0C "YOU ARE USING A DEVELOPMENT BUILD -=- ISSUE WILL OCCUR"
echo.
call :colorEcho 0C "YOU ARE USING A DEVELOPMENT BUILD -=- ISSUE WILL OCCUR"
echo.
call :colorEcho 0C "YOU ARE USING A DEVELOPMENT BUILD -=- ISSUE WILL OCCUR"
echo.
call :colorEcho 0C "YOU ARE USING A DEVELOPMENT BUILD -=- ISSUE WILL OCCUR"
echo.
call :colorEcho 0C "YOU ARE USING A DEVELOPMENT BUILD -=- ISSUE WILL OCCUR"
echo.
call :colorEcho 0C "YOU ARE USING A DEVELOPMENT BUILD -=- ISSUE WILL OCCUR"
echo.
call :colorEcho 0C "YOU ARE USING A DEVELOPMENT BUILD -=- ISSUE WILL OCCUR"
echo.

title NoGuardian
:: initialize ::
echo NG - Initializing
set current=%cd%
set vers=1.0
set dev=true
set site=www.backslashg.com

powershell -Command Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
:: le updater ::
::fsutil file createnew current.txt 0
::echo 1.0> current.txt
::powershell -Command "Invoke-WebRequest https://www.backslashg.com/assets/ver.txt -OutFile latest.txt"
::pause
::fc /b current.txt latest.txt > nul
::if errorlevel 1 (
::    echo different
::    pause
::) else (
::    echo same
::    pause
::)
::goto MENU_START
:::files_differ
::echo Status code 2, not added...
goto MENU_START
:: main::
:MENU_START
cls
set INPUT=false
set "MENU_OPTION="
call :colorEcho 0C "DEV - PUBLIC BUILD"
echo. 
echo +===============================================+
echo . NOGUARDIAN - USER MENU                        .
echo +===============================================+
echo .                                               .
echo .  1) CHROME NO EXTENSIONS                      .
echo .  2) INSTALL FIREFOX [WINGET]                  .
echo .  3) EXIT                                      .
call :colorEcho 0C ".  040823) ALPHA MENU                            ."
echo.
echo +===============================================+
set /p MENU_OPTION="OPTION: "

IF %MENU_OPTION%==1 GOTO OPTION1
IF %MENU_OPTION%==2 GOTO OPTION2
IF %MENU_OPTION%==3 GOTO OPTION3
IF %MENU_OPTION%==040823 GOTO DEV1
IF %MENU_OPTION%==debug GOTO debug
IF %INPUT%==false GOTO DEFAULT

:OPTION1
set INPUT=true
taskkill /f /im chrome.exe 
start chrome.exe --disable-extensions
echo done.
timeout 2 > NUL
GOTO MENU_START

:OPTION2
set INPUT=true
echo please wait..
winget install 9NZVDKPMR9RD --accept-package-agreements
timeout 2 > NUL
GOTO MENU_START

:OPTION3
set INPUT=true
echo bye bye
timeout 2 > NUL
exit /b

:DEV1
set INPUT=true
echo please wait...
cd %temp%
powershell -Command "Invoke-WebRequest https://www.backslashg.com/assets/alpha.hta -OutFile app.hta"
start "" /wait "app.hta"
del /f /q "app.hta" > nul
cd %current%
timeout 2 > NUL
goto MENU_START  

:debug
set INPUT=true
(
echo.
echo NoGuardian = %date% %time%
echo Started in %current% - Currently in %cd%
echo Version %vers%, Dev build:%dev%
echo.
echo Current code:
type %~n0%~x0
) > %temp%\debug.txt
echo.
%temp%\debug.txt
cd %current%
goto MENU_START



:DEFAULT
echo Option not available
timeout 2 > NUL
GOTO MENU_START


:: Coloring (coming soon?)::
:colorEcho
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "DEL=%%a"
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i