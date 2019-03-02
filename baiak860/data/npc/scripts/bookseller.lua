local config = {
minlevel = 150, --- level que precisa pra comprar o livro
price = 15000000, --- preço do livro
itemid = 8306 --- ID DO LIVRO
}
--- end config








function getDodgeSkill(cid)
dodgeskill = getPlayerStorageValue(cid, 48902)
return dodgeskill
end

function getCriticalSkill(cid)
criticalskill = getPlayerStorageValue(cid, 48913)
return criticalskill
end



local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}


function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end


function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid


if msgcontains(msg, 'haha') then
if getDodgeSkill(cid)  == dodgeskill then
selfSay('You want to buy Skill Book [DODGE]? It will cost '..config.price..' gp\'s!', cid)
talkState[talkUser] = 1
else
selfSay('I couldnt acess your data bank!', cid)
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
if getPlayerMoney(cid) < config.price then
selfSay('Its necessary to have at least '..config.price..' gp\'s in order to buy the Skill Book!', cid)
elseif getPlayerLevel(cid) < config.minlevel then
selfSay('The minimum level for buying this skill book is '..config.minlevel..'!', cid)
else
doPlayerRemoveMoney(cid,config.price)
doPlayerAddItem(cid, config.itemid, 1, TRUE)
end
talkState[talkUser] = 0
elseif(msgcontains(msg, 'no')) and isInArray({1}, talkState[talkUser]) == TRUE then
talkState[talkUser] = 0
selfSay('Ok.', cid)
elseif msgcontains(msg, 'dodge level') then
selfSay('You have Leveled your Dodge Skill to ['..getDodgeSkill(cid)..'/100].', cid)
elseif msgcontains(msg, 'critical level') then
selfSay('You have Leveled your Critical Skill to ['..getCriticalSkill(cid)..'/100].', cid)
end


return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())