function onAdvance(cid, skill, oldlevel, newlevel)

        if(getPlayerStorageValue(cid, 60371) ~= 1 and skill == SKILL__LEVEL and newlevel >= 400) then
                doAddPoints(cid, 15)
                setPlayerStorageValue(cid, 60371, 1)
                doSendMagicEffect(getPlayerPosition(cid), CONST_ME_FIREWORK_RED)
    local message = "Congratulations you get 15 vip points."
    doCreatureSay(cid, message, TALKTYPE_ORANGE_1)
                doPlayerSendTextMessage(cid, 19, "Congratulations you get 15 vip points.")
                end
        return TRUE
        end