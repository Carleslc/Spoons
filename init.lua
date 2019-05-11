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
require('utils.strings')

function help()
    return [[
        Ctrl+D    -  Downloads
        Ctrl+V    -  Paste
        Alt+S     -  Custom Screenshot
        Alt+Cmd+T -  Open Terminal
        Ctrl+Alt+Cmd+T     -  Open Terminal in current Finder folder
        Ctrl+Alt+Cmd+S     -  Snapshot current window
        Ctrl+Alt+Cmd+space -  Clipboard History
        Ctrl+Alt+Cmd+C     -  AutoClick
        Ctrl+Alt+Cmd+M     -  Locate pointer
        [Ctrl+]Alt+Cmd+P   -  Generate Strong/Weak Password
        Ctrl+Alt+Cmd+W     -  Add a resource with the copied url
        Ctrl+Alt+Cmd+R     -  Reload Hammerspoon]]
end

-- Spoons

--loadSpoon("LineageAutoQuest")

loadSpoon("ReloadConfiguration")

loadSpoon("MouseCircle")

loadSpoon("PasswordGenerator")

loadSpoon("Resources")
spoon.Resources.path = HOME .. '/Git/GitHub/resources/get_info.py'

loadSpoon("AutoClick")
spoon.AutoClick.clicksPerSecond = 20

local clipboardHistory = loadSpoon("TextClipboardHistory")
spoon.TextClipboardHistory.show_in_menubar = false
clipboardHistory:start()

-- Keybindings

local ctrlAltCmd = {"ctrl", "alt", "cmd"}

--- Shows Help
bindKey(ctrlAltCmd, "H", function() alert(help(), 5) end)

--- Open Downloads folder
bindKey("ctrl", "D", function() open(HOME .. "/Downloads") end)

--- Pastes clipboard
bindKey("ctrl", "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

--- Takes a snapshot of the current window
bindKey(ctrlAltCmd, "S", snapshotWindow)

--- Open terminal in current finder location
bindKey(ctrlAltCmd, "T", openTerminalHere)
bindKey({"alt", "cmd"}, "T", function() hs.application.launchOrFocus("Terminal.app") end)

--- Generate a weak or strong password and copy to the clipboard
bindKey({"alt", "cmd"}, "P", function() spoon.PasswordGenerator.weakPassword(8) end)
bindKey(ctrlAltCmd, "P", function() spoon.PasswordGenerator.strongPassword(16) end)

--- Add a resource to https://carleslc.me/resources with the copied url
spoon.Resources:bindHotkeys({ add = {ctrlAltCmd, "W"} })

--- Start/Stop LineageAutoQuest bot
--spoon.LineageAutoQuest:bindHotkeys({ triggerBot = {ctrlAltCmd, "L"} })

--- Reload configuration
spoon.ReloadConfiguration:bindHotkeys({ reloadConfiguration = {ctrlAltCmd, "R"} })

-- Show/Hide Clipboard History
spoon.TextClipboardHistory:bindHotkeys({ toggle_clipboard = {ctrlAltCmd, "space"} })

--- Start/Stop Autoclick
spoon.AutoClick:bindHotkeys({ triggerAutoClick = {ctrlAltCmd, "C"} })

--- Locates pointer
spoon.MouseCircle:bindHotkeys({ show = {ctrlAltCmd, "M"} })

-- Finish loading

notify("Configuration loaded", 3)