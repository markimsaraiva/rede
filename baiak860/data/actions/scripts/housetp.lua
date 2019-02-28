function onUse(cid, item, frompos, item2, topos)
        if getCreatureCondition(cid, CONDITION_INFIGHT) == FALSE then
                if getHouseByPlayerGUID(getPlayerGUID(cid)) then        
                        doTeleportThing(cid, getHouseEntry(getHouseByPlayerGUID(getPlayerGUID(cid))))  
                                        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
                                                doPlayerSendTextMessage(cid,22,"You have been teleported to your house, 1x house teleporter removed!")                                                  
                                                        else
                                                                doPlayerSendTextMessage(cid,22,"You still do not have a house, buy a talking '!buyhouse' front of her.")
                                                        end
                                                end
                                                        
                                                if getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE then
                                                        doPlayerSendTextMessage(cid,22,"Please wait for your Battle/PZ for using house teleporter!")
                                                                doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
                                                                        return true
                                                                end
                                                        end