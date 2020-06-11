local data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent('ranch:moonshine')
AddEventHandler("ranch:moonshine", function(name, weapon)
    local _source = tonumber(source)
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
		local count = data.checkItem(_source, "sugar")
		local count2 = data.checkItem(_source, "water")
		if count >= 25 and count2 >= 10 then
		
			data.delItem(_source,"sugar", 25)
			data.delItem(_source,"water", 10)
			
          TriggerClientEvent('shiner:moonshine', _source)
		  
          Citizen.Wait(26000)
		  
                data.addItem(_source,"moonshine", 10)
                TriggerClientEvent("redemrp_notification:start", source, "Shine was cooked", 2, "success")
        else
            TriggerClientEvent("redemrp_notification:start", _source, 'Nice try bud', 3)
        end
    end)
end)