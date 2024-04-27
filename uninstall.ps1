##
# JJ's dotfile uninstaller script
# ===============================
#
# This script uninstalls and cleans up the changes
# that my dotfile installer script makes.
##

try {
    . .\envvars\unset.ps1
    . .\scoop\uninstall.ps1
    . .\powershell\uninstall.ps1
    #. .\nvim\uninstall.ps1

    Write-Host "Done!"
    Write-Warning "Restart your Windows Terminal process for changes to take full effect!"
}

catch {
    Write-Host $_.Exception.Message -Foreground "Red"
    Write-Host $_.ScriptStackTrace -Foreground "DarkGray"
}
