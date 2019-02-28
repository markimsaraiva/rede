local function doSendTextMessage (cid, msgSta , msg )
	return doPlayerSendTextMessage (cid, msgSta , msg )
end

local getPlayerPoints = function(cid)
	local accid, points = getPlayerAccountId(cid), 0
	local query = db.getResult("SELECT `premium_points` FROM `accounts` WHERE `id` = '"..accid.."'")
	if query:getID() ~= -1 then
		points = query:getDataInt("premium_points")
	end
	return tonumber(points)
end

local query = db.query or db.executeQuery
		

function onSay(cid, words, param)
if(not checkExhausted(cid, 666, 40)) then
		return false
	end
	if not getTilePzInfo(getThingPos(cid)) then
		doSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "{Sell Points System} Para gerar o documento, você precisa estar em ProtectZone.")
		return true
	end

	if param == "" then
		return doPlayerSendCancel(cid, "{Sell Points System} Escolha uma quantidade de pontos.")
	end
	
	if tonumber(param) and tonumber(param) > 0 then
		if getPlayerPoints(cid) >= tonumber(param) then
			local papel = doCreateItemEx(12343)
			doItemSetAttribute(papel, "pontos", tonumber(param))
			doItemSetAttribute(papel, "description", "[Sell Points System] Este documento vale "..param.." pontos para você usar no site.")
			if query("UPDATE `accounts` SET `premium_points` = `premium_points` - '"..tonumber(param).."' WHERE `id` = '"..getPlayerAccountId(cid).."'") then
				doPlayerAddItemEx(cid, papel)
				doSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "{Sell Points System} Você transferiu "..param.." pontos para este documento.")
				doSendMagicEffect(getThingPos(cid), 31)
			else
				doSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "{Sell Points System} Aconteceu algum problema, tente novamente.")
			end
		else
			doSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "{Sell Points System} Desculpe, você não tem pontos suficiente.")
		end
	else
		doSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "{Sell Points System} Escolha a quantidade de pontos que você quer transferir ao documento ex: !sellpoints 15.")
	end
	return true
end