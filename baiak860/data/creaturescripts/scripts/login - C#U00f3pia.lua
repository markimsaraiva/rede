local config = {
	loginMessage = getConfigValue('loginMessage')
}

function onLogin(cid)
	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	local Subwat = getPlayerAccountManager(cid)
	if(Subwat == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Seu ultimo login foi " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			str = str .. "The BEST"
			doPlayerSendOutfitWindow(cid)
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(Subwat == MANAGER_NAMELOCK) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, it appearss that your character has been namelocked, what would you like as your new name?")
	elseif(Subwat == MANAGER_ACCOUNT) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Ola, digite 'account' acessar sua conta ou digite  'cancel'.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Ola, digite 'account' Para criar uma conta no servidor ou 'recover' Para recuperar conta perdida.")
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Bem vindo!")
	registerCreatureEvent(cid, "Mail")
if getPlayerLevel(cid) < 717217 then 
registerCreatureEvent(cid, "AdvanceTeleport") 
end
	registerCreatureEvent(cid, "GuildMotd")
	registerCreatureEvent(cid, "Idle")
registerCreatureEvent(cid, "DeathBroadcast")
registerCreatureEvent(cid, "addons")
registerCreatureEvent(cid, "onPrepareDeath")
registerCreatureEvent(cid, "magebomb")
registerCreatureEvent(cid, "SkullCheck")
registerCreatureEvent(cid, "SkullAmulet")
registerCreatureEvent(cid, "killitem")

registerCreatureEvent(cid, "huntdeath")
registerCreatureEvent(cid, "loguthunt")


	registerCreatureEvent(cid, "ReportBug")
	doSetCreatureLight(cid, 25, 250, -1)
	return true
end
