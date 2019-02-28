local config = {
positions = {
["Snowball"] = { x = 162, y = 52, z = 7 },
["18 Hrs"] = { x = 163, y = 52, z = 7 },

}
}

function onThink(cid, interval, lastExecution)
for text, pos in pairs(config.positions) do
doSendAnimatedText(pos, text, 250)
doSendMagicEffect(pos, 43)
end

return TRUE
end