function onThink(interval, lastExecution)
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[[ATENCAO] Quando Tiver 100 player's Online Vai comecar o Sistema de Premiacao EX:100 Player's  Online = 100 Reais.. 200 player's = 200 reais e assim sucessivamente. Ocorrera todos os sabados as 15:00 Em Fire Storm event.. Visite nosso Shop online Muitas Novidades Ribeirot.servegame.com  ]]
}
doBroadcastMessage(mensagens[1], cor)
return TRUE
end