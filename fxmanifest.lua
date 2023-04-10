fx_version 'adamant'
lua54 'yes'
game 'gta5'

description "Treasure hunting script"

author "andrejkm#0866"

shared_script {
    '@es_extended/locale.lua',
	'locales/*.lua',
    '@es_extended/imports.lua', 
    'config.lua'
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}
