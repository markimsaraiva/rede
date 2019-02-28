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

local f1, t1 = {x = 2435, y = 499, z = 7}, {x = 2578, y = 593, z = 7}
local f2, t2 = {x = 2445, y = 390, z = 7}, {x = 2588, y = 487, z = 7}
local f3, t3 = {x = 2461, y = 315, z = 7}, {x = 2518, y = 368, z = 7}
local f4, t4 = {x = 2423, y = 167, z = 7}, {x = 2561, y = 271, z = 7}
local f5, t5 = {x = 2457, y = 252, z = 6}, {x = 2520, y = 302, z = 6}
local f6, t6 = {x = 1932, y = 402, z = 7}, {x = 2081, y = 459, z = 7}
local f7, t7 = {x = 2194, y = 469, z = 6}, {x = 2282, y = 543, z = 6}
local f8, t8 = {x = 2058, y = 559, z = 7}, {x = 2135, y = 632, z = 7}
local f9, t9 = {x = 2049, y = 468, z = 9}, {x = 2143, y = 523, z = 9}
local f10, t10 = {x = 2068, y = 325, z = 8}, {x = 2160, y = 405, z = 8}
local f11, t11 = {x = 2592, y = 507, z = 7}, {x = 2730, y = 597, z = 7}
local f12, t12 = {x = 2609, y = 399, z = 7}, {x = 2723, y = 489, z = 7}
local f13, t13 = {x = 2526, y = 318, z = 7}, {x = 2580, y = 370, z = 7}
local f14, t14 = {x = 2267, y = 161, z = 7}, {x = 2398, y = 269, z = 7}
local f15, t15 = {x = 2769, y = 505, z = 7}, {x = 2919, y = 601, z = 7}
local f16, t16 = {x = 2245, y = 315, z = 7}, {x = 2393, y = 419, z = 7}
local f17, t17 = {x = 2598, y = 316, z = 7}, {x = 2655, y = 370, z = 7}
local f18, t18 = {x = 2411, y = 16, z = 7}, {x = 2557, y = 124, z = 7}

function onThink(interval, lastExecution)
	local first = getPlayersInArea(f1, t1)
	local second = getPlayersInArea(f2, t2)
	local third = getPlayersInArea(f3, t3)
	local fourth = getPlayersInArea(f4, t4)
	local fifth = getPlayersInArea(f5, t5)
	local sixth = getPlayersInArea(f6, t6)
	local seventh = getPlayersInArea(f7, t7)
	local eighth = getPlayersInArea(f8, t8)
	local ninth = getPlayersInArea(f9, t9)
	local tenth = getPlayersInArea(f10, t10)
	local eleventh = getPlayersInArea(f11, t11)
	local twelfth = getPlayersInArea(f12, t12)
	local thirteenth = getPlayersInArea(f13, t13)
	local fourteenth = getPlayersInArea(f14, t14)
	local fifteenth = getPlayersInArea(f15, t15)
	local sixteenth = getPlayersInArea(f16, t16)
	local seventeenth = getPlayersInArea(f17, t17)
	local eighteenth = getPlayersInArea(f18, t18)
	
	if first then
		for _, pid in pairs(first) do
			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822081))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822081))[1]) and tonumber(filtrateString(getGlobalStorageValue(822081))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 1 expirou. Você foi levado até seu templo.")
			end
		end
	end
	if second then
		for _, pid in pairs(second) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822082))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822082))[1]) and tonumber(filtrateString(getGlobalStorageValue(822082))[2]) <= os.time()	then
        	doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 2 expirou. Você foi levado até seu templo.")
			end
		end
	end
	if third then
		for _, pid in pairs(third) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822083))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822083))[1]) and tonumber(filtrateString(getGlobalStorageValue(822083))[2]) <= os.time() then
        				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 3 expirou. Você foi levado até seu templo.")
			end
		end
	end
	if fourth then
		for _, pid in pairs(fourth) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822084))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822084))[1]) and tonumber(filtrateString(getGlobalStorageValue(822084))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 4 expirou. Você foi levado até seu templo.")
			end
		end
	end
	if fifth then
		for _, pid in pairs(fifth) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822085))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822085))[1]) and tonumber(filtrateString(getGlobalStorageValue(822085))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 5 expirou. Você foi levado até seu templo.")
			end
		end
	end
	if sixth then
		for _, pid in pairs(sixth) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822086))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822086))[1]) and tonumber(filtrateString(getGlobalStorageValue(822086))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 6 expirou. Você foi levado até seu templo.")
			end
		end
	end
	if seventh then
		for _, pid in pairs(seventh) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822087))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822087))[1]) and tonumber(filtrateString(getGlobalStorageValue(822087))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 7 expirou. Você foi levado até seu templo.")
			end
		end
	end
	if eighth then
		for _, pid in pairs(eighth) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822088))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822088))[1]) and tonumber(filtrateString(getGlobalStorageValue(822088))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 8 expirou. Você foi levado até seu templo.")
			end
		end
	end
	if ninth then
		for _, pid in pairs(ninth) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822089))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822089))[1]) and tonumber(filtrateString(getGlobalStorageValue(822089))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 9 expirou. Você foi levado até seu templo.")
			end
		end
	end
	if tenth then
		for _, pid in pairs(tenth) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822090))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822090))[1]) and tonumber(filtrateString(getGlobalStorageValue(822090))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 10 expirou. Você foi levado até seu templo.")
			end
		end
	end
		if eleventh then
		for _, pid in pairs(eleventh) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822091))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822091))[1]) and tonumber(filtrateString(getGlobalStorageValue(822091))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 11 expirou. Você foi levado até seu templo.")
			end
		end
	end
		if twelfth then
		for _, pid in pairs(twelfth) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822092))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822092))[1]) and tonumber(filtrateString(getGlobalStorageValue(822092))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 12 expirou. Você foi levado até seu templo.")
			end
		end
	end
			if thirteenth then
		for _, pid in pairs(thirteenth) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822093))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822093))[1]) and tonumber(filtrateString(getGlobalStorageValue(822093))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 13 expirou. Você foi levado até seu templo.")
			end
		end
	end
			if fourteenth then
		for _, pid in pairs(fourteenth) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822094))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822094))[1]) and tonumber(filtrateString(getGlobalStorageValue(822094))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 14 expirou. Você foi levado até seu templo.")
			end
		end
	end
		if fifteenth then
		for _, pid in pairs(fifteenth) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822095))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822095))[1]) and tonumber(filtrateString(getGlobalStorageValue(822095))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 15 expirou. Você foi levado até seu templo.")
			end
		end
	end
		if sixteenth then
		for _, pid in pairs(sixteenth) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822096))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822096))[1]) and tonumber(filtrateString(getGlobalStorageValue(822096))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 16 expirou. Você foi levado até seu templo.")
			end
		end
	end
		if seventeenth then
		for _, pid in pairs(seventeenth) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822097))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822097))[1]) and tonumber(filtrateString(getGlobalStorageValue(822097))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 17 expirou. Você foi levado até seu templo.")
			end
		end
	end
		if eighteenth then
		for _, pid in pairs(eighteenth) do
    			if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(822098))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(822098))[1]) and tonumber(filtrateString(getGlobalStorageValue(822098))[2]) <= os.time() then
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				doPlayerPopupFYI(pid, "Seu tempo como dono da Cave 18 expirou. Você foi levado até seu templo.")
			end
		end
	end




	return true
end
	