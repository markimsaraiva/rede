function endMatamata()
	local max, winner = 0, 0	
	for k, v in pairs(mata_mata) do
		if v > max then
			max = v; winner = k
		end
	end
	doBroadcastMessage("O evento Mata-Mata acabou! O vencedor foi "..winner.." com "..max.." kills! Parabéns!")
	if getPlayerByName(winner) then
		doPlayerSetBalance(getPlayerByName(winner), getPlayerBalance(getPlayerByName(winner)) + 50000000)
		doPlayerSendTextMessage(getPlayerByName(winner), 25, "Parabéns, você venceu o evento Mata-Mata! Você recebeu 50kk no banco.")
	end
	for _, pid in pairs(getPlayersOnline()) do
		if getPlayerStorageValue(pid, 9988124) == 1 then
			doPlayerSetStorageValue(pid, 9988124, -1)
			doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
		end
	end
	mata_mata = {}
end

function onKill(cid, target)
	if isPlayer(cid) and isPlayer(target) then
		if getPlayerStorageValue(cid, 9988124) == 1 and getPlayerStorageValue(target, 9988124) == 1 then
			if getGlobalStorageValue(9988125) == 1 then
				addEvent(endMatamata, 60 * 60 * 1000)
				setGlobalStorageValue(9988125, -1)
			end
			mata_mata[getCreatureName(cid)] = mata_mata[getCreatureName(cid)] and mata_mata[getCreatureName(cid)] + 1 or 1
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você matou "..getCreatureName(target)..", você está com "..mata_mata[getCreatureName(cid)].." kills.")
		end
	end
	return true
end

function onDeath(cid, killer)
	if isPlayer(cid) and getPlayerStorageValue(cid, 9988124) == 1 then
		doPlayerSetStorageValue(cid, 9988124, -1)
	end
	return true
end

function onLogin(cid)
	if getPlayerStorageValue(cid, 9988124) == 1 then
		doPlayerSetStorageValue(cid, 9988124, -1)
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
	end
	registerCreatureEvent(cid, "mmkill")
	registerCreatureEvent(cid, "mmdeath")
	return true
end