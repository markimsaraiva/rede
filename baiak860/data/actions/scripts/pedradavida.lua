function onUse(cid, item, itemEx, toPosition, fromPosition)
if getPlayerStorageValue(cid, 19000) <= 0 then
setPlayerStorageValue(cid, 19000, 1)
doPlayerSendTextMessage(cid, 22, "Parabéns! Você ganhou o VIP outfit.")
doSendMagicEffect(getPlayerPosition(cid), 30)
doRemoveItem(item.uid)
if getPlayerSex(cid) == 0 then
doPlayerAddOutfit(cid, 264, 1)
else
doPlayerAddOutfit(cid, 255, 1)
end
else
doPlayerSendCancel(cid, "Você já tem esse outfit.")
return true
end
return true
end