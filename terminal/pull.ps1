Write-Host 'Attempting to pull Windows Terminal settings file...'
. $PSScriptRoot\paths.ps1
Copy-Item -Path "$Target" -Destination "$Source" -Force | Out-Null
Write-Host 'OK'
