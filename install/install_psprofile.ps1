##############
# powershell #
##############

Write-Host "Updating powershell profile..." -NoNewLine
$profileSource = "$env:DOTFILES\powershell\profile.ps1"
$profileTarget = "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
#The New-Item call below looks redundant but it forces subdirectory creation whereas Copy-Item doesn't
New-Item -Force -ItemType File -Path "$profileTarget" | Out-Null 
Copy-Item -Path "$profileSource" -Destination "$profileTarget" -Force | Out-Null
Write-Host "OK"
