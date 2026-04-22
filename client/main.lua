local ox_inventory = exports.ox_inventory

local function PlaySellAnimation(cb)
    local ped = PlayerPedId()

    lib.progressBar({
        duration = 2500,
        label = TranslateCap('selling_item'),
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        disable = {
            move = true,
            car = true,
            combat = true
        },
        anim = {
            dict = 'mp_common',
            clip = 'givetake1_a'
        }
    })

    if cb then cb() end
end

local function AmountMenu(itemLabel, itemName)
    lib.registerContext({
        id = 'amount_menu',
        title = TranslateCap('title_amount') .. itemLabel,
        menu = 'sell_menu',
        options = {
            {
                title = TranslateCap('title_sell_all'),
                description = TranslateCap('description_sell_all'),
                event = 'esx_pawnshop:client:sellAll',
                args = {
                    item = itemName
                }
            },
            {
                title = TranslateCap('title_sell_some'),
                description = TranslateCap('description_sell_some'),
                event = 'esx_pawnshop:client:sellSome',
                args = {
                    item = itemName
                }
            }
        }
    })

    lib.showContext('amount_menu')
end

local function OpenCategory(categoryKey)
    local category = Config.ItemsBuy[categoryKey]
    if not category then return end

    local options = {}

for item, data in pairs(category.items) do
    local count = exports.ox_inventory:GetItemCount(item)

    options[#options + 1] = {
        title = data.label,
        description = count > 0 and (TranslateCap('description_item_count') .. count) or TranslateCap('description_item_no_count'),
        icon = Config.ImagePath .. item .. '.png',
        disabled = count <= 0,

        onSelect = function()
            AmountMenu(data.label, item)
        end
    }
end

    lib.registerContext({
        id = 'category_menu',
        title = category.label,
        menu = 'sell_menu',
        options = options
    })

    lib.showContext('category_menu')
end

local function SellMenu()
    local options = {}

    for key, data in pairs(Config.ItemsBuy) do
        options[#options + 1] = {
            title = data.label,
            description = TranslateCap('sellmenu_title'),
            icon = data.icon,
            onSelect = function()
                OpenCategory(key)
            end
        }
    end

    lib.registerContext({
        id = 'sell_menu',
        title = TranslateCap('pawnshop_menu_title'),
        menu = 'pawn_menu',
        options = options
    })

    lib.showContext('sell_menu')
end

RegisterNetEvent('esx_pawnshop:openShop', function()
    lib.registerContext({
        id = 'pawn_menu',
        title = TranslateCap('pawnshop_menu_title'),
        options = {
            {
                title = TranslateCap('sellmenu_title'),
                description = TranslateCap('sellmenu_description'),
                icon = 'ring',
                onSelect = SellMenu
            }
        }
    })

    lib.showContext('pawn_menu')
end)

RegisterNetEvent('esx_pawnshop:client:sellAll', function(args)
    PlaySellAnimation(function()
        TriggerServerEvent('esx_pawnshop:sellAll', args.item)
    end)
end)

RegisterNetEvent('esx_pawnshop:client:sellSome', function(args)
    local input = lib.inputDialog('Aantal verkopen', {
        {
            type = 'number',
            label = TranslateCap('sellsome_amount'),
            required = true,
            min = 1
        }
    })

    if input then
        PlaySellAnimation(function()
            TriggerServerEvent('esx_pawnshop:sellSome', args.item, input[1])
        end)
    end
end)