See the below string for generating the .psd1 file.

New-ModuleManifest -Path $env:DOTFILES\shared\MyHelperModule\MyHelperModule.psd1 -RootModule MyHelperModule -Author 'Jorge B Nunez' -Description 'MyHelperModule' -CompanyName 'jjnunez.me'