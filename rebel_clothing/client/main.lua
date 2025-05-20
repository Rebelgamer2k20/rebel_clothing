local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for _,v in pairs(Config.ClothingRacks) do
        exports['qb-target']:AddBoxZone("clothingrack_".._, v.coords, 1.5, 1.5, {
            name = "clothingrack_".._,
            heading = 0,
            debugPoly = false,
            minZ = v.coords.z - 1,
            maxZ = v.coords.z + 1
        }, {
            options = {
                {
                    type = "client",
                    event = "clothingstore:openMenu",
                    icon = "fas fa-tshirt",
                    label = v.label
                }
            },
            distance = 2.0
        })
    end
    for _,v in pairs(Config.Registers) do
        exports['qb-target']:AddBoxZone("register_".._, v.coords, 1.0, 1.0, {
            name = "register_".._,
            heading = 0,
            debugPoly = false,
            minZ = v.coords.z - 1,
            maxZ = v.coords.z + 1
        }, {
            options = {
                {
                    type = "client",
                    event = "clothingstore:checkout",
                    icon = "fas fa-cash-register",
                    label = v.label
                }
            },
            distance = 2.0
        })
    end
end)

RegisterNetEvent('clothingstore:openMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "👕 Clothing Options",
            isMenuHeader = true
        },
        {
            header = "🧥 Try on Clothes",
            txt = "Use appearance editor",
            params = {
                event = "clothingstore:openAppearance"
            }
        },
        {
            header = "💾 Finish & Pay",
            txt = "Save outfit & checkout",
            params = {
                event = "clothingstore:checkout"
            }
        }
    })
end)

RegisterNetEvent('clothingstore:openAppearance', function()
    exports['illenium-appearance']:startPlayerCustomization(function(appearance)
        if (appearance) then
            TriggerEvent('clothingstore:checkout')
        end
    end, {
        ped = true,
        tattoos = false,
        clothing = true,
        accessories = true
    })
end)

RegisterNetEvent('clothingstore:checkout', function()
    TriggerServerEvent("clothingstore:chargePlayer")
end)