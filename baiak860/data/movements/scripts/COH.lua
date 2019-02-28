function onStepIn(cid, item)
 local pos = getThingPos(cid)
 
--//
	if item.actionid == 16201 then
  if not isPlayer(cid) then
   return true
  end
  
  if (getPlayerGuildId(cid) > 0) then
   doSendMagicEffect(pos, 1)
   doCreatureSay(cid, "[Castle-Entrada]", TALKTYPE_ORANGE_1)
  else
   doSendMagicEffect(pos, 2)  
   doTeleportThing(cid, {x = pos.x + 1, y = pos.y, z = pos.z})
   doPlayerSendCancel(cid, "[Castle24hrs] Você não possui uma guild.")
  end
  return true
 end
--//
 
 if (item.actionid == 16203) then 
  if not isPlayer(cid) then
	  return true
  end 
  if getGlobalStorageValue(COH_STATUS) == getPlayerGuildName(cid) then
   doSendMagicEffect(getThingPos(cid), 14)
   doSendAnimatedText(pos, "[C-Hunts]", math.random(1, 255))
  else
   doSendMagicEffect(getThingPos(cid), 2)
   doTeleportThing(cid, {x = pos.x, y = pos.y - 1, z = pos.z})
   doPlayerSendCancel(cid, "[Castle24hrs] Você não pertence á guild "..getGlobalStorageValue(COH_STATUS)..".")
  end
  return true
 end
--//

	if (item.actionid == 16202) then
	 if not isPlayer(cid) then
	  return true
  end
  
  if (getPlayerGuildId(cid) > 0) then
   if (getGlobalStorageValue(COH_STATUS) ~= getPlayerGuildName(cid)) then
  		doPlayerSendTextMessage(cid, 20, "[Castle24hrs] Você e sua guild estão no comando, os antigos donos ["..tostring(getGlobalStorageValue(COH_STATUS)).."] podem se vingar!")
 	  setGlobalStorageValue(COH_PREPARE1, -1)
  	 setGlobalStorageValue(COH_PREPARE2, -1)
 	  setGlobalStorageValue(COH_STATUS, getPlayerGuildName(cid))
 	  doCastleRemoveEnemies()
    doBroadcastMessage("[Castle24hrs] O jogador ["..getCreatureName(cid).."] e sua guild ["..getPlayerGuildName(cid).."] estão no comando do castelo, vá dominar e impedir isso!")
  	end
 	else
   doSendMagicEffect(pos, 2)  
   doTeleportThing(cid, {x = pos.x + 1, y = pos.y, z = pos.z})
   doPlayerSendCancel(cid, "[Castle24hrs] Você não possui uma guild.")
   end
 	 return true
 end
--// 
 return true
end