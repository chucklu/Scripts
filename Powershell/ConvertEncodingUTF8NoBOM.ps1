#https://stackoverflow.com/questions/5596982/using-powershell-to-write-a-file-in-utf-8-without-the-bom/#answer-5596984
$files =  Get-ChildItem -Filter "*.sql"
$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
foreach($file in $files)
{
   #$file.Name
   $fileContent = Get-Content -Path $file.Name
   [System.IO.File]::WriteAllLines($file.Name, $fileContent, $Utf8NoBomEncoding)
}

