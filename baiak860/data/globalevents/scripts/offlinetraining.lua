local config = {
positions = {
["Axe"] = { x = 117, y = 46, z = 4 },
["Sword"] = { x = 119, y = 46, z = 4 },
["Club"] = { x = 121, y = 46, z = 4 },
["Distance"] = { x = 123, y = 46, z = 4 },
["Magic"] = { x = 125, y = 46, z = 4 },

}
}

function onThink(cid, interval, lastExecution)
for text, pos in pairs(config.positions) do
doSendAnimatedText(pos, text, 192)
doSendMagicEffect(pos, 6)
end

return TRUE
end 