local cf = {
	teleportPosition = {x = 172, y = 48, z = 7, stackpos = 1}, -- Where the teleport will be created
	teleportToPosition = {x = 2194, y = 2049, z = 7}, -- Where the teleport will take you 
	from = {x=2172,y=2042,z=7}, -- left top corner of event room
	to = {x=2217,y=2062,z=7} -- right bottom corner of event room
}

function onTime ()
	doItemSetAttribute(doCreateTeleport(1387, cf.teleportToPosition, cf.teleportPosition), "aid", 1747)
	doBroadcastMessage("[Firestorm] O FireStorm event vai comecar em 3 minutos! O teleport sera fechado quando o evento comecar!", MESSAGE_STATUS_WARNING)
	setGlobalStorageValue(17, 0)
	addEvent(startEventF, 1 * 60 * 1000)
	return true
end

function startEventF ()
	doRemoveItem(getTileItemById(cf.teleportPosition, 1387).uid, 1)
	if getGlobalStorageValue(17) > 0 then
		addEvent(doRepeatCheckFireStorm, 5 * 1000)
		doBroadcastMessage("[Firestorm] Boa sorte no evento FireStorm galera! O teleport foi fechado!", MESSAGE_STATUS_WARNING)
	else
		doBroadcastMessage('[FireStorm] O evento FireStorm nao comecou porque nao havia a quantidade de Players suficiente!')
	end
end

y, x = 1, 1

function doRepeatCheckFireStorm ()
	if getGlobalStorageValue(17) > 0 then
		local xTable, yTable, playerTable = {}, {}, {}
		
		for x = cf.from.x, cf.to.x do
			for y = cf.from.y, cf.to.y do
				table.insert(xTable, x)
				table.insert(yTable, y)
				
				local n, i = getTileInfo({x=x, y=y, z=cf.to.z}).creatures, 1
				if n ~= 0 then
					local v = getThingfromPos({x=x, y=y, z=cf.to.z, stackpos=i}).uid
					while v ~= 0 do
						if isPlayer(v) then
							table.insert(playerTable, v)
							if n == #playerTable then
								break
							end
						end
						i = i + 1
						v = getThingfromPos({x=x, y=y, z=cf.to.z, stackpos=i}).uid
					end
				end
			end
		end
		
		if #playerTable == 1 then
			doCreatureAddHealth(playerTable[1], getCreatureMaxHealth(playerTable[1]) - getCreatureHealth(playerTable[1]))
			doCreatureAddMana(playerTable[1], getCreatureMaxMana(playerTable[1]) - getCreatureMana(playerTable[1]))
			doTeleportThing(playerTable[1], getTownTemplePosition(getPlayerTown(playerTable[1])), true)
			doItemSetAttribute(doPlayerAddItem(playerTable[1], 7371), "name", "trophy " .. getCreatureName(playerTable[1]) .. "! Congratulations! Winner a fire event")
			doPlayerAddItem(playerTable[1],9971,10)
			doPlayerAddItem(playerTable[1],6527,100)
			doPlayerAddItem(playerTable[1],12695,10)
			doBroadcastMessage('O evento FireStorm terminou. O vencedor e ' .. getCreatureName(playerTable[1]) .. '. Congratulations.')
			setGlobalStorageValue(17, 0)
			
			x, y = 1, 1
		elseif #playerTable > 1 then
			for a = 1, y do
				local pos = {x=xTable[math.random(#xTable)], y=yTable[math.random(#yTable)], z=7}
				for _, player in ipairs(playerTable) do
					local pPos = getThingPos(player)
					if pPos.x == pos.x and pPos.y == pos.y and pPos.z == pos.z then
						doCreatureAddHealth(player, - getCreatureMaxHealth(player))
					end
				end
				doSendDistanceShoot({x = pos.x - math.random(4, 6), y = pos.y - 5, z = pos.z}, pos, CONST_ANI_FIRE)
				addEvent(doSendMagicEffect, 150, pos, CONST_ME_HITBYFIRE)
				addEvent(doSendMagicEffect, 150, pos, CONST_ME_FIREAREA)
				math.random(100,1000)
			end
			if x == 5 * y then
				y = y + 1
			end
			
			x = x + 1
		else
			doBroadcastMessage('Nao houve vencedor no FireStorm Event')
			setGlobalStorageValue(17, 0)
			x, y = 1, 1
		end
		
		addEvent(doRepeatCheckFireStorm, 1000)
	end
end