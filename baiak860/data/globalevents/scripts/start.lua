function onStartup()
	db.executeQuery("DELETE FROM `player_storage` WHERE `key` = 51")
	db.executeQuery("DELETE FROM `player_storage` WHERE `key` = 52")
	db.executeQuery("DELETE FROM `player_storage` WHERE `key` = 71")
	db.executeQuery("DELETE FROM `player_storage` WHERE `key` = 72")
	db.executeQuery("DELETE FROM `player_storage` WHERE `key` = 82")
	db.executeQuery("DELETE FROM `player_storage` WHERE `key` = 83")	
	db.executeQuery("UPDATE `players` SET `town_id` = 1")
	db.query("UPDATE `players` SET `online` = 0 WHERE `world_id` = " .. getConfigValue('worldId') .. ";")
	db.query("DELETE FROM `guild_wars` WHERE `status` = 0 AND `begin` < " .. (os.time() - 2 * 86400) .. ";")
	db.query("UPDATE `guild_wars` SET `status` = 5, `end` = " .. os.time() .. " WHERE `status` = 1 AND `end` > 0 AND `end` < " .. os.time() .. ";")
	return true
end
