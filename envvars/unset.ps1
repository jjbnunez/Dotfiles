Write-Host "Attempting to unset environment variables..."

# Unset the environment variables
[Environment]::SetEnvironmentVariable("HOME", $null, "User")
[Environment]::SetEnvironmentVariable("DOTFILES", $null, "User")

# Read the environment variables in for the current session
$env:HOME = $null
$env:DOTFILES = $null

Write-Host "OK"
