ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('gast_treasurehunt:reward')
AddEventHandler('gast_treasurehunt:reward', function()
    local item = {}
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local gotID = {}
    local rolls = math.random(1, 2)
    local foundItem = false
    local lopata = xPlayer.getInventoryItem(Config.ItemNeeded).count
    if lopata > 0 then
        TriggerClientEvent('gast_treasurehunt:animacion',src)
        for i = 1, rolls do
            item = Config.Items[math.random(1, #Config.Items)]
            if math.random(1, 10) >= item.chance then
                if item.limit > 0 then
                    local count = xPlayer.getInventoryItem(item.id).count
                    if count >= item.limit then
                        xPlayer.showNotification(_U('cant_carry'))
                    else
                        gotID[item.id] = true
                        xPlayer.showNotification(_U('found_item'))
                        xPlayer.addInventoryItem(item.id, item.quantity)
                        foundItem = true
                    end
                else
                    gotID[item.id] = true
                    xPlayer.showNotification(_U('found_item'))
                    xPlayer.addInventoryItem(item.id, item.quantity)
                    foundItem = true
                end
            end
            if i == rolls and not gotID[item.id] and not foundItem then
                xPlayer.showNotification(_U('not_found'))
            end
        end
    else
        xPlayer.showNotification(_U('item_needed'))
    end
end)
