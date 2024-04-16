local fontzone = Config['Target_Fontanna']
local coinzone = Config['Target_CoinBuyer']


for _, fontzone in ipairs(fontzone) do
    fontzone.options = {
        {
            name = 'StartHeist',
            label = 'Wrzuć Monetę',
            icon = 'fa-solid fa-user',
            onSelect = function()
                GiveCoin()
            end
        }
    }
    exports.ox_target:addBoxZone(fontzone)
end

for _, coinzone in ipairs(coinzone) do
    coinzone.options = {
        {
            name = 'StartHeist',
            label = 'Kup Monetę',
            icon = 'fa-solid fa-user',
            onSelect = function()
                BuyCoin()
            end
        }
    }
    exports.ox_target:addBoxZone(coinzone)
end


local wrozba = Config['wrozba'] 

function GiveCoin()
    local playerPed = PlayerPedId()

    ESX.TriggerServerCallback('sz-Fontanna:checkmoney', function(count, type)
        if count then
    
            RequestAnimDict("amb@world_human_tourist_map@male@base")
            while not HasAnimDictLoaded("amb@world_human_tourist_map@male@base") do
                Wait(0)
            end
            
            TaskPlayAnim(PlayerPedId(), "amb@world_human_tourist_map@male@base", "base", 8.0, -8.0, -1, 0, 0, false, false, false)

            Citizen.Wait(2000)

            ClearPedTasks(playerPed)

            local notify = math.random(1, #wrozba)
            print(notify)
            ESX.ShowNotification(wrozba[notify])
        end
    end)
end

function BuyCoin()

    ESX.TriggerServerCallback('sz-Fontanna:buycoin', function(count, type)
        if count then
            ESX.ShowNotification('Pomyślnie Zakupiono Monetę')
        end
    end)
end
