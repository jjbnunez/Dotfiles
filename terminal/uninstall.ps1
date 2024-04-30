if ((Get-CimInstance Win32_OperatingSystem).Caption.Contains("Windows 11")) {
	Write-Warning "You are running Windows 11. The Windows Terminal comes installed by default, so this script will not uninstall it."
}
else {
	Import-Module -Name $PSScriptRoot\..\shared\MyHelperModule
	Uninstall-FromWinGet -Id "Microsoft.WindowsTerminal"
	
}
