if ($PSVersionTable.PSVersion.Major -le 5) {
    Import-Module -Name $PSScriptRoot\..\shared\MyHelperModule
    Install-FromWinGet -Id "Microsoft.PowerShell"
} else {
    Write-Warning "You are currently using PowerShell Core. Use Windows PowerShell (version 5.1) to update PowerShell Core."
}