##
# JJ's dotfile uninstaller script
# ===============================
#
# This script uninstalls and cleans up the changes
# that my dotfile installer script makes.
##

try {
    . .\envvars\uninstall.ps1
    . .\scoop\uninstall.ps1
    . .\powershell\install.ps1
    #. .\nvim\install.ps1

    ########
    # nvim #
    ########

    Write-Host "Removing nvim config and plugin manager..." -NoNewLine
    if (Test-Path "$env:LOCALAPPDATA\nvim") {
        Remove-Item -Recurse -Force -Path "$env:LOCALAPPDATA\nvim"
    }
    if (Test-Path "$env:LOCALAPPDATA\nvim-data") {
        Remove-Item -Recurse -Force -Path "$env:LOCALAPPDATA\nvim-data"
    }
    Write-Host "OK"


    #########
    # FINAL #
    #########

    Write-Host "Done!"
    Write-Warning "Restart your Windows Terminal process for changes to take full effect!"
}

catch {
    Write-Error $_ 
}
