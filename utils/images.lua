require("utils.hs")
require("utils.strings")

function snapshot(rect, window, title, path)
    if title == nil then title = "" else title = "-" .. title end
    if path == nil then path = HOME .. "/.hammerspoon/cache/" end
    local file = path .. os.time() .. title .. ".png"
    local screen = window:screen()
    local frame = screen:absoluteToLocal(window:frame())
    if rect == nil then rect = { x = 0, y = 0, w = frame.w, h = frame.h } end
    rect = hs.geometry.rect { x = frame.x + rect.x, y = frame.y + rect.y, w = math.min(frame.w, rect.w), h = math.min(frame.h, rect.h) }
    local image = screen:snapshot(rect)
    image:saveToFile(file)
    return file
end

function snapshotWindow(title)
    notify("Snapshot to " .. snapshot(nil, hs.window.frontmostWindow(), title, os.getenv("HOME") .. "/Pictures/"))
    hs.launchOrFocus("Finder")
end

function getPixel(imageFile, x, y)
    local handle = io.popen("/usr/local/bin/python3 " .. hs.configdir .. "/utils/pixel_color.py " .. imageFile .. " " .. x .. " " .. y)
    local result = handle:read("*a")
    result = string.split(string.split(result, '\n')[1], ',')
    handle:close()
    return { r = tonumber(result[1]), g = tonumber(result[2]), b = tonumber(result[3]) }
end

function isSimilar(px1, px2, th)
    return px1.r <= px2.r + th and px1.r >= px2.r - th
        and px1.g <= px2.g + th and px1.g >= px2.g - th
        and px1.b <= px2.b + th and px1.b >= px2.b - th
end