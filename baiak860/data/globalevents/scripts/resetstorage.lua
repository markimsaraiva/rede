function onThink(interval, lastExecution)
	db.query("DELETE FROM `player_storage` WHERE `key` = '15900';")
end