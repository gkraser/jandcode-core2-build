@echo off
call %~dp0\env.bat
call %JC_RUN% -f:%~dp0builder.jc %*

