Write-Host 'Attempting to push Windows Terminal settings file...'
. $PSScriptRoot\paths.ps1
Copy-Item -Path "$Source" -Destination "$Target" -Force | Out-Null
Write-Host 'OK'
