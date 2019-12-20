if (Get-Command choco.exe -ErrorAction SilentlyContinue) {
    Write-Output "Chocolatey already installed, upgrading instead."
    choco.exe upgrade -y chocolatey
} else {
    Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
