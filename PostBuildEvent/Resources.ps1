$moduleDir = $args[0]
$targetDir = $args[1]
$targetName = $args[2]
$targetExt = $args[3]
$languageCode = $args[4]

$modulePath = "{0}powershell\Resources.psm1" -f $moduleDir
Import-Module $modulePath

ConvertTo-ResourceDll $targetDir $targetName $targetExt $languageCode