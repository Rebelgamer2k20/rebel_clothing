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

RegisterNetEvent('rebel_clothing:openRack')
AddEventHandler('rebel_clothing:openRack', function(category)
    -- Open the clothing menu for only the specified category
    -- Example for qb-clothing:
    exports['qb-clothing']:openOutfitCategory(category)
end)

Citizen.CreateThread(function()
    for storeName, store in pairs(Config.Stores or {}) do
        for _, rack in ipairs(store.racks or {}) do
            exports['qb-target']:AddBoxZone(
                rack.label .. "_" .. storeName, -- unique name
                vector3(rack.coords.x, rack.coords.y, rack.coords.z),
                1.0, 1.0,
                {
                    name = rack.label .. "_" .. storeName,
                    heading = 0,
                    debugPoly = false,
                    minZ = rack.coords.z - 1,
                    maxZ = rack.coords.z + 1,
                },
                {
                    options = {
                        {
                            event = "rebel_clothing:openRack",
                            icon = "fas fa-tshirt",
                            label = "Open " .. rack.label,
                            category = rack.category,
                            store = storeName
                        }
                    },
                    distance = 2.0
                }
            )
        end
    end
end)

-- Listen for the event and open the correct clothing category
RegisterNetEvent("rebel_clothing:openRack", function(data)
    local category = data.category
    -- Replace this with your clothing menu logic for the category:
    -- Example for qb-clothing:
    exports['qb-clothing']:openOutfitCategory(category)
end)