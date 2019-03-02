function onDeath(cid, corpse, deathList)
local ID_ITEM = 2131
 if (getPlayerSlotItem(cid, CONST_SLOT_NECKLACE).itemid == ID_ITEM) and (getCreatureSkullType(cid) == SKULL_RED or getCreatureSkullType(cid) == SKULL_BLACK) then
 doCreatureSetDropLoot(cid, false)
end
return true
end