local function filtrateString(str)
	if type(str) ~= "string" then
		return false
	end
	local first, last = 0, 0
	local second, final = 0, #str
	for i = 1, #str do
		if string.byte(str:sub(i,i)) == string.byte('a') then
			first = i + 2
			for t = first, #str do
				if string.byte(str:sub(t,t)) == string.byte(' ') then
					last = t - 1
					break
				end
			end
		end
		if string.byte(str:sub(i,i)) == string.byte('b') then
			second = i + 2
		end
	end
	return {str:sub(first, last), str:sub(second, final)}
end


function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerLevel(cid) > 700 then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce e maior que level 700, porem nao pode usar a cave exclusiva.")
	return false
	end
    	if tonumber(filtrateString(getGlobalStorageValue(822081))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822081, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 4))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 1 e pode upar lá por 4 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822082))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822082, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 4))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 2 e pode upar lá por 4 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822083))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822083, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 4))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 3 e pode upar lá por 4 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822084))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822084, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 4))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 4 e pode upar lá por 4 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822085))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822085, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 4))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 5 e pode upar lá por 4 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822086))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822086, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 4))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 6 e pode upar lá por 4 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822087))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822087, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 4))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 7 e pode upar lá por 4 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822088))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822088, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 4))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 8 e pode upar lá por 4 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822089))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822089, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 4))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 9 e pode upar lá por 4 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822090))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822090, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 4))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 10 e pode upar lá por 4 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822091))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822091, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 4))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 11 e pode upar lá por 4 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822092))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822092, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 4))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 12 e pode upar lá por 4 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822093))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822093, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 4))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 13 e pode upar lá por 4 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822094))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822094, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 4))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 14 e pode upar lá por 4 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822095))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822095, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 4))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 15 e pode upar lá por 4 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822096))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822096, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 4))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 16 e pode upar lá por 4 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822097))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822097, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 4))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 17 e pode upar lá por 4 horas.")
	elseif tonumber(filtrateString(getGlobalStorageValue(822098))[2]) < os.time() then
		doRemoveItem(item.uid)
		setGlobalStorageValue(822098, "a "..getPlayerAccountId(cid).." b ".. os.time() + (3600 * 4))
		doPlayerSendTextMessage(cid, 25, "Agora você é o dono da cave 18 e pode upar lá por 4 horas.")
	
	else
		doPlayerSendCancel(cid, "Todas as caves já estão com dono no momento. Tente mais tarde.")
	end
	return true
end