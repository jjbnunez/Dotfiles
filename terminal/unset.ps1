Write-Host "Attempting to unset Windows Terminal settings file..."
if (Test-Path $Target) {
    New-Item -Force -ItemType File -Path "$Target" | Out-Null
}
Write-Host "OK"
