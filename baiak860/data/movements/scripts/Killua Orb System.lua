function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if item.actionid == 6666 then
		if tonumber(getPlayerTableStorage(cid, 666688).time) and tonumber(getPlayerTableStorage(cid, 666688).time) >= os.time() then
			doPlayerAddExperience(cid, getPlayerTableStorage(cid, 666688).exp)
			doSendAnimatedText(getThingPos(cid), getPlayerTableStorage(cid, 666688).exp.." exp!", 14, cid)
			doItemSetAttribute(item.uid, "aid", 0)
		end
	elseif item.actionid == 6667 then
		if tonumber(getPlayerTableStorage(cid, 666688).time) and tonumber(getPlayerTableStorage(cid, 666688).time) >= os.time() then
			doPlayerAddMoney(cid, getPlayerTableStorage(cid, 666688).gold)
			doSendAnimatedText(getThingPos(cid), getPlayerTableStorage(cid, 666688).gold.." gold!", 14, cid)
			doItemSetAttribute(item.uid, "aid", 0)
		end
	end
	return true
end