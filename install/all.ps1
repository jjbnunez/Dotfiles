##
 # JJ's dotfile installer script
 # =============================
 #
 # This is a dotfile installer script for development
 # tool configs that are convenient to my workflow on
 # Windows machines.
 #
 # If you want to learn how to similarly build one for
 # yourself, let me know and I'll happily share resources.
 ##

try {
    
    . .\install_envvars.ps1

    . .\install_scoop.ps1

    . .\install_psprofile.ps1

    . .\install_nvimconf.ps1  

    Write-Host "Done!"
    Write-Warning "Restart your Windows Terminal process for changes to take full effect!"
}

catch {
    Write-Host $_.Exception.Message -Foreground "Red"
    Write-Host $_.ScriptStackTrace -Foreground "DarkGray"
}
