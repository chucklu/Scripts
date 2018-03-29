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
echo Fetch Started: %date% %time%
git fetch --all
echo Fetch Completed: %date% %time%
echo.
)
cd ..
) 
echo Mission Completed: %date% %time%
exit /b 0

:CountSubFolders
set count=0
cd %~1
for /d %%i in (*) do (
set /a count+=1)
set "%~2=%count%"
cd..
exit /b %ErrorLevel%