# Tools to manipulate your system-wide and user-specific PATH
#
# You can add PATH entries to the top or bottom of the list, or remove extra ones
#
# To manipulate user's PATH:
# user_top(@("c:\path", "c:\path2"))
# user_bottom(@("c:\path", "c:\path2"))
# user_remove(@("c:\path", "c:\path2"))
#
# To manipulate system's PATH:
# system_top(@("c:\path", "c:\path2"))
# system_bottom(@("c:\path", "c:\path2"))
# system_remove(@("c:\path", "c:\path2"))
#
# If the paths already exist in the list, the existing entries are removed, so you
# don't have to worry about first removing duplicates.
#
# The comparison is case-insensitive, so c:\path is the same as C:\Path


# ---------------- #
# Define functions #
# ---------------- #

# Add/move items to the start of a list
function list_top([string[]]$topItems, [string[]]$list) {
    # Filter away entry items, just in case
    $topItems = $topItems | Where-Object {$_}
    $list = $list | Where-Object {$_}

    $newList = New-Object System.Collections.ArrayList

    # Add desired items to the top
    if ($topItems) {
        foreach ($item in $topItems) {
            $newList.Add($item.Trim()) | Out-Null
        }
    }

    # Then the rest
    if ($list) {
        foreach ($item in $list) {
            # Skip items already added to the top
            if ($topItems) {
                if ($topItems.Contains($item)) {
                    continue
                }
            }

            $newList.Add($item.Trim()) | Out-Null
        }
    }

    return $newList
}

# Add/move items to the bottom of a list
function list_bottom([string[]]$bottomItems, [string[]]$list) {
    # Filter away entry items, just in case
    $bottomItems = $bottomItems | Where-Object {$_}
    $list = $list | Where-Object {$_}

    $newList = New-Object System.Collections.ArrayList

    # Add everything else
    if ($list) {
        foreach ($item in $list) {
            # Skip items going to the bottom
            if ($bottomItems) {
                if ($bottomItems.Contains($item)) {
                    continue
                }
            }

            $newList.Add($item.Trim()) | Out-Null
        }
    }

    # Add desired items to bottom
    if ($bottomItems) {
        foreach ($item in $bottomItems) {
            $newList.Add($item.Trim()) | Out-Null
        }
    }

    return $newList
}

# Remove items from a list
function list_remove([string[]]$removeItems, [string[]]$list) {
    # Filter away entry items, just in case
    $removeItems = $removeItems | Where-Object {$_}
    $list = $list | Where-Object {$_}

    $newList = New-Object System.Collections.ArrayList
    if ($list) {
        foreach ($item in $list) {
            if ($removeItems) {
                if ($removeItems.Contains($item)) {
                    continue
                }
            }
            $newList.Add($item.Trim()) | Out-Null
        }
    }
    
    return $newList
}

# Add/move paths to the top of user's PATH
function user_top([string[]]$paths) {
    $reg = "Registry::HKCU\Environment"
    $oldPath = (Get-ItemProperty -Path "$reg" -Name PATH).Path
    $newPath = (list_top $paths $oldPath.Split(";")) -Join ";"
    Set-ItemProperty -Path "$reg" -Name PATH -Value "$newPath"
}

# Add/move paths to the bottom of user's PATH
function user_bottom([string[]]$paths) {
    $reg = "Registry::HKCU\Environment"
    $oldPath = (Get-ItemProperty -Path "$reg" -Name PATH).Path
    $newPath = (list_bottom $paths $oldPath.Split(";")) -Join ";"
    Set-ItemProperty -Path "$reg" -Name PATH -Value "$newPath"
}

# Remove paths from user's PATH
function user_remove([string[]]$paths) {
    $reg = "Registry::HKCU\Environment"
    $oldPath = (Get-ItemProperty -Path "$reg" -Name PATH).Path
    $newPath = (list_remove $paths $oldPath.Split(";")) -Join ";"
    Set-ItemProperty -Path "$reg" -Name PATH -Value "$newPath"
}

# Add/move paths to the top of system-wide PATH
function system_top([string[]]$paths) {
    $reg = "Registry::HKLM\System\CurrentControlSet\Control\Session Manager\Environment"
    $oldPath = (Get-ItemProperty -Path "$reg" -Name PATH).Path
    $newPath = (list_top $paths $oldPath.Split(";")) -Join ";"
    Set-ItemProperty -Path "$reg" -Name PATH -Value "$newPath"
}

# Add/move paths to the bottom of system-wide PATH
function system_bottom([string[]]$paths) {
    $reg = "Registry::HKLM\System\CurrentControlSet\Control\Session Manager\Environment"
    $oldPath = (Get-ItemProperty -Path "$reg" -Name PATH).Path
    $newPath = (list_bottom $paths $oldPath.Split(";")) -Join ";"
    Set-ItemProperty -Path "$reg" -Name PATH -Value "$newPath"
}

# Remove paths from system-wide PATH
function system_remove([string[]]$paths) {
    $reg = "Registry::HKLM\System\CurrentControlSet\Control\Session Manager\Environment"
    $oldPath = (Get-ItemProperty -Path "$reg" -Name PATH).Path
    $newPath = (list_remove $paths $oldPath.Split(";")) -Join ";"
    Set-ItemProperty -Path "$reg" -Name PATH -Value "$newPath"
}

# ----------------- #
# Functions defined #
# ----------------- #

# -------- #
# Examples #
# -------- #
#
# You may or may not want to use these as-is
# They are here just for demonstration purposes
#

# Figure out latest Java JRE version installed
$java = ((Get-ChildItem "C:\Program Files\Java\" -Filter "jre*") | Sort-Object)[-1]

system_top(@(
    "C:\Python38",
    "C:\Python38\Scripts",
    "C:\Python27",
    "C:\Python27\Scripts",
    "C:\ProgramData\chocolatey\bin",
    "C:\Program Files\Java\$java\bin",
    "" # To make it so entries above can all have trailing commas
))

system_bottom(@(
    "" # To make it so entries above can all have trailing commas
))

system_remove(@(
    "" # To make it so entries above can all have trailing commas
))

user_top(@(
    "$env:USERPROFILE\bin",
    "$env:USERPROFILE\.pyenv\pyenv-win\bin",
    "$env:USERPROFILE\.pyenv\pyenv-win\shims",
    "C:\Go\bin",
    "C:\source\go\bin",
    "C:\tools\cygwin\sbin",
    "C:\tools\cygwin\usr\sbin",
    "C:\tools\cygwin\bin",
    "C:\tools\cygwin\usr\local\bin",
    "" # To make it so entries above can all have trailing commas
))

user_bottom(@(
    "" # To make it so entries above can all have trailing commas
))

user_remove(@(
    "$env:USERPROFILE\AppData\Local\Microsoft\WindowsApps",
    "" # To make it so entries above can all have trailing commas
))
