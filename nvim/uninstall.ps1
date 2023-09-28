Write-Host "Removing nvim config and plugin manager..." -NoNewLine
if (Test-Path "$env:LOCALAPPDATA\nvim") {
	Remove-Item -Recurse -Force -Path "$env:LOCALAPPDATA\nvim"
}
if (Test-Path "$env:LOCALAPPDATA\nvim-data") {
	Remove-Item -Recurse -Force -Path "$env:LOCALAPPDATA\nvim-data"
}
Write-Host "OK"
