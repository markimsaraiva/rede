function onDeath(cid, corpse, deathList)
if (getPlayerSlotItem(cid, 2).itemid == 7889) then
		doCreatureSetDropLoot(cid, false)
	end
	return true
end