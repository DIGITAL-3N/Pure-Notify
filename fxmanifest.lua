fx_version 'adamant'
game 'rdr3'
lua54 'yes'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name 'Pure-Notify'

author 'DIGITALEN'


description 'rnotify'

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

ui_page 'html/notification.html' 

files {
    'html/notification.html',
    'assets/background.png',
    'assets/backgroundtestnew.png',
    'assets/backgroundtestnew2.png',
    'html/DustWest.ttf'
}

dependencies {
    'rsg-core'
}
