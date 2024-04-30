########
# nvim #
########

$isScoopInstalled = ($null -ne (Get-Command scoop -ErrorAction Ignore))
$isNvimInstalled = ($null -ne (Get-Command nvim -ErrorAction Ignore))

if (-not $isScoopInstalled) {
    Write-Error "ABORT! scoop not found among commands. Is scoop installed?"
}
else {
    if (-not $isNvimInstalled) {
        scoop install neovim
        pip install --user wheel
        pip install --user pynvim
        npm install --global neovim
    }
    else {
        scoop update neovim
    }
}

# neovim
Write-Host "Updating nvim config and plugin manager... " -NoNewLine
Get-Content -Raw "$env:DOTFILES\nvim\init.vim" | New-Item -Force -Path "$env:XDG_CONFIG_HOME\nvim\init.vim" | Out-Null
New-Item -Force -ItemType Directory -Path "$env:XDG_CONFIG_HOME\nvim\undo" | Out-Null
$vimplug = Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
$vimplug | New-Item -Force -ItemType File -Path "$env:XDG_CONFIG_HOME\nvim-data\site\autoload\plug.vim" | Out-Null
Write-Host "OK"

# Update nvim plugins
nvim --noplugin +PlugUpdate +qa
