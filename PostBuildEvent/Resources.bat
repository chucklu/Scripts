@echo off
set solutionDir=%~1
set targetDir=%~2
set targetName=%~3
set targetExt=%~4
set languageCode=%~5
set projectDir=%~6
rem you can execute the following command in post-build event directly
pwsh -file "%solutionDir%\powershell\Resources.ps1" "%solutionDir%" "%targetDir%" %targetName% %targetExt% %languageCode%