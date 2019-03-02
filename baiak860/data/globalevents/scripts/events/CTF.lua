function onTime ()
	doItemSetAttribute(doCreateItem(1387, 1, {x = 165, y = 43, z = 7, stackpos = 1}), "aid", 1432)
	doBroadcastMessage("CTF Evento começando em 4 minutos! O teletransporte será fechado quando o evento começar!", MESSAGE_STATUS_WARNING)
	setGlobalStorageValue(6, 0)
	setGlobalStorageValue(7, 0)
	setGlobalStorageValue(8, 0)
	setGlobalStorageValue(9, 0)
	setGlobalStorageValue(10, 0)
	setGlobalStorageValue(11, 0)
	setGlobalStorageValue(12, 0)	
	addEvent(startCtf, 4 * 60 * 1000)
	return true
end

function startCtf()
	doRemoveItem(getTileItemById({x = 165, y = 43, z = 7}, 1387).uid, 1)
	if getGlobalStorageValue(6) > 4 and getGlobalStorageValue(7) > 0 then
		doBroadcastMessage("Boa Sorte o Evento Vai Começar!", MESSAGE_STATUS_WARNING)		
		addEvent(endCtf, 30 * 60 * 1000)
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 71) == 1 or getPlayerStorageValue(cid, 72) == 1 then
				doCreatureSetNoMove(cid, false)
			end
		end
	else
		doBroadcastMessage("CTF Evento não foi iniciado porque não havia jogadores suficientes.")
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 71) == 1 or getPlayerStorageValue(cid, 72) == 1 then
				doPlayerSetTown(cid, 1)
				doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			setPlayerStorageValue(cid, 71, 0)
			setPlayerStorageValue(cid, 72, 0)
			doRemoveCondition(cid, CONDITION_OUTFIT)
				doCreatureSetNoMove(cid, false)
			end
		end
	end
	return true
end

function endCtf()
	if getGlobalStorageValue(10) == 1 then
		return false
	end
	
	if getGlobalStorageValue(9) > getGlobalStorageValue(8) then
		doBroadcastMessage("CTF Event encerrado! Time vermelho foi o vencedor! "..getGlobalStorageValue(9).." X "..getGlobalStorageValue(8)..". Recompensa: 10kk de ExP, 100 Event Coins e 5 RibeirOT Coins!.")
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 72) == 1 then
				doPlayerAddExperience(cid, 10000000)
				doPlayerAddItem(cid,6527,100)
				doPlayerAddItem(cid,12695,5)
			end
		end
	elseif getGlobalStorageValue(8) > getGlobalStorageValue(9) then
		doBroadcastMessage("CTF Event encerrado! Time verde foi o vencedor! "..getGlobalStorageValue(8).." X "..getGlobalStorageValue(9)..". Recompensa: 10kk de ExP, 100 Event Coins e 5 RibeirOT Coins!")
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 71) == 1 then
				doPlayerAddExperience(cid, 10000000)
				doPlayerAddItem(cid,6527,100)
				doPlayerAddItem(cid,12695,5)
			end
		end
	elseif getGlobalStorageValue(8) == getGlobalStorageValue(9) then
		doBroadcastMessage("CTF Event encerrado! Empate de "..getGlobalStorageValue(8).." X "..getGlobalStorageValue(9).."! Todos participantes irão ganhar uma parte da recompensa: 5kk de ExP,50 Event Coins e 2 RibeirOT Coins!")
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 71) == 1 or getPlayerStorageValue(cid, 72) == 1 then
				doPlayerAddExperience(cid, 5000000)
				doPlayerAddItem(cid,6527,50)
				doPlayerAddItem(cid,12695,2)
			end
		end
	end
	
	for _, cid in ipairs(getPlayersOnline()) do
		if getPlayerStorageValue(cid, 71) == 1 or getPlayerStorageValue(cid, 72) == 1 then
			doPlayerSetTown(cid, 1)
			setPlayerStorageValue(cid, 71, 0)
			setPlayerStorageValue(cid, 72, 0)
			doRemoveCondition(cid, CONDITION_OUTFIT)
			doRemoveCondition(cid, CONDITION_INFIGHT)
			doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			doPlayerSave(cid)
		end
		if getPlayerStorageValue(cid, 82) >= os.time() then
		setPlayerStorageValue(cid, 82, 0)
	doItemSetAttribute(doCreateItem(1437, 1, {x = 1180, y = 444, z = 6, stackpos = 1}), "uid", 2499)
	end
	if getPlayerStorageValue(cid, 83) >= os.time() then
	setPlayerStorageValue(cid, 83, 0)
	doItemSetAttribute(doCreateItem(1435, 1, {x = 1234, y = 444, z = 6}), "uid", 2500)	
	end
	end
	return true
end