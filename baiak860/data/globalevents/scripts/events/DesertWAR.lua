function onTime ()
	doItemSetAttribute(doCreateItem(1387, 1, {x = 170, y = 54, z = 7, stackpos = 1}), "aid", 2137)
	doBroadcastMessage("Desert WAR começando em 3 minutos! O teletransporte será fechado quando o evento começar CORRA!", MESSAGE_STATUS_WARNING)
	setGlobalStorageValue(4, 0)
	setGlobalStorageValue(5, 0)
	addEvent(startDesert, 3 * 60 * 1000)
	return true
end

function startDesert()
	doRemoveItem(getTileItemById({x = 170, y = 54, z = 7}, 1387).uid, 1)
	if getGlobalStorageValue(4) > 0 and getGlobalStorageValue(5) > 0 then
		doBroadcastMessage("Boa Sorte a Guerra Vai Começar Monte Sua Estrategia !", MESSAGE_STATUS_WARNING)		
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 51) > 0 or getPlayerStorageValue(cid, 52) > 0 then
				doCreatureSetNoMove(cid, false)
			end
		end
	else
		doBroadcastMessage("Desert War não começou porque não havia jogadores suficientes, Aguarde o Proximo Evento .")
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 51) > 0 or getPlayerStorageValue(cid, 52) > 0 then
				doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
				doCreatureSetNoMove(cid, false)
			end
		end
	end
	return true
end