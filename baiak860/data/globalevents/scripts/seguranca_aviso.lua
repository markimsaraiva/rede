function onThink(interval, lastExecution)
  -- Configurações
    local cor = 19 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[AVISO IMPORTANTE: Nunca caçe de mão fechada, jogadores podem fazer você pegar Red Skull e a Staff não se responsabiliza por perdas de equipamentos.
]]
}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end