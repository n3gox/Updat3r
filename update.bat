@echo off
chcp 65001 >nul
SETLOCAL EnableDelayedExpansion
title Gestor de Actualizaciones Winget Pro

:: Generar el carácter de escape real (ESC) de forma dinámica
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"

:: Definición de colores usando el carácter generado
set "reset=%ESC%[0m"
set "bold=%ESC%[1m"
set "cyan=%ESC%[36m"
set "green=%ESC%[32m"
set "yellow=%ESC%[33m"
set "red=%ESC%[31m"
set "white=%ESC%[97m"
set "bg_blue=%ESC%[44m"

:: Verificar permisos de administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo %red%[ERROR] Por favor, ejecuta este script como ADMINISTRADOR.%reset%
    pause
    exit /b
)

:menu
cls
echo %cyan%============================================================%reset%
echo %white%%bg_blue%           BUSCANDO ACTUALIZACIONES DISPONIBLES           %reset%
echo %cyan%============================================================%reset%
echo.

:: Ejecutar winget upgrade
winget upgrade

if %errorLevel% neq 0 (
    echo.
    echo %yellow%------------------------------------------------------------%reset%
    echo %green%[INFO] Tu sistema está al día o no se encontraron cambios.%reset%
    echo %yellow%------------------------------------------------------------%reset%
    pause
    exit /b
)

echo.
echo %bold%%white%¿QUÉ DESEAS HACER?%reset%
echo %cyan%------------------------------------------------------------%reset%
echo  [%green%1%reset%] %green%Actualizar TODO%reset%
echo  [%yellow%2%reset%] %yellow%Elegir un programa específico%reset%
echo  [%red%3%reset%] %red%Salir%reset%
echo %cyan%------------------------------------------------------------%reset%
echo.

set /p opt="%bold%Selecciona una opción (1, 2 o 3): %reset%"

if "%opt%"=="1" goto update_all
if "%opt%"=="2" goto update_id
if "%opt%"=="3" exit
goto menu

:update_all
echo.
echo %yellow%[PROCESO]%reset% Actualizando todo...
winget upgrade --all --include-unknown
echo.
echo %green%============================================================%reset%
echo %green%[OK] ¡Actualización masiva completada!%reset%
pause
goto menu

:update_id
echo.
set /p id="%white%Escribe el %bold%ID%reset%%white% del programa: %reset%"
if "%id%"=="" (
    echo %red%[ERROR] ID no válido.%reset%
    pause
    goto menu
)
echo.
echo %yellow%[PROCESO]%reset% Actualizando: %cyan%%id%%reset%...
winget upgrade --id "%id%"
echo.
echo %green%[OK] Proceso finalizado.%reset%
pause
goto menu