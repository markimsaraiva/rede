function onDeath(cid, corpse, deathList)
if isPlayer(deathList[1]) then
return true,doBroadcastMessage(" O Jogador ".. getCreatureName(cid) .. " [Level: " .. getPlayerLevel(cid) .. "] Foi morto pelo jogador " .. getCreatureName(deathList[1]) .. " [Level: " .. getPlayerLevel(deathList[1]) .. "]",20)
end
return doBroadcastMessage(" O Jogador ".. getCreatureName(cid) .. " [Level: " .. getPlayerLevel(cid) .. "] Foi morto pelo monstro " .. getCreatureName(deathList[1]) .. ".",20)
end

function onKill(cid, target, lastHit)
 
local str = "O Noob %s acaba de ser morto no nivel %d por %s"
 
    if isPlayer(cid) and isPlayer(target) then
        doBroadcastMessage(str:format(getCreatureName(target), getPlayerLevel(target), getCreatureName(cid)), 19)
    end
 
    return true
end