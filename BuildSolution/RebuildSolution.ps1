$msBuild = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community-Preview\Common7\IDE\devenv.com"

$location = $PSScriptRoot

$folder = "{0}\Log" -f $location
$logFolderExists = Test-Path -Path $folder
If(!$logFolderExists)
{
    New-Item -ItemType Directory -Force -Path $folder
}
#$folder

$log = "build_{0}.log" -f (Get-Date).ToString("yyyyMMdd")
$log = Join-Path -Path $folder -ChildPath $log
$logFileExists = Test-Path -Path $log
if(!$logFileExists)
{
    New-Item $log
}
#$log

$solutionName = $args[0]
$mode = $args[1]
# "& $msBuild $solutionName /nologo -verbosity:normal /Rebuild $mode"
# -verbosity:normal is ot supported in vs 2019
$solutionPath = Join-Path -Path $location -ChildPath $solutionName
& $msBuild $solutionPath /nologo /Rebuild $mode >> $log 2>&1