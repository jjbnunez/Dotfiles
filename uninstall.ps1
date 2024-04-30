##
# JJ's dotfile installer script
# =============================
#
# This is a dotfile installer script for development
# tools that are convenient to my workflow on Windows
# machines.
#
# If you want to learn how to similarly build one for
# yourself, let me know and I'll happily share resources.
##

try {
    # First, check if winget is installed
    if (-not ($null -ne (Get-Command winget -ErrorAction Ignore))) {
        # See https://learn.microsoft.com/en-us/windows/package-manager/winget/ for installation instructions
        # We do this in case you just logged into your profile for the first time on Windows 10 moments ago
        #Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe
        Write-Warning "For some reason, WinGet is not installed. Please consult the following resource to install it:"
        Write-Warning "    https://learn.microsoft.com/en-us/windows/package-manager/winget/"
        throw "Please ensure WinGet is installed first and accessible by your shell before running this script."
    }
    
    $DotfilesDirectory = "$env:USERPROFILE\Dotfiles"

    $Directories = Get-ChildItem -Path "$DotfilesDirectory" -Directory

    $Directories | ForEach-Object {
        $BaseName = $_.BaseName
        $Path = "$DotfilesDirectory\$BaseName\uninstall.ps1"
        if (Test-Path $Path) {
            . $Path
        }
    }

    Write-Host "Done!"
    Write-Warning "Restart your Windows Terminal process for changes to take full effect!"
}

catch {
    Write-Host $_.Exception.Message -Foreground "Red"
    Write-Host $_.ScriptStackTrace -Foreground "DarkGray"
}
