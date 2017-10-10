@echo off

rem Environment variables are local only and thus forgotten when script exits
setlocal

title msbuilr
set MSBUILD="C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\MSBuild.exe"
rem Please make sure this bat file is executed under the solution folder
set ROOT=.
if not exist %MSBUILD% goto :requirements_missing

:build
set LOG=clean.log
if exist %LOG% del %LOG%
date /T > %LOG%
time /T >> %LOG%

set WHAT=*.sln
for /r %ROOT% %%i in (%WHAT%) do (
  echo Cleaning: %%~ni [%%i]
  call %MSBUILD% %%i /t:clean >> %LOG% 2>&1
  rem Can you read the return code of call?
)

if "%1" == "all" (
  set WHAT=*.sln
) else (
  if "%1" == "" (
    set WHAT=*.sln
  ) else (
    set WHAT=*%1.sln
  )
)

set LOG=build.log
date /T > %LOG%
time /T >> %LOG%

echo %MSBUILD%
echo %WHAT%

for /r %ROOT% %%i in (%WHAT%) do (
  echo Building: %%~ni [%%i]
  call %MSBUILD% %%i /nologo /verbosity:normal >> %LOG% 2>&1
  rem Can you read the return code of call?
)
goto end

:requirements_missing
echo ###############################################################################
echo  Ooops! You don't seem to have MSBuild or you have the wrong version.
echo  Was looking for:
echo   %MSBUILD%
echo ###############################################################################
goto end

:nothing_to_do
echo Please specify a target or 'all'.
:goto end

:end

echo Mission Completed