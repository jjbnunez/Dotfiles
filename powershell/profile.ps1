$DOTFILES = "$env:DOTFILES"
$XDG_CONFIG_HOME = "$env:XDG_CONFIG_HOME"
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/agnosterplus.omp.json" | Invoke-Expression