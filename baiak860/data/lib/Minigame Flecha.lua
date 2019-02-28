MiniGame = {}

MiniGame.Status = {0, 0, 0, 0, 0, 0}

function MiniGame.getHighestScore()
	return getGlobalStorageValue(823300) > 0 and getGlobalStorageValue(823300) or 0
end

function MiniGame.getPlayerHighscore(cid)
	return getPlayerStorageValue(cid,823300)
end

function MiniGame.setHighestScore(cid,score)
	setGlobalStorageValue(823300,score)
	setGlobalStorageValue(823301,getCreatureName(cid))
end

function MiniGame.getBestPlayer()
	return getGlobalStorageValue(823301)
end

function MiniGame.setPlayerHighscore(cid,score)
	setPlayerStorageValue(cid, 823300, score)
end

function MiniGame:new(infos)
	if type(infos) ~= "table" then return end
	local obj = {}
	obj.cid = infos.cid or false
	obj.playerPos = infos.playerPos or false
	obj.birdPos = infos.birdPos or false
	obj.balistaPos = {}
	obj.fromPos, obj.toPos = infos.fromPos or false, infos.toPos or false
	obj.points = 0
	obj.start = 1
	obj.finished = false
	for k, v in pairs(obj) do
		if v == false and k ~= "finished" then
			if obj.cid then doPlayerSendTextMessage(obj.cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Não foi possível iniciar o minigame. Reporte para alguém da Staff.") end
			error("Argumentos passados de forma incorreta na function new", 2); return
		end
	end
	return setmetatable(obj, { __index = self})
end

function MiniGame:createBalista()
	if self.finished then return end
	local ppos = getThingPos(self.cid)
	local balistaPos = {x = ppos.x - 1, y = ppos.y, z = ppos.z}
	if self.start == 1 then
		self.start = 0
		doCreateItem(5698, 1, balistaPos)
		balistaPos.x = balistaPos.x - 1
		doCreateItem(5700, 1, balistaPos)
		balistaPos.y = balistaPos.y - 1
		doCreateItem(5699, 1, balistaPos)
		balistaPos.y = balistaPos.y + 1
		self.balistaPos = balistaPos
	else
		if ppos.y ~= self.balistaPos.y then
			self:deleteBalista()
			doCreateItem(5698, 1, balistaPos)
			balistaPos.x =balistaPos.x - 1
			doCreateItem(5700, 1, balistaPos)
			balistaPos.y = balistaPos.y - 1
			doCreateItem(5699, 1, balistaPos)
			balistaPos.y = balistaPos.y + 1
			self.balistaPos = balistaPos
		end
	end
	addEvent(self.createBalista, 450, self)
end

function MiniGame:createBird()
	local pos = {x = self.birdPos.x, y = self.birdPos.y + math.random(-3, 4), z = self.birdPos.z}
	return doCreateMonster("Seagull", pos)
end
	
function MiniGame:deleteBalista()
	local area
	for x = self.fromPos.x, self.toPos.x do
		for y = self.fromPos.y, self.toPos.y do
			area = {x = x, y = y, z = self.fromPos.z, stackpos = 0}
			for i = 1, 255 do
				area.stackpos = i
				local item = getThingFromPos(area)
				if item.uid > 0 then
					if item.itemid == 5698 or item.itemid == 5699 or item.itemid == 5700 then
						doRemoveItem(item.uid)
					end
				end
			end
		end
	end
end

function MiniGame:deleteBird()
	local area
	for x = self.fromPos.x, self.toPos.x do
		for y = self.fromPos.y, self.toPos.y do
			area = {x = x, y = y, z = self.fromPos.z}
			if getTopCreature(area).uid > 0 and isMonster(getTopCreature(area).uid) then
				doSendMagicEffect(area, CONST_ME_POFF)
				doRemoveCreature(getTopCreature(area).uid)
			end
		end
	end
end

function MiniGame:addPoint()
	self.points = self.points + 1
end

function MiniGame:getPoints()
	return self.points
end

function MiniGame:Shoot(pos)
	if getTopCreature(pos).uid > 0 then
		self:addPoint()
		self:deleteBird()
		self:createBird()
		doSendAnimatedText(pos, self:getPoints(), 200)
	end
end

function MiniGame:sendShoot()
	if self.finished then return end
	local frompos = self.balistaPos
	local topos = {x = frompos.x - 3, y = frompos.y, z = frompos.z}
	doSendDistanceShoot(frompos,topos,1)
	addEvent(self.Shoot, 400, self, topos)
	addEvent(self.sendShoot, 850, self)
end

function MiniGame:Start(game)
	if MiniGame.Status[game] == 0 then
		doPlayerSetStorageValue(self.cid, 1236664, 1)
		doTeleportThing(self.cid, self.playerPos)
		doPlayerSendTextMessage(self.cid, 22, "Acerte o pássaro o máximo de vezes que conseguir!")
		MiniGame.Status[game] = 1
		self:createBalista()
		self:createBird()
		self:sendShoot()
		self:End(80000,game)
	else
		self:Destroy();
		return doPlayerSendCancel(self.cid, "Já tem alguém jogando, aguarde.")
	end
end

function MiniGame:Destroy()
	self = nil
end

function MiniGame:End(cooldown,game)
	addEvent(function()
		local recorde = false
		doPlayerSetStorageValue(self.cid, 1236664, -1)
		self.finished = true
		MiniGame.Status[game] = 0
		self:deleteBalista()
		self:deleteBird()
		local exp, gold = math.ceil(((getPlayerLevel(self.cid) / 100) + 1.5)) * self:getPoints() * 4000, self:getPoints() * 3000
		doPlayerAddExperience(self.cid, exp)
		doPlayerAddMoney(self.cid, gold)
		doPlayerSendTextMessage(self.cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você acertou o pássaro "..self:getPoints().." vezes. Você recebeu "..exp.." exp e ".. gold / 1000 .."k de gold.")
		doTeleportThing(self.cid, getTownTemplePosition(getPlayerTown(self.cid)))
		if self:getPoints() > MiniGame.getPlayerHighscore(self.cid) then
			MiniGame.setPlayerHighscore(self.cid, self:getPoints())
			recorde = true
		end
		if MiniGame.getPlayerHighscore(self.cid) > MiniGame.getHighestScore() then
			MiniGame.setHighestScore(self.cid,MiniGame.getPlayerHighscore(self.cid))
		end
		local rk = recorde and "Novo recorde!! "..MiniGame.getPlayerHighscore(self.cid).." pontos! Parabéns!" or "Seu recorde foi "..MiniGame.getPlayerHighscore(self.cid).." pontos."
		doPlayerPopupFYI(self.cid, "Sua pontuação foi "..self:getPoints().." pontos.\n\n"..rk.."\n\n O recorde do servidor é "..MiniGame.getHighestScore().." pontos, feito por: "..MiniGame.getBestPlayer()..".\n\nVocê acertou o pássaro "..self:getPoints().." vezes. Você recebeu "..exp.." exp e ".. gold / 1000 .."k de gold.")
		self:Destroy()
	end, cooldown)
end
	