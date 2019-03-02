function onThink(interval, lastExecution)
  -- Configurações
    local cor = 20 -- Defina a cor da mensagem (20 = Orange)
    local mensagens = {"{Mensagem}Shopping Entregando Pontos Automaticamente.O Shopping Foi Reformulado, Adicionado Itens Donate. Mais Informações, Acesse -> http://baiaknew.top/index.php?subtopic=shopsystem"} -- Defina as mensagens de propaganda
  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end