local msgs = {
        "O melhor servidor Baiak é aqui! RibeirOT Server!!!",
		"Curta nossa fanpage:  RibeirOT Server",
		"Chame seus amigos! Entre no nosso grupo Whatsapp, só enviar mensagem aos GMS!!",
		"Visite nosso site! ribeirot.servegame.com   ",
		"Ataulizações diárias! Acompanhe no site e também na nossa fan page!!!",
		"Faça uma Doação e incentive a melhoria do servidor feito para vocês!!!",
		"Torne-se Fodão!!! Realize uma doação, e adquira os itens MAX !!!",
}
 
function onThink(interval)
        local msg = msgs[math.random(#msgs)]
 
        for _, uid in pairs(getPlayersOnline()) do
                doScrollMessage(uid, msg)
        end
 
        return true
end