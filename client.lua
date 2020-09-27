
Citizen.CreateThread(function()
    while true do
        local coords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Sounds) do
                local distanceVolumeMultiplier = (v.vol / v.dist)
                local distance = Vdist(GetEntityCoords(PlayerPedId()),v.pos.x,v.pos.y,v.pos.z)
                local distanceVolume = v.vol - (distance * distanceVolumeMultiplier)
                local pcoords = {x = coords.x,y = coords.y,z = coords.z}
                local camRot = rot_to_direction(GetGameplayCamRot(0))
                SendNUIMessage({submissionType="updateVolume",volume = distanceVolume, playerPos=GetEntityCoords(PlayerPedId()),camDir = {x = camRot.x,y = camRot.y,z = camRot.z}, soundIndex=k})
                Citizen.Wait(1)
        end
        Citizen.Wait(10)
    end
end)

RegisterNetEvent("3dsounds:play3dsound")
AddEventHandler("3dsounds:play3dsound", function(coords,soundName,volume,radius)
    local distanceVolumeMultiplier = (volume / radius)
    local distance = Vdist(GetEntityCoords(PlayerPedId()),coords.x,coords.y,coords.z)
    local distanceVolume = volume - (distance * distanceVolumeMultiplier)
    local i = 1
    while Sounds[i] ~= nil do
        i = i + 1
    end
    Sounds[i] = {pos = coords,vol = volume,dist = radius}
    SendNUIMessage({submissionType="sendSound", volume = volume, submissionFile=soundName,soundIndex=i,pos = coords})
end)

RegisterNUICallback("discardSound", function(data)
    if Sounds[data.index] ~= nil then
        Sounds[data.index] = nil
    end
end)


function rot_to_direction(rot)

    local radiansZ = rot.z * 0.0174532924;
    local radiansX = rot.x * 0.0174532924;
    local num = math.abs(math.cos(radiansX));
    local dir = {};
    dir.x = (-math.sin(radiansZ)) * num;
    dir.y = (math.cos(radiansZ)) *  num;
    dir.z = math.sin(radiansX);
    return dir;
end
