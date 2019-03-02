local config = {
	-- NOTE: data from tibia.wikia.com
	
	--[xxxx] = {
		--{ rate = 1, item = 2160, count = { min = 1, max = 2 }},
		--{ rate = 2, item = 2400, count = { const = 1 }}
	--}
	
	-- blue
	[6570] = {		
		{ rate = 5000, item = 7440, count = { const = 1 }},
		{ rate = 400, item = 9693, count = { const = 1 }},
		{ rate = 700, item = 2346, count = { const = 1 }},
		{ rate = 450, item = 12461, count = { const = 1 }},
	},
	-- red
	[6571] = {
		{ rate = 5000, item = 9971, count = { const = 3 }},
		{ rate = 1000, item = 9971, count = { const = 4 }},
		{ rate = 800, item = 9971, count = { const = 5 }},
	},
}

local sumOfRate = {}

for k,v in pairs(config) do
	sumOfRate[k] = 0
	for k2,v2 in pairs(v) do
		sumOfRate[k] = sumOfRate[k] + v2.rate
	end
end

function randomGift(itemid)
	local rand = math.random(1, sumOfRate[itemid])

	local subSum = 0
	local exactItem = nil
	for i,v in ipairs(config[itemid]) do
		if (subSum > rand) then
			if (i > 1) then
				exactItem = i-1
			end
			break
		end
		subSum = subSum + v.rate
		if (subSum >= rand) then
			exactItem = i
			break
		end
	end
	
	return exactItem
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local run = false
	
	for k,v in pairs(config) do
		if (k == item.itemid) then
			run = true
			break
		end
	end
	
	if (not run) then
		return false
	end
	
	local gift = randomGift(item.itemid)

	if (config[item.itemid][gift].count.const ~= nil) then
		doPlayerAddItem(cid, config[item.itemid][gift].item, config[item.itemid][gift].count.const)
	else
		doPlayerAddItem(cid, config[item.itemid][gift].item, math.random(config[item.itemid][gift].count.min, config[item.itemid][gift].count.max))
	end
	
	doSendMagicEffect(fromPosition, CONST_ME_GIFT_WRAPS)
	doRemoveItem(item.uid, 1)
	return true
end