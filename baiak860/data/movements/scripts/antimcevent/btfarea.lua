local eventArea = {from = {x=1809, y=2369, z=3}, to = {x=1845, y=2378, z=3}}
local eventWait = {from = {x=168, y=44, z=7}, to = {x=170, y=46, z=7}}
local templo = {x=166,y=49,z=7}
 -- area do evento...
function onStepIn(cid, item, position, fromPosition)
	for _, pid in pairs(getPlayersOnline()) do
		if(cid ~= pid and getPlayerIp(cid) == getPlayerIp(pid) and isInRange(getThingPos(pid), eventArea.from, eventArea.to)) or (cid ~= pid and getPlayerIp(cid) == getPlayerIp(pid) and isInRange(getThingPos(pid), eventWait.from, eventWait.to))then
			doTeleportThing(cid, templo, false)
			doPlayerSendTextMessage(cid, 25, "[ANTI-MC] Nao e permitido na area de eventos, dois chares com mesmo ip")
			return true
		end
	end
	return true
end

