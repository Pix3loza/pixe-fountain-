local ItemName = Config['CoinItemName']

ESX.RegisterServerCallback('sz-Fontanna:checkmoney', function(source, cb)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local count = xPlayer.getInventoryItem(ItemName).count

    if count >= 1 then
        xPlayer.removeInventoryItem(ItemName, 1)
        cb(true)
    else
        xPlayer.showNotification(Config['No_coin_notify'])
        cb(false)
    end
end)

ESX.RegisterServerCallback('sz-Fontanna:buycoin', function(source, cb)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local count = xPlayer.getInventoryItem('money').count

    if count >= 1 then
        xPlayer.removeInventoryItem('money', 1)
        xPlayer.addInventoryItem(ItemName, 1)
        cb(true)
    else
        xPlayer.showNotification(Config['No_money_notify'])
        cb(false)
    end
end)