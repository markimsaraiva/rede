-- Sistema de Guild War sem intervencoes
-- criado por Vitor Bertolucci
-- 24/05/214
-- Favor nao postar nem compartilhar este codigo
-- Favor manter os comentarios quando foi utilizar co codigo


local arena_storage = 454523
local players_storage = 456512
local storage_accept = 151230
local storage_check = 153201
local guild_invite = 542351
local guild_accept = 456121
local time_1_pos = {x = 1170, y = 280, z = 7}
local time_2_pos = {x = 1188, y = 280, z = 7}
local city = "city"

local function getOnlineGuildMembersByRank(guildId, rank, selectLowerRanks) -- Funcao feita pelo Omega
    if not rank then
        rank = 3
        selectLowerRanks = true
    end
    local list = {}
    for _, pid in pairs(getPlayersOnline()) do
        if getPlayerGuildId(pid) == guildId then
            local playerRank = getPlayerGuildLevel(pid)
            if playerRank == rank or (selectLowerRanks and playerRank <= rank) then
                table.insert(list, pid)
            end
        end
    end
    return list
end

function onSay(cid, words, param, channel)
    if param == "" then
        doPlayerSendCancel(cid, "Use os parametros corretos.")
        return true
    end
	
	if getPlayerLevel(cid) <= 30 then
        doPlayerSendCancel(cid, "Voce nao tem level suficiente.")
        return true
    end
    
    local t = string.explode(param, ",")
    
    if t[1] == "invite" then
        if getPlayerGuildLevel(cid) < 3 then
            doPlayerSendCancel(cid, "Somente liders de guild podem usar esse comando.")
            return true
        end
        if getGuildId(t[2]) and getGuildId(t[2]) ~= getPlayerGuildId(cid) then
            if #getOnlineGuildMembersByRank(getGuildId(t[2]), 3, false) > 0 then
                if getGlobalStorageValue(arena_storage) <= os.time() then
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce convidou a guild "..t[2].." para uma war em "..city.."!")
                    for _, gid in pairs(getOnlineGuildMembersByRank(getGuildId(t[2]), 3, false)) do
                        doPlayerSendTextMessage(gid, MESSAGE_STATUS_CONSOLE_ORANGE, getCreatureName(cid).." da guild "..getPlayerGuildName(cid).." chamou sua guild para uma war em "..city.." Para aceitar diga /war"..city.." accept, "..getPlayerGuildName(cid)..".")
                        setPlayerStorageValue(gid, storage_accept, os.time() + 20*60)
                        setPlayerStorageValue(gid, storage_check, getPlayerGuildId(cid))
                    end
                else
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A arena ja esta ocupada.")
                end
            else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Nenhum lider da guild "..t[2].." esta online.")
            end
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Essa guild nao existe.")
        end
    elseif t[1] == "accept" then
        if getPlayerGuildLevel(cid) < 3 then
            doPlayerSendCancel(cid, "Somente liders de guild podem usar esse comando.")
            return true
        end
        if getGuildId(t[2]) and getGuildId(t[2]) ~= getPlayerGuildId(cid) then
            if getPlayerStorageValue(cid, storage_accept) > os.time() then
                if getPlayerStorageValue(cid, storage_check) == getGuildId(t[2]) then
                    setGlobalStorageValue(arena_storage, os.time() + 3600)
                    setGlobalStorageValue(guild_accept, getPlayerGuildId(cid))
                    setGlobalStorageValue(guild_invite, getGuildId(t[2]))
                    if #getOnlineGuildMembersByRank(getGuildId(t[2]), 3, true) > 0 then
                        for _, gid in pairs(getOnlineGuildMembersByRank(getGuildId(t[2]), 3, true)) do
                        doPlayerSendTextMessage(gid, MESSAGE_STATUS_CONSOLE_BLUE, "Sua guild entrou em war contra a guild "..getPlayerGuildName(cid).."! Para participar diga /war"..city.." go")
                        end
                    end
                    if #getOnlineGuildMembersByRank(getPlayerGuildId(cid), 3, true) > 0 then
                        for _, pid in pairs(getOnlineGuildMembersByRank(getPlayerGuildId(cid), 3, true)) do
                            doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Sua guild entrou em war contra a guild "..t[2].."! Para participar diga /war"..city.." go")
                        end
                    end
                    addEvent(function()
                        for _, pid in pairs(getPlayersOnline()) do
                            if isInArea(getThingPos(pid), {x = 1094, y = 246, z = 7}, {x = 1245, y = 294, z = 7}) then
                                doTeleportThing(pid, getTownTemplePosition(getPlayerTown(cid)))
                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce foi teleportado para o templo porque o tempo de war acabou")
                            end
                        end
                    end, 1000*3600)
                    addEvent(setGlobalStorageValue, 3600*1000, guild_accept, -1)
                    addEvent(setGlobalStorageValue, 3600*1000, guild_invite, -1)
                else
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Essa guild nao te invitou para uma war.")
                end
            else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sua guild nao foi chamada para nenhuma war.")
            end
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Essa guild nao existe.")
        end
    elseif t[1] == "go" then
        if getTilePzInfo(getThingPos(cid)) == false then
            doPlayerSendCancel(cid, "Voce precisa estar em uma area protect zone")
            return true
        end
        if getGlobalStorageValue(guild_invite) == getPlayerGuildId(cid) or getGlobalStorageValue(guild_accept) == getPlayerGuildId(cid) then
            doPlayerSetStorageValue(cid, 888123, os.time() + getGlobalStorageValue(arena_storage))
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce entrou na war!")
            if getGlobalStorageValue(guild_invite) == getPlayerGuildId(cid) then
                doTeleportThing(cid, time_1_pos)
            else
                doTeleportThing(cid, time_2_pos)
            end
        else
            doPlayerSendCancel(cid, "Sua guild nao esta em war")
        end
    end
    return true
end