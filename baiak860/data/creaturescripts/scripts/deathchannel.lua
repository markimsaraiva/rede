-- Coded by Zoom..
local info, win, lose = "%s [Level: %s] foi mort%s pelo %s %s%s", "%s obteve %s frags seguidos apos derrotar %s.", "%s acabou de impedir que %s fizesse uma sequencia de %s frags seguidos."
local frags, storage = {10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80}, 30045

function onDeath(cid, corpse, deathList)
    if(not isPlayer(cid)) then
        return true
    end
    
    local target = deathList[1]
    doCreatureSetStorage(target, storage, getCreatureStorage(target, storage) + (getCreatureStorage(target, storage) == -1 and 2 or 1))
    
    for _, pid in ipairs(getPlayersOnline()) do
        doPlayerSendChannelMessage(pid, '', info:format(getCreatureName(cid), getPlayerLevel(cid), getPlayerSex(cid) == 1 and "o" or "a", isPlayer(target) and "player" or "monstro", getCreatureName(target), isPlayer(target) and " [Level: "..getPlayerLevel(target).."]." or "."), TALKTYPE_CHANNEL_ORANGE, 0xF)
        for _, frag in ipairs(frags) do
            if(getCreatureStorage(target, storage) == frag) then
                doPlayerSendChannelMessage(pid, '', win:format(getCreatureName(target), frag, getCreatureName(cid)), TALKTYPE_CHANNEL_MANAGEMENT, 0xF)
            end
            
            if(getCreatureStorage(cid, storage) >= frag) then
                doPlayerSendChannelMessage(pid, '', lose:format(getCreatureName(target), getCreatureName(cid), getCreatureStorage(cid, storage)+1), TALKTYPE_GAMEMASTER_CHANNEL, 0xF)
            end
        end
    end
    
    doCreatureSetStorage(cid, storage, 0)
    return true
end