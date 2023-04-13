function Get-BiosDetails {
	param($Computer)  
	
	$output = "" | Select-Object ComputerName, ComputerModel, BIOSVersion, SerialNumber
	$CimInstanceBios = Get-CimInstance -Class Win32_BIOS -ComputerName $Computer
	$CimInstanceComputer = Get-CimInstance -ClassName Win32_ComputerSystem -ComputerName $Computer
	$output.ComputerName = $Computer.ToUpper()
	$output.ComputerModel = $CimInstanceComputer.Model
	$output.BIOSVersion = $CimInstanceBios.SMBIOSBIOSVersion
	$output.SerialNumber = $CimInstanceBios.SerialNumber
	
	$output
}