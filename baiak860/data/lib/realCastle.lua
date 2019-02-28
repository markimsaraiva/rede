--[[

				Real Castle Event
	Desenvolvido por Vítor Bertolucci (Killua)

]]

realCastle = {
	
	open_storage = 100005,
	guild_storage = 100006,
	date_storages = {100007,100008,100009},
	frompos = {x = 3166, y = 260, z = 7},
	topos = {x = 3293, y = 337, z = 7}

}

realCastle.removePlayers = function()
	local first_cave = getPlayersInArea({x = 2829, y = 7, z = 7},{x = 3118, y = 467, z = 7})
	local second_cave = getPlayersInArea({x = 2902, y = 340, z = 7},{x = 3445, y = 585, z = 7})
	local fifith_cave = getPlayersInArea({x = 3304, y = 192, z = 7},{x = 3687, y = 340, z = 7})
	local sixth_cave = getPlayersInArea({x = 3595, y = 260, z = 8},{x = 3689, y = 338, z = 8})
	local seventh_cave = getPlayersInArea({x = 3616, y = 270, z = 9},{x = 3680, y = 341, z = 9})
	local eight_cave = getPlayersInArea({x = 3445, y = 175, z = 6},{x = 3515, y = 241, z = 6})
	local ninth_cave = getPlayersInArea({x = 3445, y = 175, z = 5},{x = 3515, y = 241, z = 5})
	local tenth_cave = getPlayersInArea({x = 3445, y = 175, z = 4},{x = 3515, y = 241, z = 4})
	local eleventh_cave = getPlayersInArea({x = 3143, y = 342, z = 8},{x = 3246, y = 423, z = 8})
	local castle_area = getPlayersInArea(realCastle.frompos,realCastle.topos)
	if first_cave then
		for _, pid in pairs(first_cave) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if second_cave then
		for _, pid in pairs(second_cave) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	for _, tid in pairs(getPlayersOnline()) do
		local pos = getThingPos(tid)
		if pos.x >= 2829 and pos.x <= 3118 and pos.y >= 7 and pos.y <= 467 then
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(tid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	for _, tid in pairs(getPlayersOnline()) do
		local pos = getThingPos(tid)
		if pos.x >= 2902 and pos.x <= 3445 and pos.y >= 340 and pos.y <= 585 then
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(tid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	for _, tid in pairs(getPlayersOnline()) do
		local pos = getThingPos(tid)
		if pos.x >= 3304 and pos.x <= 3687 and pos.y >= 192 and pos.y <= 340 then
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(tid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if fifith_cave then
		for _, pid in pairs(fifith_cave) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if sixth_cave then
		for _, pid in pairs(sixth_cave) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if seventh_cave then
		for _, pid in pairs(seventh_cave) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if eight_cave then
		for _, pid in pairs(eight_cave) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if ninth_cave then
		for _, pid in pairs(ninth_cave) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if tenth_cave then
		for _, pid in pairs(tenth_cave) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if eleventh_cave then
		for _, pid in pairs(eleventh_cave) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if castle_area then
		for _, pid in pairs(castle_area) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
end

realCastle.open = function()
    doBroadcastMessage("[New Castle] A batalhar para conquistar o New Castle começou! Boa sorte a Todas as Guilds!")
	setGlobalStorageValue(realCastle.open_storage,1)
	setGlobalStorageValue(realCastle.guild_storage,-1)
	realCastle.removePlayers()
end

realCastle.close = function()
	setGlobalStorageValue(realCastle.open_storage,-1)
	local players = getPlayersInArea(realCastle.frompos, realCastle.topos)
	if players then
		for _, pid in pairs(players) do
			doTeleportThing(pid,getTownTemplePosition(1))
		end
	end
	if getGlobalStorageValue(realCastle.guild_storage) == -1 then
		doBroadcastMessage("[New Castle] A batalhar terminou e nenhuma guild conseguiu dominar o castelo! Amanhã às 21:00 vocês podem tentar novamente!")
	else
		doBroadcastMessage("[New Castle] A batalha terminou e a guild vencedora foi "..getGuildNameByID(getGlobalStorageValue(realCastle.guild_storage)).."! Todos os jogadores dessa guild agora podem aproveitar o castelo até amanhâ às 21:00!")
	end
	doSaveServer()
end

realCastle.broadcast = function(message)
	local players = getPlayersInArea(realCastle.frompos, realCastle.topos)
	if players then
		for _, pid in pairs(players) do
			doPlayerSendTextMessage(pid,MESSAGE_STATUS_WARNING,message)
		end
	end
end

realCastle.domain = function(cid)
	local guild_id = getPlayerGuildId(cid)
	setGlobalStorageValue(realCastle.guild_storage,guild_id)
	realCastle.broadcast("[New Castle] O jogador "..getPlayerName(cid).." da guild "..getPlayerGuildName(cid).." dominou o castelo! As outras guilds têm até às 22:30 para conseguir tirar o domínio deles, não desistam!")
end

realCastle.isDominating = function(cid)
	local guild_id = getPlayerGuildId(cid)
	return guild_id == getGlobalStorageValue(realCastle.guild_storage)
end

realCastle.isOpen = function()
	return getGlobalStorageValue(realCastle.open_storage) == 1
end