function onSay(cid, words, param)

if getPlayerStorageValue(cid, 71) == 1 or getPlayerStorageValue(cid, 72) == 1 or getPlayerStorageValue(cid, 82) == 1 or getPlayerStorageValue(cid, 83) == 1 then
	return doPlayerSendCancel(cid, "Nao pode usar fly no Capture the Flag event.")
end

if getPlayerStorageValue(cid, 1236664) == 1 then
	return doPlayerSendCancel(cid, "Nao pode usar fly no Acerte o Alvo.")
end

local config = {
pz = true, -- players precisam estar em protection zone para usar? (true or false)
battle = false, -- players deve estar sem battle (true or false)
custo = true, -- se os teleport irão custa (true or false)
need_level = true, -- se os teleport irão precisar de level (true or false)
vip = false, -- somente vip players poderam usar o comando? ("yes" or "no")
storage = 13500 -- Storage Id da sua vip account caso for usar somente vips
}

--[[ Config lugares]]--
local lugar = {
["depot"] = { -- nome do lugar
pos = {x=123, y=53, z=7},level = 8,price = 30000},
["templo"] = { -- nome do lugar
pos = {x=155, y=54, z=7},level = 8, price = 30000},
["vip2"] ={ -- nome do lugar
pos = {x=266, y=531, z=7},level = 8,price = 30000},
["hunts"] ={ -- nome do lugar
pos = {x=341, y=298, z=6},level = 8,price = 30000},
["eventos"] ={ -- nome do lugar
pos = {x=93, y=184, z=7},level = 8,price = 30000},
["trainer"] ={ -- nome do lugar
pos = {x=2957, y=1320, z=7},level = 8,price = 30000}
}

--[[ Lista de Viagem (Não mexa) ]]--
if (param == "lista") then
local str = ""
str = str .. "lista de viagem :\n\n"
for name, pos in pairs(lugar) do
str = str..name.."\n"
end
str = str .. ""
doShowTextDialog(cid, 6579, str)
return TRUE
end


local a = lugar[param]
if not(a) then
doPlayerSendTextMessage(cid, 25, "desculpe,este lugar não existe")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
return TRUE
elseif config.pz == true and getTilePzInfo(getCreaturePosition(cid)) == FALSE then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT,"você precisa estar em protection zone pra poder teleportar.")
return TRUE
elseif config.premium == true and not isPremium(cid) then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Apenas players com premium account podem teleportar.")
return TRUE
elseif config.battle == true and getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Você precisa estar sem battler pra poder teleportar.")
return TRUE
elseif config.need_level == true and getPlayerLevel(cid) < a.level then
doPlayerSendTextMessage(cid, 25, "Desculpe,Voce não tem level. voce precisa "..a.level.." level ou mais para ser teleportado.")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
return TRUE
elseif config.custo == true and doPlayerRemoveMoney(cid, a.price) == FALSE then
doPlayerSendTextMessage(cid, 25, "Desculpe,voce nao tem dinheiro suficiente. Voce precisa "..a.price.." k para ser teleportado.")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
return TRUE
elseif config.vip == true and getPlayerStorageValue(cid, tonumber(config.storage))  - os.time() <= 0 then
doPlayerSendTextMessage(cid, 25, "Desculpe,voce nao e Player vip Para Usar o !fly!.")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
return TRUE
end
doTeleportThing(cid, a.pos)
doSendMagicEffect(a.pos, CONST_ME_TELEPORT)
return TRUE
end