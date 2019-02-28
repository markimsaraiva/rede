-- PVP System criado por Vítor Bertolucci - Killua

local function isInWar(cid)
	local check = {}
	if getPlayerGuildId(cid) and getPlayerGuildId(cid) > 0 then
		local query = db.getResult("SELECT `status` FROM `guild_wars` WHERE `guild_id` = '"..getPlayerGuildId(cid).."'")
		if query:getID() == -1 then
			return false
		end
		repeat
			local status = query:getDataInt("status")
			table.insert(check, status)
		until not query:next()
		query:free()
		if isInArray(check, 1) then	
			return true
		end
	end
	return false
end

local function isFighting(cid, target)
	if getPlayerGuildId(cid) and getPlayerGuildId(cid) > 0 and getPlayerGuildId(target) and getPlayerGuildId(target) > 0 then
		local query = db.getResult("SELECT `enemy_id` FROM `guild_wars` WHERE `guild_id` = '"..getPlayerGuildId(cid).."' AND `status` = '1'")
		if query:getID() == -1 then
			local tery = db.getResult("SELECT `enemy_id` FROM `guild_wars` WHERE `guild_id` = '"..getPlayerGuildId(target).."' AND `status` = '1'")
			if tery:getID() == -1 then
				return false
			end
			local guild = tery:getDataInt("enemy_id")
			tery:free()
			if guild == getPlayerGuildId(cid) then
				return true
			end
		else
			local enemy = query:getDataInt("enemy_id")
			query:free()
			if enemy == getPlayerGuildId(target) then
				return true
			end
		end
	end
	return false
end

function onCombat(cid, target)
    if isPlayer(cid) and isPlayer(target) then
		if getPlayerGuildId(cid) == getPlayerGuildId(target) and not isInWar(cid) then
			if getPlayerStorageValue(cid, 0442200) == 1 then
				return false
			end
		end
		if getPlayerStorageValue(cid, 0442201) == 1 and getCreatureSkull(target) == 0 and not isFighting(cid, target) then
			return false
		end
		if getPlayerStorageValue(cid, 0442202) == 1 and not isFighting(cid, target) then
			return false
		end
		if getPlayerStorageValue(cid, 0442203) ~= -1 and getPlayerLevel(target) < getPlayerStorageValue(cid, 0442203) then
			return false
		end
	end
	return true
end

function onTarget(cid, target)
	if isPlayer(cid) and isPlayer(target) then
		if getPlayerGuildId(cid) == getPlayerGuildId(target) and not isInWar(cid) then
			if getPlayerStorageValue(cid, 0442200) == 1 then
				doPlayerSendCancel(cid, "Voce nao pode atacar alguem da sua guild pois o modo de pvp guild esta ativado.")
				return false
			end
		end
		if getPlayerStorageValue(cid, 0442201) == 1 and getCreatureSkull(target) == 0 and not isFighting(cid, target) then
			doPlayerSendCancel(cid, "Voce nao pode atacar alguem sem skull pois o modo de pvp marked esta ativado.")
			return false
		end
		if getPlayerStorageValue(cid, 0442202) == 1 and not isFighting(cid, target) then
			doPlayerSendCancel(cid, "Voce nao pode atacar alguem que nao esteja em war contra sua guild pois o modo pvp war esta ativado.")
			return false
		end
		if getPlayerStorageValue(cid, 0442203) ~= -1 and getPlayerLevel(target) < getPlayerStorageValue(cid, 0442203) then
			doPlayerSendCancel(cid, "Voce nao pode atacar alguem com level menor que "..getPlayerStorageValue(cid, 0442203).." pois o modo de pvp level esta ativado.")
			return false
		end
	end
	return true
end

function onLogin(cid)
	if not vip.hasVip(cid) then
		if getPlayerStorageValue(cid, 0442200) > 0 or getPlayerStorageValue(cid, 0442201) > 0 or getPlayerStorageValue(cid, 0442202) > 0 or getPlayerStorageValue(cid, 0442203) > 0 then
			doPlayerSetStorageValue(cid, 0442200, -1)
			doPlayerSetStorageValue(cid, 0442201, -1)
			doPlayerSetStorageValue(cid, 0442202, -1)
			doPlayerSetStorageValue(cid, 0442203, -1)
		end
	end
	registerCreatureEvent(cid, "PVPSystemC")
	registerCreatureEvent(cid, "PVPSystemT")
	return true
end