##
 # JJ's dotfile uninstaller script
 # ===============================
 #
 # This script uninstalls and cleans up the changes
 # that my dotfile installer script makes.
 #
 ##

try {

    ############
    # env vars #
    ############

    Write-Host "Removing env vars..." -NoNewLine
    [Environment]::SetEnvironmentVariable("DOTFILES", $null, "User")
    [Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", $null, "User")
    [Environment]::SetEnvironmentVariable("EDITOR", $null, "User")
    Write-Host "OK"


    #########
    # scoop #
    #########

    $scoopIsInstalled = ($null -ne (Get-Command scoop -ErrorAction Ignore))
    if ($scoopIsInstalled) {

        # neovim provider
        pip uninstall --yes pynvim
        pip uninstall --yes wheel

        # final scoop uninstall
        scoop uninstall scoop
    }

    
    ##############
    # powershell #
    ##############

    Write-Host "Removing PowerShell profile..." -NoNewLine
    $profileTarget = "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
    if (Test-Path $profileTarget) {
        New-Item -Force -ItemType File -Path "$profileTarget" | Out-Null
    }
    Write-Host "OK"
    
    
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
