local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)             end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()                             npcHandler:onThink()                         end

npcHandler:setMessage(MESSAGE_GREET, "Ola |PLAYERNAME|. Eu vendo addons por itens, algumas precisa de {addon doll}, para ver mais diga {todas addons} ou {como fazer} leia para entender!")

function playerBuyAddonNPC(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    if (parameters.confirm ~= true) and (parameters.decline ~= true) then
        if(getPlayerPremiumDays(cid) == 1) and (parameters.premium == true) then
            npcHandler:say('Desculpe, somente para players com premium account! (!buypremium)', cid)
            npcHandler:resetNpc()
            return true
        end
        if (getPlayerStorageValue(cid, parameters.storageID) ~= -1) then
            npcHandler:say('Voce ja possui este addon!', cid)
            npcHandler:resetNpc()
            return true
        end
        local itemsTable = parameters.items
        local items_list = ''
        if table.maxn(itemsTable) > 0 then
            for i = 1, table.maxn(itemsTable) do
                local item = itemsTable[i]
                items_list = items_list .. item[2] .. ' ' .. getItemNameById(item[1])
                if i ~= table.maxn(itemsTable) then
                    items_list = items_list .. ', '
                end
            end
        end
        local text = ''
        if (parameters.cost > 0) and table.maxn(parameters.items) then
            text = items_list .. ' and ' .. parameters.cost .. ' gp'
        elseif (parameters.cost > 0) then
            text = parameters.cost .. ' gp'
        elseif table.maxn(parameters.items) then
            text = items_list
        end
        npcHandler:say('Did you bring me ' .. text .. ' for ' .. keywords[1] .. '?', cid)
        return true
    elseif (parameters.confirm == true) then
        local addonNode = node:getParent()
        local addoninfo = addonNode:getParameters()
        local items_number = 0
        if table.maxn(addoninfo.items) > 0 then
            for i = 1, table.maxn(addoninfo.items) do
                local item = addoninfo.items[i]
                if (getPlayerItemCount(cid,item[1]) >= item[2]) then
                    items_number = items_number + 1
                end
            end
        end
        if(getPlayerMoney(cid) >= addoninfo.cost) and (items_number == table.maxn(addoninfo.items)) then
            doPlayerRemoveMoney(cid, addoninfo.cost)
            if table.maxn(addoninfo.items) > 0 then
                for i = 1, table.maxn(addoninfo.items) do
                    local item = addoninfo.items[i]
                    doPlayerRemoveItem(cid,item[1],item[2])
                end
            end
            doPlayerAddOutfit(cid, addoninfo.outfit_male, addoninfo.addon)
            doPlayerAddOutfit(cid, addoninfo.outfit_female, addoninfo.addon)
            setPlayerStorageValue(cid,addoninfo.storageID,1)
            npcHandler:say('Here you are.', cid)
        else
            npcHandler:say('Esta faltando alguma coisa, confira sua backpack!', cid)
        end
        npcHandler:resetNpc()
        return true
    elseif (parameters.decline == true) then
        npcHandler:say('Nao esta interessado? escolha outra addon!', cid)
        npcHandler:resetNpc()
        return true
    end
    return false
end

local noNode = KeywordNode:new({'no'}, playerBuyAddonNPC, {decline = true})
local yesNode = KeywordNode:new({'yes'}, playerBuyAddonNPC, {confirm = true})

-- citizen (done)
local outfit_node = keywordHandler:addKeyword({'first citizen addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5878,100}}, outfit_female = 136, outfit_male = 128, addon = 1, storageID = 10001})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second citizen addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5890,100}, {5902,100}, {2160,10}}, outfit_female = 136, outfit_male = 128, addon = 2, storageID = 10002})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- hunter (done)
local outfit_node = keywordHandler:addKeyword({'first hunter addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5880,100}, {5883,20}, {5890,300}, {5905,10}, {5894,20}, {2160,50}}, outfit_female = 137, outfit_male = 129, addon = 1, storageID = 10003})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second hunter addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2160,200}}, outfit_female = 137, outfit_male = 129, addon = 2, storageID = 10004})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- knight (done)
local outfit_node = keywordHandler:addKeyword({'first knight addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5880,100}, {2193,10}}, outfit_female = 139, outfit_male = 131, addon = 1, storageID = 10005})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second knight addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5893,30}, {2160,200}, {5905,20}}, outfit_female = 139, outfit_male = 131, addon = 2, storageID = 10006})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- mage (done)
local outfit_node = keywordHandler:addKeyword({'first magersrsrs addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2392,30}, {5903,1}, {2193,50}}, outfit_female = 138, outfit_male = 130, addon = 1, storageID = 10007}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode) 
local outfit_node = keywordHandler:addKeyword({'second magersrsrs addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5903,1}}, outfit_female = 138, outfit_male = 130, addon = 2, storageID = 10008}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode) 


-- summoner (done)
local outfit_node = keywordHandler:addKeyword({'first summoner addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5878,300}}, outfit_female = 141, outfit_male = 133, addon = 1, storageID = 10009}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode) 
local outfit_node = keywordHandler:addKeyword({'second summoner addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5894,150}, {5911,100}, {5883,100}, {5922,80}, {5879,150}, {2160,130}, {5905,100}}, outfit_female = 141, outfit_male = 133, addon = 2, storageID = 10010}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode) 


-- barbarian (done)
local outfit_node = keywordHandler:addKeyword({'first barbarian addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5893,150}, {5879,150}, {5910,100}, {5911,80}, {2160,100}}, outfit_female = 147, outfit_male = 143, addon = 1, storageID = 10011})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second barbarian addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5880,200}, {5883,100}, {5893,150}}, outfit_female = 147, outfit_male = 143, addon = 2, storageID = 10012})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- druid (done)
local outfit_node = keywordHandler:addKeyword({'first druidrsrsrs addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5896,100}, {5897,100}}, outfit_female = 148, outfit_male = 144, addon = 1, storageID = 10013})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second druidrsrsrs addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5903,1}, {5906,200}, {5880,100}, {2160,400}}, outfit_female = 148, outfit_male = 144, addon = 2, storageID = 10014})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- nobleman (done)
local outfit_node = keywordHandler:addKeyword({'first nobleman addon'}, playerBuyAddonNPC, {premium = true, cost = 1500000, items = {}, outfit_female = 140, outfit_male = 132, addon = 1, storageID = 10015})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second nobleman addon'}, playerBuyAddonNPC, {premium = false, cost = 1500000, items = {}, outfit_female = 140, outfit_male = 132, addon = 2, storageID = 10016})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- oriental (done)
local outfit_node = keywordHandler:addKeyword({'first oriental addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2160,300}}, outfit_female = 150, outfit_male = 146, addon = 1, storageID = 10017})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second oriental addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5883,50}, {5911,100}, {5880,100}}, outfit_female = 150, outfit_male = 146, addon = 2, storageID = 10018})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- warrior (done)
local outfit_node = keywordHandler:addKeyword({'first warriorrsrsrs addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5925,200}, {5899,300}, {5883,150}, {5919,1}}, outfit_female = 142, outfit_male = 134, addon = 1, storageID = 10019})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second warriorrsrsrs addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5880,250}, {2160,400}}, outfit_female = 142, outfit_male = 134, addon = 2, storageID = 10020})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- wizard (done)
local outfit_node = keywordHandler:addKeyword({'first wizard addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2536,1}, {2492,10}, {5899,100}, {2160,100}}, outfit_female = 149, outfit_male = 145, addon = 1, storageID = 10021})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second wizard addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5922,50}}, outfit_female = 149, outfit_male = 145, addon = 2, storageID = 10022})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- assassin (done)
local outfit_node = keywordHandler:addKeyword({'first assassinrsrsrs addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5912,250}, {5910,250}, {5911,250}, {5913,250}, {5914,250}, {5909,250}, {5879,500}}, outfit_female = 156, outfit_male = 152, addon = 1, storageID = 10023})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second assassinrsrsrs addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2160,2000}, {5893,100}}, outfit_female = 156, outfit_male = 152, addon = 2, storageID = 10024})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- beggar (done)
local outfit_node = keywordHandler:addKeyword({'first beggar addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5878,100}, {5909,50}, {5913,50}, {5894,50}}, outfit_female = 157, outfit_male = 153, addon = 1, storageID = 10025})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second beggar addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5883,50}, {2160,150}, {5910,50}}, outfit_female = 157, outfit_male = 153, addon = 2, storageID = 10026})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- pirate (done)
local outfit_node = keywordHandler:addKeyword({'first piratersrsrs addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2160,3000}}, outfit_female = 155, outfit_male = 151, addon = 1, storageID = 10027})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second piratersrsrs addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5909,300}, {5914,300}, {5913,300}, {5912,1}}, outfit_female = 155, outfit_male = 151, addon = 2, storageID = 10028})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- shaman (done)
local outfit_node = keywordHandler:addKeyword({'first shaman addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5919,1}, {5903,1}, {5905,50}}, outfit_female = 158, outfit_male = 154, addon = 1, storageID = 10029})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second shaman addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5922,100}, {2160,300}}, outfit_female = 158, outfit_male = 154, addon = 2, storageID = 10030})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- norseman (done)
local outfit_node = keywordHandler:addKeyword({'first norseman addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2160,50}}, outfit_female = 252, outfit_male = 251, addon = 1, storageID = 10031})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second norseman addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2160,50}}, outfit_female = 252, outfit_male = 251, addon = 2, storageID = 10032})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- jester (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first jester addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5912,50}, {5913,50}, {5914,50}, {5909,50}}, outfit_female = 270, outfit_male = 273, addon = 1, storageID = 10033})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second jester addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5912,50}, {5910,50}, {5911,50}, {5912,50}}, outfit_female = 270, outfit_male = 273, addon = 2, storageID = 10034})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- demonhunter (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first demonhunter addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5905,30}, {5906,100}, {6500,500}, {2160,200}}, outfit_female = 288, outfit_male = 289, addon = 1, storageID = 10035})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second demonhunter addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5906,50}, {6500,500}}, outfit_female = 288, outfit_male = 289, addon = 2, storageID = 10036})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- nightmare (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first nightmarersrsrs addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{6500,2500}}, outfit_female = 269, outfit_male = 268, addon = 1, storageID = 10037})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second nightmarersrsrs addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{6500,2500}}, outfit_female = 269, outfit_male = 268, addon = 2, storageID = 10038})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- brotherhood (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first brotherhoodrsrsrs addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{6500,2500}}, outfit_female = 279, outfit_male = 278, addon = 1, storageID = 10039})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second brotherhoodrsrsrs addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{6500,2500}}, outfit_female = 279, outfit_male = 278, addon = 2, storageID = 10040})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- yalaharian (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first yalaharian addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2160,100}}, outfit_female = 324, outfit_male = 325, addon = 1, storageID = 10041})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second yalaharian addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2160,100}}, outfit_female = 324, outfit_male = 325, addon = 2, storageID = 10041})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
	
-- warmaster (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first warmaster addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2160,300}}, outfit_female = 336, outfit_male = 335, addon = 1, storageID = 10042})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second warmaster addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2160,300}}, outfit_female = 336, outfit_male = 335, addon = 2, storageID = 10043})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
	
-- wayfarer (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first wayfarerrsrsrs addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2160,300}}, outfit_female = 367, outfit_male = 366, addon = 1, storageID = 10045})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second wayfarerrsrsrs addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2160,300}}, outfit_female = 367, outfit_male = 366, addon = 2, storageID = 10046})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

keywordHandler:addKeyword({'todas addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Eu tenho as addons citizen, hunter, knight, {mage (ADDON DOLL)}, nobleman, summoner, {warrior (ADDON DOLL)}, barbarian, {druid (ADDON DOLL)}, wizard, oriental, {pirate (ADDON DOLL)}, {assassin (ADDON DOLL)}, beggar, shaman, norseman, {nighmare (ADDON DOLL)}, jester, yalaharian, {brotherhood (ADDON DOLL)}, warmaster and {wayfarer (ADDON DOLL)} addons.'})
keywordHandler:addKeyword({'como fazer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Para comprar a primeira addon voce diz \'first NAME addon\', para comprar a segunda addon voce diz \'second NAME addon\'.'})

npcHandler:addModule(FocusModule:new())