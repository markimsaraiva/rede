dofile("./_woe.lua")

function onSay(cid, words, param)
	if not Woe.isRegistered(cid) then
		if getPlayerGuildId(cid) > 0 then
			setPlayerStorageValue(cid, stor.register, 1)
		else
			doPlayerSendCancel(cid, "Sem guild você não pode entrar.")
		end
	else
		doPlayerSendCancel(cid, "Você ja está registrado.")
	end
	return true
end
