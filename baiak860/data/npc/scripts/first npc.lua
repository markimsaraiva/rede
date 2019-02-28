local keywordHandler = KeywordHandler:new() -- By Byerne XTibia
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

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local startVoc = (getPlayerVocation(cid) - ((getPlayerPromotionLevel(cid))*4))

if msgcontains(msg, 'promotion') then
if getPlayerPromotionLevel(cid) ~= 1 then
selfSay("Não posso te promover.", cid)
else
selfSay("Deseja virar um {VIP "..getVocationInfo(startVoc).name.."} por {40.000 gold coins} ({40k})?", cid)
talkState[talkUser] = 1
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
if doPlayerRemoveMoney(cid, 40000) then
doPlayerSetPromotionLevel(cid, 2)
selfSay("Parabéns, você agora é um "..getVocationInfo(getPlayerVocation(cid)).name..".", cid)
else
selfSay("Você não tem dinheiro suficiente.", cid)
end
talkState[talkUser] = 0
end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())