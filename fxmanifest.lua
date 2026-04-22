fx_version 'adamant'
game 'gta5'

lua54 'yes'

author 'Lenn V.'
description 'A simple pawnshop script for ESX, working wit ox_lib and ox_inventory'
version '1.0.0'

shared_scripts {
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
    '@ox_lib/init.lua',
    'config/cl_config.lua',
	'locales/*.lua'

}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
	'server/main.lua',
    'config/sv_config.lua',
    'server/webhook.lua'
}

client_scripts {
	'client/main.lua',
	'client/ped.lua'
}