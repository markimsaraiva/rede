local function filtrateString(str)
	if type(str) ~= "string" then
		return false
	end
	local first, last = 0, 0
	local second, final = 0, #str
	for i = 1, #str do
		if string.byte(str:sub(i,i)) == string.byte('a') then
			first = i + 2
			for t = first, #str do
				if string.byte(str:sub(t,t)) == string.byte(' ') then
					last = t - 1
					break
				end
			end
		end
		if string.byte(str:sub(i,i)) == string.byte('b') then
			second = i + 2
		end
	end
	return {str:sub(first, last), str:sub(second, final)}
end

function onStartup()
	if not filtrateString(getGlobalStorageValue(822081)) then
		setGlobalStorageValue(822081, "a 123 b 456")
	end
	if not filtrateString(getGlobalStorageValue(822082)) then
		setGlobalStorageValue(822082, "a 123 b 456")
	end
	if not filtrateString(getGlobalStorageValue(822083)) then
		setGlobalStorageValue(822083, "a 123 b 456")
	end
	if not filtrateString(getGlobalStorageValue(822084)) then
		setGlobalStorageValue(822084, "a 123 b 456")
	end
	if not filtrateString(getGlobalStorageValue(822085)) then
		setGlobalStorageValue(822085, "a 123 b 456")
	end
	if not filtrateString(getGlobalStorageValue(822086)) then
		setGlobalStorageValue(822086, "a 123 b 456")
	end
	if not filtrateString(getGlobalStorageValue(822087)) then
		setGlobalStorageValue(822087, "a 123 b 456")
	end
	if not filtrateString(getGlobalStorageValue(822088)) then
		setGlobalStorageValue(822088, "a 123 b 456")
	end
	if not filtrateString(getGlobalStorageValue(822089)) then
		setGlobalStorageValue(822089, "a 123 b 456")
	end
	if not filtrateString(getGlobalStorageValue(822090)) then
		setGlobalStorageValue(822090, "a 123 b 456")
	end
	if not filtrateString(getGlobalStorageValue(822091)) then
		setGlobalStorageValue(822091, "a 123 b 456")
	end
	if not filtrateString(getGlobalStorageValue(822092)) then
		setGlobalStorageValue(822092, "a 123 b 456")
	end
	if not filtrateString(getGlobalStorageValue(822093)) then
		setGlobalStorageValue(822093, "a 123 b 456")
	end
	if not filtrateString(getGlobalStorageValue(822094)) then
		setGlobalStorageValue(822094, "a 123 b 456")
	end
	if not filtrateString(getGlobalStorageValue(822095)) then
		setGlobalStorageValue(822095, "a 123 b 456")
	end
	if not filtrateString(getGlobalStorageValue(822096)) then
		setGlobalStorageValue(822096, "a 123 b 456")
	end
	if not filtrateString(getGlobalStorageValue(822097)) then
		setGlobalStorageValue(822097, "a 123 b 456")
	end
	if not filtrateString(getGlobalStorageValue(822098)) then
		setGlobalStorageValue(822098, "a 123 b 456")
	end




	local query = db.getResult("SELECT `guild_id` FROM `castle_dono` WHERE `guild_id` > 0")
	if query:getID() ~= -1 then
		setGlobalStorageValue(1823999, query:getDataInt("guild_id"))
	end
	return true
end