local function controlFlag(cid)
    if not isPlayer(cid) then return true end
    if getPlayerStorageValue(cid, CTF.storages.redFlag) == 1 then
        doPlayerSetStorageValue(cid, CTF.storages.redFlag, -1)
        local flag = doCreateItem(CTF.redFlag, 1, CTF.redFlagPos)
        				        doItemSetAttribute(flag, 'aid', 5435)
        warnPlayersWithStorage(822066, 1, MESSAGE_STATUS_WARNING, getCreatureName(cid).." ficou muito tempo com a Bandeira Vermelha e ela foi devolvida para sua base.")
    elseif getPlayerStorageValue(cid, CTF.storages.greenFlag) == 1 then
        doPlayerSetStorageValue(cid, CTF.storages.greenFlag, -1)
        local flag = doCreateItem(CTF.greenFlag, 1, CTF.greenFlagPos)
        doItemSetAttribute(flag, 'aid', 5434)
        warnPlayersWithStorage(822066, 1, MESSAGE_STATUS_WARNING, getCreatureName(cid).." ficou muito tempo com a Bandeira Verde e ela foi devolvida para sua base.")
    end
end
           

function onUse(cid, item, frompos, item2, topos)

    	if item.actionid == 5434 then
        		if getPlayerStorageValue(cid, CTF.storages.redTeam) == 1 then
            			doRemoveItem(item.uid)
            			doPlayerSetStorageValue(cid, CTF.storages.greenFlag, 1)
            			CTF.doPlayerAddFlag(cid, "green")
            			warnPlayersWithStorage(822066, 1, MESSAGE_STATUS_WARNING, "O jogador "..getCreatureName(cid).." capturou a bandeira verde!")
               addEvent(controlFlag, 3000 * 60, cid)
        		else
            			return doPlayerSendCancel(cid, "Você não pode capturar a bandeira de seu time!")
        		end
    	elseif item.actionid == 5435 then
        		if getPlayerStorageValue(cid, CTF.storages.greenTeam) == 1 then
            			doRemoveItem(item.uid)
            			doPlayerSetStorageValue(cid, CTF.storages.redFlag, 1)
            			CTF.doPlayerAddFlag(cid, "red")
            			warnPlayersWithStorage(822066, 1, MESSAGE_STATUS_WARNING, "O jogador "..getCreatureName(cid).." capturou a bandeira vermelha!")
               addEvent(controlFlag, 3000 * 60, cid)
        		else
            			return doPlayerSendCancel(cid, "Você não pode capturar a bandeira de seu time!")
        		end
    	end
    return true
end