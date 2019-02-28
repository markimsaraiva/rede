-- Script por Killua --

function onKill(cid, target, lastHit)
	if isMonster(target) and isPlayer(cid) then
	
		for _, tasks in pairs(killuaTask) do
			if isInArray(tasks.creatures, getCreatureName(target)) then
				
				if getPlayerTableStorage(cid, tasks.storage).count == nil then

					setPlayerTableStorage(cid, tasks.storage, {["done"] = -1, ["count"] = 1})
				else
					if getPlayerTableStorage(cid, tasks.storage).count < tasks.count then
						setPlayerTableStorage(cid, tasks.storage, {["done"] = -1, ["count"] = getPlayerTableStorage(cid, tasks.storage).count + 1})
					end
				end	
			end
		end
	end
    return true
end

function onLogin(cid)
	registerCreatureEvent(cid, "killuaTask")
	return true
end