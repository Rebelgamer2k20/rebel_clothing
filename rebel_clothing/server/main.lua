-- 🌟 Mechanic Shop ASCII Logo 🌟
local creatorLogo = [[
 ____      _          _  ____                          ____  _    ____   ___  
|  _ \ ___| |__   ___| |/ ___| __ _ _ __ ___   ___ _ _|___ \| | _|___ \ / _ \ 
| |_) / _ \ '_ \ / _ \ | |  _ / _` | '_ ` _ \ / _ \ '__|__) | |/ / __) | | | |
|  _ <  __/ |_) |  __/ | |_| | (_| | | | | | |  __/ |  / __/|   < / __/| |_| |
|_| \_\___|_.__/ \___|_|\____|\__,_|_| |_| |_|\___|_| |_____|_|\_\_____|\___/ 
]]

local resourceVersion = "1.0.0.0"

print(creatorLogo)
print("^3[Mechanic Shop]^0 Resource Version: ^2" .. resourceVersion .. "^0")

local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("clothingstore:chargePlayer", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cost = 150
    if Player.Functions.RemoveMoney("cash", cost, "clothing-store-purchase") then
        TriggerClientEvent("QBCore:Notify", src, "You paid $"..cost.." for your outfit!", "success")
    else
        TriggerClientEvent("QBCore:Notify", src, "Not enough cash!", "error")
    end
end)