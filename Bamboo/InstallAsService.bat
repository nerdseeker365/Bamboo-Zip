@echo off
setlocal

set _PRG_DIR=%~dp0
cd %_PRG_DIR%

set PATH=%JAVA_HOME%\bin;%PATH%
"%_PRG_DIR%bin\service.bat" install Bamboo

if not errorlevel 1 goto :eof
pause
