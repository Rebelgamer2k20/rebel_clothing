-- config.lua
Config = {}
Config.ClothingRacks = {
    {coords = vector3(72.3, -1399.1, 29.4), label = "Men's Rack"},
    {coords = vector3(75.3, -1392.1, 29.4), label = "Women's Rack"},
}
Config.Registers = {
    {coords = vector3(78.9, -1390.9, 29.4), label = "Checkout Register"}
}

function vector3(x, y, z)
    return {x = x, y = y, z = z}
end