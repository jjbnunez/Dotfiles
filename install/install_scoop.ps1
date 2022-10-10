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
