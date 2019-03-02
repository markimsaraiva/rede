local conditionBlue = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionBlue, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionBlue, {lookType = 128, lookHead = 85, lookBody = 85, lookLegs = 85, lookFeet = 85})
local conditionYellow = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionYellow, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionYellow, {lookType = 128, lookHead = 79, lookBody = 79, lookLegs = 79, lookFeet = 79})
function onStepIn(cid, item, position, fromPosition)
	if getPlayerAccess(cid) > 3 or getPlayerLevel(cid) < 100 then
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[BattleField] Você precisa ser no mínimo level 100!")
	elseif getGlobalStorageValue(414) >= getGlobalStorageValue(415) then
		setPlayerStorageValue(cid, 502, 1)
		setGlobalStorageValue(415, getGlobalStorageValue(415)+1)
		doAddCondition(cid, conditionBlue)
		doRemoveCondition(cid, CONDITION_INVISIBLE)
		doTeleportThing(cid, {x=1815, y = 2375, z = 3})
		doCreatureSetNoMove(cid, true)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[BattleField] You entered battlefield event, wait for the event start. You need to kill all the players of the yellow team.")
	else
		setPlayerStorageValue(cid, 501, 1)
		setGlobalStorageValue(414, getGlobalStorageValue(414)+1)
		doAddCondition(cid, conditionYellow)
		doRemoveCondition(cid, CONDITION_INVISIBLE)
		doTeleportThing(cid, {x = 1839, y = 2375, z = 3})
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[BattleField] You entered battlefield event, wait for the event start. You need to kill all the players of the blue team.")
		doCreatureSetNoMove(cid, true)
	end
	return true
end