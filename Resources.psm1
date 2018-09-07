function ConvertTo-ResourceDll
{
Param(
[parameter(Mandatory=$true)]
[ValidateNotNullOrEmpty()]
[String]
$FullFileName,
[parameter(Mandatory=$true)]
[ValidateSet("Debug", "Release")]
[String]
$Mode)

$index = $FullFileName.LastIndexOf(".")
#write-host $index
$filename = $FullFileName.SubString(0,$index)
$path = "..\bin\{0}\{1}" -f $Mode,$FullFileName
$embed = "{0}.resources" -f $filename
$out = "{0}.dll" -f $filename
$fileversion = (Get-Item $path).VersionInfo.FileVersion
$txt = "{0}.txt" -f $filename

# write-host $path
# write-host $embed
# write-host $out
# write-host $fileversion

$env:Path = $env:Path + ';C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\Bin\'
$env:Path = $env:Path + ';C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.7.2 Tools\x64\'
ResGen $txt
al /t:lib /culture:en-US  /embed:$embed /out:$out /fileversion:$fileversion
}