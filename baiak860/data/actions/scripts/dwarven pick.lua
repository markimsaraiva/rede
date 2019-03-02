local function getItemCharges(uid)
    return getItemAttribute(uid, "crg") or 0
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if isInArray({386, 387, 390, 391}, itemEx.itemid) then
        if getItemCharges(item.uid) == 29 then
            doRemoveItem(item.uid)
            doSendMagicEffect(fromPosition, 3)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sua pick atingiu o limite de 30 cargas e quebrou!")
        else
            doItemSetAttribute(item.uid, "crg", getItemCharges(item.uid) + 1)
            doItemSetAttribute(item.uid, "description", "Cargas: "..30 - getItemCharges(item.uid))
        end
        
        doRemoveItem(itemEx.uid)
        doSendMagicEffect(toPosition, 9) 
        doSendAnimatedText(toPosition, "25", 19)
        local a = 24
        local b = 1000
        repeat
            addEvent(doSendAnimatedText, b, toPosition, a, 19)
            a = a - 1
            b = b + 1000
        until a == 0
        addEvent(doCreateItem, 25000, itemEx.itemid, 1, toPosition)
        addEvent(doSendMagicEffect, 25000, toPosition, 34)
    end
    return true
end
