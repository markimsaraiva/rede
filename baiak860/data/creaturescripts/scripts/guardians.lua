-- Script feito por VÃ­tor Bertolucci (Killua)
-- 07/06/2014

function onDeath(cid, corpse, deathList)
    if isMonster(cid) then
        if getCreatureName(cid) == "Castle Guardian I" then
            setGlobalStorageValue(3432322, 0)
            doCreateMonster("Castle Generator", {x = 574, y = 619, z = 6})
            doCreateMonster("Castle Generator", {x = 500, y = 620, z = 6})
            doCreateMonster("Castle Generator", {x = 501, y = 575, z = 6})
            doCreateMonster("Castle Generator", {x = 575, y = 575, z = 6})
			setGlobalStorageValue(8220591, 0)
            doBroadcastMessage("{Castle War} O Primeiro Guardião Foi Derrotado, Os Geradores Dos Corredores Foram Ligados.")
        elseif getCreatureName(cid) == "Castle Guardian II" then
            setGlobalStorageValue(3432322, 4)
            doCreateMonster("Castle Generator", {x = 516, y = 607, z = 6})   
            doCreateMonster("Castle Generator", {x = 522, y = 593, z = 6})   
            doCreateMonster("Castle Generator", {x = 556, y = 594, z = 6})   
            doCreateMonster("Castle Generator", {x = 554, y = 607, z = 6})   
            doBroadcastMessage("{Castle War} O Segundo Guardião Foi Derrotado, Os Geradores Do Castelo Foram Ligados.")
        elseif getCreatureName(cid) == "Castle Guardian III" then
            setGlobalStorageValue(3432322, 8)
            doCreateMonster("Castle Generator", {x = 520, y = 599, z = 5})   
            doCreateMonster("Castle Generator", {x = 529, y = 589, z = 5})   
            doCreateMonster("Castle Generator", {x = 544, y = 589, z = 5})   
            doCreateMonster("Castle Generator", {x = 556, y = 598, z = 5})
            doBroadcastMessage("{Castle War} O Terceiro Guardião Foi Derrotado, Os Geradores do Segundo Andar, Foram Ligados.")
        elseif getCreatureName(cid) == "Castle Guardian IV" then
            setGlobalStorageValue(3432322, 12)
            doCreateMonster("Castle Generator", {x = 537, y = 598, z = 3})   
            doCreateMonster("Castle Generator", {x = 533, y = 594, z = 3})   
            doCreateMonster("Castle Generator", {x = 529, y = 598, z = 3})   
            doCreateMonster("Castle Generator", {x = 533, y = 601, z = 3})
            doBroadcastMessage("{Castle War} O Quarto Guardião Foi Derrotado, Os Geradores do Ultimo Andar, Foram Ligados.")
        elseif getCreatureName(cid) == "Castle Generator" then
			if getGlobalStorageValue(8220591) == 3 then
				doBroadcastMessage("{Castle War} Os Geradores Dos Corredores Foram Destruídos, O Segundo Guardião Foi Acionado, A Entrada do Castelo Foi Desbloqueada.")
			elseif getGlobalStorageValue(8220591) == 7 then
				doBroadcastMessage("{Castle War} Os Geradores do Castelo Foram Destruídos, O Terceiro Guardião Foi Acionado, O Segundo Andar Foi Desbloqueado.")
			elseif getGlobalStorageValue(8220591) == 11 then
				doBroadcastMessage("{Castle War} Os Geradores do Segundo Andar Foram Destruídos, O Quarto Guardião foi Acionado, o Ultimo Andar Foi Desbloqueado.")
			elseif getGlobalStorageValue(8220591) == 15 then
				doBroadcastMessage("{Castle War} Os Ultimos Geradores Foram Destruídos, O Cristal está vunerável.")
			end
			setGlobalStorageValue(8220591, getGlobalStorageValue(8220591) + 1)
            if not isInArray({3, 7, 11, 15}, getGlobalStorageValue(3432322)) then
                setGlobalStorageValue(3432322, getGlobalStorageValue(3432322) + 1)
            elseif getGlobalStorageValue(3432322) == 3 then
                local pos = {{x = 536, y = 608, z = 6}, {x = 537, y = 608, z = 6}, {x = 538, y = 608, z = 6}, {x = 539, y = 608, z = 6}}
                for i = 1, #pos do
                    if getTileItemById(pos[i], 9485) then
                        doRemoveItem(getTileItemById(pos[i], 9485).uid, 1)
                    end
                end
                doCreateMonster("Castle Guardian II", {x = 537, y = 601, z = 6})
                
            elseif getGlobalStorageValue(3432322) == 7 then
                local pos = {{x = 537, y = 591, z = 6}, {x = 537, y = 591, z = 6}}
                local pos2 = {{x = 555, y = 601, z = 6}, {x = 555, y = 602, z = 6}, {x = 555, y = 603, z = 6}, {x = 555, y = 604, z = 6}, {x = 555, y = 605, z = 6}, {x = 555, y = 606, z = 6}, {x = 555, y = 607, z = 6}}
                for i = 1, #pos do
                    if getTileItemById(pos[i], 9485) then
                        doRemoveItem(getTileItemById(pos[i], 9485).uid, 1)
                    end
                end
                for j = 1, #pos2 do
                    if getTileItemById(pos2[j], 9533) then
                        doRemoveItem(getTileItemById(pos2[j], 9533).uid, 1)
                    end
                end
                doCreateMonster("Castle Guardian III", {x = 538, y = 598, z = 5})
            elseif getGlobalStorageValue(3432322) == 11 then
                local pos = {{x = 519, y = 607, z = 5}, {x = 519, y = 606, z = 5}, {x = 519, y = 605, z = 5}, {x = 519, y = 604, z = 5}}
                local pos2 = {{x = 516, y = 595, z = 5}, {x = 516, y = 594, z = 5}, {x = 516, y = 593, z = 5}, {x = 516, y = 592, z = 5}, {x = 516, y = 591, z = 5}, {x = 516, y = 590, z = 5}, {x = 516, y = 589, z = 5}, {x = 516, y = 588, z = 5}}
                local pos3 = {{x = 549, y = 593, z = 5}, {x = 549, y = 592, z = 5}, {x = 549, y = 591, z = 5}, {x = 549, y = 590, z = 5}, {x = 549, y = 589, z = 5}, {x = 549, y = 588, z = 5}}
                for i = 1, #pos do
                    if getTileItemById(pos[i], 9533) then
                        doRemoveItem(getTileItemById(pos[i], 9533).uid, 1)
                    end
                end
                for j = 1, #pos2 do
                    if getTileItemById(pos2[j], 9533) then
                       doRemoveItem(getTileItemById(pos2[j], 9533).uid, 1)
                   end
                end
                for k = 1, #pos3 do
                    if getTileItemById(pos3[k], 9533) then
                       doRemoveItem(getTileItemById(pos3[k], 9533).uid, 1)
                   end
               end
               doCreateMonster("Castle Guardian IV", {x = 530, y = 607, z = 3})
            elseif getGlobalStorageValue(3432322) == 15 then
                local pos = {{x = 530, y = 596, z = 3}, {x = 536, y = 600, z = 3}, {x = 536, y = 599, z = 3}, {x = 536, y = 598, z = 3}, {x = 536, y = 597, z = 3}, {x = 536, y = 596, z = 3}, {x = 530, y = 600, z = 3}, {x = 530, y = 599, z = 3}, {x = 530, y = 598, z = 3}, {x = 530, y = 597, z = 3}, {x = 530, y = 598, z = 3}}
                local pos2 = {{x = 535, y = 600, z = 3}, {x = 534, y = 600, z = 3}, {x = 533, y = 600, z = 3}, {x = 532, y = 600, z = 3}, {x = 531, y = 600, z = 3}, {x = 535, y = 595, z = 3}, {x = 534, y = 595, z = 3}, {x = 533, y = 595, z = 3}, {x = 532, y = 595, z = 3}, {x = 531, y = 595, z = 3}}  
                for i = 1, #pos do
                    if getTileItemById(pos[i], 9533) then
                        doRemoveItem(getTileItemById(pos[i], 9533).uid, 1)
                    end
                end
                for j = 1, #pos2 do
                    if getTileItemById(pos2[j], 9485) then
                        doRemoveItem(getTileItemById(pos2[j], 9485).uid, 1)
                    end
                end
                doCreateMonster("Ice Crystal", {x = 533, y = 597, z = 4})
            end
        end
    end
    return true
end

function onCombat(cid, target)
    if isPlayer(cid) and isPlayer(target) then
        if isInArea(getThingPos(cid), {x = 500, y = 574, z = 6}, {x = 575, y = 620, z = 6}) or isInArea(getThingPos(cid), {x = 511, y = 588, z = 5}, {x = 556, y = 607, z = 5}) or isInArea(getThingPos(cid), {x = 511, y = 588, z = 4}, {x = 556, y = 607, z = 4}) or isInArea(getThingPos(cid), {x = 511, y = 588, z = 3}, {x = 556, y = 607, z = 3}) or isInArea(getThingPos(cid), {x = 481, y = 580, z = 7}, {x = 683, y = 798, z = 7}) then
            if getPlayerGuildId(cid) == getPlayerGuildId(target) then
                return false
            end
        end
    end
    return true
end

function onTarget(cid, target)
    if isPlayer(cid) and isPlayer(target) then
        if isInArea(getThingPos(cid), {x = 500, y = 574, z = 6}, {x = 575, y = 620, z = 6}) or isInArea(getThingPos(cid), {x = 511, y = 588, z = 5}, {x = 556, y = 607, z = 5}) or isInArea(getThingPos(cid), {x = 511, y = 588, z = 4}, {x = 556, y = 607, z = 4}) or isInArea(getThingPos(cid), {x = 511, y = 588, z = 3}, {x = 556, y = 607, z = 3}) or isInArea(getThingPos(cid), {x = 481, y = 580, z = 7}, {x = 683, y = 798, z = 7}) then
            if getPlayerGuildId(cid) == getPlayerGuildId(target) then
				doPlayerSendCancel(cid, "Nao pode atacar alguem de sua guild")
                return false
            end
        end
    end
    return true
end

function onLogin(cid)
    if isInArea(getThingPos(cid), {x = 500, y = 574, z = 6}, {x = 575, y = 620, z = 6}) or isInArea(getThingPos(cid), {x = 511, y = 588, z = 5}, {x = 556, y = 607, z = 5}) or isInArea(getThingPos(cid), {x = 511, y = 588, z = 4}, {x = 556, y = 607, z = 4}) or isInArea(getThingPos(cid), {x = 511, y = 588, z = 3}, {x = 556, y = 607, z = 3}) or isInArea(getThingPos(cid), {x = 481, y = 580, z = 7}, {x = 683, y = 798, z = 7}) then
        if getPlayerGuildId(cid) ~= getGlobalStorageValue(1821999) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao e dono do castelo e logou ali dentro, voce foi teleportado para o templo.")
            doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
        end
    end
    registerCreatureEvent(cid, "deathCastle")
    registerCreatureEvent(cid, "deathCrystal")
    registerCreatureEvent(cid, "statsCastle")
    registerCreatureEvent(cid, "targetCastle")
    registerCreatureEvent(cid, "combatCastle")
    return true
end