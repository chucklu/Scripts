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