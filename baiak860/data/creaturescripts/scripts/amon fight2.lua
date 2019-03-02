function onCombat(cid, target)
    if isMonster(target) and getCreatureName(target) == "Amon" then
        if getPlayerStorageValue(cid, 129124) < os.time() then
            return false
        end
    end
    return true
end

function onTarget(cid, target)
    if isMonster(target) and isPlayer(cid) and getCreatureName(target) == "Amon" then
        if getPlayerStorageValue(cid, 129124) < os.time() then
            doPlayerSendCancel(cid, "Você precisa estar batalhando com o Amon para atacá-lo!")
            return false
        end
    end
    return true
end

function onStatsChange(cid, attacker, type, combat, value) 
    
    if isMonster(cid) and getCreatureName(cid) == "Amon" then
        if getPlayerStorageValue(attacker, 129124) < os.time() then
            return false
        end
    end
    return true
end

function onLogin(cid)
    registerCreatureEvent(cid, "amonTarget")
    registerCreatureEvent(cid, "amonStats2")
    registerCreatureEvent(cid, "amonCombat")
    return true
end