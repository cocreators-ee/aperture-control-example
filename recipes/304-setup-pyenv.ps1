$pyenvPath = "$env:USERPROFILE/.pyenv"
$reg = "Registry::HKCU\Environment"
Set-ItemProperty -Path "$reg" -Name PYENV -Value "$pyenvPath"
$env:PYENV = [System.Environment]::GetEnvironmentVariable("PYENV", "User")

pip install pyenv-win --target $pyenvPath
pyenv --version
pyenv rehash
