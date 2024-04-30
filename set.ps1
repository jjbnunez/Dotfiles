##
# JJ's dotfile setter script
# ==========================
#
# This is a dotfile setter script for development
# tool configs that are convenient to my workflow on
# Windows machines.
#
# If you want to learn how to similarly build one for
# yourself, let me know and I'll happily share resources.
##

try {
    $DotfilesDirectory = "$env:USERPROFILE\Dotfiles"

    $Directories = Get-ChildItem -Path "$DotfilesDirectory" -Directory

    $Directories | ForEach-Object {
        $BaseName = $_.BaseName
        $Path = "$DotfilesDirectory\$BaseName\set.ps1"
        if (Test-Path $Path) {
            . $Path
        }
    }

    Write-Host "Done!"
    Write-Warning "Restart this shell for changes to take full effect!"
}

catch {
    Write-Host $_.Exception.Message -Foreground "Red"
    Write-Host $_.ScriptStackTrace -Foreground "DarkGray"
}
