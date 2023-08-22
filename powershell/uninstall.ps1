##############
# powershell #
##############

Write-Host "Removing PowerShell profile..." -NoNewLine

$profileTarget51 = "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
$profileTargetVSCode51 = "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.VSCode_profile.ps1"
$profileTarget7 = "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
$profileTargetVSCode7 = "$env:USERPROFILE\Documents\PowerShell\Microsoft.VSCode_profile.ps1"

if (Test-Path $profileTarget51) {
    New-Item -Force -ItemType File -Path "$profileTarget51" | Out-Null
}
if (Test-Path $profileTargetVSCode51) {
    New-Item -Force -ItemType File -Path "$profileTargetVSCode51" | Out-Null
}
if (Test-Path $profileTarget7) {
    New-Item -Force -ItemType File -Path "$profileTarget7" | Out-Null
}
if (Test-Path $profileTargetVSCode7) {
    New-Item -Force -ItemType File -Path "$profileTargetVSCode7" | Out-Null
}

Write-Host "OK"