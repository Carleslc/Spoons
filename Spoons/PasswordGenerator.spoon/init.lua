--- === PasswordGenerator ===
---
--- Generate simple or strong passwords and copy them to clipboard
---
--- Download: [https://github.com/Carleslc/Spoons/raw/master/Spoons/PasswordGenerator.spoon.zip](https://github.com/Carleslc/Spoons/raw/master/Spoons/PasswordGenerator.spoon.zip)

local obj = {}
obj.__index = obj

-- Metadata

obj.name = "PasswordGenerator"
obj.version = "1.0"
obj.author = "Carlos Lázaro Costa <lazaro.costa.carles@gmail.com>"
obj.homepage = "https://github.com/Carleslc/PasswordGenerator"
obj.license = "MIT - https://opensource.org/licenses/MIT"

-- Utils

require("utils.hs")

function obj:notify(text)
    notify(text, 2, obj.name)
end

-- Methods

--- PasswordGenerator:generatePassword(strong[ , length, chars])
--- Method
--- Generates a random password
---
--- Parameters:
---  * strong - A boolean, true if password can contain special characters: !\\#$%&()*+-./<=>?@[]^_{|}~ or false for only alphanumeric characters: ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789\nExcludes similar characters like O and 0 or ' and " or ` and ´ or : and ; and ,
---  * length - Password length. Defaults to 8.
---  * chars - Optional charset. If filled then `strong` parameter is ignored and only this charset is used.
---
--- Returns:
---  * Generated password
function obj:generatePassword(strong, length, chars)
    local index = 0
    local pw = ""
    local rnd = 0
    local customChars = chars ~= nil
    if not customChars then
        chars = {
            "ABCDEFGHIJKLMNPQRSTUVWXYZ", -- O
            "abcdefghijklmnopqrstuvwxyz",
            "123456789" -- 0
        }
        if strong then
            table.insert(chars, "!\\#$%&()*+-./<=>?@[]^_{|}~") -- '"`´:;,
        end
    end
    length = length or 8
    repeat
        index = index + 1
        rnd = math.random(chars[index]:len())
        if math.random(2) == 1 then
            pw = pw .. chars[index]:sub(rnd, rnd)
        else
            pw = chars[index]:sub(rnd, rnd) .. pw
        end
        index = index % #chars
    until pw:len() >= length
    return pw
end

--- PasswordGenerator:copyPassword(strong[ , length, chars])
--- Method
--- Generates a random password and copies it to the clipboard
---
--- Parameters:
---  * strong - A boolean, true if password can contain special characters: !\\#$%&()*+-./<=>?@[]^_{|}~ or false for only alphanumeric characters: ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789\nExcludes similar characters like O and 0 or ' and " or ` and ´ or : and ; and ,
---  * length - Password length. Defaults to 8.
---  * chars - Optional charset. If filled then `strong` parameter is ignored and only this charset is used.
---
--- Returns:
---  * Generated password
function obj:copyPassword(strong, length, chars)
    math.randomseed(os.time())
    local pw = obj:generatePassword(strong, length, chars)
    hs.pasteboard.setContents(pw)
    hs.pasteboard.changeCount("Hammerspoon - PasswordGenerator")
    obj:notify("Password copied to clipboard!", 2)
    return pw
end

--- PasswordGenerator:weakPassword([length, chars])
--- Method
--- Generates a random password and copies it to the clipboard. This method uses only alphanumeric characters: ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789\nExcludes similar characters like O and 0 or ' and " or ` and ´ or : and ; and ,
---
--- Parameters:
---  * length - Password length. Defaults to 8.
---  * chars - Optional charset. If filled then only this charset is used.
---
--- Returns:
---  * Generated password
obj.weakPassword = hs.fnutils.partial(obj.copyPassword, obj, false)

--- PasswordGenerator:strongPassword([length, chars])
--- Method
--- Generates a random password and copies it to the clipboard. This method can use special characters: ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789!\\#$%&()*+-./<=>?@[]^_{|}~\nExcludes similar characters like O and 0 or ' and " or ` and ´ or : and ; and ,
---
--- Parameters:
---  * length - Password length. Defaults to 8.
---  * chars - Optional charset. If filled then only this charset is used.
---
--- Returns:
---  * Generated password
obj.strongPassword = hs.fnutils.partial(obj.copyPassword, obj, true)

-- Return spoon object

return obj