local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SHIVERARROW)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -500, 0, -500)

function onUseWeapon(cid, var)
return doCombat(cid, combat, var)
end