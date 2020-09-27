
RegisterNetEvent("3dsounds:play3dsound")
AddEventHandler("3dsounds:play3dsound", function(coords,soundName,volume,radius)
    TriggerClientEvent("3dsounds:play3dsound", -1, coords,soundName,volume,radius)
end)
