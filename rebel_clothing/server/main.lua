local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("rebel_clothing:chargePlayer", function(method)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cost = 150

    if method == "cash" then
        if Player.Functions.RemoveMoney("cash", cost, "clothing-store-purchase") then
            TriggerClientEvent("QBCore:Notify", src, "You paid $"..cost.." in cash!", "success")
        else
            TriggerClientEvent("QBCore:Notify", src, "Not enough cash!", "error")
        end
    elseif method == "society" then
        -- Replace 'society' with your actual society account name if needed
        local society = exports['qb-management']:GetAccount('society')
        if society and society.money >= cost then
            exports['qb-management']:RemoveMoney('society', cost)
            TriggerClientEvent("QBCore:Notify", src, "You paid $"..cost.." from society funds!", "success")
        else
            TriggerClientEvent("QBCore:Notify", src, "Society does not have enough funds!", "error")
        end
    end
end)