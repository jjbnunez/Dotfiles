#########
# scoop #
#########

$isScoopInstalled = ($null -ne (Get-Command scoop -ErrorAction Ignore))
if (-not $isScoopInstalled) {
    # install scoop
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

# 7zip and git (NEEDED FOR BUCKET MANAGEMENT)
scoop install 7zip
scoop install git
git config --global credential.helper manager-core

# add buckets 
scoop bucket add extras
scoop bucket add java

# python
scoop install python

# nodejs (& yarn)
scoop install nodejs-lts
npm install --global yarn

# flutter
scoop install flutter

# java and kotlin
scoop install openjdk
scoop install kotlin

# firebase
scoop install firebase

# scoop updates
scoop update
scoop update *
