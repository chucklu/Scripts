@echo off
echo Mission Started: %date% %time%
echo Mission Started: %date% %time% >fetch.log
setlocal EnableDelayedExpansion
set repositoryCount=0
Call :GitFetch %cd% >>fetch.log
echo Mission Completed: %date% %time% >>fetch.log
echo Mission Completed: %date% %time%
echo hello >>fetch.log
Exit /B 0

:GitFetch
IF EXIST .git (
set /a repositoryCount+=1
echo !repositoryCount! %cd%
git remote -v 
echo Fetch Started: %date% %time%
git fetch --all
echo Fetch Completed: %date% %time%
echo.
)
Call :CountSubFolders "%~1",value2
if not !value2! == 0 (
for /d %%i in ("%~1"\*) do (
cd "%%~i"
Call :GitFetch "%%~i"
cd ..
) 
)
exit /b %ERRORLEVEL%

:CountSubFolders
set "count=0"
cd "%~1"
for /d %%i in (*) do (
set /a count+=1)
set "%~2=%count%"
cd..
exit /b %ERRORLEVEL%