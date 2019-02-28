function onKill(cid, target)
if isPlayer(target) == TRUE then
---- BOUNTY HUNTERS START -----
pid = cid
pid2 = getPlayerGUID(target)
    local result_plr = db.getResult("SELECT * FROM `bounty_hunters` WHERE `sp_id` = "..pid2.." AND `killed` = 0;")
    if(result_plr:getID() ~= -1) then
    prize = tonumber(result_plr:getDataInt("prize"))
    bid = tonumber(result_plr:getDataInt("id"))
   result_plr:free()
    else
    prize = 0
   bid = 0