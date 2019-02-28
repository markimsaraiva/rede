local bosses = {
    ["The BOSS STRIKER"] = {
        {itemid = 9971, count = {min = 80, max = 100}},
        {itemid = 7440, count = {min = 1, max = 1}},
		{itemid = 12396, count = {min = 3, max = 10}},
        {itemid = 12575, count = {min = 3, max = 5}}
    }
}

function getRotate(uid)
    local pos = getCreaturePosition(uid)
    return
    {
        {x = pos.x, y = pos.y, z = pos.z},
        {x = pos.x, y = pos.y, z = pos.z},
        {x = pos.x, y = pos.y, z = pos.z},
        {x = pos.x, y = pos.y, z = pos.z},
        {x = pos.x, y = pos.y, z = pos.z}
    }
end

function onKill(cid, target)
    local bid = bosses[getCreatureName(target)]
    
    if isMonster(target) and bid and getStorage(33999) <= os.time() then
        doCreatureSetDropLoot(target, nil)
        for _, v in ipairs(bid) do
            doCreateItem(v.itemid, math.random(v.count.min, v.count.max), getRotate(target)[_])
            doSendMagicEffect(getRotate(target)[_], 6)
        end
        doSetStorage(33999, os.time() + 5)
    end

    return true
end

function onLogin(cid)
    return registerCreatureEvent(cid, "lootboss")
end