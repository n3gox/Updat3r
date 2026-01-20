@echo off
chcp 65001 >nul
SETLOCAL EnableDelayedExpansion
title Winget Pro Update Manager

:: Generate real escape character (ESC) dynamically
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"

:: Color definitions using the generated character
set "reset=%ESC%[0m"
set "bold=%ESC%[1m"
set "cyan=%ESC%[36m"
set "green=%ESC%[32m"
set "yellow=%ESC%[33m"
set "red=%ESC%[31m"
set "white=%ESC%[97m"
set "bg_blue=%ESC%[44m"

:: Check for administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo %red%[ERROR] Please run this script as ADMINISTRATOR.%reset%
    pause
    exit /b
)

:menu
cls
echo %cyan%============================================================%reset%
echo %white%%bg_blue%            CHECKING FOR AVAILABLE UPDATES              %reset%
echo %cyan%============================================================%reset%
echo.

:: Execute winget upgrade
winget upgrade

if %errorLevel% neq 0 (
    echo.
    echo %yellow%------------------------------------------------------------%reset%
    echo %green%[INFO] Your system is up to date or no changes were found.%reset%
    echo %yellow%------------------------------------------------------------%reset%
    pause
    exit /b
)

echo.
echo %bold%%white%WHAT WOULD YOU LIKE TO DO?%reset%
echo %cyan%------------------------------------------------------------%reset%
echo  [%green%1%reset%] %green%Update EVERYTHING%reset%
echo  [%yellow%2%reset%] %yellow%Choose a specific program%reset%
echo  [%red%3%reset%] %red%Exit%reset%
echo %cyan%------------------------------------------------------------%reset%
echo.

set /p opt="%bold%Select an option (1, 2 or 3): %reset%"

if "%opt%"=="1" goto update_all
if "%opt%"=="2" goto update_id
if "%opt%"=="3" exit
goto menu

:update_all
echo.
echo %yellow%[PROCESS]%reset% Updating everything...
winget upgrade --all --include-unknown
echo.
echo %green%============================================================%reset%
echo %green%[OK] Bulk update completed successfully!%reset%
pause
goto menu

:update_id
echo.
set /p id="%white%Type the program %bold%ID%reset%%white%: %reset%"
if "%id%"=="" (
    echo %red%[ERROR] Invalid ID.%reset%
    pause
    goto menu
)
echo.
echo %yellow%[PROCESS]%reset% Updating: %cyan%%id%%reset%...
winget upgrade --id "%id%"
echo.
echo %green%[OK] Process finished.%reset%
pause
goto menu

