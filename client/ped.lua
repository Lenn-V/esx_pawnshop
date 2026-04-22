local function loadAnimDict(dict)
    if HasAnimDictLoaded(dict) then return end
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
end

CreateThread(function()
    for _, v in pairs(Config.Pawnshops) do
        local blip = AddBlipForCoord(v.coords)
        SetBlipSprite(blip, 431)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 5)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(TranslateCap('blip_name'))
        EndTextCommandSetBlipName(blip)

        local model = joaat(v.ped)
        RequestModel(model)
        while not HasModelLoaded(model) do Wait(0) end

        local pawnPed = CreatePed(
            0,
            model,
            v.pedcoords.x,
            v.pedcoords.y,
            v.pedcoords.z,
            v.heading,
            false,
            false
        )

        loadAnimDict('anim@heists@heist_corona@team_idles@male_a')
        TaskPlayAnim(pawnPed, 'anim@heists@heist_corona@team_idles@male_a', 'idle', 2.0, 1.0, -1, 1, 0, false, false, false)

        FreezeEntityPosition(pawnPed, true)
        SetEntityInvincible(pawnPed, true)
        SetBlockingOfNonTemporaryEvents(pawnPed, true)
    end
end)

CreateThread(function()
    for k, v in pairs(Config.Pawnshops) do
        exports.ox_target:addBoxZone({
            name = 'Pandjeshuis_' .. k,
            coords = vec3(v.pedcoords.x, v.pedcoords.y, v.pedcoords.z + 0.98),
            size = vec3(v.length, v.width, 2.0),
            rotation = v.heading,
            debug = Config.Debug,
            distance = v.distance,
            options = {
                {
                    icon = 'fas fa-ring',
                    label = TranslateCap('target_open_shop'),
                    event = 'esx_pawnshop:openShop',
                }
            }
        })
    end
end)