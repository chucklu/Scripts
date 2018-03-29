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
rem echo current folder 
set /a repositoryCount+=1
echo !repositoryCount! %cd%
git remote -v 
echo Fetch Started: %date% %time%
git fetch --all
echo Fetch Completed: %date% %time%
echo.
)
Call :CountSubFolders "%~1",value2
rem echo %~1  111
if !value2! == 0 (
rem echo "%~1" sub folder count is zero, chuckchuck
exit /b 0
) else (
for /d %%i in ("%~1"\*) do (
rem echo %%i 222
cd "%%~i"
rem echo 333
Call :GitFetch "%%~i"
rem echo 666
rem cd
cd ..
rem echo 444
rem cd
rem echo 555
rem for
) 
rem else end
) 
rem echo 777
exit /b %ERRORLEVEL%

:CountSubFolders
set "count=0"
rem echo %~1  111
rem echo %cd% 222
rem echo CountSubFolders "%~1"
cd "%~1"
rem echo CountSubFolders 111
rem echo %cd% 333
for /d %%i in (*) do (
rem echo subfolder %%i
set /a count+=1)
rem echo %count% 444
rem echo CountSubFolders 333
rem echo %count%
set "%~2=%count%"
rem echo CountSubFolders 444
cd..
rem echo CountSubFolders 222
exit /b %ERRORLEVEL%