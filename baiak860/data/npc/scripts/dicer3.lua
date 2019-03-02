local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) end
function onThink()					    	npcHandler:onThink() end
 
local function delayMoneyRemoval(item, pos)
	doRemoveItem(getTileItemById(pos, item).uid)
	return true
end
 
local function placeMoney(amount, table_middle_pos)
	local remain = amount
	local crystal_coins = 0
	local platinum_coins = 0
 
	if (math.floor(amount / 10000) >= 1) then
		crystal_coins = math.floor(amount / 10000)
		remain = remain - crystal_coins * 10000
	end
	if ((remain / 100) >= 1) then
		platinum_coins = remain / 100
	end
	addEvent(doCreateItem, 550, 2152, platinum_coins, table_middle_pos)
	addEvent(doCreateItem, 600, 2160, crystal_coins, table_middle_pos)
end
 
local function rollDice(roll, cc_count, pc_count, table_left_pos, table_middle_pos, npc)
	local dice_ids = {5792, 5793, 5794, 5795, 5796, 5797}
	local random_rollval = math.random(1,6)
	local total_g = (10000 * cc_count) + (100 * pc_count)
	local prize_percent = 1.0 -- 100%
 
	if ((total_g) <= 1000000 and (total_g) >= 5000) then
		doSendMagicEffect(table_left_pos, CONST_ME_CRAPS)
 
		for _, itemId in pairs(dice_ids) do
				if(getTileItemById(table_left_pos, itemId).uid > 0) then
				doTransformItem(getTileItemById(table_left_pos, itemId).uid, dice_ids[random_rollval])
			end
		end
 
		if (roll == 1 and random_rollval <= 3) then
			placeMoney(total_g + (total_g * prize_percent), table_middle_pos)
			addEvent(doSendMagicEffect, 400, table_left_pos, 28)
			addEvent(doSendMagicEffect, 700, table_left_pos, 28)
			addEvent(doCreatureSay, 500, npc, "You win "..total_g.." gold coins, Parabéns você venceu", TALKTYPE_SAY, false, 0)
		elseif (roll == 2 and random_rollval >= 4) then
			placeMoney(total_g + (total_g * prize_percent), table_middle_pos)
			addEvent(doSendMagicEffect, 400, table_left_pos, 28)
			addEvent(doSendMagicEffect, 700, table_left_pos, 28)
			addEvent(doCreatureSay, 500, npc, "You win "..total_g.." gold coins, Parabéns você venceu!", TALKTYPE_SAY, false, 0)
		else
			addEvent(doSendMagicEffect, 400, table_left_pos, CONST_ME_BLOCKHIT)
			addEvent(doSendMagicEffect, 700, table_left_pos, CONST_ME_BLOCKHIT)
			addEvent(doCreatureSay, 500, npc, "Você perdeu tente denovo.", TALKTYPE_SAY, false, 0)
		end
		doCreatureSay(npc, string.format("%s rolled a %d.", getCreatureName(npc), random_rollval), TALKTYPE_ORANGE_1, false, 0, table_left_pos)
	else
		addEvent(doCreateItem, 100, 2160, cc_count, table_middle_pos)
		addEvent(doCreateItem, 150, 2152, pc_count, table_middle_pos)
		doCreatureSay(npc, "Você precisa jogar o dinheiro no recipiente de baixo e falar L para 1 a 3 ou H para 4 a 6 o preço minimo para a aposta é 5k e o maximo 1kk.", TALKTYPE_SAY, false, 0)
	end
	return true
end
 
function creatureSayCallback(cid, type, msg)
	-- NPC userdata instance
	local npc = getNpcCid()
 
	-- Participating player userdata instance
	local position = {x = getNpcPos().x+1, y = getNpcPos().y+2, z = getNpcPos().z}
	position.stackpos = STACKPOS_TOP_CREATURE
	local player_uid = getThingfromPos(position).uid
 
	-- Game table position userdata instances
	local table_left_pos = {x = 395, y = 154, z = 7}
	local table_middle_pos = {x = 395, y = 155, z = 7}
 
	-- Search for coins on the left and middle tables and create item userdata instances
	local table_middle_cc = getTileItemById(table_middle_pos, 2160)
	local table_middle_pc = getTileItemById(table_middle_pos, 2152)
 
	-- Other variables
	local cc_count = 0
	local pc_count = 0
	local ROLL, LOW, HIGH = 0, 1, 2
 
	if (player_uid ~= 0) then
		if ((msgcontains(string.lower(msg), 'high') or msgcontains(string.lower(msg), 'h')) and (isPlayer(player_uid) and player_uid == cid)) then
			ROLL = HIGH
		elseif ((msgcontains(string.lower(msg), 'low') or msgcontains(string.lower(msg), 'l')) and (isPlayer(player_uid) and player_uid == cid)) then
			ROLL = LOW
		else
			return false
		end
		if (table_middle_cc.uid ~= 0) then
			cc_count = table_middle_cc.type
			doTeleportThing(table_middle_cc.uid, table_left_pos)
			addEvent(delayMoneyRemoval, 300, 2160, table_left_pos)
		end
		if (table_middle_pc.uid ~= 0) then
			pc_count = table_middle_pc.type
			doTeleportThing(table_middle_pc.uid, table_left_pos)
			addEvent(delayMoneyRemoval, 300, 2152, table_left_pos)
		end
		addEvent(rollDice, 500, ROLL, cc_count, pc_count, table_left_pos, table_middle_pos, npc)
	else
		return false
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)