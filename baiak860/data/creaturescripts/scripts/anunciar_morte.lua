function onKill(cid, target, lastHit)

	if not isPlayer(target) or not isPlayer(cid) then
		return true
	end

	doBroadcastMessage(""..getCreatureName(cid).." ["..getPlayerLevel (cid).."] killed "..getCreatureName (target).." [".. getPlayerLevel (target) .."].", MESSAGE_STATUS_CONSOLE_ORANGE)
    return true
end