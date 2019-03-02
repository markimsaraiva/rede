-- Script feito por Vítor Bertolucci (Killua)
-- 07/06/2014

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if getGlobalStorageValue(1823999) ~= getPlayerGuildId(cid) then
		return doPlayerSendCancel(cid, "Somente donos do castelo podem abrir a porta")
    end
    doTeleportThing(cid, toPosition)
    return true
end