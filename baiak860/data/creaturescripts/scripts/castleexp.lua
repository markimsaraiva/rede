function onLogin(cid)
storage_guild = getGlobalStorageValue(123123)
local rate = 1.05 -- 50%
local config = {
welvip = "Você recebeu "..((rate - 1)*100).."% de exp pois sua guild esta dominando o castelo!",
not_vip = "A guild que domina o castle 24h ganha "..((rate - 1)*100).."% a mais de experiencia!",
}

if getPlayerGuildId(cid) == storage_guild then
doPlayerSetExperienceRate(cid, rate)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.welvip)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.not_vip)
end
return TRUE
end