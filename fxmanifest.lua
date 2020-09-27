fx_version 'bodacious'
game 'gta5'
author 'Vasco Ferreira'
description 'Sons 3d'
version '1.0.0'


client_scripts{
    'client.lua'
}

server_scripts{
    'server.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    
    -- Sound files must be in html/sounds/
    -- Sound files must be in .ogg format
    'html/sounds/*.ogg'
}
