--[[
              # #     # #                  # #     # #   
              # #     # #	    # # #      # #     # #
              # #     # #	   # # # #     # #     # #
         	  # #     # #     # #   # #    # #     # #
              # # 	  # #    # #     # #   # #     # #
        # #	  # #	  # #   # #       # #  # #     # #
        # # # # #	   # # # #         # # # #     # # # # # #
         # # # #        # # #           # # #      # # # # # #        
--]]

QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterNetEvent("jwl-weed:kenevirsat")
AddEventHandler("jwl-weed:kenevirsat", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    
    if xPlayer.Functions.GetItemByName("weed").amount >= 1 then
        xPlayer.Functions.RemoveItem ("weed", 1)
        Citizen.Wait(500)
        xPlayer.Functions.AddMoney('cash', 500, "Bank depost") -- banka
    else
        TriggerClientEvent("QBCore:Notify", source, "Üzerinde Kenevir Yok!", "error")
    end
end)

RegisterNetEvent("jwl-weed:kenevirtopla")
AddEventHandler("jwl-weed:kenevirtopla", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.AddItem ("weed", 1)
end)