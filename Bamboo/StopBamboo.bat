@echo off
setlocal

rem
rem Stop the Bamboo server.
rem

:startup

set PATH=%JAVA_HOME%\bin;%PATH%;
net stop Bamboo

if not errorlevel 1 goto :eof
pause

