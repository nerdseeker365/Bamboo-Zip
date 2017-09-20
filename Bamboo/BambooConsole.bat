@echo off
setlocal

set _PRG_DIR=%~dp0
cd %_PRG_DIR%

set PATH=%JAVA_HOME%\bin;%PATH%
"%_PRG_DIR%bin\start-bamboo.bat" /fg

if not errorlevel 1 goto :eof
pause
