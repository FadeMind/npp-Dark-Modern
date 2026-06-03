@echo off

net session >nul 2>&1
if %errorLevel% equ 0 (
    echo Run as a regular user, not as an administrator!
    pause
    exit /b 1
)

:: ==========================================================
:: Install Dark+ Modern notepad++ theme
:: ==========================================================
:: Data: 20/05/2026
:: Autor: helldio
::
:: ==========================================================
:: Changes 
:: ==========================================================
:: - Don't run as admin guard
:: - autohotkey-dark.xml | 03/06/2026 FadeMind

setlocal

set "THEME_NAME=Dark+ Modern.xml"
set "THEME_DIR=%AppData%\Notepad++\themes"

set "UDL_MDN=plugins\markdown-dark.xml"
set "UDL_DIR=%AppData%\Notepad++\userDefineLangs"

set "UDL_AHK=plugins\autohotkey-dark.xml"
set "UDL_DIR=%AppData%\Notepad++\userDefineLangs"

set "PLUGIN_SRC=plugins\CSVLint.xml"
set "PLUGIN_DIR=%AppData%\Notepad++\plugins\config"

set "ERRORS=0"

:: ----------------------------------------------------------
:: Theme
:: ----------------------------------------------------------
echo Installing theme...
if not exist "%THEME_DIR%" mkdir "%THEME_DIR%"
copy /y "%~dp0%THEME_NAME%" "%THEME_DIR%\" >nul
if %errorlevel% neq 0 ( echo   [FAILED] Theme & set "ERRORS=1" ) else echo   [OK] Theme ^-^> %THEME_DIR%

:: ----------------------------------------------------------
:: UDL (Markdown)
:: ----------------------------------------------------------
echo Installing UDL files...
if not exist "%UDL_DIR%" mkdir "%UDL_DIR%"
copy /y "%~dp0%UDL_MDN%" "%UDL_DIR%\" >nul
if %errorlevel% neq 0 ( echo   [FAILED] %UDL_MDN% & set "ERRORS=1" ) else echo   [OK] %UDL_MDN% ^-^> %UDL_DIR%

:: ----------------------------------------------------------
:: UDL (Autohotkey)
:: ----------------------------------------------------------
echo Installing UDL files...
if not exist "%UDL_DIR%" mkdir "%UDL_DIR%"
copy /y "%~dp0%UDL_AHK%" "%UDL_DIR%\" >nul
if %errorlevel% neq 0 ( echo   [FAILED] %UDL_AHK% & set "ERRORS=1" ) else echo   [OK] %UDL_AHK% ^-^> %UDL_DIR%

:: ----------------------------------------------------------
:: Plugin config (CSVLint)
:: ----------------------------------------------------------
echo Installing plugin config files...
if not exist "%PLUGIN_DIR%" mkdir "%PLUGIN_DIR%"
copy /y "%~dp0%PLUGIN_SRC%" "%PLUGIN_DIR%\" >nul
if %errorlevel% neq 0 ( echo   [FAILED] %PLUGIN_SRC% & set "ERRORS=1" ) else echo   [OK] %PLUGIN_SRC% ^-^> %PLUGIN_DIR%

:: ----------------------------------------------------------
:: Result
:: ----------------------------------------------------------
echo.
if "%ERRORS%"=="0" (
    echo All files installed successfully!
    echo Please restart Notepad++ and select "Dark+ Modern" in Settings ^> Style Configurator.
) else (
    echo Some files failed to copy. Check the errors above.
)

pause
exit /b
