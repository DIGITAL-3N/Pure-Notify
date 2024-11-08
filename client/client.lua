local RSGCore = exports['rsg-core']:GetCoreObject()

-- Notification counter
local notificationId = 0

-- Table to store active notification IDs
local activeNotifications = {}

-- Function to show notification
local function showNotification(params)
    notificationId = notificationId + 1
    
    local payload = {
        action = 'showNotification',
        id = notificationId,
        firstText = params.firstText or '',
        secondText = params.secondText or '',
        type = params.type or 'info',
        icon = params.icon or 'fa-info-circle',
        duration = params.duration or 4000
    }
    
    SendNUIMessage(payload)
    
    -- Add notification ID to the active notifications table
    table.insert(activeNotifications, notificationId)

    -- Remove all notifications after the specified duration
    Citizen.SetTimeout(tonumber(payload.duration), function()
        for _, id in ipairs(activeNotifications) do
            SendNUIMessage({
                action = 'removeNotification',
                id = id
            })
        end
        activeNotifications = {}  -- Clear the list after removing notifications
    end)
    
    return notificationId
end

-- Event handlers with RDR2-themed defaults
RegisterNetEvent('pure-notify:Info')
AddEventHandler('pure-notify:Info', function(text, duration)
    showNotification({
        firstText = text,
        type = 'info',
        icon = 'fa-circle-info',
        duration = tonumber(duration) or 10000
    })
end)

RegisterNetEvent('pure-notify:Success')
AddEventHandler('pure-notify:Success', function(amount, isPositive, duration)
    showNotification({
        firstText = text,
        secondText = '' .. amount,
        type = isPositive and 'success' or 'error',
        icon = 'fa-circle-check',
        duration = tonumber(duration) or 4000
    })
end)

RegisterNetEvent('pure-notify:Error')
AddEventHandler('pure-notify:Error', function(text, duration)
    showNotification({
        secondText = text,
        type = 'Warning',
        icon = 'fa-exclamation-triangle',
        duration = tonumber(duration) or 10000
    })
end)

RegisterNetEvent('pure-notify:Alert')
AddEventHandler('pure-notify:Alert', function(text, duration)
    showNotification({
        secondText = text,
        type = 'Alert',
        icon = 'fa-exclamation-triangle',
        duration = tonumber(duration) or 10000
    })
end)

RegisterNetEvent('pure-notify:Objective')
AddEventHandler('pure-notify:Objective', function(text, duration)
    showNotification({
        secondText = text,
        type = 'info',
        icon = 'fa-tasks',
        duration = tonumber(duration) or 10000
    })
end)

-- Exports
exports("ShowNotification", function(title, message, type, icon, duration)
    return showNotification({
        firstText = title,
        secondText = message,
        type = type or 'info',
        icon = icon or 'fa-info-circle',
        duration = tonumber(duration) or 4000
    })
end)