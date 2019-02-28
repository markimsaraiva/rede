local query = db.query or db.executeQuery

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if not getTilePzInfo(getThingPos(cid)) then
		doPlayerSendCancel(cid, "{Sell Points System} Você precisa está em protectzone.")
		return true
	end
	if getItemAttribute(item.uid, "pontos") and tonumber(getItemAttribute(item.uid, "pontos")) then
		local points = tonumber(getItemAttribute(item.uid, "pontos"))
		if doRemoveItem(item.uid) then
			query("UPDATE `accounts` SET `premium_points` = `premium_points` + '"..points.."' WHERE `id` = '"..getPlayerAccountId(cid).."'")
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "{Sell Points System} Você recebeu "..points.." Points!")
			doSendMagicEffect(getThingPos(cid), 28)
		end
	else
		doPlayerSendCancel(cid, "Este documento não vale nenhum ponto.")
	end
	return true
end