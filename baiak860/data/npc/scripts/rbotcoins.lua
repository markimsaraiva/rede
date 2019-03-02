local keywordHandler = KeywordHandler:new() 
local npcHandler = NpcHandler:new(keywordHandler) 
NpcSystem.parseParameters(npcHandler) 
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end 
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end 
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end 
function onThink() npcHandler:onThink() end 
function creatureSayCallback(cid, type, msg) 
if(not npcHandler:isFocused(cid)) then 
return false 
end 
local talkState = {}
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local shopWindow = {}
local moeda = 12695 -- id da sua moeda vip
local t = {
      [7443] = {price = 40},
	  [12657] = {price = 150},
	  [8981] = {price = 60},
	  [12658] = {price = 200},
	  [6300] = {price = 200},
	  [10502] = {price = 200}, 
	  [5801] = {price = 10},	
	  [8300] = {price = 70},	
	  [12396] = {price = 150},	
	  [12575] = {price = 150},	
	  [9693] = {price = 50},
	  [6512] = {price = 300},
	  [12289] = {price = 350},
	  [5468] = {price = 50}
	 
	  
      }
	  
local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)
    if  t[item] and not doPlayerRemoveItem(cid, moeda, t[item].price) then
          selfSay("You don't have "..t[item].price.." "..getItemNameById(moeda), cid)
             else
        doPlayerAddItem(cid, item)
        selfSay("Here are you.", cid)
       end
    return true
end
if (msgcontains(msg, 'trade') or msgcontains(msg, 'TRADE'))then
            for var, ret in pairs(t) do
                    table.insert(shopWindow, {id = var, subType = 0, buy = ret.price, sell = 0, name = getItemNameById(var)})
                end
            openShopWindow(cid, shopWindow, onBuy, onSell)
	        end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())