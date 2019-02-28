	local firstItems = {}
firstItems[0] =
{
2173,
2525,
2428,
2124,
2460,
2478,
2643
}
firstItems[1] =
{
2173,
8901,
7426,
2124,
2323,
2647,
2195,
8871
}
firstItems[2] =
{
2173,
8901,
7426,
2124,
2323,
2647,
2195,
8871
}
firstItems[3] =
{
2173,
2520,
7366,
2124,
2498,
2488,
2195,
2487
}
firstItems[4] =
{
2173,
2520,
8924,
2124,
2498,
2488,
2195,
2487

}

function onLogin(cid)
if getPlayerStorageValue(cid, 30001) == -1 then
for i = 1, table.maxn(firstItems[getPlayerVocation(cid)]) do
doPlayerAddItem(cid, firstItems[getPlayerVocation(cid)][i], 1)
end
local bag = doPlayerAddItem(cid, 10518, 1)
doAddContainerItem(bag, 2789, 100)
doAddContainerItem(bag, 2160, 20)
doAddContainerItem(bag, 12610, 1)
doAddContainerItem(bag, 7428, 1)
setPlayerStorageValue(cid, 30001, 1)
end
return TRUE
end