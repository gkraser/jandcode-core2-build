@echo off

SetLocal EnableExtensions EnableDelayedExpansion

set JC_ENV_FILE=jc-env.bat

set OSCM_TMP=%*
set OSCM=%OSCM_TMP:~1%

:: setup env

call :findup _%JC_ENV_FILE% %JC_ENV_FILE% _jc\%JC_ENV_FILE%
if exist %~dp0%JC_ENV_FILE% set FINDUP_RET=%~dp0%JC_ENV_FILE% %FINDUP_RET%

if "%FINDUP_RET%"=="" (
  echo ERROR: %JC_ENV_FILE% not found in folder %CD% and up and in folder %~dp0
  exit /b 1
)
set JC_ENV_FILE_LIST=%FINDUP_RET%

for %%I in (%FINDUP_RET%) do (
  call %%I
)

:: run command

if "%1"=="@" (
  call %OSCM%
  if errorlevel 1 exit /b !ERRORLEVEL!
) else (
  if "%JC_RUN%"=="" (
    echo ERROR: JC_RUN variable not set in %FINDUP_RET% from folder %~dp0
    exit /b 1
  )
  call %JC_RUN% %*
  if errorlevel 1 exit /b !ERRORLEVEL!
)

goto :end

:: =================================================
:: call:abspath RELATIVE_PATH
:: absolute path in ABSPATH_RET
:: =================================================
:abspath
set ABSPATH_RET=%~dpfn1
exit /B

:: =================================================
:: call:findup WHAT_FIND1 WHAT_FIND2 ...
:: list found files in FINDUP_RET
:: =================================================
:findup
set FINDUP_RET=
call:abspath .\
set CWD=%ABSPATH_RET%

:findup__nextstep
for %%I in (%*) do (
  call:abspath %CWD%%%I
  set FND=!ABSPATH_RET!
  if exist !FND! (
    set FINDUP_RET=!FND! !FINDUP_RET!
  )
)
set CWD_PREV=%CWD%
call:abspath %CWD%..\
set CWD=%ABSPATH_RET%
if "%CWD%"=="%CWD_PREV%" (
  exit /b 0
)
goto findup__nextstep

:end
