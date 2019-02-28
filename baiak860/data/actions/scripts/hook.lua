-- OMS #1
-- Player Pull Action
-- Created by Killua, antigo amoeba13

------ Configure aqui -------
local intervalo = 1.5 -- tempo ate o player ser puxado (em segundos)
local exhaust = 1 -- Exhaustion entre usos do item (em segundos)
local chance = 90 -- chance em % de puxar
local itemefeito = 8633 -- item que aparece no cara que foi puxado
local falas = {"Vem aqui!", "Veem!", "Get over here!"}
local monsters = {"Bug", "Wasp", "Centipede"}
local chancebug = 20 -- chance de vir insetos junto com o jogador puxado (em porcentagem)
local chanceband = 80 -- chance de puxar um bandit quanto o puxao falhar (em porcentagem)

------ Nao altera mais nada ------
function mayNotMove(uid, block)
    return doCreatureSetNoMove(uid, block)
end

local function isWalkable(pos)-- by Nord / editado por Omega
    if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then 
    return false
	elseif getTopCreature(pos).uid > 0 then
    		return false
	elseif isCreature(getTopCreature(pos).uid) then
    		return false
    elseif getTileInfo(pos).protection then
    		return false
	elseif getThingFromPos(pos).itemid > 0 then
if hasProperty(getThingFromPos(pos).uid, 3) or hasProperty(getThingFromPos(pos).uid, 7) then
    		return false
end
	end
return true
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local pos1 = getCreaturePosition(cid) 
    local pos2 = getCreaturePosition(itemEx.uid)
    local poss1 = getCreatureLookPosition(cid)
    local fightcondition = createConditionObject(CONDITION_INFIGHT)
    setConditionParam(fightcondition, CONDITION_PARAM_TICKS, intervalo*1000+100)
                
    local function removeritem1(cid, item, pos, itemEx)
        local itemnapos = getTileItemById(pos2, itemefeito)
        doRemoveItem(itemnapos.uid,1)
    end
    
    local function removeritem2(cid, item, pos)
        local itemnaposs = getTileItemById(poss1, itemefeito)
        doRemoveItem(itemnaposs.uid,1)
    end

    local function doEffect(pos)
        doSendMagicEffect(poss1, CONST_ME_TELEPORT)
        doSendMagicEffect(pos2, CONST_ME_TELEPORT)
    end
     
    local tmp = getCreatureStorage(cid, 23125)
    if getCreatureStorage(cid, 23125) > os.time() then
        return doPlayerSendCancel(cid, "Você precisa esperar ".. tmp - os.time() .." segundos para usar novamente.")
    end
    
    if not isPlayer(itemEx.uid) then
        return doPlayerSendCancel(cid, "Voce so pode puxar jogadores!")
    end
        
    if itemEx.uid == cid then
        return doPlayerSendCancel(cid, "Voce nao pode usar em si mesmo.")
    end
    
    if getTilePzInfo(pos1) == true or getTilePzInfo(pos2) == true  or getTilePzInfo(poss1) == true then
        return doPlayerSendCancel(cid, "Voce nao pode puxar na protection zone!")
    end
    
    if not isWalkable(poss1) then
       return doPlayerSendCancel(cid, "Voce nao pode puxar ele aqui!")
    end
    
    if pos1.x ~= pos2.x and pos1.y ~= pos2.y then
        return doPlayerSendCancel(cid, "Voce nao pode puxar na diagonal!")
    end
    
    local function puxarPlayer(cid, pos, item) -- script por amoeba13
        local randomChance = math.random(1, #falas)
        doAddCondition(cid, fightcondition)
        doAddCondition(itemEx.uid, fightcondition)
        doCreatureSay(cid, falas[randomChance], TALKTYPE_ORANGE_1)
        doPlayerSetStorageValue(cid, 23125, os.time()+exhaust)
            addEvent(doTeleportThing, intervalo*1000, itemEx.uid, poss1)
            addEvent(mayNotMove, intervalo*1000, cid, false)
            addEvent(mayNotMove, intervalo*1000, itemEx.uid, false)
            addEvent(removeritem1, intervalo*1000) 
            addEvent(doCreateItem, intervalo*1000, itemefeito, 1, poss1)
            addEvent(removeritem2, intervalo*1000+1500)
            addEvent(doEffect, intervalo*1000)
            addEvent(doEffect, intervalo*1000/2)
            addEvent(doEffect, intervalo*1000/3)
            addEvent(doEffect, intervalo*1000/4)
            addEvent(doSendAnimatedText, intervalo*1000, poss1, "Wooon", 215)
            addEvent(doSendAnimatedText, intervalo*1000, pos2, "Puff", 215)
        doCreateItem(itemefeito, 1, pos2)
        doSendDistanceShoot(pos1, pos2, 4)
        mayNotMove(cid, true)
        mayNotMove(itemEx.uid, true)
        doSendAnimatedText(pos1, "Succes!", TEXTCOLOR_GREEN)
        doPlayerSendTextMessage(itemEx.uid, 27, "Voce foi puxado pelo jogador ".. getCreatureName(cid) .."!")                    
    end -- script por amoeba13
    
	if doRemoveItem(item.uid,1) then
   		 local qnts = math.random(1, 100)
   		 if qnts <= chance and qnts <= chancebug then
   		     puxarPlayer(cid) 
     		   local axb = math.random(1, #monsters)
      		  addEvent(doCreatureSay, intervalo*1000+100, itemEx.uid, "Eu nao vi que isso tinha vindo comigo...", TALKTYPE_ORANGE_1)
     		   addEvent(doCreateMonster, intervalo*1000+100, monsters[axb], poss1)
 		   elseif qnts <= chance and qnts > chancebug then
  		      puxarPlayer(cid)
   		 elseif qnts > chance and qnts <= chanceband then
   		     doCreateMonster("Bandit", poss1)
     		   doCreatureSay(cid, "Nao foi voce que eu puxei!", TALKTYPE_ORANGE_1)
     		   doSendAnimatedText(pos1, "Fail!", TEXTCOLOR_RED)
     		   doSendMagicEffect(pos1, CONST_ME_POFF)
     		   doPlayerSetStorageValue(cid, 23125, os.time()+exhaust)
   		 elseif qnts > chance then 
      		  doSendAnimatedText(pos1, "Fail!", TEXTCOLOR_RED)
      		  doSendMagicEffect(pos1, CONST_ME_POFF)
      		  doPlayerSetStorageValue(cid, 23125, os.time()+exhaust)
      		  end
	end
    return true
end