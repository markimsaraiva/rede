function onThink(interval, lastExecution)
  -- Configurações
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Faça doações para nosso servidor e seja um jogador com vários benefícios exclusivos como areas com criaturas vips, respawns rápidos, várias opções de hunts. Faça já sua doação e desfrute dos benefícios vip! 
]]
}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end