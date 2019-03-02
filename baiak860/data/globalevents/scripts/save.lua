function executeSaveServer()
    doSaveServer()
    return true
end

function onThink(interval, lastExecution, thinkInterval)
doBroadcastMessage("O Servidor foi Salvo ..")
    addEvent(executeSaveServer, 1000)
    return true
end