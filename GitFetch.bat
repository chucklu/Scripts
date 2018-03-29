@echo off
setlocal ENABLEDELAYEDEXPANSION
set repositoryCount=0
echo Mission Started: %date% %time%
for /d %%i in (*) do (
cd %%i
IF EXIST .git (
set /a repositoryCount+=1
echo !repositoryCount! %%i
git remote -v 
git fetch --all
echo.
)
cd ..
) 
echo Mission Completed: %date% %time%
exit /b 0

:CountSubFolders
set count=0
rem echo %~1  111
rem echo %cd% 222
cd %~1
rem echo %cd% 333
for /d %%i in (*) do (
rem echo subfolder %%i
set /a count+=1)
rem echo %count% 444
set "%~2=%count%"
cd..
exit /b %ErrorLevel%