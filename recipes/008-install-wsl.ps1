# Install WSL
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart

# Download and install Ubuntu if necessary
$installed = [boolean](Get-AppxPackage | Select-String ubuntu)

if (-Not $installed) {
    Write-Output "Installing Ubuntu 18.04 LTS"
    $installer = "$env:USERPROFILE\Downloads\Ubuntu.appx"
    Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile $installer -UseBasicParsing
    Add-AppxPackage $installer
    Remove-Item $installer
} else {
    Write-Output "Ubuntu already installed."
}
