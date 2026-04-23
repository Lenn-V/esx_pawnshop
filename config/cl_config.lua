Config = {}

Config.ImagePath = 'nui://ox_inventory/web/images/'
Config.Debug = false

Config.Locale = GetConvar('esx:locale', 'en')

Config.Webhook = ''

Config.Pawnshops = {
    [1] = {
        coords = vector3(1124.0193, -344.9838, 67.1328),
        pedcoords = vector3(1124.0193, -344.9838, 66.1328),
        heading = 185.5238,
        ped = 's_m_m_movspace_01',
        length = 1.0,
        width = 1.0,
        distance = 3.0
    },

    -- Add more pawnshop locations as needed
}


Config.ItemsBuy = {

    ['electronics'] = {
        label = 'Electronics',
        icon = 'mobile',
        items = {
            ['phone'] = { label = 'Phone' },
            ['radio'] = { label = 'Radio' },
        }
    },

    ['gadgets'] = {
        label = 'Gadgets',
        icon = 'parachute-box',
        items = {
            ['parachute'] = { label = 'Parachute' },
        }
    },

    --- add more categories and items as needed, categories names between the [] cant have spaces, but the label can have spaces, also do nut use the same name for the category and the item, for example you cant have ['electronics'] = { label = 'Electronics', items = { ['electronics'] = { label = 'Electronics' } } }, you need to change the name of the item to something else like ['phone'] = { label = 'Phone' }
}