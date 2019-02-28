--function onStartup()
-- USAR FROM 62 OU 70 ELE VAI PEGAR APARTIR DO 62 ou 70 CARACTERS
local  function Antidupe() 
	local tablesToCheck = {"player_items", "player_depotitems", "tile_items"}
	local itemsToCheck = {12623, 12624, 12621, 12634, 12628, 12627, 12626, 12625, 12630, 12631, 12632, 12633, 12635, 12629, 12622, 5957}
	local text, final = "", ""
	local filex = "data/logs/Duplicated.txt"
	local f = io.open(filex, "a+")
	local count = 0
	local Caracters = 30
	for i = 1, table.maxn(tablesToCheck) do
		for _, item in ipairs(itemsToCheck) do
            if(type(tablesToCheck[i]) == "string") then
				local query = db.getResult("SELECT *, SUBSTRING(CONVERT(attributes USING latin1) FROM "..Caracters..") AS 'track' FROM " .. tablesToCheck[i] .. " WHERE itemtype = "..item.." AND SUBSTRING(CONVERT(attributes USING latin1) FROM "..Caracters..") IN (SELECT SUBSTRING(CONVERT(attributes USING latin1) FROM "..Caracters..") FROM " .. tablesToCheck[i] .. " WHERE CONVERT(attributes USING latin1) LIKE '%serial%' GROUP BY SUBSTRING(CONVERT(attributes USING latin1) FROM "..Caracters..") having count(*) > 1)")
					if(query:getID() < 1) then
						print("[!] [Anti-Dupe] -> No duplicated item was found in the database!")
					end
					if(query:getID() ~= -1) then
						while(true) do
							local delete = db.query("DELETE FROM " .. tablesToCheck[i] .. " WHERE SUBSTRING(CONVERT(attributes USING latin1) FROM "..Caracters..") = " .. db.escapeString(query:getDataString("track")) .. ";")
						    text = "[!] [Anti-Dupe] -> Deleting item with duplicated serial from '" .. tablesToCheck[i] .. "' [Player: " .. getPlayerNameByGUID(query:getDataInt("player_id")) .. ", Item: " .. query:getDataInt("itemtype") .. ", Count: " .. query:getDataInt("count") .. ", Serial: " .. query:getDataString("track") .."]... " .. (delete and "Success!" or "Failed!")
							count = (delete and count + 1 or count)
							final = final .. (final ~= "" and "\n" or "") .. text
							print(text)
							if not query:next() then break end
						end	
					end
				end
			end
		end
		if(f ~= nil) then
			f:write("[" .. os.date("%d %B %Y Hora: %X") .. "] >> [Anti-Dupe] " .. count .. " duplicated items have been deleted from the database.\n" .. (final == "" and "[!] [Anti-Dupe] -> No duplicated item was found in the database" or final) .. "\n\n")
			f:close()
		else
			print("[!] [Anti-Dupe] -> Cannot save info to file!")
		end
	return true
end

function onSay(cid, words, param)
		Antidupe()
	return true
end

