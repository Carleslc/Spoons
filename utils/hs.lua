bindKey = hs.hotkey.bind

function notify(text, seconds, title)
	title = title or "Hammerspoon"
	print(title .. ": " .. text)
    hs.notify.new({title=title, informativeText=text, withdrawAfter=seconds or 5}):send()
end

function inspect(var)
	print(hs.inspect(var))
end

function pathWatcher(path, callback)
    hs.pathwatcher.new(path, callback):start()
end

function open(f)
	hs.execute("open " .. f)
end