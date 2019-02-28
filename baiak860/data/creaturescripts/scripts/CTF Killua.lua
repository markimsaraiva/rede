function onLogin(cid)
	if getPlayerStorageValue(cid, 822066) == 1 or getPlayerStorageValue(cid, CTF.storages.redTeam) == 1 or getPlayerStorageValue(cid, CTF.storages.greenTeam) == 1 or getPlayerStorageValue(cid, CTF.storages.greenFlag) == 1 or getPlayerStorageValue(cid, CTF.storages.redFlag) == 1 then
		doPlayerSetStorageValue(cid, 822066, -1)
		doPlayerSetStorageValue(cid, CTF.storages.redTeam, -1)
		doPlayerSetStorageValue(cid, CTF.storages.greenTeam, -1)
		doPlayerSetStorageValue(cid, CTF.storages.redFlag, -1)
		doPlayerSetStorageValue(cid, CTF.storages.greenFlag, -1)
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Ocorreu algum problema com seu char e você foi enviado para seu templo. O erro já foi corrigido, não há razões para se preocupar.")
	end
	registerCreatureEvent(cid, "Ctfdeath")
	registerCreatureEvent(cid, "Ctfcombat")
	registerCreatureEvent(cid, "Ctfoutfit")
	return true
end

local function removeFlag(pos, id)
	local flag = getThingFromPos(pos)
	if flag and flag.uid > 0 and flag.itemid == id then
		doRemoveItem(flag.uid, 1)
	end
end

function onCombat(cid, target)
	if isPlayer(cid) and isPlayer(target) then
		if getPlayerStorageValue(cid, CTF.storages.greenTeam) == 1 and getPlayerStorageValue(target, CTF.storages.greenTeam) == 1 or getPlayerStorageValue(cid, CTF.storages.redTeam) == 1 and getPlayerStorageValue(target, CTF.storages.redTeam) == 1 then
			return false
		end
	end
	return true
end

local function telep(cid)
    if isPlayer(cid) then
        	doTeleportThing(cid, getPlayerStorageValue(cid, CTF.storages.greenTeam) == 1 and CTF.base_A or CTF.base_B)
    end
end

function onPrepareDeath(cid, deathList)
	if isPlayer(cid) and getPlayerStorageValue(cid, 822066) == 1 then
 	addEvent(telep, 100, cid)
		doTeleportThing(cid, getPlayerStorageValue(cid, CTF.storages.greenTeam) == 1 and CTF.base_A or CTF.base_B)
		if getPlayerStorageValue(cid, CTF.storages.greenFlag) == 1 then
			doPlayerSetStorageValue(cid, CTF.storages.greenFlag, -1)
			local flag = doCreateItem(CTF.greenFlag, 1, CTF.greenFlagPos)
			doItemSetAttribute(flag, 'aid', 5434)
			warnPlayersWithStorage(822066, 1, MESSAGE_STATUS_WARNING, "O jogador "..getCreatureName(cid).." morreu com a Bandeira Verde e ela foi devolvida à sua base.")
			local pos = getThingPos(cid)
			addEvent(removeFlag, 200, pos, CTF.greenFlag)
		elseif getPlayerStorageValue(cid, CTF.storages.redFlag) == 1 then
			doPlayerSetStorageValue(cid, CTF.storages.redFlag, -1)
			local flag = doCreateItem(CTF.redFlag, 1, CTF.redFlagPos)
			doItemSetAttribute(flag, 'aid', 5435)
			warnPlayersWithStorage(822066, 1, MESSAGE_STATUS_WARNING, "O jogador "..getCreatureName(cid).." morreu com a Bandeira Vermelha e ela foi devolvida à sua base.")
			local pos = getThingPos(cid)
			addEvent(removeFlag, 200, pos, CTF.redFlag)
		end
	end
	return true
end

local outfit_tb = {
[194] = 121211, -- Acolyte
[193] = 121212, --- Enlightened
[98] = 121218, -- Pirate
[306] = 121219 -- Gonka
}

function onOutfit(cid, old, current)
	if outfit_tb[current.lookType] then
		if getPlayerStorageValue(cid, outfit_tb[current.lookType]) ~= 1 then
			if current.lookType == 306 then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não é digno de usar esse outfit. Somente aqueles que derrotaram o Gonka podem usá-lo.")
				doCreatureChangeOutfit(cid, old)
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não pode usar este outfit pois ele é exclusivo. Para ter acesso a ele, compre em nossa shop do site.")
			end
			return false
		end
	end
    if getPlayerStorageValue(cid, 822066) == 1 then
		doPlayerSendCancel(cid, "Nao pode trocar outfit no CTF.")
		return false
    end
    return true
end