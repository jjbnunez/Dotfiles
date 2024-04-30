$scoopIsInstalled = ($null -ne (Get-Command scoop -ErrorAction Ignore))
if ($scoopIsInstalled) {

	# neovim provider
	pip uninstall --yes pynvim
	pip uninstall --yes wheel

	# final scoop uninstall
	scoop uninstall scoop
}