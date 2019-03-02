local config = {
	rate = 2.0, -- 4x More Experience
	storage = 20015
}
local function endExpRate(cid)
	if isPlayer(cid) == TRUE then
		doPlayerSetRate(cid, SKILL__LEVEL, 1) -- config.lua rate
		setPlayerStorageValue(cid, config.storage, -1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Your extra experience time has ended.")
	end
end
function onLogin(cid)
	local str = getPlayerStorageValue(cid, config.storage)
	if(str >= 0 and (str - os.time()) > 0) then
		doPlayerSetRate(cid, SKILL__LEVEL, config.rate)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Your extra exp rate will expire at: " .. os.date("%X", str))
		addEvent(endExpRate, (str - os.time()) * 1000, cid)
	else
		doPlayerSetRate(cid, SKILL__LEVEL, 1) -- config.lua rate
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You do not have any extra experience time.")
		setPlayerStorageValue(cid, config.storage, -1)
	end
	return TRUE
end