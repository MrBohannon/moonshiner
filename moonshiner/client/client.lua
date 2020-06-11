local keys = { ['G'] = 0x760A9C6F, ['S'] = 0xD27782E3, ['W'] = 0x8FD015D8, ['H'] = 0x24978A28, ['G'] = 0x5415BE48, ["ENTER"] = 0xC7B5340A, ['E'] = 0xDFF812F9,["BACKSPACE"] = 0x156F7119 }
local still = 0

--menu
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
		
		
		local still = DoesObjectOfTypeExistAtCoords(x, y, z, 1.5, GetHashKey("p_still04x"), true)
		
		if cauldron or still then 
			TriggerEvent('redem_roleplay:Tip', "Press G to Prepare Shine.", 100)
			if IsControlJustReleased(0, 0x760A9C6F) then -- g
				TriggerEvent("ranch:moonshine")
			end
		end
	end
end)

Citizen.CreateThread(function()
    WarMenu.CreateMenu('still', "Prepare Shine")
    WarMenu.SetSubTitle('still', 'Prepare Shine')
    WarMenu.CreateSubMenu('prepare', 'still', 'Prepare Shine')
  

    while true do
        local ped = GetPlayerPed(-1)
        local coords = GetEntityCoords(PlayerPedId())

        if WarMenu.IsMenuOpened('still') then
            if WarMenu.MenuButton('prepare', 'prepare') then
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('prepare') then
            if WarMenu.Button('Prepare Moonshine') then
					TriggerServerEvent("ranch:moonshine")
			end
   
            WarMenu.Display()
		
        end
        Citizen.Wait(0)
    end
end)

AddEventHandler('ranch:moonshine', function()
local _source = source
		if still ~= 0 then
            SetEntityAsMissionEntity(still)
            DeleteObject(still)
            still = 0
            end
            local playerPed = PlayerPedId()
			Citizen.Wait(0)
            ClearPedTasksImmediately(PlayerPedId())
			WarMenu.OpenMenu('still')
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), -1, true, false, false, false)
       
            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
            SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
            PlaceObjectOnGroundProperly(prop)
            still = prop

end)

Citizen.CreateThread(function()
    while true do
	local playerPed = PlayerPedId()
        Citizen.Wait(0)
		
        if whenKeyJustPressed(keys['BACKSPACE']) then
            if still ~= 0 then
            SetEntityAsMissionEntity(still)
            DeleteObject(still)
			ClearPedTasksImmediately(PlayerPedId())
            still = 0
            end
     end
	end
end)


function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end
-----------------------------------------------------------COOKING 
function GetClosestPlayer()
    local players, closestDistance, closestPlayer = GetActivePlayers(), -1, -1
    local playerPed, playerId = PlayerPedId(), PlayerId()
    local coords, usePlayerPed = coords, false
    
    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        usePlayerPed = true
        coords = GetEntityCoords(playerPed)
    end
    
    for i=1, #players, 1 do
        local tgt = GetPlayerPed(players[i])

        if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then

            local targetCoords = GetEntityCoords(tgt)
            local distance = #(coords - targetCoords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = players[i]
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

RegisterNetEvent('shiner:moonshine')
AddEventHandler('shiner:moonshine', function()

    local playerPed = PlayerPedId()
    exports['progressBars']:startUI(27000, "Cooking Shine...")


end)