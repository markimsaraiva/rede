-- Script feito por Vítor Bertolucci (Killua)
-- 07/06/2014

local query = db.query or db.executeQuery

local premios = {{12575, 1, 10}, {12396, 1, 10}, {8300, 1, 10}, {9971, 10, 30}}

local function getGuildNameById(id)
    local name = ""
    local query = db.getResult('SELECT `name` FROM `guilds` WHERE `id` = "'.. id ..'"')
    if query:getID() == -1 then
        return true
    end
    name = query:getDataString("name")
    query:free()
    return name
end 

function onStatsChange(cid, attacker, type, combat, value)
    if isMonster(cid) and isPlayer(attacker) and type == STATSCHANGE_HEALTHLOSS then		
        if isInArray({"Castle Guardian I", "Castle Guardian II", "Castle Guardian III", "Castle Guardian IV", "Castle Generator", "Ice Crystal"}, getCreatureName(cid)) then            
			doPlayerSetStorageValue(attacker, 1827311, getPlayerStorageValue(attacker, 1827311) + value)
            local quant = guild_hit_count[getPlayerGuildId(attacker)] and guild_hit_count[getPlayerGuildId(attacker)] or 0
            guild_hit_count[getPlayerGuildId(attacker)] = quant + value
        end
    end
    return true
end

function onDeath(cid, corpse, deathList)
    local gid = 0
    local winner = 0
    if isMonster(cid) and getCreatureName(cid) == "Ice Crystal" then
       if not getPlayingGuilds() then
           return true
       end
       local guilds = getPlayingGuilds()
       local max = 0
       for index, var in pairs(guild_hit_count) do
           if var > max then
               max = var
               gid = index
           end
       end
       setGlobalStorageValue(1823999, gid)
	   query("UPDATE `castle_dono` SET `guild_id` = '"..gid.."' WHERE `guild_id` > 0")
       doBroadcastMessage("{Castle War} O evento acabou, a guild com maior desempenho foi "..getGuildNameById(gid)..", com "..max.." pontos sobre o castelo.")
       updateCastleData()
       setGlobalStorageValue(18219113, -1)
       if gid > 0 then
           local mx = 0
           for _, pid in pairs(getPlayersOnline()) do
               if getPlayerGuildId(pid) == gid then
                   local st = getPlayerStorageValue(pid, 1827311)
                   if st > mx then
                       mx = st
                       winner = pid
                   end
               end
           end
           if isPlayer(winner) then
               local rand = math.random(1, #premios)
               doBroadcastMessage("{Castle War} O jogador com maior desempenho foi "..getCreatureName(winner)..", com "..mx.." pontos sobre o castelo. Ele recebeu alguns itens como premio.")    
                doPlayerAddItem(winner, premios[rand][1], math.random(premios[rand][2], premios[rand][3]))
			             local medal = doPlayerAddItem(winner, 5785, 1)
				            doItemSetAttribute(medal, 'description', "Dada a "..getCreatureName(winner).." por ter causado a maior quantia de dano no Castle Event no dia "..os.date("%d/%m/%y")..".")
          end
        end
        for _, pid in pairs(getPlayersOnline()) do
            if isInArea(getThingPos(pid), {x = 500, y = 574, z = 6}, {x = 575, y = 620, z = 6}) or isInArea(getThingPos(pid), {x = 511, y = 588, z = 5}, {x = 556, y = 607, z = 5}) or isInArea(getThingPos(pid), {x = 511, y = 588, z = 4}, {x = 556, y = 607, z = 4}) or isInArea(getThingPos(pid), {x = 511, y = 588, z = 3}, {x = 556, y = 607, z = 3}) or isInArea(getThingPos(pid), {x = 481, y = 580, z = 7}, {x = 683, y = 798, z = 7}) then
                doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
            end
        end
         guild_hit_count = {}
    end
    return true
end