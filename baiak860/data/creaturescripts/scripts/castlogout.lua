function onLogout(cid, forceLogout)
	db.query("UPDATE `players` SET `broadcasting` = 0, `viewers` = 0 WHERE `id` = " .. getPlayerGUID(cid) .. " LIMIT 1")

	return true
end