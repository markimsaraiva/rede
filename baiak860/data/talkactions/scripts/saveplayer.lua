	function onSay(cid, words, param, channel)
	if(not checkExhausted(cid, 666, 10)) then
		return false
	end
	doPlayerSave(cid)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Seu personagem foi salvo com sucesso.")
	return TRUE
	end