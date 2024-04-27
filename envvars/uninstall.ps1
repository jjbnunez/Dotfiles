Write-Host "Attempting to unset environment variables..."

# Unset the environment variables
[Environment]::SetEnvironmentVariable("DOTFILES", $null, "User")
[Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", $null, "User")
#[Environment]::SetEnvironmentVariable("EDITOR", $null, "User")

# Read the environment variables in for the current session
$env:DOTFILES = $null
$env:XDG_CONFIG_HOME = $null
#$env:EDITOR = $null

Write-Host "OK"