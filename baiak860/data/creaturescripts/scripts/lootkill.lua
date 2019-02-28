function onKill(cid, target, lastHit)
local item,count = 5925,1

if isPlayer(cid) and isPlayer(target) and getPlayerIp(target) ~= getPlayerIp(cid) then
doPlayerAddItem(cid, item, count)
doSendAnimatedText(getCreaturePosition(target), "OwNeD!", 35)
end
return TRUE
end