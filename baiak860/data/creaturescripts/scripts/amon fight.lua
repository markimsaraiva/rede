function onCombat(cid, target)
    if isMonster(cid) and getCreatureName(cid) == "Amon" then
        if getPlayerStorageValue(target, 129124) < os.time() then
            doMonsterChangeTarget(cid)
            return false
        end
    end
    return true
end

function onStatsChange(cid, attacker, type, combat, value) 
    
    if isMonster(attacker) and isPlayer(cid) and getCreatureName(attacker) == "Amon" then
        if getPlayerStorageValue(cid, 129124) < os.time() then
            return false
        end
    end
    return true
end

function onKill(cid, target, lastHit)
    if isPlayer(cid) and isMonster(target) and getCreatureName(target) == "Amon" then
        doSendMagicEffect(getThingPos(target), 27)
        doPlayerSetStorageValue(cid, 129125, 1)
        doCreatureSay(target, "Voce me derrotou!", TALKTYPE_ORANGE_1)
    end
    return true
end

function onLogin(cid)
    registerCreatureEvent(cid, "amonAttack")
    registerCreatureEvent(cid, "amonStats")
    registerCreatureEvent(cid, "amonKill")
    return true
end