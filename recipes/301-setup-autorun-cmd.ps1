# First figure out if we need to update the files
$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent -Resolve
$filesDir = (Split-Path -Path $scriptDir -Resolve) + "\files"

Copy-Item "$filesDir\init.cmd" "$env:USERPROFILE\init.cmd" -Force
