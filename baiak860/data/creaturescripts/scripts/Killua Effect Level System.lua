local control = {
	{from = 1, to = 10, effect = 27},
	{from = 11, to = 20, effect = 7},
	{from = 21, to = 30, effect = 30},
	{from = 31, to = 40, effect = 31},
	{from = 41, to = 50, effect = 44},
	{from = 51, to = 60, effect = 51},
	{from = 61, to = 70, effect = 65},
	{from = 71, to = 80, effect = 35},
	{from = 81, to = 90, effect = 49},
	{from = 91, to = 99, effect = 53},
	{from = 100, to = 100, effect = 66}
}

local function doSendEffectLevel(cid)
	if isPlayer(cid) then
		for _, levels in pairs(control) do
			if getPlayerEffectLevel(cid) >= levels.from and getPlayerEffectLevel(cid) <= levels.to then
				doSendMagicEffect(getThingPos(cid), levels.effect)
				break
			end
		end
		addEvent(doSendEffectLevel, 3500, cid)
	end
end

function onLogin(cid)
	if getPlayerEffectLevel(cid) > 0 then
		addEvent(doSendEffectLevel, 5000, cid)
	end
	return true
end