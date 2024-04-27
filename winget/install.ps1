if (-not ($null -ne (Get-Command winget -ErrorAction Ignore))) {
	# See https://learn.microsoft.com/en-us/windows/package-manager/winget/ for installation instructions
	# We do this in case you just logged into your profile for the first time on Windows 10 moments ago
	Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe
}
else {
	# winget is already installed
}
