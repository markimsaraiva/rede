-- ########################################################
-- #####        Name: Private Shop System             #####
-- #####        Version: 2.0                          #####
-- ########################################################
-- #####  Developed by Maxwell Alcantara[MaXwEllDeN]  #####
-- #####  Contact: maxwellmda@gmail.com               #####
-- #####           maxwellden@hotmail.com             #####
-- ########################################################

function fileExist(file)
	return (io.open(file, "r")) and true or false
end

function getUidsInArea(ext1, ext2)
	local uids = {}
	for a = 0, ext2.x-ext1.x do
		for b = 0, ext2.y-ext1.y do
			for c = 1, 255 do
				local pos = {x = ext1.x+a, y = ext1.y+b, z = ext1.z, stackpos = c}

				local cid = getTopCreature(pos).uid
				if (isCreature(cid)) then
					table.insert(uids, cid)
				end
			end
		end
   end

   return uids
end

function printTableM(aff)
	local s = "{"
    for a, b in pairs(aff) do
        local index = "[".. a .. "]"

		if (type(a) == "string") then
           index = '["'.. a ..'"]'
        end

        if (type(b) == "table") then
           value = printTableM(b)
        elseif (type(b) == "string") then
           value = '"'.. b .. '"'
        else
           value = b
        end

        s = s .. index .. " = " .. value .. ", "
    end

    s = "{" .. s:sub(2, #s)
    return (#s < 3) and "{}" or (s:sub(1, #s-2) .. "}")
end

function deleteNPCFile(name)
	return os.remove ("data/npc/ZSHOP - ".. name ..".xml")
end

function createNPCFile(name, looktype)
   if (fileExist("data/npc/ZSHOP - ".. name .. ".xml")) then
      local fili = io.open("data/npc/ZSHOP - ".. name .. ".xml", "w+")
      fili:close()
   end
   local fili = io.open("data/npc/ZSHOP - ".. name .. ".xml", "a+")

   local nam = _PV_SHOP_CONFIG.prefix_shop and "[Shop] " or ""
   local example = [[<?xml version = "1.0" ?>
<npc name = "%s" script = "Private Shop.lua" floorchange = "0" speed= "0" walkable = "true">
       <health now = "150" max = "150"/>
       <look type = "%d" head = "%d" body = "%d" legs = "%d" feet = "%d" addons = "%d" %s/>
</npc>
]]

   local mount = looktype.lookMount and "mount = \"".. looktype.lookMount .. "\"" or ""
   fili:write(example:format(nam .. name, looktype.lookType, looktype.lookHead, looktype.lookBody, looktype.lookLegs, looktype.lookFeet, looktype.lookAddons, mount))
   fili:close()
end

function createNPCShop(name, outfit, playerguid, pos, dir)
   createNPCFile(name, outfit)

	local mons = doCreateNpc("ZSHOP - ".. name, pos)
		doCreatureSetLookDir(mons, dir)

	setPlayerShopLucro(playerguid, "{}")
	setPlayerStorageValue(mons, 277531, "{x = ".. pos.x ..", y = ".. pos.y ..", z = ".. pos.z .."}")
end

function getValueFromString(str)
   return loadstring("return ".. str)()
end

_MAXSHOP_STOSHOP = 52337

function doRemoveItemFromPlayerShop(playerguid, itemid, quant)

   local shop = getPlayerShopItens(playerguid)
   local newshop = {}
   for a, b in pairs(shop) do
      if (a == itemid) then
         if (b[1]-quant > 0) then
            newshop[a] = {b[1]-quant, b[2]}
         end
      else
         newshop[a] = {b[1], b[2]}
      end
   end
   return (setPlayerShopItens(playerguid, printTableM(newshop))) and true or false
end

function doAddItemForPlayerShop(playerguid, itemid, quant, money)

   local shop = getPlayerShopItens(playerguid)
   local newshop = {}
   dd = 0
   for a, b in pairs(shop) do
      dd = 1
      if (a == itemid) then
         newshop[a] = {b[1]+quant, money}
      else
         newshop[a] = {b[1], b[2]}
      end
   end
   if not(newshop[itemid]) then
      newshop[itemid] = {quant, money}
   elseif (dd == 0) then
      newshop[itemid] = {quant, money}
   end
   
   return (setPlayerShopItens(playerguid, printTableM(newshop))) and true or false
end

function installSHOPSystem()
   if not(INSTALLED) then

      if not (db.getResult("ALTER TABLE `players` ADD COLUMN `shopitens` VARCHAR( 255 )  NOT NULL DEFAULT '''{}''';")) then
	 error("###@!#!@$#!#@ FALHA CRÍTICA AO INSTALAR O PRIVATE SHOP SYSTEM!\n     Não foi possível criar a coluna: players.shopitens")
      end
      print("              Instalação Shop System: Coluna players.shopitens criada com sucesso")      
      
      if not(db.getResult("ALTER TABLE `players` ADD COLUMN `shoplucro` VARCHAR( 255 )  NOT NULL DEFAULT '''{}''';")) then
	 error("###@!#!@$#!#@ FALHA CRÍTICA AO INSTALAR O PRIVATE SHOP SYSTEM!\n     Não foi possível criar a coluna: players.shoplucro")
      end
         print("              Instalação Shop System: Coluna players.shoplucro criada com sucesso.")      
   end
end

function getPlayerShopItens(playerguid)
    local get = db.getResult("SELECT `shopitens` FROM `players` WHERE `id` = '".. playerguid.."';")
    local resultado = get:getDataString('shopitens')
   return (resultado) and loadstring("return " .. (resultado:sub(2, #resultado-1)))() or nil
end

function getPlayerShopLucro(playerguid)
    local get = db.getResult("SELECT `shoplucro` FROM `players` WHERE `id` = '".. playerguid.."';")
    local resultado = get:getDataString('shoplucro')
   return (resultado) and loadstring("return " .. (resultado:sub(2, #resultado-1)))() or nil
end

function getPrefix(val)
   if (type("val") ~= number) then
	return ""
   end
   return (val > 1) and "s" or ""
end

function valid(f, val)
	return function(...)
		if val then
			return f(...)
		end
	end
end

function doShopAddLucro(playerguid, itemid, money)
   local shop = getPlayerShopLucro(playerguid)
   local newshop = {}
   c = 0
   for a, b in pairs(shop) do
      c = 1
      if (a == itemid) then
         newshop[a] = {b[1]+1, b[2]+money}
      else
         newshop[a] = {b[1], b[2]}
      end
   end
   if not(newshop[itemid]) then
      newshop[itemid] = {1, money}
   elseif (c == 0) then
      newshop[itemid] = {1, money}
   end
   return (setPlayerShopLucro(playerguid, printTableM(newshop))) and true or false
end

function setPlayerShopItens(playerguid, shop)
   return (db.executeQuery("UPDATE `players` SET `shopitens` = '''".. shop .."''' WHERE `id` = '".. playerguid .."';")) and true or false
end

function setPlayerShopLucro(playerguid, shop)
   return (db.executeQuery("UPDATE `players` SET `shoplucro` = '''".. shop .."''' WHERE `id` = '".. playerguid .."';")) and true or false
end

local file = io.open("PrivateShopInstall.lua", "r")
	local t = loadstring("return ".. file:read("*all"))() file:close()

if not(t) then
	installSHOPSystem()
	local file = io.open("PrivateShopInstall.lua", "w+") file:write("true") file:close()
end
