--By MatheusVidaLoka
function onUse(cid, item, frompos, item2, topos)
if doRemoveItem(item.uid,1) then
doPlayerSendTextMessage(cid,22,"Voce trocou 1 gold ingot por 100 crystal coins")
doPlayerAddItem(cid,2160,100)
end
end