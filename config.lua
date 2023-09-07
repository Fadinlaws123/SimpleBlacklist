Config = {}

Config.Management = {
    disableAllWeapons = false, -- Bypasses the current weapon blacklist system and disables all weapons in the sevrer.
    defaultPlayerPed = "a_m_y_skater_01",

    vehicleBlacklist = true, -- Enable / Disable the vehicle blacklist script.
    weaponBlacklist = true, -- Enable / Disable the weapon blacklist script.
    pedBlacklist = true, -- Enable / Disable the player ped blacklist script.

}

Config.BlacklistedVehicles = {
    -- "VehicleSpawnCode" ("police")
    "RHINO" -- Vehicle Spawn Code.
}

Config.BlacklistedWeapons = {
    "WEAPON_MINIGUN", -- Weapon Spawn Code.
    "WEAPON_TEARGAS"
}

Config.BlacklistedPeds = {
    "CSB_BallasOG" -- Player Ped Spawn Code.
}