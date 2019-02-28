-- Inquisition chests

function onUse(cid, item, frompos, item2, topos)

       if item.uid == 8560 then
           queststatus = getPlayerStorageValue(cid,8560)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Mega Wand.")
               doPlayerAddItem(cid,8920,1)
               setPlayerStorageValue(cid,8560,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8561 then
           queststatus = getPlayerStorageValue(cid,8560)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Mega Sword.")
               doPlayerAddItem(cid,7391,1)
               setPlayerStorageValue(cid,8560,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8562 then
           queststatus = getPlayerStorageValue(cid,8560)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Mega Axe.")
               doPlayerAddItem(cid,7456,1)
               setPlayerStorageValue(cid,8560,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8563 then
           queststatus = getPlayerStorageValue(cid,8560)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Mega Club")
               doPlayerAddItem(cid,7429,1)
               setPlayerStorageValue(cid,8560,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8564 then
           queststatus = getPlayerStorageValue(cid,8560)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Mega Bow.")
               doPlayerAddItem(cid,8855,1)
               setPlayerStorageValue(cid,8560,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8565 then
           queststatus = getPlayerStorageValue(cid,8560)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a 10k de life.")
               doPlayerAddItem(cid,11205,1)
               setPlayerStorageValue(cid,8560,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8566 then
           queststatus = getPlayerStorageValue(cid,8560)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a 10k de mana.")
               doPlayerAddItem(cid,11213,1)
               setPlayerStorageValue(cid,8560,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8567 then
           queststatus = getPlayerStorageValue(cid,8560)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Warsinger Bow.")
               doPlayerAddItem(cid,8854,1)
               setPlayerStorageValue(cid,8560,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8568 then
           queststatus = getPlayerStorageValue(cid,8560)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Hellforged axe")
               doPlayerAddItem(cid,8924,1)
               setPlayerStorageValue(cid,8560,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end

    else
        return 0
       end

       return 1
end