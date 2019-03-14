function Reset-FolderTime {
    Param(
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String]
        $targetDir)
    Get-ChildItem -Path $targetDir -Recurse | Foreach-Object {
        $_.LastWriteTime = Get-Date
    }
}

function Convert-EncodingToUTF8NoBOM{
    Param(
        [parameter(Mandatory = $false)]
        [String]
        $targetDir = '.',
        [parameter(Mandatory = $false)]
        $extension = '*')
        $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
        $files =  Get-ChildItem -Path $targetDir -Filter $extension
        foreach($file in $files)
        {
          #$file.Name
          $fileContent = Get-Content -Path $file.Name
          [System.IO.File]::WriteAllLines($file.Name, $fileContent, $Utf8NoBomEncoding)
        }
}