local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
 
 
-- OTServ event handling functions start
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                         npcHandler:onThink() end
-- OTServ event handling functions end
 
 
-- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
local travelNode = keywordHandler:addKeyword({'Quest Promotion'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Eu posso te levar para a Quest Promotion. Diga Quest Promotion. Eu cobrarei 30kk para a sua morte chegar!'})
    travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=1553, y=1825, z=4} })
    travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Ok Obrigado Boa Escolha HAHA.'})
keywordHandler:addKeyword({'Quest Promotion'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você quer ir para a Quest Promotion? Eu irei cobrar 30kk'})
 
-- Makes sure the npc reacts when you say hi, bye etc.
npcHandler:addModule(FocusModule:new())

