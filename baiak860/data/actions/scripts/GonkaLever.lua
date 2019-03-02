function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getGlobalStorageValue(15421) == 1 then
		doPlayerSendCancel(cid, "Já tem alguém lutando contra o Gonka, espere ele sair.")
		return true
	end
	doTeleportThing(cid, {x = 347, y = 158, z = 7})
	doSendMagicEffect({x = 347, y = 158, z = 7}, CONST_ME_TELEPORT)
	doCreateMonster("Gonka", {x = 337, y = 149, z = 7})
	setGlobalStorageValue(15421,1)

	return true
end
        