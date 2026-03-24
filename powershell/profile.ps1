Set-PSReadLineKeyHandler -Chord Ctrl+d -Function DeleteCharOrExit

if ($null -ne (Get-Command oh-my-posh -ErrorAction Ignore)) {
    oh-my-posh init pwsh --config 'cert' | Invoke-Expression
}
