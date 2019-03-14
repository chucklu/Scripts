function Reset-FolderTime {
  param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]
    $targetDir)
  Get-ChildItem -Path $targetDir -Recurse | ForEach-Object {
    $_.LastWriteTime = Get-Date
  }
}

function Convert-EncodingToUTF8NoBOM {
  param(
    [Parameter(Mandatory = $false)]
    [string]
    $targetDir = '.',
    [Parameter(Mandatory = $false)]
    $extension = '*')
  $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
  $files = Get-ChildItem -Path $targetDir -Filter $extension
  foreach ($file in $files)
  {
    #$file.Name
    $fileContent = Get-Content -Path $file.Name
    [System.IO.File]::WriteAllLines($file.Name,$fileContent,$Utf8NoBomEncoding)
  }
}
