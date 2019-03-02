local stor = 77648
local tempo_em_horas = 3

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, stor) < os.time() then
		setPlayerStorageValue(cid, stor, os.time() + (tempo_em_horas*60*60))
		doRemoveItem(item.uid,1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você ganhou "..tempo_em_horas.." horas de auto loot.")
	else
		local t = getPlayerStorageValue(cid, stor) - os.time()
		local horas = math.floor(t/(60*60))
		local minutos = math.floor((t/60) - (horas*60))
		local segundos = math.floor(t - ((horas*60*60) + (minutos *60)))
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você tem que esperar "..horas.." horas, "..minutos.." minutos e "..segundos.." segundos para usar este item novamente.")
	end
	return false
end