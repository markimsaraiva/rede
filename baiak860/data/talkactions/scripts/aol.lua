function onSay(cid, words, param)
if doPlayerRemoveMoney(cid, 20000) == TRUE then
local bp = doPlayerAddItem(cid, 2173, 1)
local efeitos = math.random(34, 54)
doSendMagicEffect(getCreaturePosition(cid), efeitos)
doCreatureSay(cid, "Voce comprou um AOL", TALKTYPE_ORANGE_1)
else
doPlayerSendTextMessage(cid, 22, "Você precisa de dinheiro para comprar um aol")
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
end