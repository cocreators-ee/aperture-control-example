# Install all the packages you want to use in other scripts

$chocoPackages = @(
	"7zip.install",
	"aria2",
	"awscli",
	"azure-cli",
	"chocolateygui",
	"conemu",
	"cpu-z.install",
	"cyg-get",
	"cygwin",
	"dejavufonts",
	"docker-cli",
	"dotnet4.6.1",
	"gcloudsdk",
	"gimp",
	"git-fork",
	"git.install",
	"gitkraken",
	"golang",
	"gpu-z",
	"hg",
	"jetbrainstoolbox",
	"jq",
	"jre8",
	"kitty",
	"kubernetes-cli",
	"kubernetes-helm",
	"kubeval",
	"mingw",
	"minikube",
	"nodejs.install",
	"nvm",
	"putty",
	"python3",
	"screentogif",
	"shutup10",
	"skyfonts",
	"sublimetext3",
	"sysinternals",
	"tortoisesvn",
	"treesizefree",
	"vcbuildtools",
	"vcredist-all",
	"virtualbox",
	"vscode",
	"weasel-pageant.portable",
	"winmerge",
	"winscp",
	"yarn"
)

$scoopPackages = @(
    "dos2unix"
)

scoop.cmd bucket add extras


# ----- LOGIC ----- #

# Check currently installed packages
$chocoInstalled = choco list --local-only -r | ForEach-Object {
    return $_.Split("|", 2)[0]
}

$scoopInstalled = scoop.cmd list | ForEach-Object {
    if ($_.StartsWith("  ")) {
        return $_.Trim().Split(" ", 2)[0]
    }
}

# Install packages
$chocoPackages | ForEach-Object {
    $pkg = $_
    if ($chocoInstalled -contains $pkg) {
        Write-Output "Already have $pkg installed."
    } else {
        choco.exe install -y $pkg
    }
}

$scoopPackages | ForEach-Object {
    $pkg = $_
    if ($scoopInstalled -contains $pkg) {
        Write-Output "Already have $pkg installed."
    } else {
        scoop.cmd install $pkg
    }
}


# TODO: kubeseal, kubernetic, kubebox
