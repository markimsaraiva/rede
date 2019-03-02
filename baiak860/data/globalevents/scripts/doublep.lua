function onThink(interval, lastExecution)
  -- Configurações
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[
AJUDE O SERVIDOR A MANTER-SE ONLINE COM A SUA DOAÇÃO!

Entre em nosso site Ribeirot.servegame.com]]
}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end