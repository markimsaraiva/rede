local chance = 20 -- %

local function getMonstInfo(uid)
   if isMonster(uid) and getCreatureName(uid) then
       if type(getMonsterInfo(getCreatureName(uid))) == "table" and #getMonsterInfo(getCreatureName(uid)) > 0 then
            if tonumber(getMonsterInfo(getCreatureName(uid)).experience) and tonumber(getMonsterInfo(getCreatureName(uid)).health) then
                return {experience = tonumber(getMonsterInfo(getCreatureName(uid))), health = tonumber(getMonsterInfo(getCreatureName(uid)))}
            end
        end
    end
    return false
end

local function showOrb(cid, pos, type, quant)
	local effects = {4,7,8,18,19,21,30,34}
	doSendMagicEffect(pos, effects[math.random(1,#effects)], cid)
	if type == 1 then
		doSendAnimatedText(pos, "exp", math.random(1, 256), cid)
	elseif type == 2 then
		doSendAnimatedText(pos, "gold", math.random(1, 256), cid)
	end
	if quant > 0 then
		addEvent(showOrb, 700, cid, pos, type, quant - 1)
	end
end	

local function isWalkable(cid, pos)
	pos.stackpos = 0
	if getTileThingByPos(pos).uid ~= 0 then
		local n = getTileInfo(pos)
		if doTileQueryAdd(cid, pos) == RETURNVALUE_NOERROR then
			return true
		end
	end
	return false
end

local function removeAction(pos)
	pos.stackpos = 0
	doItemSetAttribute(getThingFromPos(pos).uid, "aid", 0)
end

function onKill(cid, target)
	if isPlayer(cid) and isMonster(target) then
			if math.random(1,100) <= chance then
				local pos = getThingPos(target)
				local pos_opt = {x = pos.x + math.random(-1, 1), y = pos.y + math.random(-1, 1), z = pos.z}
				local count = 0
				if isWalkable(cid, pos_opt) then	
    					setPlayerTableStorage(cid, 666688, {time = os.time() + 5, exp = math.random(20000,100000), gold = math.random(10000,25000)})
					local type = math.random(1,2)
					showOrb(cid, pos_opt, type, 5)
					pos_opt.stackpos = 0
					doItemSetAttribute(getThingFromPos(pos_opt).uid, "aid", type == 1 and 6666 or 6667)
					addEvent(removeAction, 4900, pos_opt)
			end
		end
	end
	return true
end

function onLogin(cid)
	if getPlayerStorageValue(cid, 666688) == -1 then
		setPlayerTableStorage(cid, 666688, {time = os.time(), exp = 0, gold = 0})
	end
	registerCreatureEvent(cid, "Killua Orbs")
	return true
end