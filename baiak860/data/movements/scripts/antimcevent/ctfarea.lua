local eventArea = {from = {x=1180, y=425, z=6}, to = {x=1235, y=460, z=7}}
local eventWait = {from = {x=164, y=44, z=7}, to = {x=167, y=46, z=7}} -- area do evento...
local templo = {x=166,y=49,z=7}

function onStepIn(cid, item, position, fromPosition)
	for _, pid in pairs(getPlayersOnline()) do
		if(cid ~= pid and getPlayerIp(cid) == getPlayerIp(pid) and isInRange(getThingPos(pid), eventArea.from, eventArea.to)) or (cid ~= pid and getPlayerIp(cid) == getPlayerIp(pid) and isInRange(getThingPos(pid), eventWait.from, eventWait.to)) then
			doTeleportThing(cid, templo, false)
			doPlayerSendTextMessage(cid, 25, "[ANTI-MC] Nao e permitido na area de eventos, dois chares com mesmo ip")
			return true
		end
	end
	return true
end

