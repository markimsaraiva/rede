function onSay(cid, words, param, channel)
	if(not checkExhausted(cid, 666, 10)) then
		return false
	end

	local strings, i, position, added, showGamemasters = {""}, 1, 1, false, getBooleanFromString(getConfigValue('displayGamemastersWithOnlineCommand'))
	for _, pid in ipairs(getPlayersOnline()) do

		added = false
		if((showGamemasters or getPlayerCustomFlagValue(cid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES) or not getPlayerCustomFlagValue(pid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES)) and (not isPlayerGhost(pid) or getPlayerGhostAccess(cid) >= getPlayerGhostAccess(pid))) then
			i = i + 1
			added = true
		end
	end

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, (i - 1) .. " player" .. (i > 1 and "s" or "") .. " online")
	

	return true
end