function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 4610 then
   		queststatus = getPlayerStorageValue(cid,4619)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Você ganhou uma Donate Staff.")
   			doPlayerAddItem(cid,12629,1)
   			setPlayerStorageValue(cid,4619,1)
   		else
   			doPlayerSendTextMessage(cid,22,"Você ja fez essa quest.")
   		end
   	elseif item.uid == 4611 then
   		queststatus = getPlayerStorageValue(cid,4619)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Você ganhou um Donate Sword.")
   			doPlayerAddItem(cid,12622,1)
   			setPlayerStorageValue(cid,4619,1)
   		else
   			doPlayerSendTextMessage(cid,22,"Você ja fez essa quest.")
   		end
   	elseif item.uid == 4612 then
   		queststatus = getPlayerStorageValue(cid,4619)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Você ganhou um Donate SlingShot.")
   			doPlayerAddItem(cid,12621,1)
   			setPlayerStorageValue(cid,4619,1)
   		else
   			doPlayerSendTextMessage(cid,22,"Você ja fez essa quest.")
   		end
   	elseif item.uid == 4613 then
   		queststatus = getPlayerStorageValue(cid,4619)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Você ganhou um Donate Axe.")
   			doPlayerAddItem(cid,12624,1)
   			setPlayerStorageValue(cid,4619,1)
   		else
   			doPlayerSendTextMessage(cid,22,"Você ja fez essa quest.")
   		end
   	elseif item.uid == 4614 then
   		queststatus = getPlayerStorageValue(cid,4619)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Você ganhou um Donate Club.")
   			doPlayerAddItem(cid,12623,1)
   			setPlayerStorageValue(cid,4619,1)
   		else
   			doPlayerSendTextMessage(cid,22,"Você ja fez essa quest.")
   		end
   	elseif item.uid == 4615 then
   		queststatus = getPlayerStorageValue(cid,4619)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Você ganhou uma Donate Shoes.")
   			doPlayerAddItem(cid,12633,1)
   			setPlayerStorageValue(cid,4619,1)
   		else
   			doPlayerSendTextMessage(cid,22,"Você ja fez essa quest.")
   		end
   	elseif item.uid == 4616 then
   		queststatus = getPlayerStorageValue(cid,4619)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Você ganhou uma Donate Boots.")
   			doPlayerAddItem(cid,12628,1)
   			setPlayerStorageValue(cid,4619,1)
   		else
   			doPlayerSendTextMessage(cid,22,"Você ja fez essa quest.")
   		end
   	elseif item.uid == 4617 then
   		queststatus = getPlayerStorageValue(cid,4619)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Você ganhou um Donate Shield.")
   			doPlayerAddItem(cid,12634,1)
   			setPlayerStorageValue(cid,4619,1)
   		else
   			doPlayerSendTextMessage(cid,22,"Você ja fez essa quest.")
   		end
   	elseif item.uid == 4618 then
   		queststatus = getPlayerStorageValue(cid,4619)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Você ganhou um Donate Book.")
   			doPlayerAddItem(cid,12635,1)
   			setPlayerStorageValue(cid,4619,1)
   		else
   			doPlayerSendTextMessage(cid,22,"Você ja fez essa quest.")
   		end
	else
		return 0
   	end

   	return 1
end