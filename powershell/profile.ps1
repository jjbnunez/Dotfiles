$DOTFILES = "$env:DOTFILES"
$XDG_CONFIG_HOME = "$env:XDG_CONFIG_HOME"
Set-PSReadLineKeyHandler -Chord Ctrl+d -Function DeleteCharOrExit
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/spaceship.omp.json" | Invoke-Expression
