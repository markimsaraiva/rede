local function removeWall(pos)
	local check = false
	for i = 1, 255 do
		if getTileItemById(pos,9118).uid > 0 then 
			doRemoveItem(getTileItemById(pos,9118).uid)
			check = true
			break
		end
	end
	if check then
		addEvent(doCreateItem, 60000, 9118, 1, pos)
	end
end

function onDeath(cid, corpse, deathList)
    if isPlayer(deathList[1]) and isMonster(cid) then
		if isInArea(getThingPos(cid), {x = 2428, y = 965, z = 7}, {x = 2459, y = 972, z = 7}) then
			doPlayerSendTextMessage(deathList[1], 25, "JAMAU")
			local pos = {}
			if getCreatureName(cid) == "Mariun Warrior" then
				doPlayerSendTextMessage(deathList[1], 25, "JAMAU2")
				pos = {x = 2443, y = 968, z = 7}
			elseif getCreatureName(cid) == "Mariun Wyzard" then
				pos = {x = 2451, y = 968, z = 7}
			elseif getCreatureName(cid) == "Mariun Ranger" then
				pos = {x = 2459, y = 968, z = 7}
			end
			--if #pos > 1 then
			      doCreatureSay(cid, "A parede sumiu e vai voltar em 1 minuto!", 1)
				  removeWall(pos)
			--else
				--doPlayerSendTextMessage(deathList[1], 25, "JAMAU4")
			--end
		end
	end
	return true
end