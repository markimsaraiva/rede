function onThink(interval, lastExecution)
  -- Configurações
    local cor = 20 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Deseja fazer uma doação? Acesse agora o site http://ribeirot.servegame.com/]]
}

  -- Fim de Configurações

  doBroadcastMessage("Mate o Rei que nasce aproximadamente a cada 1 hora e 30 minutos e ganhe itens!", MESSAGE_STATUS_WARNING)
return TRUE
end