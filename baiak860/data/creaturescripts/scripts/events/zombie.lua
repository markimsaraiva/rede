local config = {
	fromPosition = {x = 1667, y = 1654, z = 7}, -- top left cornor of the playground
	toPosition = {x = 1737, y = 1721, z = 7}, -- bottom right cornor of the playground
}

function onStatsChange(cid, attacker, type, combat, value)
	if isPlayer(cid) and isMonster(attacker) then
		if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
			if getGlobalStorageValue(3) > 1 then
				for _, pid in ipairs(getPlayersOnline()) do
					if isInArea(getPlayerPosition(pid), config.fromPosition, config.toPosition) then
						doPlayerSendTextMessage(pid, 18, "" .. getPlayerName(cid) .. " have been eated by Zombies! Only ".. (getGlobalStorageValue(3)-1) .." players are still alive.")
					end
				end
				doItemSetAttribute(doCreateItem(3058, 1, getPlayerPosition(cid)), "description", "You recognize " .. getCreatureName(cid) .. ". He was killed by "..getCreatureName(attacker)..".")
				doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
				doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
				doPlayerSendTextMessage(cid, 22, 'You loss.')
				doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MORTAREA)
				setGlobalStorageValue(3, getGlobalStorageValue(3)-1)
		doPlayerSave(cid)
			else
				doBroadcastMessage(getPlayerName(cid) .. " won the Zombie event! Congratulations!", MESSAGE_STATUS_WARNING)
				doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
				doSendMagicEffect(getPlayerPosition(cid), 36)
				doPlayerSendTextMessage(cid, 22, 'You Win!')
				doPlayerAddItem(cid,6527,150)				
				doPlayerAddItem(cid,9971,10)
				doPlayerAddItem(cid,6570,1)
				doPlayerAddItem(cid,12695,10)
				setGlobalStorageValue(3, getGlobalStorageValue(3)-1)
		doPlayerSave(cid)
				for x = config.fromPosition.x, config.toPosition.x do
					for y = config.fromPosition.y, config.toPosition.y do
						for z = config.fromPosition.z, config.toPosition.z do
							areapos = {x = x, y = y, z = z, stackpos = 253}
							getMonsters = getThingfromPos(areapos)
							if isMonster(getMonsters.uid) then
								doRemoveCreature(getMonsters.uid) 
							end								
						end
					end
				end
			end
			return false
		end
	end
	return true
end