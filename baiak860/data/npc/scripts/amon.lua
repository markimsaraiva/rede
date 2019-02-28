local focus = 0 
local talk_start = 0 
local target = 0 
local following = false 
local attacking = false 
local talkState = {} 
local npc_pos = {x = 160, y = 36, z = 7}
local monster_name = "Amon"

local function takeItBack(por)
	for i = 1,255 do
		por.stackpos = i
		if getTileItemById(por, 1285) and getTileItemById(por, 1285).uid > 0 then
			doRemoveItem(getTileItemById(por, 1285).uid)
			check = true
			break
		end
	end
	if check then
			
		doCreateNpc("Amon", npc_pos)
		setGlobalStorageValue(129123, -1)
	end
end

 
function onThingMove(creature, thing, oldpos, oldstackpos) 
end 
 
function onCreatureAppear(creature) 
end 
 
function onCreatureDisappear(cid, pos) 
if focus == cid then 
selfSay("Tchau Noob") 
focus = 0 
talk_start = 0 
end 
end 
 
function onCreatureTurn(creature) 
end 
 
function msgcontains(txt, str) 
return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)')) 
end 
 
function onCreatureSay(cid, type, msg) 
local msg = string.lower(msg) 
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid 

 
if (msgcontains(msg, 'hi') and (focus == 0) and (focus ~= cid) and (getDistanceToCreature(cid) <= 4)) then 

focus = cid 
talkState[talkUser] = 1 
selfSay("O que foi? Está aqui para uma {batalha}?", cid)
elseif (msgcontains(msg, "no") or msgcontains(msg, "bye") or msgcontains(msg, "nao")) and focus == cid and talkState[talkUser] ~= 3 then 
 selfSay('Ok... Volte aqui se mudar de ideia.', cid) 
focus = 0 
elseif (msgcontains(msg, "yes") or msgcontains(msg, "battle") or msgcontains(msg, "sim") or msgcontains(msg, "batalha")) and focus == cid and talkState[talkUser] == 1 then 
	if getPlayerStorageValue(cid, 129121) == 1 then
        if getPlayerStorageValue(cid, 129129111) <= os.time() then
            if getGlobalStorageValue(129123) == -1 then
                if getPlayerStorageValue(cid, 129125) < 1 then
                    doPlayerSetStorageValue(cid, 129129, os.time() + 120)
                    doPlayerSetStorageValue(cid, 129124, os.time() + 120)
                    setGlobalStorageValue(129123, 1)
                    selfSay('Vamos lá!')
                    doCreateItem(1285, npc_pos)
                    local monster = doCreateMonster(monster_name, npc_pos)
					doMonsterSetTarget(monster,cid)
                    addEvent(function()
                        if isMonster(monster) then
                            doRemoveCreature(monster)
                        end
                    end, 120000)
                    addEvent(takeItBack, 120000, npc_pos)
					focus = 0
					doRemoveCreature(getNpcCid())
					return true
                else
                    selfSay('Você já me derrotou! E eu não estou afim de uma revanche...', cid)
                end
            else
                selfSay('Eu já estou numa batalha, espere!', cid)
            end
        else
            selfSay('Você só pode batalhar cmg a cada 5 horas!', cid)
        end
    else
        selfSay('Você ainda não pode batalhar comigo!', cid)
    end
		

 
    local function focusCheck(cid) 
    if not isCreature(cid) then 
    focus = 0 
    return true 
    end 
    addEvent(focusCheck, 500, cid) 
    end 
 
addEvent(focusCheck, 1000, cid) 
end 
end 
  
function onThink() 



if focus ~= 0 then 
a, b, c = selfGetPosition() 
if c ~= getThingPos(focus).z then 
focus = 0 
end 
end 
 
if focus ~= 0 then 
if getDistanceToCreature(focus) > 6 then 
focus = 0 
end 
end 
 
return true 
end
