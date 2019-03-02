function onDeath(cid, corpse, killer)
    if isMonster(killer[1]) and isPlayer(cid) and getCreatureName(killer[1]) == 'Gonka' then
        doRemoveCreature(killer[1])
        setGlobalStorageValue(15421, -1)
    end
    return true
end

local function teleportHim(cid)
	if isPlayer(cid) then
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
	end
end

function onKill(cid, target)
	if isPlayer(cid) and isMonster(target) then
		if getCreatureName(target) == "Gonka" then
			doBroadcastMessage(""..getPlayerSex(cid) == 0 and "A jogadora " or "O jogador "..""..getCreatureName(cid).." matou o terrível Gonka e recebeu o outfit supremo! Parabens!",25)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Você conseguiu matar o Gonka e ganhou o outfit supremo! Você tem 30 segundos para pegar o loot dele.")
			doPlayerSetStorageValue(cid, 121219, 1)
			addEvent(teleportHim, 30000, cid)
			addEvent(setGlobalStorageValue, 30000, 15421, -1)
		end
	end
	return true
end
			

function onLogin(cid)
    registerCreatureEvent(cid, "GonkaKill")
    registerCreatureEvent(cid, "GonkaKill2")
    return true
end