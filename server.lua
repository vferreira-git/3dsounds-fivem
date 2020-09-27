ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


RegisterNetEvent("3dsounds:play3dsound")
AddEventHandler("3dsounds:play3dsound", function(coords,soundName,volume,radius)
    TriggerClientEvent("3dsounds:play3dsound", -1, coords,soundName,volume,radius)
end)