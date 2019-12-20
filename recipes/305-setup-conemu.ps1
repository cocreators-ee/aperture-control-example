# First figure out if we need to update the files
$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent -Resolve
$filesDir = (Split-Path -Path $scriptDir -Resolve) + "\files"

# Put the configuration and other files in place
Copy-Item "$filesDir\ConEmu.xml" "$env:APPDATA\ConEmu.xml" -Force
Copy-Item "$filesDir\ConemuInit.cmd" "$env:USERPROFILE\ConemuInit.cmd" -Force
