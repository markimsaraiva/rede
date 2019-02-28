function getPlayerFrags(cid)
    local time = os.time()
    local times = {today = (time - 86400), week = (time - (7 * 86400))}
 
    local contents, result = {day = {}, week = {}, month = {}}, db.getResult("SELECT `pd`.`date`, `pd`.`level`, `p`.`name` FROM `player_killers` pk LEFT JOIN `killers` k ON `pk`.`kill_id` = `k`.`id` LEFT JOIN `player_deaths` pd ON `k`.`death_id` = `pd`.`id` LEFT JOIN `players` p ON `pd`.`player_id` = `p`.`id` WHERE `pk`.`player_id` = " .. getPlayerGUID(cid) .. " AND `k`.`unjustified` = 1 AND `pd`.`date` >= " .. (time - (30 * 86400)) .. " ORDER BY `pd`.`date` DESC")
    if(result:getID() ~= -1) then
        repeat
            local content = {date = result:getDataInt("date")}
            if(content.date > times.today) then
                table.insert(contents.day, content)
            elseif(content.date > times.week) then
                table.insert(contents.week, content)
            else
                table.insert(contents.month, content)
            end
        until not result:next()
        result:free()
    end
 
    local size = {
        day = table.maxn(contents.day),
        week = table.maxn(contents.week),
        month = table.maxn(contents.month)
    } 
    return size.day + size.week + size.month
end 
 
function onLogin(cid)
    registerCreatureEvent(cid, "fraglook")
    return true
end
 
function onLook(cid, thing, position, lookDistance)
    if isPlayer(thing.uid) and thing.uid ~= cid then
        local temporary_level = getPlayerStorageValue(thing.uid, ARMY_LEVEL)
        if temporary_level >= 1 then
        doPlayerSetSpecialDescription(thing.uid, "[Frags: "..getPlayerFrags(thing.uid).."]. "..(getPlayerSex(thing.uid) == 0 and "She" or "He").." is "..ARMY[getPlayerStorageValue(thing.uid, ARMY_LEVEL)][3].." and have "..getPlayerStorageValue(thing.uid, ARMY_EXPERIENCE).." of "..ARMY[getPlayerStorageValue(thing.uid, ARMY_LEVEL)][2].." army points.")
        else
        doPlayerSetSpecialDescription(thing.uid, "[Frags: "..getPlayerFrags(thing.uid).."] No have army points.")
        end
        local temporary_level = nil
        return true
    elseif thing.uid == cid then
        local temporary_level = getPlayerStorageValue(cid, ARMY_LEVEL)
        if temporary_level >= 1 then
        doPlayerSetSpecialDescription(cid, "[Frags: "..getPlayerFrags(cid).."]. You are "..ARMY[getPlayerStorageValue(cid, ARMY_LEVEL)][3].." and have "..getPlayerStorageValue(cid, ARMY_EXPERIENCE).." of "..ARMY[getPlayerStorageValue(cid, ARMY_LEVEL)][2].." army points.")
        else
        doPlayerSetSpecialDescription(cid, "[Frags: "..getPlayerFrags(cid).."] You no have army points.")
        end
        local temporary_level = nil      
        local string = 'You see yourself.'
        if getPlayerFlagValue(cid, PLAYERFLAG_SHOWGROUPINSTEADOFVOCATION) then
            string = string..' You are '.. getPlayerGroupName(cid) ..'.'
        elseif getPlayerVocation(cid) ~= 0 then
            string = string..' You are '.. getPlayerVocationName(cid) ..'.'
        else
            string = string..' You have no vocation.'
        end
        string = string..getPlayerSpecialDescription(cid)..''

 
        if getPlayerGuildId(cid) > 0 then 
            string = string..' You are ' .. (getPlayerGuildRank(cid) == '' and 'a member' or getPlayerGuildRank(cid)) ..' of the '.. getPlayerGuildName(cid)
            string = getPlayerGuildNick(cid) ~= '' and string..' ('.. getPlayerGuildNick(cid) ..').' or string..'.'
        end 
 
        if getPlayerFlagValue(cid, PLAYERCUSTOMFLAG_CANSEECREATUREDETAILS) then
            string = string..'nHealth: ['.. getCreatureHealth(cid) ..' / '.. getCreatureMaxHealth(cid) ..'], Mana: ['.. getCreatureMana(cid) ..' / '.. getCreatureMaxMana(cid) ..'].'
            string = string..'nIP: '.. doConvertIntegerToIp(getPlayerIp(cid)) ..'.'
        end
 
        if getPlayerFlagValue(cid, PLAYERCUSTOMFLAG_CANSEEPOSITION) then
            string = string..'nPosition: [X:'.. position.x..'] [Y:'.. position.y..'] [Z:'.. position.z..'].'
        end
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, string)  
        return false
    end
    return true
end