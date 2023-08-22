############
# env vars #
############

Write-Host "Removing env vars..." -NoNewLine

# Unset the environment variables
[Environment]::SetEnvironmentVariable("DOTFILES", $null, "User")
[Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", $null, "User")
[Environment]::SetEnvironmentVariable("EDITOR", $null, "User")

Write-Host "OK"