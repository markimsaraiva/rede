function executeClean()
	doCleanMap()
	doBroadcastMessage("O mapa foi limpo.")
	return true
end

function onThink(interval, lastExecution, thinkInterval)
	doBroadcastMessage("[Warning] O Mapa vai ser limpo, guarde seus itens.")
	addEvent(executeClean, 50000)
	return true
end
