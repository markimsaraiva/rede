local COST = 3000000 ----- Preço par Remover o Red Skull em Gold Pieces

function onSay(cid, words, chanel, param)
if getCreatureSkullType(cid) == SKULL_RED then
if doPlayerRemoveMoney(cid, COST) then
doCreatureSetSkullType(cid, SKULL_NONE)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Red Skull removed for: " .. COST)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MORTAREA)
else
doPlayerSendCancel(cid, "You don't have enough money.")
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
else
doPlayerSendCancel(cid, "You are not with Red Skull.")
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
end