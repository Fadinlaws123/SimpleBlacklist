if(Config.Management.weaponBlacklist == true) then
    Citizen.CreateThread(function()
        while true do
            Wait(1)

            playerPed = GetPlayerPed(-1)
            if playerPed then
                nothing, weapon = GetCurrentPedWeapon(playerPed, true)

                if Config.Management.disableAllWeapons == true then
                    RemoveAllPedWeapons(playerPed, true)
                else
                    if isWeaponBlacklisted(weapon) then
                        RemoveWeaponFromPed(playerPed, weapon)
                        Notify("~r~This weapon has been blacklisted!")
                    end
                end
            end
        end
    end)

    function isWeaponBlacklisted(model)
        for _, blacklistedWeapon in pairs(Config.BlacklistedWeapons) do
            if model == GetHashKey(blacklistedWeapon) then
                return true
            end
        end

        return false
    end

    function Notify(text)
        SetNotificationTextEntry("STRING")
        AddTextComponentString(text)
        DrawNotification(false, false)
    end
end