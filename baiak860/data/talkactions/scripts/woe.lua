dofile("./_woe.lua")

local config = woe_config

function onSay(cid, words, param)

	if words == "/woe" and param == "/!/SETUP" then
		Woe.setup()
		return true
	end
	
	Woe.getInfo()
	
	local myTable = {}
	
	for _, i in ipairs({"%d", "%B", "%Y", "%X"}) do
		table.insert(myTable, os.date(i, infoLua[4]))
	end
	
	if Woe.isStarted() then
		text = "time left = " ..  Woe.timeToEnd().mins .. ":" .. Woe.timeToEnd().secs .. "\nActually the castle " .. Castle.name .. " is owned by " .. Woe.guildName() .. ".\n" .. Woe.breakerName() .. " broke the empe at "..myTable[1].." / "..myTable[2].." / "..myTable[3].." at time "..myTable[4].."."
	else
		text = "A ultima Batalha pelo New Castle foi dominada pela guild " .. Woe.guildName() .. ".\n" .. Woe.breakerName() .. " dominou o emperium para sua guild dia "..myTable[1].." / "..myTable[2].." / "..myTable[3].." at time "..myTable[4].."."
	end

	if words == "/woe" then
		if getPlayerAccess(cid) >= config.accessToStar then
			if param == "on" then
				if Woe.isTime() ~= true then
					doBroadcastMessage("War of Emperium vai começar em 5 minutos se preparem!...", config.bcType)
					doBroadcastMessage("O War Of Emperium terá duração de " .. config.timeToEnd .. " Minutos.", config.bcType)
					setGlobalStorageValue(stor.WoeTime, 1)
				else
					doPlayerSendCancel(cid, "WoE já está sendo executado.")
				end
			elseif param == "off" then
				if Woe.isTime() == true then
					doBroadcastMessage("WoE foi cancelada...", config.bcType)
					setGlobalStorageValue(stor.WoeTime, 0)
					setGlobalStorageValue(stor.Started, 0)
					if isCreature(getThingFromPos(Castle.empePos).uid) == TRUE then
						doRemoveCreature(getThingFromPos(Castle.empePos).uid)
					end
					if getThingFromPos(Castle.desde).itemid > 0 then
						doRemoveItem(getThingFromPos(Castle.desde).uid)
					end
					Woe.removePre()
					Woe.removePortals()
				else
					doPlayerSendCancel(cid, "WoE não está aberto.")
				end
			elseif param == "empe" then
				doSummonCreature("empe", Castle.empePos)
			elseif param == "go" then
				local newPos = Castle.empePos
				newPos.y = newPos.y + 1
				doTeleportThing(cid, newPos, FALSE)
			elseif param == "info" then
				doPlayerPopupFYI(cid, text)
			else
				doPlayerSendCancel(cid, "not valid param.")
			end
		elseif getPlayerAccess(cid) < config.accessToStar then
			if param == "info" then
				doPlayerPopupFYI(cid, text)
			end
		else
			doPlayerSendCancel(cid, "not possible.")
		end	
	elseif words == "!recall" then
		if Woe.isStarted() == true then
			if getPlayerGuildLevel(cid) == GUILDLEVEL_LEADER then
				if Woe.isInCastle(cid) == true then
					local members = Woe.getGuildMembers(getPlayerGuildId(cid))
					if #members > 1 then
						if(exhaust(cid, stor.recall, config.recallTime) == 1) then
							for _, i in ipairs(members) do
								if getPlayerGuildLevel(i) ~= GUILDLEVEL_LEADER then
									local pos = getClosestFreeTile(cid, getCreaturePosition(cid), FALSE, TRUE)
									doTeleportThing(i, pos, FALSE)
								end
							end
							doCreatureSay(cid, "Emergency Recall", TALKTYPE_SAY)
						else
							doPlayerSendCancel(cid, "you can only use this every " .. config.recallTime / 60 .. " minutes.")
						end		
					else
						doPlayerSendCancel(cid, "no members online.")
					end
				else
					doPlayerSendCancel(cid, "only can be used in the castle.")
				end
			else
				doPlayerSendCancel(cid, "Você não é o leader.")
			end
		else
			doPlayerSendCancel(cid, "woe não está aberto.")
		end
	end
	return true
end
