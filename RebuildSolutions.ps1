$msBuild = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community-Preview\Common7\IDE\devenv.com"
$log = "build.log"
$solutionName = $args[0]
$mode = $args[1]
# "& $msBuild $solutionName /nologo -verbosity:normal /Rebuild $mode"
# -verbosity:normal is ot supported in vs 2019
& $msBuild $solutionName /nologo /Rebuild $mode >> $log 2>&1