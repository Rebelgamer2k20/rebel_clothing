fx_version 'cerulean'
game 'gta5'

-- fxmanifest.lua
fx_version 'cerulean'
game 'gta5'

author 'YourName'
description 'Interactive Clothing Store using qb-target'

lua54 'yes'

-- Shared Files
shared_scripts {
    '@qb-core/shared/locale.lua',
    'shared/config.lua',
    'shared/locales/en.lua'
}

-- Client Files
client_scripts {
    'client/main.lua'
}

-- Server Files
server_scripts {
    'server/main.lua'
}
server_script 'version_check.lua'
-- Dependencies
dependency 'qb-core'
dependency 'qb-target'
dependency 'qb-menu'
dependency 'qb-clothing'