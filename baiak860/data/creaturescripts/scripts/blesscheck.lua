local freeBlessMaxLevel = 150
 
function onLogin(cid)
	if(getPlayerLevel(cid) <= freeBlessMaxLevel and not getPlayerBlessing(cid,1)) then
		for b=1, 5 do
			doPlayerAddBlessing(cid, b)
		end
		doCreatureSay(cid, 'Voce tem bless gratuita, porque seu level é menor que 150', TALKTYPE_ORANGE_1)
		doSendMagicEffect(getThingPosition(cid), CONST_ME_HOLYDAMAGE)
		elseif(getPlayerBlessing(cid,1)) then
	doCreatureSay(cid, 'Você já tem bless!', TALKTYPE_ORANGE_1)
	else
	doCreatureSay(cid, 'Você não tem bless. Digite !bless cuidado pode dar exausted', TALKTYPE_ORANGE_1)
	end
	return true
end