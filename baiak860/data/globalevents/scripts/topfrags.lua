function getJogadorFrags(jogador) -- essa função já existia, só modifiquei uma parte
	local time = os.time()
	local times = {today = (time - 86400), week = (time - (7 * 86400))}
	local contents, result = {day = {}, week = {}, month = {}}, db.getResult("SELECT `pd`.`date`, `pd`.`level`, `p`.`name` FROM `player_killers` pk LEFT JOIN `killers` k ON `pk`.`kill_id` = `k`.`id` LEFT JOIN `player_deaths` pd ON `k`.`death_id` = `pd`.`id` LEFT JOIN `players` p ON `pd`.`player_id` = `p`.`id` WHERE `pk`.`player_id` = " .. jogador .. " AND `k`.`unjustified` = 1 AND `pd`.`date` >= " .. (time - (30 * 86400)) .. " ORDER BY `pd`.`date` DESC")
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
	local size = {day = table.maxn(contents.day),week = table.maxn(contents.week),month = table.maxn(contents.month)} 
	return size.day + size.week + size.month
end
function onThink(interval, lastExecution)
	local max = 5 -- quantidade max que vai aparecer no rank
	local str,k, p = "TOP "..max.." Rank Frags:\n\n", 0, {} -- n mexa em nd
	local players = db.getResult("SELECT `id`,`name` FROM `players`")
	if (players:getID() ~= -1) then
		repeat
			table.insert(p, {getJogadorFrags(players:getDataInt("id")), players:getDataString("name")})
		until not players:next()
	end
	table.sort(p, function(a, b) return a[1] > b[1] end)
	for x = 1, table.maxn(p) do
		k = k + 1
		str = str .. "\n " .. k .. ". ".. p[x][2] .." - " .. p[x][1] .. ""
		if k == max then break end 
	end
	doBroadcastMessage(str, 22)
	return true
end