function Install-FromWinGet {
	param (
		[Parameter(Mandatory)]
		[String] $Id
	)

	Write-Host "Attempting to install $Id from WinGet..."
	# "--id" limits the install to the ID of the application
	#
	# "--exact" uses the exact string in the query,
	#   including checking for case-sensitivity. It
	#   will not use the default behavior of a
	#   substring.
	#
	# "--source winget" restricts the search to
	#   the source name "winget". When using
	#   WinGet to install a package, you may
	#   encounter a Microsoft Store agreement.
	#   This is due to the way in which WinGet
	#   queries package manifest sources. If you
	#   prefer not to have the Microsoft Store
	#   policy popup when uninstalling, you can
	#   pass in "--source winget" to suppress
	#   the agreement.
	winget install --id $Id --exact --source winget
}

function Uninstall-FromWinGet {
	param (
		[Parameter(Mandatory)]
		[String] $Id
	)

	Write-Host "Attempting to remove $Id from WinGet..."
	# "--id" limits the install to the ID of the application
	#
	# "--exact" uses the exact string in the query,
	#   including checking for case-sensitivity. It
	#   will not use the default behavior of a
	#   substring.
	#
	# "--source winget" restricts the search to
	#   the source name "winget". When using
	#   WinGet to install a package, you may
	#   encounter a Microsoft Store agreement.
	#   This is due to the way in which WinGet
	#   queries package manifest sources. If you
	#   prefer not to have the Microsoft Store
	#   policy popup when uninstalling, you can
	#   pass in "--source winget" to suppress
	#   the agreement.
	winget uninstall --id $Id --exact --source winget
}