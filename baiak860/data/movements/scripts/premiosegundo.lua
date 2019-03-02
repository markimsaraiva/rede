local config = {
    --[actionid] = {item = itemid, desc = "description"},
    [2136] = {item = 10128, desc = "Premio ao jogador %s por ficar em segundo lugar no war event."},
}
function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    local trophy = config[item.actionid]
    if isPlayer(cid) and trophy then
        local pos = getCreaturePosition(cid)
        pos.y = pos.y - 1
        local thing = doCreateItem(trophy.item, 1, pos)
        doItemSetAttribute(thing, "description", string.format(trophy.desc, getCreatureName(cid)))
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
    end
    return true
end