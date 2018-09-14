function ConvertTo-ResourceDll
{
Param(
[parameter(Mandatory=$true)]
[ValidateNotNullOrEmpty()]
[String]
$targetDir,
[parameter(Mandatory=$true)]
[ValidateNotNullOrEmpty()]
[String]
$targetName,
[parameter(Mandatory=$true)]
[ValidateNotNullOrEmpty()]
[String]
$targetExt,
[parameter(Mandatory=$true)]
[ValidateNotNullOrEmpty()]
[String]
$languageCode)
#write-host $targetDir
#write-host $targetName
#write-host $targetExt
#write-host $languageCode

$env:Path = $env:Path + ';C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\Bin\'
$env:Path = $env:Path + ';C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.7.2 Tools\x64\'

$txt = "{0}{2}\{1}.txt" -f $targetDir,$targetName,$languageCode
# write-host $txt

ResGen $txt

$embed = "{0}{2}\{1}.resources" -f $targetDir,$targetName,$languageCode
$out = "{0}{2}\{1}.resources.dll" -f $targetDir,$targetName,$languageCode
# write-host $embed
# write-host $out

 $path = "{0}{1}{2}" -f $targetDir,$targetName,$targetExt
# write-host $path
$fileversion = (Get-Item $path).VersionInfo.FileVersion
# write-host $fileversion

al /t:lib /culture:en-US  /embed:$embed /out:$out /fileversion:$fileversion
}