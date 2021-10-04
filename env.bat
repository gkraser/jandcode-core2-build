@echo off

set JAVA_HOME=w:\pf\jdk17
set JC_RUN=%~dp0\bin\jc2\jc-run.bat
set JC_JVM=

rem ---------------------------------------------------------------
if exist %~dp0\_env.bat call %~dp0\_env.bat
rem ---------------------------------------------------------------

set PATH=%JAVA_HOME%\bin;%PATH%
