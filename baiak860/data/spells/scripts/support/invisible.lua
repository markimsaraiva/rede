local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_INVISIBLE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 200000)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	local blue = getPlayerStorageValue(cid, dtt.storage.team_blue)
	local red = getPlayerStorageValue(cid, dtt.storage.team_red)
	if (blue > 0) or (red > 0) then return false end
	return doCombat(cid, combat, var)
end

function onCastSpell(cid, var)
     if getPlayerStorageValue(cid, 82) == 1 or getPlayerStorageValue(cid, 83) == 1 or getPlayerStorageValue(cid, 72) == 1 or getPlayerStorageValue(cid, 71) == 1 then
	 doPlayerSendCancel(cid, "Este spell não pode ser usado em eventos!")
     doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
	 return false
	 end
	return doCombat(cid, combat, var)
end

function onCastSpell(cid, var)
	local blue = getPlayerStorageValue(cid, dtt.storage.team_blue)
	local red = getPlayerStorageValue(cid, dtt.storage.team_red)
	local sto = getPlayerStorageValue(cid, realTeamBattle.teamStorage)
     if getPlayerStorageValue(cid, 51) == 1 or getPlayerStorageValue(cid, 52) == 1 or getPlayerStorageValue(cid, 72) == 1 or getPlayerStorageValue(cid, 71) == 1 or getPlayerStorageValue(cid, 171) == 1 or getPlayerStorageValue(cid, 172) == 1 or getPlayerStorageValue(cid, 151) == 1 or getPlayerStorageValue(cid, 152) == 1 or (blue > 0) or (red > 0) or (sto > 0) then
	 doPlayerSendCancel(cid, "Sorry, not possible.")
     doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
	 return false
	 end
	return doCombat(cid, combat, var)
end