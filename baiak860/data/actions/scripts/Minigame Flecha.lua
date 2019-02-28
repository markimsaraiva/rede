function onUse(cid, item, fromPosition, itemEx, toPosition)
	local game
	if item.actionid == 4619 then
		game = MiniGame:new({cid = cid, playerPos = {x = 391, y = 165, z = 7}, birdPos = {x = 386, y = 165, z = 7}, fromPos = {x = 385, y = 160, z = 7}, toPos = {x = 391, y = 169, z = 7}})
		game:Start(1)
	elseif item.actionid == 4620 then
		game = MiniGame:new({cid = cid, playerPos = {x = 391, y = 175, z = 7}, birdPos = {x = 386, y = 175, z = 7}, fromPos = {x = 385, y = 170, z = 7}, toPos = {x = 391, y = 179, z = 7}})
		game:Start(2)
	elseif item.actionid == 4621 then
		game = MiniGame:new({cid = cid, playerPos = {x = 391, y = 185, z = 7}, birdPos = {x = 386, y = 185, z = 7}, fromPos = {x = 385, y = 180, z = 7}, toPos = {x = 391, y = 189, z = 7}})
		game:Start(3)
	elseif item.actionid == 4622 then
		game = MiniGame:new({cid = cid, playerPos = {x = 403, y = 165, z = 7}, birdPos = {x = 398, y = 165, z = 7}, fromPos = {x = 397, y = 160, z = 7}, toPos = {x = 403, y = 169, z = 7}})
		game:Start(4)
	elseif item.actionid == 4623 then
		game = MiniGame:new({cid = cid, playerPos = {x = 403, y = 175, z = 7}, birdPos = {x = 398, y = 175, z = 7}, fromPos = {x = 397, y = 170, z = 7}, toPos = {x = 403, y = 179, z = 7}})
		game:Start(5)
	elseif item.actionid == 4624 then
		game = MiniGame:new({cid = cid, playerPos = {x = 403, y = 185, z = 7}, birdPos = {x = 398, y = 185, z = 7}, fromPos = {x = 397, y = 180, z = 7}, toPos = {x = 403, y = 189, z = 7}})
		game:Start(6)
	end
	return true
end
