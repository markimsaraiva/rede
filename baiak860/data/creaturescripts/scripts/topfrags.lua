function onKill(cid, target, lastHit)
if isPlayer(target) then
 db.query("UPDATE `players` SET `frags` = `frags` + 1 WHERE `id` = " .. getPlayerGUID(cid) .. ";")
end
return true
end