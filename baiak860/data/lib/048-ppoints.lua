function getAccountPoints(cid)
local res = db.getResult('select `premium_points` from accounts where name = \''..getPlayerAccount(cid)..'\'')
if(res:getID() == -1) then
return false
end
local ret = res:getDataInt("premium_points")
res:free()
return tonumber(ret)
end

function doAccountAddPoints(cid, count)
return db.query("UPDATE `accounts` SET `premium_points` = '".. getAccountPoints(cid) + count .."' WHERE `name` ='"..getPlayerAccount(cid).."'")
end

function doAccountRemovePoints(cid, count)
return db.query("UPDATE `accounts` SET `premium_points` = '".. getAccountPoints(cid) - count .."' WHERE `name` ='"..getPlayerAccount(cid).."'")
end