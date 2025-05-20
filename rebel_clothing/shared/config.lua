-- config.lua
Config = {}

Config.Stores = {
    ["Downtown"] = {
        label = "Downtown Clothing Store",
        blip = {
            coords = vector3(72.3, -1399.1, 29.4), -- Blip location (usually store entrance)
            sprite = 73, -- Clothing store icon
            color = 47,  -- Blue
            scale = 0.8,
            display = 4,
            shortRange = true,
            name = "Clothing Store"
        },
        racks = {
            {coords = vector3(72.3, -1399.1, 29.4), label = "Men's Shoes", category = "shoes"},
            {coords = vector3(73.0, -1398.0, 29.4), label = "Men's Pants", category = "pants"},
            {coords = vector3(74.0, -1397.0, 29.4), label = "Men's Jackets", category = "jackets"},
            {coords = vector3(75.0, -1396.0, 29.4), label = "Chains", category = "chains"},
            {coords = vector3(76.0, -1395.0, 29.4), label = "Body Armour", category = "bodyarmour"},
            {coords = vector3(75.3, -1392.1, 29.4), label = "Women's Shoes", category = "shoes"},
            {coords = vector3(76.3, -1391.1, 29.4), label = "Women's Pants", category = "pants"},
            {coords = vector3(77.3, -1390.1, 29.4), label = "Women's Jackets", category = "jackets"},
        },
        registers = {
            {coords = vector3(78.9, -1390.9, 29.4), label = "Checkout Register"}
        }
    },
    -- Add more stores here
    -- ["Vespucci"] = { ... }
}

function vector3(x, y, z)
    return {x = x, y = y, z = z}
end