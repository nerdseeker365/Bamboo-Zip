rem --------------------------------------------------------------------------
rem Note: If running Bamboo as a Service, settings in this file have no
rem effect.
rem
rem --------------------------------------------------------------------------

rem --------------------------------------------------------------------------
rem
rem One way to set the Bamboo HOME path is here via this variable.  Simply uncomment it and set a valid path like c:\bamboo\home.  You can of course set it outside in the command terminal.  That will also work.
rem
rem BAMBOO_HOME=""
rem --------------------------------------------------------------------------



rem --------------------------------------------------------------------------
rem
rem  Occasionally Atlassian Support may recommend that you set some specific JVM arguments.  You can use this variable below to do that.
rem
rem --------------------------------------------------------------------------
set JVM_SUPPORT_RECOMMENDED_ARGS=

#
# Byteman agent
#set JVM_SUPPORT_RECOMMENDED_ARGS="%JVM_SUPPORT_RECOMMENDED_ARGS% -javaagent:..\tools\byteman\lib\byteman.jar=listener:true"
#

rem --------------------------------------------------------------------------
rem
rem The following 2 settings control the minimum and maximum given to the Bamboo Java virtual machine.  In larger Bamboo instances, the maximum amount will need to be increased.
rem
rem --------------------------------------------------------------------------
set JVM_MINIMUM_MEMORY=512m
set JVM_MAXIMUM_MEMORY=1024m

rem --------------------------------------------------------------------------
rem
rem The following are the required arguments need for Bamboo standalone.
rem
rem --------------------------------------------------------------------------
set JVM_REQUIRED_ARGS=-Djava.awt.headless=true -Datlassian.standalone=BAMBOO

rem --------------------------------------------------------------------------
rem
rem In general don't make changes below here
rem
rem --------------------------------------------------------------------------

set _PRG_DIR=%~dp0
type "%_PRG_DIR%\bamboobanner.txt"

set BAMBOO_HOME_MINUSD=
IF "x%BAMBOO_HOME%x" == "xx" GOTO NOBAMBOOHOME
     set BAMBOO_HOME_MINUSD=-Dbamboo.home="%BAMBOO_HOME%"
:NOBAMBOOHOME

set JAVA_OPTS=%JAVA_OPTS% -Xms%JVM_MINIMUM_MEMORY% -Xmx%JVM_MAXIMUM_MEMORY% %JVM_REQUIRED_ARGS% %JVM_SUPPORT_RECOMMENDED_ARGS% %BAMBOO_HOME_MINUSD%


rem Checks if the JAVA_HOME has a space in it (can cause issues)
SET _marker="x%JAVA_HOME%"
SET _marker=%_marker: =%
IF NOT %_marker% == "x%JAVA_HOME%" ECHO JAVA_HOME "%JAVA_HOME%" contains spaces. Please change to a location without spaces if this causes problems.

echo.
echo If you encounter issues starting or stopping Bamboo Server, please see the Troubleshooting guide at https://confluence.atlassian.com/display/BAMBOO/Installing+Bamboo+on+Windows
echo.
IF "x%BAMBOO_HOME%x" == "xx" GOTO NOBAMBOOHOME2
    echo Using BAMBOO_HOME:       %BAMBOO_HOME%
:NOBAMBOOHOME2
