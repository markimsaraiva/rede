function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getGlobalStorageValue(15421) == -1 then
		doTeleportThing(cid, {x = 347, y = 158, z = 7})
		doSendMagicEffect({x = 347, y = 158, z = 7}, CONST_ME_TELEPORT)
	else
		doPlayerSendCancel(cid, "Já tem alguém lutando contra o Gonka, espere ele sair.")
	end
	return true
end
        