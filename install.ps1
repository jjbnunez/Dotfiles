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
 #
 ##

try {

    ############
    # env vars #
    ############

    Write-Host "Updating env vars... " -NoNewLine
    [Environment]::SetEnvironmentVariable("DOTFILES", "$env:USERPROFILE\Dotfiles", "User")
    [Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "$env:LOCALAPPDATA", "User")
    [Environment]::SetEnvironmentVariable("EDITOR", "nvim", "User")
    $env:DOTFILES = [Environment]::GetEnvironmentVariable("DOTFILES", "User")
    $env:XDG_CONFIG_HOME = [Environment]::GetEnvironmentVariable("XDG_CONFIG_HOME", "User")
    $env:EDITOR = [Environment]::GetEnvironmentVariable("EDITOR", "User")
    Write-Host "OK"


    #########
    # scoop #
    #########

    $isScoopInstalled = ($null -ne (Get-Command scoop -ErrorAction Ignore))
    if (-not $isScoopInstalled) {
        # install scoop
        Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
        
        # 7zip and git (NEEDED FOR BUCKET MANAGEMENT)
    	scoop install 7zip
        scoop install git
        git config --system --unset credential.helper
        
    	# add extras bucket
    	scoop bucket rm main
    	scoop bucket add main
    	scoop bucket add extras

        # oh-my-posh
        scoop install oh-my-posh
        
        # python
        scoop install python

        # nodejs (& yarn)
        scoop install nodejs-lts
        npm install --global yarn

        # neovim
        scoop install neovim
        pip install --user wheel
        pip install --user pynvim
        npm install --global neovim

    	# vscode
    	scoop install vscode

        # scoop updates
        scoop update
        scoop update *
        Write-Host "OK"
    } else {

        # scoop updates
        scoop update
        scoop update *        
    }


    ##############
    # powershell #
    ##############

    Write-Host "Updating powershell profile..." -NoNewLine
    $profileSource = "$env:DOTFILES\powershell\profile.ps1"
    $profileTarget = "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
    #The New-Item call below looks redundant but it forces subdirectory creation whereas Copy-Item doesn't
    New-Item -Force -ItemType File -Path "$profileTarget" | Out-Null 
    Copy-Item -Path "$profileSource" -Destination "$profileTarget" -Force | Out-Null
    Write-Host "OK"


    ########
    # nvim #
    ########

    Write-Host "Updating nvim config and plugin manager..." -NoNewLine
    Get-Content -Raw "$env:DOTFILES\nvim\init.vim" | New-Item -Force -Path "$env:XDG_CONFIG_HOME\nvim\init.vim" | Out-Null
    New-Item -Force -ItemType Directory -Path "$env:XDG_CONFIG_HOME\nvim\undo" | Out-Null
    $vimplug = Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    $vimplug | New-Item -Force -ItemType File -Path "$env:XDG_CONFIG_HOME\nvim-data\site\autoload\plug.vim" | Out-Null
    Write-Host "OK"

    # Update nvim plugins
    nvim --noplugin +PlugUpdate +qa

    
    #########
    # FINAL #
    #########

    Write-Host "Done!"
    Write-Warning "Restart your Windows Terminal process for changes to take full effect!"
}

catch {
    Write-Host $_.Exception.Message -Foreground "Red"
    Write-Host $_.ScriptStackTrace -Foreground "DarkGray"
}
