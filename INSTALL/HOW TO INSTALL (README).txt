Extract the zip (pure-notify.zip)

Place in your resources folder

From the INSTALL folder that comes with this resource

Place the ox_lib_wrapper.lua into /ox_lib/resource/interface/client

Replace the fxmanifest.lua file for ox_lib with the one in the install folder or do the changes yourself.

*Important* - if you replaced the fxmanifest file you can skip this step.

-------------------------------
Update fxmanifest so it adds ox_lib_wrapper.lua to the client script dependencies. 

How your client scripts should look like:

client_scripts {
    'resource/**/client.lua',
    'resource/**/client/*.lua',
    'resource/**/client/ox_lib_wrapper.lua'
}

------------------------------

Ensure pure-notify 

Restart Server and Enjoy your brand new notifications system, automatically integrated to work with with Ox_lib and pick up all core and script notifications that use ox.lib functions. 



To test and confirm if everything is working correctly try the following chat commands 

/testoxnotify to test if the wrapper is picking up the notifications correctly.

/testpurenotify to display notifications from your new notification script. 
