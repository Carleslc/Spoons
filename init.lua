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

hs.alert.defaultStyle.atScreenEdge = 1

-- Spoons

--loadSpoon("LineageAutoQuest")

loadSpoon("ReloadConfiguration")

loadSpoon("MouseCircle")

loadSpoon("PasswordGenerator")

loadSpoon("AutoClick")
spoon.AutoClick.clicksPerSecond = 20

local clipboardHistory = loadSpoon("TextClipboardHistory")
spoon.TextClipboardHistory.show_in_menubar = false
clipboardHistory:start()

-- Keybindings

local ctrlAltCmd = {"ctrl", "alt", "cmd"}

--- Shows Help
bindKey(ctrlAltCmd, "H", function() hs.alert("Ctrl+D\t\t-  Downloads\nCtrl+V\t\t-  Paste\nAlt+S\t\t-  Custom Screenshot\nCtrl+Alt+Cmd+S\t\t-  Snapshot current window\nCtrl+Alt+Cmd+T\t\t-  Open Terminal\nCtrl+Alt+Cmd+space\t\t-  Clipboard History\nCtrl+Alt+Cmd+C\t\t-  AutoClick\nCtrl+Alt+Cmd+M\t\t-  Locate pointer\n[Ctrl+]Alt+Cmd+P\t\t-  Generate Strong/Weak Password\nCtrl+Alt+Cmd+R\t\t-  Reload Hammerspoon", 6) end)

--- Open Downloads folder
bindKey("ctrl", "D", function() open(HOME .. "/Downloads") end)

--- Pastes clipboard
bindKey("ctrl", "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

--- Takes a snapshot of the current window
bindKey(ctrlAltCmd, "S", snapshotWindow)

--- Open terminal
bindKey(ctrlAltCmd, "T", function() hs.application.launchOrFocus("Terminal") end)

--- Generate a weak or strong password and copy to the clipboard
bindKey({"alt", "cmd"}, "P", function() spoon.PasswordGenerator.weakPassword(8) end)
bindKey(ctrlAltCmd, "P", function() spoon.PasswordGenerator.strongPassword(16) end)

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