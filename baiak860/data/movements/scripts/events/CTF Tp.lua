local posgreen = {
	{x = 1224, y = 436, z = 7},
	{x = 1217, y = 434, z = 7},
	{x = 1214, y = 445, z = 7},
	{x = 1228, y = 451, z = 7}
}

local posred = {
	{x = 1191, y = 436, z = 7},
	{x = 1202, y = 444, z = 7},
	{x = 1194, y = 451, z = 7},
	{x = 1202, y = 455, z = 7}
}

function onStepIn(cid, item, position, fromPosition)
	local tpsred = posred[math.random(#posred)]
	local tpsgreen = posgreen[math.random(#posgreen)]

	if item.aid == 1435 then
		doTeleportThing(cid, tpsred)
		doSendMagicEffect(tpsred, CONST_ME_TELEPORT)
	
	elseif item.aid == 1436 then
		doTeleportThing(cid, tpsgreen)
		doSendMagicEffect(tpsgreen, CONST_ME_TELEPORT)
	end
	return true
end