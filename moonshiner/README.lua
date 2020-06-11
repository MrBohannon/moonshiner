# Made by
- MrBohannon
- Troye
- MrLupo


# moonshiner
job made for redem_roleplay redm_camping



# Installation
1. Clone this repository.
2. Extract the zip.
3. Put moonshiner to your resource folder.
4. Add "start moonshiner" in your "server.cfg".
5. Add "sugar" & "water" to redemrp_inventory


# Required resource
- redm_camping https://github.com/Gandalfor/redm_camping



# Things to add to redm_camping 
-------------------------------------------------------------------------------------------------------------------------	
        elseif WarMenu.Button('Place still') then
		TriggerEvent("ml_camping:moonshine")
		
		elseif WarMenu.Button('Deleting still') then
		TriggerEvent("ml_camping:delmoonshine")

-------------------------------------------------------------------------------------------------------------------------		
RegisterNetEvent('ml_camping:setmoonshine')
AddEventHandler('ml_camping:setmoonshine', function()
if chair ~= 0 then
        SetEntityAsMissionEntity(chair)
        DeleteObject(chair)
        chair = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    exports['progressBars']:startUI(30000, "Placing Still")
    Citizen.Wait(30000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("p_still04x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    chair = prop

end)
--------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('ml_camping:moonshine')
AddEventHandler('ml_camping:moonshine', function()
if chair == 0 then
        print("There is no still.")
    else
        SetEntityAsMissionEntity(chair)
        DeleteObject(chair)
        chair = 0
    end
end)
--------------------------------------------------------------------------------------------------------------------------
TriggerEvent("ml_camping:moonshine")
