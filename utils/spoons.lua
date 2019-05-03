loadSpoon = hs.loadSpoon

function startSpoon(name)
    sp = loadSpoon(name)
    if sp.start ~= nil then sp:start() end
    return sp
end