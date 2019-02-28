local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -2, -23, -2, -20, 15, 25, 5.8, 12.7)

function onCastSpell(cid, var)
if isMonster(cid) then
        doCreatureSay(cid, "exori san", TALKTYPE_MONSTER)
    end
	return doCombat(cid, combat, var)
end
