Set-PSReadLineKeyHandler -Chord Ctrl+d -Function DeleteCharOrExit
if ($null -ne (Get-Command oh-my-posh -ErrorAction Ignore)) {
	oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/star.omp.json" | Invoke-Expression
}
