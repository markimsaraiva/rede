local hunt = {x = 91, y = 471, z = 6}
local options = {"teleportar", "sefrodo", "summon"}

function sairDaArea(cid)
    if isPlayer(cid) then
        if isInArea(getThingPos(cid), {x = 47, y = 459, z = 7}, {x = 135, y = 521, z = 7}) or isInArea(getThingPos(cid), {x = 46, y = 486, z = 8}, {x = 83, y = 519, z = 8}) or isInArea(getThingPos(cid), {x = 85, y = 470, z = 6}, {x = 101, y = 478, z = 6}) or isInArea(getThingPos(cid), {x = 90, y = 471, z = 5}, {x = 93, y = 474, z = 5}) then     
            doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce atingiu o limite de permanencia na area 64. Voce foi teleportado para o templo.")
        end
    end
end
  
function onUse(cid, item, fromPosition, itemEx, toPosition)
    local fazer = options[math.random(1, #options)]
    if getPlayerStorageValue(cid, 12392) < os.time () then
        doPlayerSetStorageValue(cid, 12392, os.time () + 20*60)
        if fazer == "teleportar" then
            doPlayerSetStorageValue(cid, 239101, os.time () + 15*60)
            doTeleportThing(cid, hunt)
            doSendMagicEffect(hunt, CONST_ME_TELEPORT)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce conseguiu entrar na area 64! Voce pode ficar upando aqui por 15 minutos, aproveite!")
            doCreatureSay(cid,"Aha! Consegui decifrar o caminho secreto!",TALKTYPE_ORANGE_1)
            addEvent(sairDaArea, 1000*15*60, cid)
        elseif fazer == "sefrodo" then
            doCreatureAddHealth(cid, -getCreatureMaxHealth(cid))
            doCreatureSay(cid,"Cada coisa que esta escrita nesse livro... Nao consigo suportar!",TALKTYPE_ORANGE_1)
        elseif fazer == "summon" then
            if not getTilePzInfo(getThingPos(cid)) then
                doCreateMonster("Alma Penada",getCreaturePosition(cid))
            end
            doCreatureSay(cid,"Nao era bem isso que eu queria, mas...",TALKTYPE_ORANGE_1)
        end
    else
        doPlayerSendCancel(cid, "Voce so consegue ler a cada 20 minutos! Espere mais " .. math.floor((getPlayerStorageValue(cid, 12392) - os.time()) / 60) .. " minutos.")
    end
    return true 
end