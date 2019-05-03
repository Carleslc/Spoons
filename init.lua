-- [[ Hammerspoon configuration ]]
-- Execute the following command in terminal and restart Hammerspoon:
-- defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/Git/GitHub/Spoons/init.lua"

HOME = os.getenv("HOME")
hs.configdir = HOME .. "/Git/GitHub/Spoons"
os.execute("mkdir -p " .. HOME .. "/.hammerspoon/cache/")

-- Utils

require('utils.hs')
require('utils.images')
require('utils.spoons')

function snapshotWindow(title)
    notify("Snapshot to " .. snapshot(nil, hs.window.focusedWindow(), title, HOME .. "/Pictures/"))
end

-- Spoons

--loadSpoon("LineageAutoQuest")

loadSpoon("ReloadConfiguration")

loadSpoon("MouseCircle")

loadSpoon("PasswordGenerator")

loadSpoon("AutoClick")
spoon.AutoClick.clicksPerSecond = 50

-- Keybindings

local ctrlAltCmd = {"ctrl", "alt", "cmd"}

--- Says Hello World!
bindKey(ctrlAltCmd, "H", function() hs.alert.show("Hello World!") end)

--- Open Downloads folder
bindKey("ctrl", "D", function() open(HOME .. "/Downloads") end)

--- Pastes clipboard
bindKey("ctrl", "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

--- Takes a snapshot of the current window
bindKey(ctrlAltCmd, "S", snapshotWindow)

--- Generate a weak or strong password and copy to the clipboard
bindKey({"alt", "cmd"}, "P", function() spoon.PasswordGenerator.weakPassword(8) end)
bindKey(ctrlAltCmd, "P", function() spoon.PasswordGenerator.strongPassword(16) end)

--- Start/Stop LineageAutoQuest bot
--spoon.LineageAutoQuest:bindHotkeys({ triggerBot = {ctrlAltCmd, "L"} })

--- Reload configuration
spoon.ReloadConfiguration:bindHotkeys({ reloadConfiguration = {ctrlAltCmd, "R"} })

--- Start/Stop Autoclick
spoon.AutoClick:bindHotkeys({ triggerAutoClick = {ctrlAltCmd, "C"} })

--- Locates pointer
spoon.MouseCircle:bindHotkeys({ show = {ctrlAltCmd, "M"} })

-- Finish loading

notify("Configuration loaded", 3)