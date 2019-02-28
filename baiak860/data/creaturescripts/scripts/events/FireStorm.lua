function onStatsChange(cid, attacker, type, combat, value)
	if type == 1 and getCreatureHealth(cid) <= value then
		if isInRange(getThingPos(cid), {x=2172,y=2042,z=7}, {x=2217,y=2062,z=7}) then
			doCreatureAddMana(cid, - getCreatureMana(cid))
			doItemSetAttribute(doCreateItem(3058, 1, getPlayerPosition(cid)), "description", "You recognize " .. getCreatureName(cid) .. ". He was killed by Fire.")
			doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			doCreatureAddHealth(cid, getCreatureMaxHealth(cid) - getCreatureHealth(cid))
			doCreatureAddMana(cid, getCreatureMaxMana(cid) - getCreatureMana(cid))
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, 'You loss.')
			return false
		end
	end
	return true
end