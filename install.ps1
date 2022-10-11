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
    . .\envvars\install.ps1
    . .\scoop\install.ps1
    . .\powershell\install.ps1
    . .\nvim\install.ps1  

    Write-Host "Done!"
    Write-Warning "Restart your Windows Terminal process for changes to take full effect!"
}

catch {
    Write-Host $_.Exception.Message -Foreground "Red"
    Write-Host $_.ScriptStackTrace -Foreground "DarkGray"
}
