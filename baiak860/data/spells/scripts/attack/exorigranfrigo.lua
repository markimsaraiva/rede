local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 52)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -2, -6, -2, -13, 4, 4, 1, 1.5)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
