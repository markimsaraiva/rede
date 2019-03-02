dofile("./_woe.lua")

local config = woe_config

function isInTable(t, val)
	if (type(t) == "table") then
		for k, v in ipairs(t) do
			if v == val then
				return true
			end
		end
	end
    return false
end

local lastDay = false

function onTime ()
	local day = string.lower(os.date("%A", os.time()))
	if isInTable(config.dias, day) == true and lastday ~= day then
		local Hora = tonumber(os.date("%H", os.time()))
		if Hora == config.horaPartida then
			if not Woe.isTime() then
				doBroadcastMessage("O War of Emperium vai começar!", config.bcType)
				doBroadcastMessage("O War of Emperium vai durar 30 minutos", config.bcType)
				setGlobalStorageValue(stor.WoeTime, 1)
				lastDay = day
			end
		end
	end
	return true
end 	
