function associate([string]$extension, [string]$executable) {
    if (-not (Test-Path $executable))
    {
        $errorMessage = "`'$executable`' does not exist, not able to create association"

        throw $errorMessage
    }

    $extension = $extension.trim()
    if (-not ($extension.StartsWith(".")))
    {
        $extension = ".$extension"
    }

    $fileType = Split-Path $executable -leaf
    $fileType = $fileType.Replace(" ", "_")
    $elevated = @"
        cmd /c "assoc $extension=$fileType"
        cmd /c "ftype $fileType=""$executable"" ""%1"" ""%*"""
        New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
        Set-ItemProperty -Path "HKCR:\$fileType" -Name "(Default)" -Value "$fileType file" -ErrorAction Stop
"@
    Invoke-Expression $elevated
}

associate ".ppk" "C:\ProgramData\chocolatey\bin\PAGEANT.EXE"
