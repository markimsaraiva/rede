--[[	

			Real Team Battle Event
	Desenvolvido por Vítor Bertolucci (Killua)

]]

function onCombat(cid, target)
    if isPlayer(cid) and isPlayer(target) then
        local sto = getPlayerStorageValue(cid, realTeamBattle.teamStorage)
        if sto > 0 then
            if sto == getPlayerStorageValue(target, realTeamBattle.teamStorage) then
                return false
            end
        end
    end
    return true
end

function onTarget(cid, target)
    if isPlayer(cid) and isPlayer(target) then
        local sto = getPlayerStorageValue(cid, realTeamBattle.teamStorage)
        if sto > 0 then
            if sto == getPlayerStorageValue(target, realTeamBattle.teamStorage) then
                doPlayerSendCancel(cid,"Você não pode atacar seu companheiro de time.")
                return false
            end
        end
    end
    return true
end

function onPrepareDeath(cid, deathList)
    if isPlayer(cid) then
        local sto = getPlayerStorageValue(cid,realTeamBattle.teamStorage)
        if sto > 0 then
            local times = {"Red Assassins", "Blue Norsemen", "Black Hunters", "Green Beggars"}
            realTeamBattle.broadcast(MESSAGE_STATUS_CONSOLE_ORANGE,"[Team Battle] O jogador "..getCreatureName(cid).." do time "..times[sto].." foi morto!")
            doPlayerSendTextMessage(cid,MESSAGE_STATUS_WARNING,"[Team Battle] You are dead!")
            realTeamBattle.cleanPlayer(cid)
            realTeamBattle.checkTeams()
        end
    end
    return true
end

function onLogin(cid)
    doPlayerSetStorageValue(cid, realTeamBattle.teamStorage,-1)
    registerCreatureEvent(cid, "realTeamBattleDeath")
    registerCreatureEvent(cid, "realTeamBattleCombat")
    registerCreatureEvent(cid, "realTeamBattleTarget")
    return true
end