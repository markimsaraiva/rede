function onThink(interval, lastExecution)
  -- Configurações
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens = {"[PROMOÇÃO-DOUBLE POINTS] Nao Perca Sabado
Evento Fire Storm as 15:00 Pêmio em Dinheiro Sera Mesma Quantidade de Player online Ex: 200 Player 200 Reais . -> Ribeirot.servegame.com"} -- Defina as mensagens de propaganda
  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end