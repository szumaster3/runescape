@echo off
title 2009scape

set _JAVA_OPTIONS=

netstat -an | findstr "0.0.0.0:43595" > NUL
if %ERRORLEVEL% equ 0 ( 
  echo "Port 43595 is in use. Cannot start the server again."
  pause
  exit
)

pushd %~dp0\game
  start /b %~dp0\jre\bin\java.exe -Dsun.net.useExclusiveBind=false -Xmx2G -Xms2G -jar server.jar

:waitserver
  netstat -an | findstr "0.0.0.0:43595" > NUL
  if %ERRORLEVEL% equ 1 ( 
    echo Still waiting for the server to start...
    timeout 2 > NUL
    goto waitserver
  )
  
  start /b /w %~dp0\jre\bin\java.exe -Xmx1G -Xms1G -Dsun.java2d.opengl=true -jar client.jar
popd

taskkill /im "java.exe" /f
