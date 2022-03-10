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
Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, Config.Sat.x, Config.Sat.y, Config.Sat.z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, Config.Sat.x, Config.Sat.y, Config.Sat.z, true)
        if dst2 < 5 then
            sleep = 2
            DrawMarker(2, Config.Sat.x, Config.Sat.y, Config.Sat.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.7, 255, 0, 0, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst2 < 2 then
                DrawText3Ds(Config.Sat.x, Config.Sat.y, Config.Sat.z + 0.5, '[E] Kenevir Sat')
                if IsControlJustReleased(0, 38) then
                    kenevirsat()
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

function kenevirsat()
    if not satiyormu then
        satiyormu = true
        exports['mythic_progbar']:Progress({
            name = "kenevirsat",
            duration = 500,
            label = 'Kenevir satıyorsun...',
            useWhileDead = false,
            canCancel = false,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "mp_arresting",
                anim = "a_uncuff",
                flags = 49,
            },
        }, function(cancelled)
            if not cancelled then
                TriggerServerEvent('jwl-weed:kenevirsat')
                satiyormu = false
            else
            end
        end)
    end
end

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, Config.Topla.x, Config.Topla.y, Config.Topla.z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, Config.Topla.x, Config.Topla.y, Config.Topla.z, true)
        if dst2 < 5 then
            sleep = 2
            DrawMarker(2, Config.Topla.x, Config.Topla.y, Config.Topla.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.7, 255, 0, 0, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst2 < 2 then
                DrawText3Ds(Config.Topla.x, Config.Topla.y, Config.Topla.z + 0.5, '[E] Kenevir Topla')
                if IsControlJustReleased(0, 38) then
                    kenevirtopla()
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

function kenevirtopla()
    if not topluyormu then
        topluyormu = true
        exports['mythic_progbar']:Progress({
            name = "kenevirtopla",
            duration = 5000,
            label = 'Kenevir topluyorsun...',
            useWhileDead = false,
            canCancel = false,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "mp_arresting",
                anim = "a_uncuff",
                flags = 49,
            },
        }, function(cancelled)
            if not cancelled then
                TriggerServerEvent('jwl-weed:kenevirtopla')
                topluyormu = false
            else
            end
        end)
    end
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end