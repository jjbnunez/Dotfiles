##############
# powershell #
##############

$isScoopInstalled = ($null -ne (Get-Command scoop -ErrorAction Ignore))
$isOhMyPoshInstalled = ($null -ne (Get-Command oh-my-posh -ErrorAction Ignore))

if (-not $isScoopInstalled) {
    Write-Error "ABORT! scoop not found among commands. Is scoop installed?"
} else {
    if (-not $isOhMyPoshInstalled) {
        scoop install oh-my-posh
    } else {
        scoop update oh-my-posh
    }
}

Write-Host "Updating PowerShell profile... " -NoNewLine
$profileSource = "$env:DOTFILES\powershell\profile.ps1"
$profileTarget = "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
$profileTargetVSCode = "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.VSCode_profile.ps1"

#The New-Item call below looks redundant but it forces subdirectory creation whereas Copy-Item doesn't
New-Item -Force -ItemType File -Path "$profileTarget" | Out-Null 
Copy-Item -Path "$profileSource" -Destination "$profileTarget" -Force | Out-Null
Copy-Item -Path "$profileSource" -Destination "$profileTargetVSCode" -Force | Out-Null
Write-Host "OK"
