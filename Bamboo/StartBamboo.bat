@echo off
setlocal

rem
rem Start the Bamboo Server.
rem
:startup
set PATH=%JAVA_HOME%\bin;%PATH%
net start Bamboo
if not errorlevel 1 goto :eof
pause
