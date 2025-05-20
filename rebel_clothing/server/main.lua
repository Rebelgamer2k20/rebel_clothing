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