--- === Resources ===
---
--- Add a resource to https://carleslc.me/resources with the copied url
---
--- Download: [https://github.com/Carleslc/Spoons/raw/master/Spoons/Resources.spoon.zip](https://github.com/Carleslc/Spoons/raw/master/Spoons/Resources.spoon.zip)

local obj = {}
obj.__index = obj

-- Metadata

obj.name = "Resources"
obj.version = "1.0"
obj.author = "Carlos Lázaro Costa <lazaro.costa.carles@gmail.com>"
obj.homepage = "https://github.com/Carleslc/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

-- Utils

function obj:notify(text)
    hs.notify.new({title=obj.name, informativeText=text, withdrawAfter=3}):send()
end

-- Configuration

--- Resources:bindHotkeys(mapping)
--- Method
--- Binds hotkeys for Resources
---
--- Parameters:
---  * mapping - A table containing hotkey modifier/key details for the following items:
---   * add - Open the add resources form with prefilled information about the copied URL
function obj:bindHotkeys(mapping)
   local def = { add = hs.fnutils.partial(self.addWithCopiedUrl, self) }
   hs.spoons.bindHotkeysToSpec(def, mapping)
end

--- Resources.python
--- Variable
--- Python command. Defaults to python3
obj.python = nil

--- Resources.path
--- Variable
--- Required. Path to get_info.py script.
obj.path = nil

-- Methods

--- Resources:add()
--- Method
--- Open the add resources form with prefilled information about an URL
---
--- Parameters:
---  * url - URL of the resource to add
function obj:add(url)
    if self.path == nil then
        self:notify("Resources.path is not set")
    else
        output, status = hs.execute((self.python or "python3") .. " " .. self.path .. " --add --colorless " .. url, true)
        if not status then
            self:notify(output)
        else
            lines = output:split('\n')
            self:notify(lines[#lines-1]) -- Result last line
        end
    end
end

--- Resources:addWithCopiedUrl()
--- Method
--- Open the add resources form with prefilled information about the copied URL
---
--- Parameters:
---  * None
function obj:addWithCopiedUrl()
    self:add(hs.pasteboard.getContents())
end

-- Return spoon object

return obj