function onStepIn(cid, item, position, fromPosition)
	if getPlayerLevel(cid) >= 100 then
		doPlayerSetStorageValue(cid, 822066, 1)
		setGlobalStorageValue(822066, getStorageZero(822066) + 1)
		doPlayerSendTextMessage(cid, 25, "Você entrou na sala de espera do evento Capture a Bandeira. Aguarde aqui até o evento iniciar.")
		doTeleportThing(cid, CTF.waitingRoom)
	else
		doPlayerSendCancel(cid, "Você deve ser level 100 ou mais para entrar no CTF.")
		return false
	end
	return true
end