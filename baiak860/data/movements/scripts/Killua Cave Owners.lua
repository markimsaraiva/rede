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


function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if item.actionid == 3600 then
		if tonumber(filtrateString(getGlobalStorageValue(822081))[1]) == getPlayerAccountId(cid) and tonumber(filtrateString(getGlobalStorageValue(822081))[2]) >= os.time() then
			doPlayerSendTextMessage(cid, 25, "Bem vindo à sua hunt! Aproveite ela, você tem mais "..math.floor((tonumber(filtrateString(getGlobalStorageValue(822081))[2]) - os.time()) / 60).." minutos de hunt.")
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendCancel(cid, "Você não é dono dessa hunt! Para ser dono de uma hunt, compre na nossa shop do site ribeirot.servegame.com")
		end
	elseif item.actionid == 3601 then
		if tonumber(filtrateString(getGlobalStorageValue(822082))[1]) == getPlayerAccountId(cid) and tonumber(filtrateString(getGlobalStorageValue(822082))[2]) >= os.time() then
			doPlayerSendTextMessage(cid, 25, "Bem vindo à sua hunt! Aproveite ela, você tem mais "..math.floor((tonumber(filtrateString(getGlobalStorageValue(822082))[2]) - os.time()) / 60).." minutos de hunt.")
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendCancel(cid, "Você não é dono dessa hunt! Para ser dono de uma hunt, compre na nossa shop do site ribeirot.servegame.com")
		end
	elseif item.actionid == 3602 then
		if tonumber(filtrateString(getGlobalStorageValue(822083))[1]) == getPlayerAccountId(cid) and tonumber(filtrateString(getGlobalStorageValue(822083))[2]) >= os.time() then
			doPlayerSendTextMessage(cid, 25, "Bem vindo à sua hunt! Aproveite ela, você tem mais "..math.floor((tonumber(filtrateString(getGlobalStorageValue(822083))[2]) - os.time()) / 60).." minutos de hunt.")
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendCancel(cid, "Você não é dono dessa hunt! Para ser dono de uma hunt, compre na nossa shop do site ribeirot.servegame.com")
		end
	elseif item.actionid == 3603 then
		if tonumber(filtrateString(getGlobalStorageValue(822084))[1]) == getPlayerAccountId(cid) and tonumber(filtrateString(getGlobalStorageValue(822084))[2]) >= os.time() then
			doPlayerSendTextMessage(cid, 25, "Bem vindo à sua hunt! Aproveite ela, você tem mais "..math.floor((tonumber(filtrateString(getGlobalStorageValue(822084))[2]) - os.time()) / 60).." minutos de hunt.")
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendCancel(cid, "Você não é dono dessa hunt! Para ser dono de uma hunt, compre na nossa shop do site ribeirot.servegame.com")
		end
	elseif item.actionid == 3604 then
		if tonumber(filtrateString(getGlobalStorageValue(822085))[1]) == getPlayerAccountId(cid) and tonumber(filtrateString(getGlobalStorageValue(822085))[2]) >= os.time() then
			doPlayerSendTextMessage(cid, 25, "Bem vindo à sua hunt! Aproveite ela, você tem mais "..math.floor((tonumber(filtrateString(getGlobalStorageValue(822085))[2]) - os.time()) / 60).." minutos de hunt.")
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendCancel(cid, "Você não é dono dessa hunt! Para ser dono de uma hunt, compre na nossa shop do site ribeirot.servegame.com")
		end
	elseif item.actionid == 3605 then
		if tonumber(filtrateString(getGlobalStorageValue(822086))[1]) == getPlayerAccountId(cid) and tonumber(filtrateString(getGlobalStorageValue(822086))[2]) >= os.time() then
			doPlayerSendTextMessage(cid, 25, "Bem vindo à sua hunt! Aproveite ela, você tem mais "..math.floor((tonumber(filtrateString(getGlobalStorageValue(822086))[2]) - os.time()) / 60).." minutos de hunt.")
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendCancel(cid, "Você não é dono dessa hunt! Para ser dono de uma hunt, compre na nossa shop do site ribeirot.servegame.com")
		end
		elseif item.actionid == 3606 then
		if tonumber(filtrateString(getGlobalStorageValue(822087))[1]) == getPlayerAccountId(cid) and tonumber(filtrateString(getGlobalStorageValue(822087))[2]) >= os.time() then
			doPlayerSendTextMessage(cid, 25, "Bem vindo à sua hunt! Aproveite ela, você tem mais "..math.floor((tonumber(filtrateString(getGlobalStorageValue(822087))[2]) - os.time()) / 60).." minutos de hunt.")
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendCancel(cid, "Você não é dono dessa hunt! Para ser dono de uma hunt, compre na nossa shop do site ribeirot.servegame.com")
		end
		elseif item.actionid == 3607 then
		if tonumber(filtrateString(getGlobalStorageValue(822088))[1]) == getPlayerAccountId(cid) and tonumber(filtrateString(getGlobalStorageValue(822088))[2]) >= os.time() then
			doPlayerSendTextMessage(cid, 25, "Bem vindo à sua hunt! Aproveite ela, você tem mais "..math.floor((tonumber(filtrateString(getGlobalStorageValue(822088))[2]) - os.time()) / 60).." minutos de hunt.")
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendCancel(cid, "Você não é dono dessa hunt! Para ser dono de uma hunt, compre na nossa shop do site ribeirot.servegame.com")
		end
		elseif item.actionid == 3608 then
		if tonumber(filtrateString(getGlobalStorageValue(822089))[1]) == getPlayerAccountId(cid) and tonumber(filtrateString(getGlobalStorageValue(822089))[2]) >= os.time() then
			doPlayerSendTextMessage(cid, 25, "Bem vindo à sua hunt! Aproveite ela, você tem mais "..math.floor((tonumber(filtrateString(getGlobalStorageValue(822089))[2]) - os.time()) / 60).." minutos de hunt.")
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendCancel(cid, "Você não é dono dessa hunt! Para ser dono de uma hunt, compre na nossa shop do site ribeirot.servegame.com")
		end
		elseif item.actionid == 3609 then
		if tonumber(filtrateString(getGlobalStorageValue(822090))[1]) == getPlayerAccountId(cid) and tonumber(filtrateString(getGlobalStorageValue(822090))[2]) >= os.time() then
			doPlayerSendTextMessage(cid, 25, "Bem vindo à sua hunt! Aproveite ela, você tem mais "..math.floor((tonumber(filtrateString(getGlobalStorageValue(822090))[2]) - os.time()) / 60).." minutos de hunt.")
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendCancel(cid, "Você não é dono dessa hunt! Para ser dono de uma hunt, compre na nossa shop do site ribeirot.servegame.com")
		end
		elseif item.actionid == 3610 then
		if tonumber(filtrateString(getGlobalStorageValue(822091))[1]) == getPlayerAccountId(cid) and tonumber(filtrateString(getGlobalStorageValue(822091))[2]) >= os.time() then
			doPlayerSendTextMessage(cid, 25, "Bem vindo à sua hunt! Aproveite ela, você tem mais "..math.floor((tonumber(filtrateString(getGlobalStorageValue(822091))[2]) - os.time()) / 60).." minutos de hunt.")
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendCancel(cid, "Você não é dono dessa hunt! Para ser dono de uma hunt, compre na nossa shop do site ribeirot.servegame.com")
		end
		elseif item.actionid == 3611 then
		if tonumber(filtrateString(getGlobalStorageValue(822092))[1]) == getPlayerAccountId(cid) and tonumber(filtrateString(getGlobalStorageValue(822092))[2]) >= os.time() then
			doPlayerSendTextMessage(cid, 25, "Bem vindo à sua hunt! Aproveite ela, você tem mais "..math.floor((tonumber(filtrateString(getGlobalStorageValue(822092))[2]) - os.time()) / 60).." minutos de hunt.")
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendCancel(cid, "Você não é dono dessa hunt! Para ser dono de uma hunt, compre na nossa shop do site ribeirot.servegame.com")
		end
		elseif item.actionid == 3612 then
		if tonumber(filtrateString(getGlobalStorageValue(822093))[1]) == getPlayerAccountId(cid) and tonumber(filtrateString(getGlobalStorageValue(822093))[2]) >= os.time() then
			doPlayerSendTextMessage(cid, 25, "Bem vindo à sua hunt! Aproveite ela, você tem mais "..math.floor((tonumber(filtrateString(getGlobalStorageValue(822093))[2]) - os.time()) / 60).." minutos de hunt.")
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendCancel(cid, "Você não é dono dessa hunt! Para ser dono de uma hunt, compre na nossa shop do site ribeirot.servegame.com")
		end
		elseif item.actionid == 3613 then
		if tonumber(filtrateString(getGlobalStorageValue(822094))[1]) == getPlayerAccountId(cid) and tonumber(filtrateString(getGlobalStorageValue(822094))[2]) >= os.time() then
			doPlayerSendTextMessage(cid, 25, "Bem vindo à sua hunt! Aproveite ela, você tem mais "..math.floor((tonumber(filtrateString(getGlobalStorageValue(822094))[2]) - os.time()) / 60).." minutos de hunt.")
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendCancel(cid, "Você não é dono dessa hunt! Para ser dono de uma hunt, compre na nossa shop do site ribeirot.servegame.com")
		end
		elseif item.actionid == 3614 then
		if tonumber(filtrateString(getGlobalStorageValue(822095))[1]) == getPlayerAccountId(cid) and tonumber(filtrateString(getGlobalStorageValue(822095))[2]) >= os.time() then
			doPlayerSendTextMessage(cid, 25, "Bem vindo à sua hunt! Aproveite ela, você tem mais "..math.floor((tonumber(filtrateString(getGlobalStorageValue(822095))[2]) - os.time()) / 60).." minutos de hunt.")
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendCancel(cid, "Você não é dono dessa hunt! Para ser dono de uma hunt, compre na nossa shop do site ribeirot.servegame.com")
		end
		elseif item.actionid == 3615 then
		if tonumber(filtrateString(getGlobalStorageValue(822096))[1]) == getPlayerAccountId(cid) and tonumber(filtrateString(getGlobalStorageValue(822096))[2]) >= os.time() then
			doPlayerSendTextMessage(cid, 25, "Bem vindo à sua hunt! Aproveite ela, você tem mais "..math.floor((tonumber(filtrateString(getGlobalStorageValue(822096))[2]) - os.time()) / 60).." minutos de hunt.")
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendCancel(cid, "Você não é dono dessa hunt! Para ser dono de uma hunt, compre na nossa shop do site ribeirot.servegame.com")
		end
		elseif item.actionid == 3616 then
		if tonumber(filtrateString(getGlobalStorageValue(822097))[1]) == getPlayerAccountId(cid) and tonumber(filtrateString(getGlobalStorageValue(822097))[2]) >= os.time() then
			doPlayerSendTextMessage(cid, 25, "Bem vindo à sua hunt! Aproveite ela, você tem mais "..math.floor((tonumber(filtrateString(getGlobalStorageValue(822097))[2]) - os.time()) / 60).." minutos de hunt.")
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendCancel(cid, "Você não é dono dessa hunt! Para ser dono de uma hunt, compre na nossa shop do site ribeirot.servegame.com")
		end
		elseif item.actionid == 3617 then
		if tonumber(filtrateString(getGlobalStorageValue(822098))[1]) == getPlayerAccountId(cid) and tonumber(filtrateString(getGlobalStorageValue(822098))[2]) >= os.time() then
			doPlayerSendTextMessage(cid, 25, "Bem vindo à sua hunt! Aproveite ela, você tem mais "..math.floor((tonumber(filtrateString(getGlobalStorageValue(822098))[2]) - os.time()) / 60).." minutos de hunt.")
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendCancel(cid, "Você não é dono dessa hunt! Para ser dono de uma hunt, compre na nossa shop do site ribeirot.servegame.com")
		end
		
	end
	return true
end