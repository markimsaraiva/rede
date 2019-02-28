local i = {
["10:00"] = {nome = "Invasion Cartoon", pos = {x=157, y=36, z=7}, monster = {"1 Invasion Cartoon", "1 Invasion Cartoon"}},
["14:00"] = {nome = "Invasion Cartoon", pos = {x=137, y=53, z=7}, monster = {"1 Invasion Cartoon"}},
}

function onThink(interval, lastExecution)
hours = tostring(os.date("%X")):sub(1, 5)
tb = i[hours]
if tb then
doBroadcastMessage(hours .. " - " .. Invasion Cartoon está invadindo a city principal")
for _,x in pairs(tb.monster) do
for s = 1, tonumber(x:match("%d+")) do
doSummonCreature(x:match("%s(.+)"), tb.pos)
end
end
end
return true
end