local outfits = {
	[2] = {lookType = 194, lookHead = 94, lookBody = 94, lookLegs = 94, lookFeet = 94},
	[3] = {lookType = 194, lookHead = 87, lookBody = 87, lookLegs = 87, lookFeet = 87}
}

function onLogin(cid)
	local tmp = outfits[getPlayerGroupId(cid)]
	if(not tmp) then
		return true
	end

	return doSetCreatureOutfit(cid, tmp, -1)
end