@echo off
echo Mission Started: %date% %time%
setlocal EnableDelayedExpansion
set repositoryCount=0
Call :RecursiveFolders %cd%
echo Mission Completed: %date% %time%
Exit /B 0

:RecursiveFolders
IF EXIST .git (
Call :GitFetch
)
Call :CountSubFolders "%~1",value2
if not !value2! == 0 (
for /d %%i in ("%~1"\*) do (
cd "%%~i"
Call :RecursiveFolders "%%~i"
cd ..
) 
)
exit /b %ERRORLEVEL%

:GitFetch
set /a repositoryCount+=1
echo !repositoryCount! %cd%
git remote -v 
echo Fetch Started: %date% %time%
git fetch --all
echo Fetch Completed: %date% %time%
echo.
exit /b %ERRORLEVEL%


:CountSubFolders
set "count=0"
cd "%~1"
for /d %%i in (*) do (
set /a count+=1)
set "%~2=%count%"
cd..
exit /b %ERRORLEVEL%