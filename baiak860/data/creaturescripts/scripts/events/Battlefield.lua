function onCombat(cid, target)
	if isPlayer(cid) and isPlayer(target) then
		if getPlayerStorageValue(cid, 501) == 1 and getPlayerStorageValue(target, 501) == 1 or getPlayerStorageValue(cid, 502) == 1 and getPlayerStorageValue(target, 502) == 1 or getPlayerStorageValue(cid, 171) == 1 and getPlayerStorageValue(target, 171) == 1 or getPlayerStorageValue(cid, 172) == 1 and getPlayerStorageValue(target, 172) == 1 then
			doPlayerSendCancel(cid, "Sorry, not possible.")
			return false			
		end
	end
	return true
end

function onPrepareDeath(cid, deathList, lastHitKiller, mostDamageKiller)
	if getPlayerStorageValue(cid, 501) == 1 then
		if getGlobalStorageValue(414) > 1 then
			setPlayerStorageValue(cid, 501, 0)
			setGlobalStorageValue(414, getGlobalStorageValue(414)-1)
			doRemoveCondition(cid, CONDITION_OUTFIT)
			doItemSetAttribute(doCreateItem(3058, 1, getPlayerPosition(cid)), "description", "You recognize " .. getCreatureName(cid) .. ". He was killed by Blue team.")
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[BattleField] Você Morreu!")
		doPlayerSave(cid)
			for _, pid in ipairs(getPlayersOnline()) do
					if getPlayerStorageValue(pid, 501) == 1 or getPlayerStorageValue(pid, 502) == 1 then
						doPlayerSendTextMessage(pid, 18, "[BattleField] Players restante: ".. getGlobalStorageValue(415) .." Blue X ".. getGlobalStorageValue(414) .." Yellow")
					end
				end
		else
			setPlayerStorageValue(cid, 501, 0)
			setGlobalStorageValue(414, getGlobalStorageValue(414)-1)
			doRemoveCondition(cid, CONDITION_OUTFIT)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[BattleField] Você foi o último sobrevivente do time perdedor e também ganhou recompensa!")
			doPlayerAddItem(cid,6527,50)
			doPlayerAddItem(cid,12695,2)
			doBroadcastMessage("[BattleField] ".. getGlobalStorageValue(415) .." Players do Blue team sobreviveram ao evento e obteram a recompensa de 60 Event Coins!", MESSAGE_EVENT_ADVANCE)
			setGlobalStorageValue(415, getGlobalStorageValue(415)-1)
		doPlayerSave(cid)
			for _, cid in ipairs(getPlayersOnline()) do
				if getPlayerStorageValue(cid, 502) > 0 then
					setPlayerStorageValue(cid, 502, 0)
					doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
					doPlayerAddItem(cid,6527,60)
					doPlayerAddItem(cid,12695,5)
					doRemoveCondition(cid, CONDITION_OUTFIT)
		doPlayerSave(cid)
				end
			end
		end
	elseif getPlayerStorageValue(cid, 502) == 1 then
		if getGlobalStorageValue(415) > 1 then
			setPlayerStorageValue(cid, 502, 0)
			setGlobalStorageValue(415, getGlobalStorageValue(415)-1)
			doRemoveCondition(cid, CONDITION_OUTFIT)
			doItemSetAttribute(doCreateItem(3058, 1, getPlayerPosition(cid)), "description", "You recognize " .. getCreatureName(cid) .. ". He was killed by Yellow team.")
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[BattleField] Você Morreu!")
		doPlayerSave(cid)
			for _, pid in ipairs(getPlayersOnline()) do
					if getPlayerStorageValue(pid, 501) == 1 or getPlayerStorageValue(pid, 502) == 1 then
						doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_ORANGE, "[BattleField] Players restantes: ".. getGlobalStorageValue(415) .." Blue X ".. getGlobalStorageValue(414) .." Yellow")
					end
				end
		else
			setPlayerStorageValue(cid, 502, 0)
			setGlobalStorageValue(415, getGlobalStorageValue(415)-1)
			doRemoveCondition(cid, CONDITION_OUTFIT)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[BattleField] Você foi o último sobrevivente do time perdedor e também ganhou recompensa!")
			doPlayerAddItem(cid,6527,30)
			doPlayerAddItem(cid,12695,2)
			doBroadcastMessage("[BattleField] ".. getGlobalStorageValue(414).." Players do Yellow team sobreviveram ao evento e obteram a recompensa de 60 Event Coins!", MESSAGE_EVENT_ADVANCE)
			setGlobalStorageValue(414, getGlobalStorageValue(414)-1)
		doPlayerSave(cid)
			for _, cid in ipairs(getPlayersOnline()) do
				if getPlayerStorageValue(cid, 501) > 0 then
					setPlayerStorageValue(cid, 501, 0)
					doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
					doPlayerAddItem(cid,6527,60)
					doPlayerAddItem(cid,12695,5)
					doRemoveCondition(cid, CONDITION_OUTFIT)
		doPlayerSave(cid)
				end
			end
		end
	end
	return true
end