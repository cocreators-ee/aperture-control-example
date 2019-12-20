function user_env([string]$name, [string]$value) {
    [System.Environment]::SetEnvironmentVariable($name, $value, 'User')
    [System.Environment]::SetEnvironmentVariable($name, $value, 'Process')
}

function machine_env([string]$name, [string]$value) {
    [System.Environment]::SetEnvironmentVariable($name, $value, 'Machine')
    [System.Environment]::SetEnvironmentVariable($name, $value, 'Process')
}

# Make Git use Pageant for SSH keys
user_env GIT_SSH C:\ProgramData\chocolatey\bin\PLINK.EXE

# Path for Go sources etc.
user_env GOPATH C:\source\go

user_env SLACK_DEVELOPER_MENU true

