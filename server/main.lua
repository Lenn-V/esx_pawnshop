RegisterNetEvent('esx_pawnshop:sellAll', function(item)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    if not Player then return end

    local configItem = Config.ServerItemsBuy[item]
    if not configItem then

        SendToWebhook(
            TranslateCap('webhook_security_alert'),
            ("Player %s (Identifier: %s) attempted to sell an item that is not configured for sale: %s")
            :format(GetPlayerName(src), Player.identifier, item),
            16711680
        )

        return
    end

    local itemData = Player.getInventoryItem(item)
    if not itemData or itemData.count <= 0 then
        TriggerClientEvent('ox_lib:notify', src, {
            title = TranslateCap('pawnshop_menu_title'),
            description = TranslateCap('description_item_no_count'),
            type = 'error',
            position = 'center-left'
        })
        return
    end

    local totaal = itemData.count * configItem.price

    Player.removeInventoryItem(item, itemData.count)
    Player.addAccountMoney('money', totaal)
    
    SendToWebhook(
        TranslateCap('webhook_sell_all'),
        ("Player: %s\nIdentifier: %s\nItem: %s\nAmount: %s\nReceived: €%s")
        :format(
            GetPlayerName(src),
            Player.identifier,
            item,
            itemData.count,
            totaal
        ),
        5763719
    )

    TriggerClientEvent('ox_lib:notify', src, {
        title = TranslateCap('sell_success'),
        description = ('You have received €%s in cash.'):format(totaal),
        type = 'success',
        position = 'center-left'
    })
end)

RegisterNetEvent('esx_pawnshop:sellSome', function(item, amount)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    if not Player then return end

    amount = tonumber(amount)
    if not amount or amount <= 0 or amount > 50 then
        return
    end

    local configItem = Config.ServerItemsBuy[item]
    if not configItem then return end

    local itemData = Player.getInventoryItem(item)
    if not itemData or itemData.count < amount then
        TriggerClientEvent('ox_lib:notify', src, {
            title = TranslateCap('pawnshop_menu_title'),
            description = TranslateCap('description_item_no_count'),
            type = 'error',
            position = 'center-left'
        })
        return
    end

    local totaal = amount * configItem.price

    Player.removeInventoryItem(item, amount)
    Player.addAccountMoney('money', totaal)

    SendToWebhook(
        TranslateCap('webhook_sell_some'),
        ("Player: %s\nIdentifier: %s\nItem: %s\nAmount: %s\nReceived: €%s")
        :format(
            GetPlayerName(src),
            Player.identifier,
            item,
            amount,
            totaal
        ),
        16753920
    )

    TriggerClientEvent('ox_lib:notify', src, {
        title = TranslateCap('sell_success'),
        description = ('You have received €%s in cash.'):format(totaal),
        type = 'success',
        position = 'center-left'
    })
end)