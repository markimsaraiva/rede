function onStatsChange(cid, attacker, type, combat, value)
	if (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) and isPlayer(attacker) then
		if (getPlayerStorageValue(attacker, 48903)*1) >= math.random (0,1000) then
			dano = math.ceil(value*(2))
			doTargetCombatHealth(attacker, cid, combat, -dano, -dano, 255)
			doSendAnimatedText(getCreaturePos(attacker), "Critical!", 100)
		end
	end
	return true
end