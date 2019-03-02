
--Preparar jogadores pra morte
function onPrepareDeath(cid, deathList)
    if not isPlayer(cid) then
    	return false
    end
    doPlayerSetTown(cid, 1)
return true
end