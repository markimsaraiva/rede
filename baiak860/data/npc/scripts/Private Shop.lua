-- ########################################################
-- #####        Name: Private Shop System             #####
-- #####        Version: 2.0                          #####
-- ########################################################
-- #####  Developed by Maxwell Alcantara[MaXwEllDeN]  #####
-- #####  Contact: maxwellmda@gmail.com               #####
-- #####           maxwellden@hotmail.com             #####
-- ########################################################

local focus = 0
local talk_start = 0
local talkState = {}

local function tabletama(tb)
	local tam = 0
	for i, v in pairs(tb) do
		tam = tam + 1
	end
	return tam
end

local function onBuy(cid, item, subType, amount, ignoreCap, inBackpacks)
	local PlayerN = _PV_SHOP_CONFIG.prefix_shop and getCreatureName(getNpcCid()):sub(8, #getCreatureName(getNpcCid())) or getCreatureName(getNpcCid())
	local shop = getPlayerShopItens(getPlayerGUIDByName(PlayerN))
	local It = shop[item]

	if (tabletama(shop) < 1) then
		return false
	end

	local qntit = tonumber(It[1])

	if (amount <= qntit) then
		if (doPlayerRemoveMoney(cid, It[2] * amount)) then
			doPlayerAddItem(cid, item, amount)

			for a = 1, amount do
				doShopAddLucro(getPlayerGUIDByName(PlayerN), item, It[2])
			end

			doRemoveItemFromPlayerShop(getPlayerGUIDByName(PlayerN), item, amount)

			if isCreature(cid) then
				closeShopWindow(cid)
			end

			selfSay("Thank's there are your item.", cid)

			if (tabletama(getPlayerShopItens(getPlayerGUIDByName(PlayerN))) < 1) then
				local pos = getThingPos(getNpcCid())
				addEvent(function()
					local npc = getTopCreature(pos).uid
					doSendMagicEffect(pos, 2)
					doRemoveCreature(npc)
					deleteNPCFile(PlayerN)
				end, 1500)
				return selfSay("Oh! I don't have items to sell, bye bye!", cid)
			end
			setPlayerStorageValue(cid, 74123, 20)
		else
			selfSay("You haven't enought money! To buy this item you must have ".. It[2] * amount.." gold coins.", cid)
		end
	else
		selfSay("I just have ".. qntit .. " " .. getItemNameById(item) .. getPrefix(amount) .. ".",cid)
	end
end

function onCreatureDisappear(cid, pos)
   if (focus ~= 0) then
      selfSay('Bye Bye.')
      focus = 0
   end
end

function msgcontains(txt, str)
   return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end

function onCreatureSay(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if (msgcontains(msg, "hi") and (not isCreature(focus)) and (getDistanceToCreature(cid) < 4))  then
		setPlayerStorageValue(cid, 74123, -1)
		talk_start = os.time()
		selfSay("Hello {".. getCreatureName(cid) .."}, you like to {trade} with me?", cid)
		focus = cid
	elseif (msgcontains(msg, "trade")) and (focus == cid) then
		local PlayerN = _PV_SHOP_CONFIG.prefix_shop and getCreatureName(getNpcCid()):sub(8, #getCreatureName(getNpcCid())) or getCreatureName(getNpcCid())
		local ItemsWindow = {}

		for a, b in pairs(getPlayerShopItens(getPlayerGUIDByName(PlayerN))) do
			table.insert(ItemsWindow, {id = a, subType = {b, a}, buy = b[2], sell= 0, name= getItemNameById(a)})
		end

		openShopWindow(cid, ItemsWindow, onBuy, onSell)
	elseif (msgcontains(msg, "bye")) and (focus == cid) then
		selfSay('Bye Bye.', cid)
		focus = 0		
		closeShopWindow(cid)
	end

	return true
end


function onThink()
	local PlayerN = _PV_SHOP_CONFIG.prefix_shop and getCreatureName(getNpcCid()):sub(8, #getCreatureName(getNpcCid())) or getCreatureName(getNpcCid())
	if (isCreature(getPlayerByNameWildcard(PlayerN))) then
		focus = 0
		deleteNPCFile(PlayerN)
		return doRemoveCreature(getNpcCid())
	end

	if (isPlayer(focus)) then
		if (os.time() - talk_start > 90)then							
			closeShopWindow(focus)
			focus = 0			
			return true
		elseif (getDistanceBetween(getThingPos(focus), getThingPos(getNpcCid())) > 3) then			
			selfSay("Bye bye...", focus)
			closeShopWindow(focus)
			focus = 0			
			return ture
		elseif (getPlayerStorageValue(focus, 74123) > 0) then
			local cid = focus
			local ItemsWindow = {}
			for a, b in pairs(getPlayerShopItens(getPlayerGUIDByName(PlayerN))) do
				table.insert(ItemsWindow, {id = a, subType = {b, a}, buy = b[2], sell= 0, name= getItemNameById(a)})
			end

			setPlayerStorageValue(focus, 74123, -1)
			openShopWindow(focus, ItemsWindow, onBuy, onSell)
		end

		doNpcSetCreatureFocus(focus)
	end

end
