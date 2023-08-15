#########
# scoop #
#########

$isScoopInstalled = ($null -ne (Get-Command scoop -ErrorAction Ignore))
if (-not $isScoopInstalled) {
    # install scoop
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
}

# 7zip and git (NEEDED FOR BUCKET MANAGEMENT)
scoop install 7zip
scoop install git
git config --global credential.helper manager-core

# add extras bucket
scoop bucket add extras

# python
scoop install python

# nodejs (& yarn)
scoop install nodejs-lts
npm install --global yarn

# flutter
scoop install flutter

# scoop updates
scoop update
scoop update *
