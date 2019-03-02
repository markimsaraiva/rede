function onStepIn(cid, item, position, fromPosition)
	if item.actionid == 5436 then
		if getPlayerStorageValue(cid, CTF.storages.redFlag) == 1 then
			setGlobalStorageValue(CTF.storages.greenTeam, getStorageZero(CTF.storages.greenTeam) + 1)
			warnPlayersWithStorage(822066, 1, MESSAGE_STATUS_WARNING, "O jogador "..getCreatureName(cid).." levou a Bandeira Vermelha até a base verde e marcou um ponto para o time verde!")
			warnPlayersWithStorage(822066, 1, MESSAGE_STATUS_CONSOLE_BLUE, "Placar:\n Time Verde -> "..getStorageZero(CTF.storages.greenTeam).." ponto(s).\n Time Vermelho: -> "..getStorageZero(CTF.storages.redTeam).." ponto(s).")
			doPlayerSetStorageValue(cid, CTF.storages.redFlag, -1)
			doSendMagicEffect(CTF.redFlagPos, 28)
			if getStorageZero(CTF.storages.greenTeam) == 10 then
				warnPlayersWithStorage(822066, 1, 25, "O Time Verde atingiu 10 pontos e venceu o evento! Os membros que ainda estão presentes receberam alguns prêmios!")
				CTF.removeFlags()
				for _, pid in pairs(getPlayersOnline()) do
					if getPlayerStorageValue(pid, CTF.storages.greenTeam) == 1 then
						local am = {6570, 6570, 6570, 6570}
						doPlayerAddItem(pid, 9971, 30)
						doPlayerAddItem(pid, am[math.random(1, 4)], 1)
					end
				end
				for _, pid in pairs(getPlayersOnline()) do
					if getPlayerStorageValue(pid, 822066) == 1 then
						if getPlayerStorageValue(pid, CTF.storages.greenFlag) == 1 or getPlayerStorageValue(pid, CTF.storages.redFlag) == 1 then
							doPlayerSetStorageValue(pid, CTF.storages.greenFlag, -1)
							doPlayerSetStorageValue(pid, CTF.storages.redFlag, -1)
						end
						doTeleportThing(pid, CTF.exit_)
						doPlayerSetStorageValue(pid, 822066, -1)
						doPlayerSetStorageValue(pid, CTF.storages.redTeam, -1)
						doPlayerSetStorageValue(pid, CTF.storages.greenTeam, -1)
						doRemoveCondition(pid, CONDITION_OUTFIT)
					end
				end
			else						
				local flag = doCreateItem(CTF.redFlag, 1, CTF.redFlagPos)
				doItemSetAttribute(flag, 'aid', 5435)
			end
		end
	elseif item.actionid == 5437 then
		if getPlayerStorageValue(cid, CTF.storages.greenFlag) == 1 then
			setGlobalStorageValue(CTF.storages.redTeam, getStorageZero(CTF.storages.redTeam) + 1)
			warnPlayersWithStorage(822066, 1, MESSAGE_STATUS_WARNING, "O jogador "..getCreatureName(cid).." levou a Bandeira Verde até a base vermelha e marcou um ponto para o time vermelho!")
			warnPlayersWithStorage(822066, 1, MESSAGE_STATUS_CONSOLE_BLUE, "Placar:\n Time Vermelho -> "..getStorageZero(CTF.storages.redTeam).." ponto(s).\n Time Verde: -> "..getStorageZero(CTF.storages.greenTeam).." ponto(s).")
			doPlayerSetStorageValue(cid, CTF.storages.greenFlag, -1)
			doSendMagicEffect(CTF.greenFlagPos, 28)
			if getStorageZero(CTF.storages.redTeam) == 10 then
				warnPlayersWithStorage(822066, 1, 25, "O Time Vermelho atingiu 10 pontos e venceu o evento! Os membros que ainda estão presentes receberam alguns prêmios!")
				CTF.removeFlags()
				for _, pid in pairs(getPlayersOnline()) do
					if getPlayerStorageValue(pid, CTF.storages.redTeam) == 1 then
						local am = {6570, 6570, 6570, 6570}
						doPlayerAddItem(pid, 9971, 30)
						doPlayerAddItem(pid, am[math.random(1, 4)], 1)					
					end
				end
				for _, pid in pairs(getPlayersOnline()) do
					if getPlayerStorageValue(pid, 822066) == 1 then
						if getPlayerStorageValue(pid, CTF.storages.greenFlag) == 1 or getPlayerStorageValue(pid, CTF.storages.redFlag) == 1 then
							doPlayerSetStorageValue(pid, CTF.storages.greenFlag, -1)
							doPlayerSetStorageValue(pid, CTF.storages.redFlag, -1)
						end
						doTeleportThing(pid, CTF.exit_)
						doPlayerSetStorageValue(pid, 822066, -1)
						doPlayerSetStorageValue(pid, CTF.storages.redTeam, -1)
						doPlayerSetStorageValue(pid, CTF.storages.greenTeam, -1)
						doRemoveCondition(pid, CONDITION_OUTFIT)
					end
				end
			else						
				local flag = doCreateItem(CTF.greenFlag, 1, CTF.greenFlagPos)
				doItemSetAttribute(flag, 'aid', 5434)
			end
		end
	end
	return true
end