function onUse(cid, item, fromPosition, itemEx, toPosition)
    team1uids = getUidsFromArea(areateam1ext, areaplayersteam)
    team2uids = getUidsFromArea(areateam2ext, areaplayersteam)
    if haveTeamInArena() then
        return doPlayerSendCancel(cid, "Already have a team in arena.")
    end
    if checkPoses(toPosition, team1leverpos) then
        if checkPoses(getCreaturePosition(cid), leaderteam1pos) then
            if getGlobalStorageValue(team1leverstorage) == 1 then
                setGlobalStorageValue(team1leverstorage, 0)
                return doTransformItem(getThingFromPos(team1leverpos).uid, leverafter)
            end
            if onlyguildwars and getPlayerGuildLevel(cid) < 3 then
                return doPlayerSendCancel(cid, "You need to be the leader of your guild.")
            end
            if onlyguildwars and not isAllUidsSameGuild(team1uids, getPlayerGuildId(cid)) then
                return doPlayerSendCancel(cid, "All of your team need to be in your guild.")
            end             
            if not isAllUidsLevel(team1uids, needlevelarena) then
                return doPlayerSendCancel(cid, "All of your team need to be level " .. needlevelarena .. " or more.")
            end
            if getPlayerLevel(cid) < leaderlevel then
                return doPlayerSendCancel(cid, "You, the leader of the team, need to be level " .. leaderlevel .. " or more.")
            end
            if not haveQuantPlayersInArea(areateam1ext, areaplayersteam, needplayers) then
                return doPlayerSendCancel(cid, "Your team need " .. tostring(needplayers) .. " players.")
            end
            
            setGlobalStorageValue(team1leverstorage, 1)
            doTransformItem(getThingFromPos(team1leverpos).uid, leverbefore)
            if getGlobalStorageValue(team2leverstorage) >= 1 then
                startArena()
            end
        else
            doPlayerSendCancel(cid, "You must be the leader of the team to pull the lever.")
        end
    elseif checkPoses(toPosition, team2leverpos) then
        if checkPoses(getCreaturePosition(cid), leaderteam2pos) then
            if getGlobalStorageValue(team2leverstorage) == 1 then
                setGlobalStorageValue(team2leverstorage, 0)
                return doTransformItem(getThingFromPos(team2leverpos).uid, leverafter)
            end
            if onlyguildwars and getPlayerGuildLevel(cid) < 3 then
                return doPlayerSendCancel(cid, "You need to be the leader of your guild.")
            end
            if onlyguildwars and not isAllUidsSameGuild(team2uids, getPlayerGuildId(cid)) then
                return doPlayerSendCancel(cid, "All of your team need to be in your guild.")
            end              
            if not isAllUidsLevel(team2uids, needlevelarena) then
                return doPlayerSendCancel(cid, "All of your team need to be level " .. needlevelarena .. " or more.")
            end
            if getPlayerLevel(cid) < leaderlevel then
                return doPlayerSendCancel(cid, "You, the leader of the team, need to be level " .. leaderlevel .. " or more.")
            end
            if not haveQuantPlayersInArea(areateam2ext, areaplayersteam, needplayers) then
                return doPlayerSendCancel(cid, "Your team need " .. tostring(needplayers) .. " players.")
            end
            
            setGlobalStorageValue(team2leverstorage, 1)
            doTransformItem(getThingFromPos(team2leverpos).uid, leverbefore) 
            if getGlobalStorageValue(team1leverstorage) >= 1 then
                startArena()
            end
        else
            doPlayerSendCancel(cid, "You must be the leader of the team to pull the lever.")
        end
    end
return TRUE
end