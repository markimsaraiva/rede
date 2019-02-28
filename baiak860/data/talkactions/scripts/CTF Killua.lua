local function removeTp()
	local pos = CTF.tp_pos
	for i = 1, 255 do
		pos.stackpos = i
		if getThingFromPos(pos) and getThingFromPos(pos).uid > 0 and getThingFromPos(pos).itemid == 1387 then
			doRemoveItem(getThingFromPos(pos).uid, 1)
			break
		end
	end
end

function onSay(cid, words, param)

	setGlobalStorageValue(822066, 0)
	doBroadcastMessage("{Capture The Flag} A entrada para o evento foi liberada! Precisamos de pelo menos 10 jogadores para iniciar o evento. O evento começa daqui 5 minutos!")
	
	local tp = doCreateItem(1387, 1, CTF.tp_pos)
	doItemSetAttribute(tp, 'aid', 9789)
	addEvent(removeTp, 60 * 5 * 1000)
	addEvent(CTF.start, 60 * 5 * 1000)
	addEvent(CTF.stop, 60 * 60 * 1000)
	
	return true
end