Write-Host "Attempting to set environment variables..."

# Set the environment variables
[Environment]::SetEnvironmentVariable("HOME", "$env:USERPROFILE", "User")
[Environment]::SetEnvironmentVariable("DOTFILES", "$env:USERPROFILE\Dotfiles", "User")

# Read the environment variables in for the current session
$env:HOME = [Environment]::GetEnvironmentVariable("HOME", "User")
$env:DOTFILES = [Environment]::GetEnvironmentVariable("DOTFILES", "User")

Write-Host "OK"
