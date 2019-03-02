-- Sistema de auto loot por Paulo Victor xZonaah  TK --
local tabela = {}
local function getPlayerList(cid)
    local tab = {}
    if getPlayerStorageValue(cid, 0442002) ~= -1 then
        table.insert(tab, getPlayerStorageValue(cid, 0442002))
    end
    if getPlayerStorageValue(cid, 0442003) ~= -1 then
        table.insert(tab, getPlayerStorageValue(cid, 0442003))
    end
    if getPlayerStorageValue(cid, 0442004) ~= -1 then
        table.insert(tab, getPlayerStorageValue(cid, 0442004))
    end
    if getPlayerStorageValue(cid, 0442005) ~= -1 then
        table.insert(tab, getPlayerStorageValue(cid, 0442005))
    end
    if #tab > 0 then
        return tab
    end
    return false
end
local function autoLoot(cid, pos)
    local check = false
    local str = ""
    local position = {}
    for i = 1, 255 do
        pos.stackpos = i
        if getThingFromPos(pos).uid and getThingFromPos(pos).uid > 0 and isContainer(getThingFromPos(pos).uid) then
            position = pos
            check = true
            break
        end
    end
    if check then
        local corpse = getContainerItemsInfo(getThingFromPos(position).uid)        
        if corpse then
            for index, info in pairs(corpse) do
                if index < countTable(corpse) then
                        if tonumber(info.uid) and tonumber(info.itemid) then
                        if isContainer(info.uid) then
                            local bag = getContainerItemsInfo(info.uid)
                            for i = 1, countTable(bag) - 1 do
                                if isInArray(getPlayerList(cid), bag.itemid) then
                                    if bag.quant > 1 then
                                        doRemoveItem(bag.uid, bag.quant)
                                        doPlayerAddItem(cid, bag.itemid, bag.quant)
                                        str = str.." "..bag.quant.." "..getItemNameById(bag.itemid)..","
                                    else
                                        doRemoveItem(bag.uid)
                                        doPlayerAddItem(cid, bag.itemid, 1)
                                        str = str.." 1 "..getItemNameById(bag.itemid)..","
                                    end
                                end
                            end
                        end
                    end
                end
                if isInArray(getPlayerList(cid), info.itemid) then
                    if info.quant > 1 then
                        doRemoveItem(info.uid, info.quant)
                        doPlayerAddItem(cid, info.itemid, info.quant)
                        str = str.." "..info.quant.." "..getItemNameById(info.itemid)..","
                    else
                        doRemoveItem(info.uid)
                        doPlayerAddItem(cid, info.itemid, 1)
                        str = str.." 1 "..getItemNameById(info.itemid)..","
                    end
                end
            end
        end
    end
    tabela[getCreatureName(cid)] = {item = "[Zona Loot] Coletados: "..str, gold = 0}
end
local function autoGold(cid, pos)
    local check = false
    local total = 0
    local position = {}
    for i = 1, 255 do
        pos.stackpos = i
        if getThingFromPos(pos).uid and getThingFromPos(pos).uid > 0 and isContainer(getThingFromPos(pos).uid) then
            position = pos
            check = true
            break
        end
    end
    if check then
        local corpse = getContainerItemsInfo(getThingFromPos(position).uid)
        if corpse then
            for index, info in pairs(corpse) do
                if info.uid and info.itemid then
                    if index < countTable(corpse) then
                        if isContainer(info.uid) then
                            local bag = getContainerItemsInfo(info.uid)
                            for i = 1, countTable(bag) - 1 do
                                if isInArray({2148, 2152, 2160}, bag.itemid) then
                                    local multiplie = 1
                                    if bag.itemid == 2148 then
                                        multiplie = 1
                                    elseif bag.itemid == 2152 then
                                        multiplie = 100
                                    elseif bag.itemid == 2160 then
                                        multiplie = 10000
                                    end
                                    doRemoveItem(bag.uid, bag.quant)
                                    doPlayerSetBalance(cid, getPlayerBalance(cid) + (tonumber(bag.quant) and tonumber(bag.quant) * multiplie or 0))
                                    total = total + (tonumber(bag.quant) and tonumber(bag.quant) * multiplie or 0)
                                    doPlayerSetStorageValue(cid, 0442102, getPlayerStorageZero(cid, 0442102) + (tonumber(bag.quant) and tonumber(bag.quant) * multiplie or 0))
                                end
                            end
                        end
                    end
                    if isInArray({2148, 2152, 2160}, info.itemid) then
                        local multiplie = 1
                        if info.itemid == 2148 then
                            multiplie = 1
                        elseif info.itemid == 2152 then
                            multiplie = 100
                        elseif info.itemid == 2160 then
                            multiplie = 10000
                        end
    doRemoveItem(info.uid, info.quant)
                        doPlayerSetBalance(cid, getPlayerBalance(cid) + (tonumber(info.quant) and tonumber(info.quant) * tonumber(multiplie) or 0))
                        doPlayerSetStorageValue(cid, 0442102, getPlayerStorageZero(cid, 0442102) + (tonumber(info.quant) and tonumber(info.quant) * tonumber(multiplie) or 0))
                        total = total + (tonumber(info.quant) and tonumber(info.quant) * multiplie or 0)
                    end
                end
            end
        end
    end
    if tabela[getCreatureName(cid)] and tabela[getCreatureName(cid)].gold then
        tabela[getCreatureName(cid)].gold = total
    end
end
local function sendMsg(cid)
    if tabela[getCreatureName(cid)] and tabela[getCreatureName(cid)].gold then
        if tabela[getCreatureName(cid)].gold == 0 then
            doPlayerSendTextMessage(cid, 23, tabela[getCreatureName(cid)].item)
        else
            doPlayerSendTextMessage(cid, 23, tabela[getCreatureName(cid)].item.." "..tabela[getCreatureName(cid)].gold.." gold coins.")
        end
        tabela[getCreatureName(cid)] = nil
    end
end
function onKill(cid, target, lastHit)
    if isPlayer(cid) and isMonster(target) then
        if getPlayerStorageValue(cid, 0442100) == 1 and getPlayerList(cid) then
            local pos = getCreaturePosition(target)
            addEvent(autoLoot, 500, cid, pos)
        end
        if getPlayerStorageValue(cid, 0442101) == 1 then
            local pos = getCreaturePosition(target)
            addEvent(autoGold, 500, cid, pos)
        end
        if getPlayerStorageValue(cid, 0442100) == 1 or getPlayerStorageValue(cid, 0442101) == 1 then
            addEvent(sendMsg, 540, cid)
        end
    end
    return true
end