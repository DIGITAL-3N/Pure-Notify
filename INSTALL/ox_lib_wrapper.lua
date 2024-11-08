local lastNotification = {message = nil, time = 0}
local notificationCooldown = 100 -- milliseconds

-- Function to map ox_lib types to pure-notify types
local function mapNotificationType(oxType)
    local typeMap = {
        inform = 'Info',
        error = 'Error',
        alert = 'Alert',
        success = 'Success'
    }
    return typeMap[oxType] or 'Info'
end

-- Wrapper function to convert ox_lib notify to pure-notify
local function oxLibToPureNotify(data)
    local currentTime = GetGameTimer()
    local message = (data.title or '') .. (data.description or '')
    
    -- Check if this is a duplicate notification within the cooldown period
    if lastNotification.message == message and (currentTime - lastNotification.time) < notificationCooldown then
        return
    end
    
    
    local pureType = mapNotificationType(data.type)
    
    TriggerEvent('pure-notify:' .. pureType, message, data.duration)
    
    -- Update last notification info
    lastNotification.message = message
    lastNotification.time = currentTime
end

-- Create a dummy ox_lib table if it doesn't exist
if not _G.ox_lib then
    _G.ox_lib = {}
end

-- Add the notify function to ox_lib
_G.ox_lib.notify = oxLibToPureNotify

-- Export the notify function
exports('notify', oxLibToPureNotify)

-- Override lib.notify function
lib = lib or {}
lib.notify = oxLibToPureNotify

-- Remove any existing event handler for ox_lib:notify
RemoveEventHandler('ox_lib:notify')

-- Register ox_lib:notify event to use pure-notify (only once)
RegisterNetEvent('ox_lib:notify')
AddEventHandler('ox_lib:notify', oxLibToPureNotify)


-- Test command
RegisterCommand('testoxnotify', function(source, args, rawCommand)
    oxLibToPureNotify({
        title = 'Test Notification',
        description = 'This is a test from ox_lib wrapper',
        type = 'inform',
        duration = 5000
    })
end, false)