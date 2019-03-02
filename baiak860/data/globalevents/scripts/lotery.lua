local config = {
        lottery_hour = "2 hours", -- Tempo ate a proxima loteria (Esse tempo vai aparecer somente como broadcast message)
        rewards_id = {9971, 12695}, -- ID dos Itens Sorteados na Loteria
        crystal_counts = 1, -- Usado somente se a rewards_id for crystal coin (ID: 2160).
        website = "yes", -- Only if you have php scripts and table `lottery` in your database!
        days = {
                "Monday-00:00",
                "Monday-02:00",
                "Monday-04:00",
				"Monday-06:00",
				"Monday-08:00",
				"Monday-10:00",
				"Monday-12:00",
				"Monday-14:00",
				"Monday-16:00",
				"Monday-18:00",
				"Monday-20:00",
				"Monday-22:00",

                "Tuesday-00:00",
                "Tuesday-02:00",
                "Tuesday-04:00",
				"Tuesday-06:00",
                "Tuesday-08:00",
				"Tuesday-10:00",
                "Tuesday-12:00",
				"Tuesday-14:00",
                "Tuesday-16:00",
				"Tuesday-18:00",
                "Tuesday-20:00",
				"Tuesday-22:00",
        

                "Wednesday-00:00",
                "Wednesday-02:00",
				"Wednesday-04:00",
				"Wednesday-06:00",
				"Wednesday-08:00",	
				"Wednesday-10:00",
				"Wednesday-12:00",
				"Wednesday-14:00",
				"Wednesday-16:00",
				"Wednesday-18:00",
				"Wednesday-20:00",
				"Wednesday-22:00",
                

                "Thursday-08:00",
                "Thursday-10:00",
                "Thursday-12:00",
				"Thursday-14:00",
				"Thursday-16:00",
				"Thursday-18:00",
				"Thursday-20:00",
				"Thursday-22:00",
				"Thursday-00:00",
				"Thursday-02:00",
				"Thursday-04:00",
				"Thursday-06:00",
		


                "Friday-02:00",
                "Friday-04:00",
                "Friday-06:00",
				"Friday-08:00",
                "Friday-10:00",
				"Friday-12:00",
                "Friday-14:00",
				"Friday-16:00",
                "Friday-18:00",
				"Friday-20:00",
                "Friday-22:00",
				"Friday-00:00",

                "Saturday-00:00",
                "Saturday-02:00",
				"Saturday-04:00",
                "Saturday-06:00",
				"Saturday-08:00",
                "Saturday-10:00",
				"Saturday-12:00",
                "Saturday-14:00",
				"Saturday-16:00",
                "Saturday-18:00",
				"Saturday-20:00",
                "Saturday-22:00",
		

                "Sunday-00:00",
                "Sunday-02:00",
				"Sunday-04:00",
				"Sunday-06:00",
				"Sunday-08:00",
				"Sunday-10:00",
				"Sunday-12:00",
				"Sunday-14:00",
				"Sunday-16:00",
				"Sunday-18:00",
				"Sunday-20:00",
                "Sunday-22:00"
                }
        }
local function getPlayerWorldId(cid)
    if not(isPlayer(cid)) then
        return false
    end
    local pid = getPlayerGUID(cid)
    local worldPlayer = 0
    local result_plr = db.getResult("SELECT * FROM `players` WHERE `id` = "..pid..";")
    if(result_plr:getID() ~= -1) then
        worldPlayer = tonumber(result_plr:getDataInt("world_id"))
        result_plr:free()
        return worldPlayer
    end
    return false
end

local function getOnlineParticipants()
    local players = {}
    for _, pid in pairs(getPlayersOnline()) do
        if getPlayerAccess(pid) <= 2 and getPlayerStorageValue(pid, 281821) <= os.time() then
            table.insert(players, pid)
        end
    end
    if #players > 0 then
        return players
    end
    return false
end
     
function onThink(cid, interval)
    if table.find(config.days, os.date("%A-%H:%M")) then
        if(getWorldCreatures(o) <= 0)then
            return true
        end

        local query = db.query or db.executeQuery
        local random_item = config.rewards_id[math.random(1, #config.rewards_id)]
        local item_name = getItemNameById(random_item)  
        local data = os.date("%d/%m/%Y - %H:%M:%S")
        local online = getOnlineParticipants()
       
        if online then
            local winner = online[math.random(1, #online)]
            local world = tonumber(getPlayerWorldId(winner))
           
            if(random_item == 2160) then
                doPlayerSetStorageValue(winner, 281821, os.time() + 3600 * 24)
                doPlayerAddItem(winner, random_item, config.crystal_counts)
                doBroadcastMessage("[LOTTERY SYSTEM] Vencedor: " .. getCreatureName(winner) .. ", Recompensa: " .. config.crystal_counts .." " .. getItemNameById(random_item) .. "s! Parabéns! (Proxima Loteria em  " .. config.lottery_hour .. ")")
            else
                doPlayerSetStorageValue(winner, 281821, os.time() + 3600 * 24)
                doBroadcastMessage("[LOTTERY SYSTEM] Vencedor: " .. getCreatureName(winner) .. ", Recompensa: " ..getItemNameById(random_item) .. "! Parabens! (Proxima Loteria em " .. config.lottery_hour .. ")")
                doPlayerAddItem(winner, random_item, 1)
            end
            if(config.website == "yes") then
                query("INSERT INTO `lottery` (`name`, `item`, `world_id`, `item_name`, `date`) VALUES ('".. getCreatureName(winner).."', '".. random_item .."', '".. world .."', '".. item_name .."', '".. data .."');")
            end
        else
            print("Ninguem OnLine para ganhar na loteria")
        end
    end
    return true
end