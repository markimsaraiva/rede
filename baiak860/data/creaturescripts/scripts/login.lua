local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

local function effectAnel(cid)
	if isPlayer(cid) then
		if getPlayerSlotItem(cid,9) and getPlayerSlotItem(cid,9).uid > 0 and getPlayerSlotItem(cid,9).itemid == 7697 then
			doSendMagicEffect(getThingPos(cid), 36)
		end
		addEvent(effectAnel, 3000, cid)
	end
end


function onLogin(cid)
		if getCreatureOutfit(cid).lookType == 306 and getPlayerStorageValue(cid, 121219) ~= 1 then
			doCreatureChangeOutfit(cid, getPlayerSex(cid) == 0 and {lookType = 136} or {lookType = 128})
		end
	
		if(getBooleanFromString(getConfigValue('accountManager')) == false) then
		if (getCreatureName(cid) == "Account Manager") then
			return doRemoveCreature(cid, true)
		end
	end
	
	if getPlayerSlotItem(cid,9) and getPlayerSlotItem(cid,9).uid > 0 and getPlayerSlotItem(cid,9).itemid == 7697 then
		effectAnel(cid)
	end
	


	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			str = str .. " Please choose your outfit."
			doPlayerSendOutfitWindow(cid)
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, it appears that your character has been locked for name violating rules, what new name would you like to have?", TALKTYPE_PRIVATE_NP, true, cid)
	elseif(accountManager == MANAGER_ACCOUNT) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to manage your account. If you would like to start over, type {cancel} anywhere.", TALKTYPE_PRIVATE_NP, true, cid)
	else
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to create an account or {recover} to recover an account.", TALKTYPE_PRIVATE_NP, true, cid)
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	if getPlayerStorageValue(cid, 54304) > 0 then
     	doPlayerSetStorageValue(cid, 54304, 0)
 	end
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Bem Vindo!")
	doCreatureSay(getCreatureByName("[Server Information]"), "[DOUBLE POINTS]: Receba pontos em dobro para qualquer valores acima de R$30,00! visite nosso site: ribeirot.servegame.com ! ", TALKTYPE_PRIVATE, false, cid)

doCreatureSay(getCreatureByName("[Server Information]"), "Duvidas sobre algo? Confira o nosso site: ribeirot.servegame.com  ", TALKTYPE_PRIVATE, false, cid)
	if getPlayerLevel(cid) < 717217 then 
registerCreatureEvent(cid, "AdvanceTeleport")
end


 	registerCreatureEvent(cid, "DesertDeath")
 	registerCreatureEvent(cid, "DesertCombat")
	registerCreatureEvent(cid, "BattleDeath")
	registerCreatureEvent(cid, "ZombieThink")
	registerCreatureEvent(cid, "ZombieDeath")
 	registerCreatureEvent(cid, "BattleCombat")
	registerCreatureEvent(cid, "FireStorm") 
 	registerCreatureEvent(cid, "ctf")
 	registerCreatureEvent(cid, "zombieevent")
	registerCreatureEvent(cid, "Idle")
    registerCreatureEvent(cid, "tpquest")
    registerCreatureEvent(cid, "CombatDodge")
	registerCreatureEvent(cid, "recompensa")
	registerCreatureEvent(cid, "SkullAmulet")
	registerCreatureEvent(cid, "BountyHunter")
	registerCreatureEvent(cid, "PlayerDeath")
	registerCreatureEvent(cid, "rewardpoints")
	registerCreatureEvent(cid, "ArmyKill")
	registerCreatureEvent(cid, "autoloot")
	registerCreatureEvent(cid, "Auto Loot")
	registerCreatureEvent(cid, "RecordIp")
        registerCreatureEvent(cid, "DeathBroadCast")

    if (InitArenaScript ~= 0) then
    InitArenaScript = 1
    -- make arena rooms free
        for i = 42300, 42309 do
            setGlobalStorageValue(i, 0)
            setGlobalStorageValue(i+100, 0)
        end
    end
	registerCreatureEvent(cid, "Mail")
	if(getPlayerOperatingSystem(cid) >= CLIENTOS_OTCLIENT_LINUX) then
		registerCreatureEvent(cid, "ExtendedOpcode")
	end

	registerCreatureEvent(cid, "ReportBug")
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "SkullCheck")
	end

registerCreatureEvent(cid, "GuildEvents")
registerCreatureEvent(cid, "critical")
registerCreatureEvent(cid, "BroadDeath")
registerCreatureEvent(cid, "AdvanceSave")
registerCreatureEvent(cid, "GuildMotd")
registerCreatureEvent(cid, "fraglook")
registerCreatureEvent(cid, "blesscheck")
registerCreatureEvent(cid, "DeathBroadcast")
registerCreatureEvent(cid, "addons")
registerCreatureEvent(cid, "onPrepareDeath")
registerCreatureEvent(cid, "Fraglook")
registerCreatureEvent(cid, "antimb")
registerCreatureEvent(cid, "antimagebomb")
registerCreatureEvent(cid, "FimVip")
registerCreatureEvent(cid, "ExpVip")
registerCreatureEvent(cid, "VipReceive")
registerCreatureEvent(cid, "redSkullAmulet")
registerCreatureEvent(cid, "FullHpMana")
registerCreatureEvent(cid, "killitem")
registerCreatureEvent(cid, "huntdeath")
registerCreatureEvent(cid, "loguthunt")
registerCreatureEvent(cid, "ReportBug")
registerCreatureEvent(cid, "CastleExp")
registerCreatureEvent(cid, "entrosaLogout")
registerCreatureEvent(cid, "AdvEffect")
registerCreatureEvent(cid, "deathchannel")
                            
registerCreatureEvent(cid, "dodge")
		registerCreatureEvent(cid, "town")
registerCreatureEvent(cid, "recompensaLvl")
if getPlayerStorageValue(cid, 48902) == -1 then
        setPlayerStorageValue(cid, 48902, 0) 
    end
	
	registerCreatureEvent(cid, "critical")




if getPlayerName(cid) == "Account Manager" and #getPlayersByIp(getPlayerIp(cid)) > 10 then
		return false
	end

if getPlayerSlotItem(cid, 2).itemid == 7889 then
		doPlayerAddBlessing(cid, 1)
		doPlayerAddBlessing(cid, 2)
		doPlayerAddBlessing(cid, 3)
		doPlayerAddBlessing(cid, 4)
		doPlayerAddBlessing(cid, 5)
		doSendMagicEffect(getPlayerPosition(cid), 49)
	else
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)	
	end
 
	
 if getPlayerStorageValue(cid, 48903) == -1 and getPlayerStorageValue(cid, 48902) == -1 then
  setPlayerStorageValue(cid, 48903, 0) 
  setPlayerStorageValue(cid, 48902, 0) 
 end

 return true
end