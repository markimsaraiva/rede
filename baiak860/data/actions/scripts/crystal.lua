--By MatheusVidaLoka
function onUse(cid, item, frompos, item2, topos)
if item.itemid == 2160 and item.type == 100 then
doRemoveItem(item.uid,item.type)
doPlayerAddItem(cid,2157,1)
doPlayerSendTextMessage(cid,22,"Voce trocou 100 crystal por 1 Nugget Coin")
elseif item.itemid == 2152 and item.type < 100 then
doRemoveItem(item.uid,1)
doPlayerAddItem(cid,2152,100)
doPlayerSendTextMessage(cid,22,"Voce trocou 1 crystal por 100 platinum coins")
end
end