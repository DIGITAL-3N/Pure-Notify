local RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Commands.Add("testpurenotify", "Test pure-nofity notifications", {}, false, function(source)
    local src = source
    
    -- Test Honor notification
    TriggerClientEvent('pure-notify:Info', src, "You helped a stranger", true, 15000)
    Wait(500)
    
    -- Test Money notification
    TriggerClientEvent('pure-notify:Success', src, "You recieved an item", true, 15000)
    Wait(500)
    
    -- Test Alert notification
    TriggerClientEvent('pure-notify:Alert', src, "You're now wanted", 15000)
    Wait(500)
    
    -- Test Objective notification
    TriggerClientEvent('pure-notify:Objective', src, "Find and retrieve", 15000)
end)