local cfg = {
amount = 1
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

if getPlayerLevel(cid) > 8 then
doAccountAddPoints(cid, cfg.amount)
doCreatureSay(cid, "Parabéns! Você recebeu 1 Premium Points! ", TALKTYPE_ORANGE_1)
doSendMagicEffect(getCreaturePosition(cid), 28)
doRemoveItem(item.uid,1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você vai ser kikado em 4 segundos para salvar.")
else
doPlayerSendCancel(cid,"Você precisa de level 8 para usar este item.")
end
return TRUE
end