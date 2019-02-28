local c = {
	teleportPosition = {x = 172, y = 50, z = 7, stackpos = 1}, -- Where the teleport will be created
	teleportToPosition = {x = 1699, y = 1683, z = 7}, -- Where the teleport will take you 
	fromPosition = {x = 1667, y = 1654, z = 7}, -- top left cornor of the playground
	toPosition = {x = 1737, y = 1721, z = 7}, -- bottom right cornor of the playground
	availablePos = {},
}

function onTime ()
	doItemSetAttribute(doCreateTeleport(1387, c.teleportToPosition, c.teleportPosition), "aid", 1742)
	doBroadcastMessage("[Zombie] Zombie event sera comecado em 3 minutos! O teleport sera fechado quando o evento comecar!", MESSAGE_STATUS_WARNING)
	setGlobalStorageValue(3, 0)
	addEvent(startEvent, 3 * 60 * 1000)
	return true
end

function startEvent()
	doRemoveItem(getTileItemById(c.teleportPosition, 1387).uid, 1)
	if getGlobalStorageValue(3) > 0 then
		addEvent(spawnZombie, 10 * 1000)
		doBroadcastMessage("[Zombie]Boa sorte na Arena do Zombie Event Galera! O teleport foi fechado!", MESSAGE_STATUS_WARNING)
	else
		doBroadcastMessage('[Zombie] O Zombie Event nao comecou porque nao havia a quantidade de players suficiente!')
	end
end

function spawnZombie()
	if getGlobalStorageValue(3) > 0 then
		if #c.availablePos == 0 then 
			for xin = c.fromPosition.x, c.toPosition.x do
				for yin = c.fromPosition.y, c.toPosition.y do 
					if isWalkable({x = xin, y = yin, z = c.fromPosition.z}, true, false, false) then
						table.insert(c.availablePos, #c.availablePos + 1, {x = xin, y = yin, z = c.fromPosition.z}) -- Note que não é mais de 1 andar
					end
				end 
			end 
		end 
		pos = c.availablePos[math.random(1, #c.availablePos)]
		doCreateMonster("Event Zombie", pos)
		doSendMagicEffect(pos, CONST_ME_MORTAREA)
		addEvent(spawnZombie, 10 * 1000)
	end
end