ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('kamushop:test')
AddEventHandler('kamushop:test', function(price, item, nombre) 
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() >= price then
	xPlayer.removeMoney(price)
    	xPlayer.addInventoryItem(item, nombre) 
        TriggerClientEvent('esx:showNotification', source, "Merci de votre ~g~Achats !", "", 1)
     else 
         TriggerClientEvent('esx:showNotification', source, "Pas assez ~r~d'argent sur vous")    
        end
end)  

  