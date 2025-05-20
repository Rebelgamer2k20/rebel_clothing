-- version_check.lua-------

local CurrentVersion = "1.0.0.5"
local VersionURL = "https://raw.githubusercontent.com/Rebelgamer2k20/rebel_clothing/refs/heads/main/rebel_clothing/version_check.json" -- <-- Use the correct URL

local function splitVersion(version)
    local parts = {}
    for part in version:gmatch("(%d+)") do
        table.insert(parts, tonumber(part))
    end
    return parts
end

local function isOutdated(localVer, remoteVer)
    local l = splitVersion(localVer)
    local r = splitVersion(remoteVer)

    for i = 1, math.max(#l, #r) do
        local lv = l[i] or 0
        local rv = r[i] or 0
        if lv < rv then return true end
        if lv > rv then return false end
    end
    return false
end

local function printStyled(message)
    print("^3[Rebel_Clothing Update]^0 " .. message)
end

local function checkVersion()
    PerformHttpRequest(VersionURL, function(statusCode, body, _)
        if statusCode == 200 then
            local success, remoteData = pcall(function() return json.decode(body) end)
            if success and remoteData.version then
                local remoteVersion = remoteData.version
                local message = remoteData.message or "A new version is available!"
                local keymasterURL = remoteData.keymaster_url or "https://keymaster.fivem.net/"

                if isOutdated(CurrentVersion, remoteVersion) then
                    printStyled("^1Your resource is outdated!^0")
                    printStyled("Current Version: ^1" .. CurrentVersion .. "^0") -- Red
                    printStyled("Latest Version: ^4" .. remoteVersion .. "^0")   -- Blue
                    printStyled("Message: ^3" .. message .. "^0")
                    printStyled("Visit your keymaster or update at: ^5" .. keymasterURL .. "^0")
                    printStyled("please clear your server cache: ^5" .. keymasterURL .. "^0")
                else
                    printStyled("^2You're using the latest version (^2" .. CurrentVersion .. "^0)^0") -- Green
                end
            else
                printStyled("^1Failed to parse version data from GitHub^0")
            end
        else
            printStyled("^1Failed to fetch version info! HTTP Status: " .. statusCode .. "^0")
        end
    end, "GET", "", { ["Content-Type"] = "application/json" })
end

Citizen.CreateThread(function()
    Citizen.Wait(2000) -- Slight delay for startup
    checkVersion()
end)

local creatorLogo = [[
 ____      _          _  ____                          ____  _    ____   ___  
|  _ \ ___| |__   ___| |/ ___| __ _ _ __ ___   ___ _ _|___ \| | _|___ \ / _ \ 
| |_) / _ \ '_ \ / _ \ | |  _ / _` | '_ ` _ \ / _ \ '__|__) | |/ / __) | | | |
|  _ <  __/ |_) |  __/ | |_| | (_| | | | | | |  __/ |  / __/|   < / __/| |_| |
|_| \_\___|_.__/ \___|_|\____|\__,_|_| |_| |_|\___|_| |_____|_|\_\_____|\___/ 
]]

print(creatorLogo)
