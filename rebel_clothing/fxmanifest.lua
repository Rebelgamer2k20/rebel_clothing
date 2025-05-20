fx_version 'cerulean'
game 'gta5'

name "rebel_clothing"
description "Clothing for QBCORE"
author "Rebelgamer2k20"
version "1.0.0.0"
lua54 'yes'
shared_script '@qb-core/shared/locale.lua'
shared_script 'config.lua'
client_script 'client.lua'
server_script 'server.lua'

escrow_ignore {
    'config.lua'
}