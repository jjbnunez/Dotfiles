############
# env vars #
############

Write-Host "Updating env vars... " -NoNewLine
[Environment]::SetEnvironmentVariable("DOTFILES", "$env:USERPROFILE\Dotfiles", "User")
[Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "$env:LOCALAPPDATA", "User")
[Environment]::SetEnvironmentVariable("EDITOR", "nvim", "User")
$env:DOTFILES = [Environment]::GetEnvironmentVariable("DOTFILES", "User")
$env:XDG_CONFIG_HOME = [Environment]::GetEnvironmentVariable("XDG_CONFIG_HOME", "User")
$env:EDITOR = [Environment]::GetEnvironmentVariable("EDITOR", "User")
Write-Host "OK"
