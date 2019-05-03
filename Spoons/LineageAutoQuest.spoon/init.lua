--- === LineageAutoQuest ===
---
--- Lineage II Revolution Auto-Quest Bot (Nox App Player)
---
--- Download: [https://github.com/Carleslc/Spoons/raw/master/Spoons/LineageAutoQuest.spoon.zip](https://github.com/Carleslc/Spoons/raw/master/Spoons/LineageAutoQuest.spoon.zip)

local bot = {}
bot.__index = bot

-- Metadata

bot.name = "LineageAutoQuest"
bot.version = "1.0"
bot.author = "Carlos Lázaro Costa <lazaro.costa.carles@gmail.com>"
bot.homepage = "https://github.com/Carleslc/"
bot.license = "MIT - https://opensource.org/licenses/MIT"

-- Utils

require("utils.images")

local function script_path() -- Internal function used to find our location, so we know where to load files from
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*/)")
end
bot.spoonPath = script_path()

function bot:notify(text)
    notify(text, 3, bot.name)
end

-- Configuration

lineageAutoQuestRunning = false
nox = hs.application.get("Nox App Player")

function bot:init()
    self.autoQuestActivations = 0
    self.lastPx = { r = 0, g = 0, b = 0 }
end

--- LineageAutoQuest:bindHotkeys(mapping)
--- Method
--- Binds hotkeys for LineageAutoQuest
---
--- Parameters:
---  * mapping - A table containing hotkey modifier/key details for the following items:
---   * triggerBot - Start/Stop LineageAutoQuest bot
function obj:bindHotkeys(mapping)
   local def = { triggerBot = hs.fnutils.partial(self.start, self) }
   hs.spoons.bindHotkeysToSpec(def, mapping)
end

--- LineageAutoQuest:start()
--- Method
--- Start/Stop Auto-Quest Bot
---
--- Parameters:
---  * None
function bot:start()
    if nox == nil then
        self.notify("Starting Nox App Player")
        if not hs.application.launchOrFocus("Nox App Player") then
            self.notify("Nox App Player doesn't exist! Stopped")
            return self
        end
    end

    nox = nox:allWindows()[1]

    -- Frames in pixels from PNG (start position is 1,1)
    local pxToLocal = nox:screen():absoluteToLocal(nox:frame()).h / 3180
    local noxGameFrame = { x = 199*pxToLocal, y = 143*pxToLocal, w = 4848*pxToLocal, h = 3032*pxToLocal } -- tablet 1440x900
    self.questFrame = { x = noxGameFrame.x, y = noxGameFrame.y + 800*pxToLocal, w = 1000*pxToLocal, h = 848*pxToLocal }

    if self.isRunning() then
        lineageAutoQuestRunning = false
        nox:focus()
        self:triggerQuest()
        self.notify("Stopped")
    else
        lineageAutoQuestRunning = true
        nox:focus()

        self.lineageAutoQuestTriggerTimer = hs.timer.doWhile(self.isRunning(), function()
            nox:focus()
            self:enableAutoQuest()
            checkActiveQuest = hs.timer.doAfter(3, function()
                if self.autoQuestActivations > 3 then
                    print("AutoQuest obstacle avoiding or tutorial")
                    self.autoQuestActivationsReset:fire()
                    self:obstacleAvoiding():tutorialSkip():enableAutoQuest()
                end
            end)
        end, 5 --[[seconds]])

        self.lineageAutoQuestDialogTimer = hs.timer.doWhile(self.isRunning(), function() -- nextDialog
            hs.eventtap.keyStroke({}, "J")
            hs.eventtap.keyStroke({}, "H")
            hs.eventtap.keyStroke({}, "N")
        end, 1 --[[second]])

        self:enableAutoQuest()
        self.notify("Started")
    end
    return self
end

function bot:stop()
    self:start()
end

-- Methods

function bot:isRunning()
    return lineageAutoQuestRunning
end

function bot:triggerQuest()
    hs.eventtap.keyStroke({}, "Q")
    print("Quest triggered")
    return self
end

function bot:tutorialSkip()
    hs.eventtap.keyStroke({}, "X")
    hs.eventtap.keyStroke({}, "<")
    hs.timer.usleep(1000000)
    hs.eventtap.keyStroke({}, "<")
    hs.eventtap.keyStroke({}, "S")
    hs.timer.usleep(500000)
    hs.eventtap.keyStroke({}, "S")
    hs.eventtap.keyStroke({}, "B")
    return self
end

function bot:obstacleAvoiding()
    local function randomMove()
        local moves = { "up", "down", "left", "right" }
        return moves[math.random(#moves)] -- #moves is the size of moves list
    end
    hs.eventtap.keyStroke({}, randomMove(), 1500000)
    hs.eventtap.keyStroke({}, randomMove(), 1500000)
    return self
end

function bot:enableAutoQuest()
    local questImageFrame = snapshot(self.questFrame, nox, "quest")
    px = getPixel(questImageFrame, 305, 9)
    print("Reading AutoQuest pixel " .. px.r .. ", " .. px.g .. ", " .. px.b)

    local function isInactive()
        return px.r < 100
            or (px.r < 200 and self.lastPx.r < 200 and isSimilar(px, self.lastPx, 15))
            or isSimilar(px, self.lastPx, 3)
    end

    if isInactive() then
        print("AutoQuest Inactive")
        self:triggerQuest()
        self.autoQuestActivations = self.autoQuestActivations + 1
        self.autoQuestActivationsReset = hs.timer.doAfter(30, function()
            self.autoQuestActivations = 0
        end)
    end
    self.lastPx = px
    os.execute("rm " .. questImageFrame)
    return self
end

-- Return spoon object

return bot