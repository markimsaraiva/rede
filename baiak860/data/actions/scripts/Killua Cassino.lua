local bixos = {"Jack Sparrow", "Alucard", "Orochimaru", "Robin Hood"}
local positions = {{x = 386, y = 154, z = 7}, {x = 388, y = 154, z = 7}, {x = 390, y = 154, z = 7}} -- Posicao q os bixos nascem
local price = 1 -- Preco para jogar
local cassinoCoin = 6527

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local first = math.random(1, #bixos)
    local second = math.random(1, #bixos)
    local third = math.random(1, #bixos)
    local tab = {}
	local recheck = 0
        
    if getGlobalStorageValue(82192) > os.time() then
        doPlayerSendCancel(cid, "Aguarde um pouco para apostar.")
        return true
    end
    
    if getPlayerMoney(cid) < price * 1000000 then
        doPlayerSendCancel(cid, "Você precisa de " .. price .. " kk para jogar.")
        return true
    end
    
    setGlobalStorageValue(82192, os.time() + 6)
    for i = 1, (#positions) do
        doSendMagicEffect(positions[i], 37)
    end
    
    doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
    doPlayerRemoveMoney(cid, price*1000000)
    doCreateMonster(bixos[first], positions[1])
    doSendMagicEffect(positions[1], 26)
    addEvent(doSendMagicEffect, 100, positions[1], 37)
    table.insert(tab, first)
    setGlobalStorageValue(bixos[first], getGlobalStorageValue(bixos[first])+1) 
    addEvent(function()
        doCreateMonster(bixos[second], positions[2])
        doSendMagicEffect(positions[2], 26)
        addEvent(doSendMagicEffect, 100, positions[2], 37)
        table.insert(tab, second)
    end, 1700)
    addEvent(function()
        doCreateMonster(bixos[third], positions[3])
        doSendMagicEffect(positions[3], 26)
        addEvent(doSendMagicEffect, 100, positions[3], 37)
        setGlobalStorageValue(bixos[third], getGlobalStorageValue(bixos[third])+1)
        table.insert(tab, third)
    end, 2000)
    addEvent(function()
        doRemoveCreature(getTopCreature(positions[1]).uid)
        doRemoveCreature(getTopCreature(positions[2]).uid)
        doRemoveCreature(getTopCreature(positions[3]).uid)
            doSendMagicEffect(positions[1], 61)
            doSendMagicEffect(positions[2], 61)
            doSendMagicEffect(positions[3], 61)
        if tab[1] == tab[2] and tab[1] == tab[3] then
			doPlayerAddItem(cid, 6527, 30)
            doSendAnimatedText(getThingPos(cid), "VOCE", 25)
            addEvent(doSendAnimatedText, 800, getThingPos(cid), "GANHOU", 25)
            addEvent(doSendAnimatedText, 1600, getThingPos(cid), "30", 25)
	    addEvent(doSendAnimatedText, 3000, getThingPos(cid), "EVENTCOINS", 25)
            doSendMagicEffect(getThingPos(cid), 30)
            doSendMagicEffect(positions[1], 30)
            doSendMagicEffect(positions[2], 30)
            doSendMagicEffect(positions[3], 30)
            addEvent(doSendMagicEffect, 800, getThingPos(cid), 29)
            addEvent(doSendMagicEffect, 800, positions[1], 29)
            addEvent(doSendMagicEffect, 800, positions[2], 29)
            addEvent(doSendMagicEffect, 800, positions[3], 29)
            addEvent(doSendMagicEffect, 1600, getThingPos(cid), 28)
            addEvent(doSendMagicEffect, 1600, positions[1], 28)
            addEvent(doSendMagicEffect, 1600, positions[2], 28)
            addEvent(doSendMagicEffect, 1600, positions[3], 28)
        else
            doSendAnimatedText(getThingPos(cid), "VOCE", 200)
            addEvent(doSendAnimatedText, 800, getThingPos(cid), "PERDEU", 200)
            addEvent(doSendAnimatedText, 1600, getThingPos(cid), "HAHA", 200)
        end
    end, 4200)
    return true
end
