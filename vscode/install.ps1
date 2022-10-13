#
$isScoopInstalled = ($null -ne (Get-Command scoop -ErrorAction Ignore))
$isVscodeInstalled = ($null -ne (Get-Command code -ErrorAction Ignore))

if (-not $isScoopInstalled) {
    Write-Error "ABORT! scoop not found among commands. Is scoop installed?"
} else {
    if (-not $isVscodeInstalled) {
        scoop install vscode
    } else {
        scoop update vscode
    }
}
