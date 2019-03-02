function onSay(cid, words, param, channel)
if(getStorage(ZE_STATUS) ~= 2) then
local players_on_arena_count = #getZombiesEventPlayers()
if(param == 'force') then
if(players_on_arena_count > 0) then
setZombiesEventPlayersLimit(players_on_arena_count )
addZombiesEventBlockEnterPosition()
doSetStorage(ZE_STATUS, 2)
doBroadcastMessage("Zombie Arena Event started.")
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Zombies event started.")
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cannot start Zombies event. There is no players on arena.")
end
else
if(param ~= '' and tonumber(param) > 0) then
setZombiesEventPlayersLimit(tonumber(param))
end
removeZombiesEventBlockEnterPosition()
doSetStorage(ZE_STATUS, 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Event started.")
doPlayerBroadcastMessage(cid, "Zombie Arena Event teleport is opened. We are waiting for " .. getZombiesEventPlayersLimit() - players_on_arena_count .. " players to start.")
end
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Zombies event is already running.")
end
return true
end