function onThink(interval, lastExecution)
  CONFIG = {
    [1] = {message = "MSG1", color = 20},
    [2] = {message = "MSG2", color = 20},
	}

function onThink()
    getRandom = math.random(1, #CONFIG)
    return doBroadcastMessage(CONFIG[getRandom].message, CONFIG[getRandom].color)
end