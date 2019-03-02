local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 39)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 30)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -230, 0, -230)

function onUseWeapon(cid, var)
return doCombat(cid, combat, var)
end