# Example for Aperture Control - Windows environment automation

[Aperture Control](https://github.com/Lieturd/aperture-control) is a tool for automating various Windows environment configuration tasks, and this repository provides a good example of what might be considered a "standard base" to work from.

This has been tested on Windows 10 Professional. No promises about it working under anything else (but please do send feedback if you are successful in other environments as well).

See [Contributing Guidelines](./CONTRIBUTING.md) and [Code of Conduct](./CODE_OF_CONDUCT.md).

## How to run Aperture Control

You will likely want to fork this repo and edit the contents of `recipes` to match your needs. You can find a number of pre-made "recipes" to accomplish various tasks in [https://github.com/Lieturd/aperture-control-recipes](https://github.com/Lieturd/aperture-control-recipes).

To configure your system based on THIS repository run these commands in an PowerShell as Administrator:

```
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Lieturd/aperture-control/master/setup.ps1', 'setup.ps1')
.\setup.ps1 lieturd/aperture-control-example
```

**PLEASE NOTE:** Installing a lot of things with this may take a while, and your computer might launch or close various things you are already running. This is best run with a clean system, or right after starting Windows, and letting it do it's thing. Also restarting afterwards might be necessary to finish some installations, to activate various registry changes, and so on.


## What does it really do?

Check [Aperture Control](https://github.com/Lieturd/aperture-control) repository for technical details of Aperture Control itself, this describes what this repository's configuration accomplishes:

 - Installs [Chocolatey](https://chocolatey.org/) and [Scoop](https://scoop.sh) package managers, and then via them and other package managers installs:
    - **[7-Zip](https://www.7-zip.org)** - An archive manager
    - **[aria2](https://aria2.github.io)** - A download manager that can speed up e.g. Scoop
    - **[AWS CLI](https://aws.amazon.com/cli/) + [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest) + [Google Cloud SDK](https://cloud.google.com/sdk/)** - CLI utilities for the most popular cloud platforms
    - **[Chocolatey GUI](https://github.com/chocolatey/ChocolateyGUI)** - GUI for Chocolatey package management
    - **[ConEmu](https://conemu.github.io)** - A powerful terminal for Windows with tabs and lots of customization options
    - **[CPU-Z](https://www.cpuid.com/softwares/cpu-z.html) + [GPU-Z](https://www.techpowerup.com/gpuz/)** - CPU and GPU identification tools
    - **[Cygwin](https://www.cygwin.com) + [Cyg-Get](https://chocolatey.org/packages/cyg-get)** - Ports of various Linux utilities, GNU toolchain, and other such things for Windows + a CLI package manager
    - **[DejaVu Fonts](https://dejavu-fonts.github.io)** - Great free programmer friendly fonts
    - **[Docker CLI](https://docs.docker.com/engine/reference/commandline/cli/) + [Kubernetes CLI](https://kubernetes.io/docs/reference/kubectl/overview/) + [Helm](https://helm.sh) + [kubeval](https://github.com/instrumenta/kubeval) + [Minikube](https://github.com/kubernetes/minikube)** - Kubernetes and various other utilities for working with it and Docker containers in general
    - **[Dos2Unix](http://dos2unix.sourceforge.net/)** - CLI tool to convert DOS or Mac line endings to Unix line endings and vice versa
    - **[GIMP - GNU Image Manipulation Program](https://www.gimp.org)** - Free but powerful image editor
    - **[Git](https://git-scm.com) + [Fork (Git client)](https://git-fork.com) + [Mercurial](https://www.mercurial-scm.org) + [TortoiseSVN](https://tortoisesvn.net)** - Version control tools
    - **[Golang](https://golang.org) + [Python 3](https://www.python.org) + [Node.js](https://nodejs.org/) + [Yarn](https://yarnpkg.com/) + [pyenv-win](https://github.com/pyenv-win/pyenv-win) + [nvm-windows](https://github.com/coreybutler/nvm-windows)** - Various popular programming languages, version managers, and an alternative for NPM
    - **[Java 8 Runtime Environment](https://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html)** - Runtime for running Java 8 applications - NOTE: BY INSTALLING THIS YOU ARE ACCEPTING THEIR LICENSE!
    - **[Jetbrains Toolbox](https://www.jetbrains.com/toolbox-app/)** - Manager for JetBrains IDEs and other tools
    - **[jq](https://stedolan.github.io/jq/)** - CLI JSON prosessor
    - **[KiTTy](http://www.9bis.net/kitty/) + [PuTTY](https://putty.org) + [weasel-pageant](https://github.com/vuori/weasel-pageant)** - SSH etc. clients and related utilities
    - **[Microsoft .NET Framework 4.6.1](https://www.microsoft.com/en-us/download/details.aspx?id=49982)** - Libraries often required for running a lot of tools
    - **[Microsoft Visual C++ Build Tools 2015](https://www.microsoft.com/en-us/download/details.aspx?id=48159) + [Microsoft Visual C++ Runtime - all versions](https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads)** - Various dependencies for many many other things that you will no doubt end up installing at some point
    - **[MinGW](http://mingw.org)** - Another GNU environment for Windows, preferred for some reason by many other things for builds instead of CygWin
    - **[ScreenToGif](https://www.screentogif.com)** - Screen etc. recorder
    - **[ShutUp10](https://www.oo-software.com/en/shutup10)** - "Antispy" tool for Windows 10
    - **[SkyFonts](https://www.monotype.com/products/skyfonts)** - Convenient tool to install fonts from Google Fonts, MyFonts, Fonts.com and Mosaic
    - **[Sublime Text 3](https://www.sublimetext.com/3) + [Visual Studio Code](https://code.visualstudio.com)** - Free programmer editors / IDEs, depending a bit on your point of view 😄
    - **[Sysinternals Suite](https://docs.microsoft.com/en-us/sysinternals/downloads/sysinternals-suite) + [TreeSize Free](https://www.jam-software.com/treesize_free)** - Various system utilities
    - **[VirtualBox](https://www.virtualbox.org) + [Vagrant](https://www.vagrantup.com)** - Virtual Machine hypervisor + automation tools
    - **[WinMerge](https://winmerge.org)** - Excellent visual diff tool for Windows
    - **[WinSCP](https://winscp.net/eng/index.php)** - SFTP, FTP, SCP, etc. client
 - Sets up a few directories:
    - `%USERPROFILE%\bin` to store the small binary releases you get from GitHub etc. and don't know where else to put
    - `C:\Source` and `C:\Source\Go` for storing your projects' source code and acting as `GOPATH`
 - Configures various environment variables:
    - `GIT_SSH` to point to `plink.exe` for Git to work with Pageant from PuTTy
    - `GOPATH` to `C:\source\go`
    - `SLACK_DEVELOPER_MENU` to `true` to, well, enable a developer menu in Slack
    - `PATH` is manipulated in many ways, but in short `%USERPROFILE%\AppData\Local\Microsoft\WindowsApps` is removed and the following are added: `%USERPROFILE%\bin`, `C:\Python38`, `C:\Python38\Scripts`, `C:\ProgramData\chocolatey\bin`, `C:\Program Files\Java\jre<version>\bin`, `%USERPROFILE%\.pyenv\pyenv-win\bin`, `%USERPROFILE%\.pyenv\pyenv-win\shims`, `C:\Go\bin`, `C:\source\go\bin`, `C:\tools\cygwin\sbin`, `C:\tools\cygwin\usr\sbin`, `C:\tools\cygwin\bin`, `C:\tools\cygwin\usr\local\bin`
 - Sets file associations:
    - `*.ppk` files to open with Pageant
 - Sets up various software configurations:
    - Disables [Git autocrlf](https://stackoverflow.com/questions/2825428/why-should-i-use-core-autocrlf-true-in-git)
    - Disables Git "credential helper" that would otherwise cause various "Log in to GitHub" etc. screens to pop up unexpectedly
    - Sets up various [Windows 10 privacy enhancements](recipes/201-windows-10-privacy.cmd)
    - Tries to stop Windows Update from automatically rebooting the machine when you've got work to do or unsaved things
    - Sets Windows use the dark theme 😱
    - Windows Explorer etc. should show the file extensions always
    - A `%USERPROFILE%\init.cmd` ([source](files/init.cmd)) that will be run for every `cmd.exe` instances you launch to customize your environment, also the ConEmu default `ConInit.cmd` is disabled and `%USERPROFILE%\ConemuInit.cmd` is run instead (but by default it does nothing)
    - Minikube's update nag screens are disabled
    - ConEmu is configured to use the bundled [ConEmu.xml](files/ConEmu.xml) configuration (which you should edit to your liking and then export into your fork), and e.g. to use DejaVu Sans Mono font
 - And also:
    - Ensures [Hyper-V](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/) is DISABLED as it conflicts with VirtualBox and all other hypervisors + causes other griefs
    - Installs [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10) + [Ubuntu 18.04 LTS](https://www.microsoft.com/en-us/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab)

And as Aperture Control normally does, a scheduled task is set up to periodically check the repository for updates and to run them - this is one good reason you do not want to just use this repository blindly (and instead fork it and use that fork) as this repository will keep changing and probably not always to your liking 😄


## Words of warning

Do not blindly trust random scripts on the internet, including these. Check them for yourself, make sure you understand what is going on, and that you have reasonable reason to trust them and have control over what is running on your PC.

Do not use other people's repositories for your configuration, as they may change them, and the scripts can execute anything with administrator permissions without you noticing.


# License

Short answer: This software is licensed with the BSD 3-clause -license.

Long answer: The license for this software is in [LICENSE.md](./LICENSE.md), the other pieces of software installed and used have varying other licenses that you need to be separately aware of.
