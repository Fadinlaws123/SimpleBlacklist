if(Config.Management.vehicleBlacklist == true) then
    Citizen.CreateThread(function()
        while true do
            Wait(1)

            playerPed = GetPlayerPed(-1)
            if playerPed then
                checkCar(GetVehiclePedIsIn(playerPed, true))

                x, y, z = table.unpack(GetEntityCoords(playerPed, true))
                for _, blacklistedCar in pairs(Config.BlacklistedVehicles) do
                    checkCar(GetClosestVehicle(x, y, z, 100.0, GetHashKey(blacklistedCar), 70))
                end
            end
        end
    end)

    function checkCar(car)
        if car then
            carModel = GetEntityModel(car)
            carName = GetDisplayNameFromVehicleModel(carModel)
            
            if isCarBlacklisted(carModel) then
                _DeleteEntity(car)
                Notify("~r~You are unable to drive this vehicle! It is blacklisted!")
            end
        end
    end

    function isCarBlacklisted(model)
        for _, blacklistedCar in pairs(Config.BlacklistedVehicles) do 
            if model == GetHashKey(blacklistedCar) then
                return true
            end
        end

        return false
    end

    function _DeleteEntity(entity)
        Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
    end

    function Notify(text)
        SetNotificationTextEntry("STRING")
	    AddTextComponentString(text)
	    DrawNotification(false, false)
    end
end