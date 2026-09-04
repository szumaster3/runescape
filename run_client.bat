@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "JRE_DIR=%SCRIPT_DIR%jre"
set "GAME_DIR=%SCRIPT_DIR%game"
set "CLIENT_JAR=%GAME_DIR%\client.jar"

if not exist "%JRE_DIR%\bin\java.exe" (
    echo ERROR: Bundled JRE not found:
    echo %JRE_DIR%\bin\java.exe
    pause
    exit /b 1
)

if not exist "%CLIENT_JAR%" (
    echo ERROR: client.jar not found:
    echo %CLIENT_JAR%
    pause
    exit /b 1
)

cd /d "%GAME_DIR%"

"%JRE_DIR%\bin\java.exe" -jar "client.jar"

endlocal