local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 36)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EXPLOSION)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -260, 0, -360)

function onUseWeapon(cid, var)
return doCombat(cid, combat, var)
end