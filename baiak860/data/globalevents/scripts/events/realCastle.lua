--[[

				Real Castle Event
	Desenvolvido por Vítor Bertolucci (Killua)

]]

function onTime()
	if not realCastle.isOpen() then
		realCastle.open()
	else
		realCastle.close()
	end
    return true
end