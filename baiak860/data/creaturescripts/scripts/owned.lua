function onKill(cid, target)
if isPlayer(cid) and isPlayer(target) then
doSendAnimatedText(getCreaturePosition(target), "OwNeD!", 35)
end
return true
end