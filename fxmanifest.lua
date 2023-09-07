fx_version "cerulean"
game "gta5"

author "fadin_laws"
description "Simple blacklist script for vehicles, peds, and weapons."
version "1.0.0"

shared_scripts {
    'config.lua',
}

client_scripts {
    'client/pedBlacklist.lua',
    'client/vehicleBlacklist.lua',
    'client/weaponBlacklist.lua'
}

server_scripts {
    'server/versionChecker.lua'
}