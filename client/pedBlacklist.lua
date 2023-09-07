if(Config.Management.pedBlacklist == true) then
    Citizen.CreateThread(function()
        while true do
            Wait(1)
    
            playerPed = GetPlayerPed(-1)
            if playerPed then
                playerModel = GetEntityModel(playerPed)
    
                if not prevPlayerModel then
                    if isPedBlacklisted(prevPlayerModel) then
                        SetPlayerModel(PlayerId(), GetHashKey(Config.Management.defaultPlayerPed))
                    else
                        prevPlayerModel = playerModel
                    end
                else
                    if isPedBlacklisted(playerModel) then
                        SetPlayerModel(PlayerId(), prevPlayerModel)
                        Notify("~r~This player ped model is blacklisted!")
                    end
    
                    prevPlayerModel = playerModel
                end
            end
        end
    end)
    
    function isPedBlacklisted(model)
        for _, blacklistedPed in pairs(Config.BlacklistedPeds) do
            if model == GetHashKey(blacklistedPed) then
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