@echo off
setlocal

title 2009scape Server

set "SCRIPT_DIR=%~dp0"
set "JRE_DIR=%SCRIPT_DIR%jre"
set "GAME_DIR=%SCRIPT_DIR%game"
set "SERVER_JAR=%GAME_DIR%\server.jar"

echo ========================================
echo          2009scape Server
echo ========================================
echo.

if not exist "%JRE_DIR%\bin\java.exe" (
    echo ERROR: Bundled JRE not found:
    echo %JRE_DIR%\bin\java.exe
    echo.
    pause
    exit /b 1
)

if not exist "%SERVER_JAR%" (
    echo ERROR: server.jar not found:
    echo %SERVER_JAR%
    echo.
    pause
    exit /b 1
)

if not exist "%GAME_DIR%\worldprops\default.conf" (
    echo ERROR: worldprops\default.conf not found:
    echo %GAME_DIR%\worldprops\default.conf
    echo.
    pause
    exit /b 1
)

cd /d "%GAME_DIR%"

echo Starting server...
echo Working directory:
echo %CD%
echo.
echo ========================================
echo.

"%JRE_DIR%\bin\java.exe" -jar "server.jar"

echo.
echo ========================================
echo Server stopped.
echo ========================================
echo.

pause