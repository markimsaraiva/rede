local config = {
money = 80000000, -- Dinheiro que vai custar
item = 8300, -- ID do item que vai vender
count = 1, -- Quantidade
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
pos = getCreaturePosition(cid)

if item.itemid == 1945 then
 if doPlayerRemoveMoney(cid, config.money) == TRUE then
doPlayerAddItem(cid, config.item, config.count)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você acaba de comprar "..config.count.." "..getItemNameById(config.item)..".")
doSendMagicEffect(pos, CONST_ME_MAGIC_BLUE)
 else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Desculpe, mais você precisa de 80kk para comprar o Outfit VIP")
doSendMagicEffect(pos, CONST_ME_POFF)
end
end

end