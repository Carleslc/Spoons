bindKey = hs.hotkey.bind

alert = hs.alert
alert.defaultStyle.atScreenEdge = 0 -- Center

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

function openTerminalHere()
    hs.osascript.applescript([[
        tell application "Finder"
            if front window exists then
                set theFolder to POSIX path of (target of front window as string)
                tell application "Terminal"
                    if not (exists window 1) then reopen
                    activate
                    do script "cd '" & theFolder & "'" in window 1
                end tell
            else
                tell application "Terminal" to activate
            end if
        end tell
    ]])
end
