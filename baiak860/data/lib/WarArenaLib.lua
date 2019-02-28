-- [[ Area and Positions Infos ]] --
areaplayersteam = {
{1,1,1,1},
{1,1,1,1},
{1,1,1,1},
{1,1,1,1},
{1,1,1,1}
}
areateam1ext = {x=82, y=538, z=7} -- Ponta superior esquerda da area do time um
areateam2ext = {x=108, y=1546, z=7} -- Ponta superior esquerda da area do time dois
leaderteam1pos = {x=86, y=556, z=7, stackpos=255} -- Posição do lider do time um (que puxara a alavanca)
leaderteam2pos = {x=91, y=556, z=7, stackpos=255} -- Posição do lider do time dois (que puxara a alavanca)
newplayersposteam1 = {x=82, y=539, z=7} -- Posição para onde os players do time um serao teleportados
newplayersposteam2 = {x=108, y=539, z=7} -- Posição para onde os players do time dois serao teleportados
team1leverpos = {x=87, y=556, z=7, stackpos=1} -- Posição da alavanca que o lider do time um puxara
team2leverpos = {x=90, y=556, z=7, stackpos=1} -- Posição da alavanca que o lider do time dois puxara
leverafter, leverbefore = 9825, 9826 -- Ids das alavancas antes de puxadas e depois, consecutivamente (9825 = antes; 9826 = depois)
posbenterteam1 = {x=94, y=542, z=7} -- Posiçao do sqm antes de entrar na arena do time 1
posbenterteam2 = {x=96, y=542, z=7} -- Posiçao do sqm antes de entrar na arena do time 2
backteampos = {x=95, y=542, z=7}

-- [[ Storage Infos ]] --
team1leverstorage = 123497 -- Storage que sera usado quando puxarem a alavanca do time 1
team2leverstorage = 123498 -- Storage que sera usado quando puxarem a alavanca do time 2
haveteaminarena = 123499 -- Storage que sera usado para ve se tem algum time lutando na arena
storageteam1death = 123500 -- Storage usado para ver quantos morreram do time 1
storageteam2death = 123501 -- Storage usado para ver quantos morreram do time 2
storageteam1 = 123502 -- Storage usado para ver quantas pessoas entraram na arena no time 1
storageteam2 = 123503 -- Storage usado para ver quantas pessoas entraram na arena no time 2
storageleader1 = 123504 -- Storage onde ficara guardado o uid do lider do time 1
storageleader2 = 123505 -- Storage onde ficara guardado o uid do lider do time 2
storageplayersteam1 = 123506 -- Storage que todos os players do team 1 iram ter.
storageplatersteam2 = 123507 -- Storage que todos os players do team 2 iram ter.

-- [[ Player Infos ]] --
needlevelarena = 100 -- Level que os outros jogadores sem ser o lider teram que ter.
leaderlevel = 200 -- Level que o lider tera que ter.
onlyguildwars = TRUE -- Se os membros de um time tem que ser da mesma guild do lider. (Nesse caso somente o lider da guild podera puxar a alavanca.)
needplayers = 6 -- Quantidade de players que cada time tem que ter.

-- [[ Functions ]] --

function getUidsFromArea(firstpos, area)
    local result = {}
    for i,x in pairs(area) do
        for s,z in pairs(x) do
            if isPlayer(getThingFromPos({x=firstpos.x+s-1, y=firstpos.y+i-1, z=firstpos.z, stackpos=255}).uid) then
                table.insert(result, getThingFromPos({x=firstpos.x+s-1, y=firstpos.y+i-1, z=firstpos.z, stackpos=255}).uid)
            end
        end
    end
    return result
end

function teleportUidsToPos(uids, pos)
    for i,x in pairs(uids) do
        doTeleportThing(x, pos)
    end
end

function isAllUidsSameGuild(uids, guildid)
    for i,x in pairs(uids) do
        if not (getPlayerGuildId(x) == guildid) then
            return false
        end
    end
    return true
end

function isAllUidsLevel(uids, level)
    for i,x in pairs(uids) do
        if not (getPlayerLevel(x) >= level) then
            return false
        end
    end
    return true
end

function haveQuantPlayersInArea(firstpos, area, quant)
    local result = 0
    for i,x in pairs(area) do
        for s,z in pairs(x) do
            if isPlayer(getThingFromPos({x=firstpos.x+s-1, y=firstpos.y+i-1, z=firstpos.z, stackpos=255}).uid) then
                result = result+1
            end
        end
    end
    return result >= quant
end  

function addStorageToUids(uids, storage, value)
    for i,x in pairs(uids) do
        setPlayerStorageValue(x, storage, value)
    end
end

function checkPoses(pos1, pos2)
    if pos1.x == pos2.x and pos1.y == pos2.y and pos1.z == pos2.z then
        return true
    end
    return false
end

function startArena()
    setGlobalStorageValue(storageleader1, getThingFromPos(leaderteam1pos).uid)
    setGlobalStorageValue(storageleader2, getThingFromPos(leaderteam2pos).uid)
    addStorageToUids(team1uids, storageplayersteam1, 1)
    addStorageToUids(team2uids, storageplayersteam2, 1)
    teleportUidsToPos(team1uids, newplayersposteam1)
    teleportUidsToPos(team2uids, newplayersposteam2)
    setGlobalStorageValue(storageteam1, #team1uids)
    registerCreatureEventUids(team1uids, "DeathTeam1")
    registerCreatureEventUids(team2uids, "DeathTeam2")
    setGlobalStorageValue(storageteam2, #team2uids)
    setGlobalStorageValue(haveteaminarena, 1)
    setGlobalStorageValue(team1leverstorage, 0)
    setGlobalStorageValue(team2leverstorage, 0)
    doTransformItem(getThingFromPos(team1leverpos).uid, leverafter)
    doTransformItem(getThingFromPos(team2leverpos).uid, leverafter)
end

function haveTeamInArena()
    return getGlobalStorageValue(haveteaminarena) == 1 and true or false
end

function isSqmFromArea(firstpos, area, sqmpos)
    for i,x in pairs(area) do
        for s,z in pairs(x) do
            if sqmpos.x == firstpos.x+s-1 and sqmpos.y == firstpos.y+i-1 and sqmpos.z == firstpos.z then
                return true
            end
        end
    end
return false
end

function registerCreatureEventUids(uids, event)
    for i,x in pairs(uids) do
        registerCreatureEvent(x, event)
    end
end