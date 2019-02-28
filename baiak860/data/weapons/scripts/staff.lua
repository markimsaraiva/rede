local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 44)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ME_BUBBLES)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -120, 0, -200)

function onUseWeapon(cid, var)
return doCombat(cid, combat, var)
end