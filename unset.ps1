##
# JJ's dotfile unsetter script
# ============================
#
# This is a dotfile unsetter script for development
# tool configs that are convenient to my workflow on
# Windows machines.
#
# If you want to learn how to similarly build one for
# yourself, let me know and I'll happily share resources.
##

try {
    . .\powershell\unset.ps1
    . .\envvars\unset.ps1

    Write-Host "Done!"
    Write-Warning "Restart this shell for changes to take full effect!"
}

catch {
    Write-Host $_.Exception.Message -Foreground "Red"
    Write-Host $_.ScriptStackTrace -Foreground "DarkGray"
}
