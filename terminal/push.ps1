Write-Host 'Attempting to push Windows Terminal settings file...'
. $PSScriptRoot\paths.ps1
# The New-Item call below looks redundant but it
# forces subdirectory creation whereas Copy-Item
# doesn't.
New-Item -Force -ItemType File -Path "$Target"
Copy-Item -Path "$Source" -Destination "$Target" -Force | Out-Null
Write-Host 'OK'
