local function getGuildNameById(id)
    local name = ""
    local query = db.getResult('SELECT `name` FROM `guilds` WHERE `id` = "'.. id ..'"')
    if query:getID() ~= -1 then

    name = query:getDataString("name")
    query:free()
    return name
	end
end 

local placas = {
    [4860] = {"Bem vindo a Morgun City. Essa cidade eh cheia de misterios e tambem tem uma quest e algumas hunts escondidas. Alem disso, a cidade eh famosa por ser lar do temido Ice Ricardo e do poderoso Rei Tywin (Governador supremo do continente). Desvende todos os misterios, encontre as hunts de criaturas exclusivas da cidade e torne-se muito mais forte!", 8977},
    [4861] = {"Os Mell Coins sao conseguidos de monstros fortes como Ancient Boss, Lava Lord etc, e tambem em eventos. Consiga Mell Coins e troque por itens aqui nesse NPC! Os itens vendidos aqui sao muito especiais e podeorosos. Saiba mais no nosso site, na pagina Mell Coins!", 8977},
    [4862] = {"Na VIP Donate tem hunt desses monstros e muitos outros! Sendo um total de 16 hunts exclusivas! Alem de melhores hunts, os jogadores VIP recebem 30% mais exp! Nao perca tempo, compre ja em nosso site!", 8977},
    [4863] = {"- O PODEROSO GONKA!-\n\n Destruidor dos continentes, foi o ser que com as proprias maos separou a Pangeia e criou o continente Baiak. Por ser tao poderoso e malefico, Gonka foi condenado a lutar eternamente pelo papa Gregorio IX. Os guerreiros que conseguirem derrotar o terrivel Gonka em uma luta justa, recebem o Outfit Supremo!", 8977},
    [4864] = {"O caminho esta bloqueado! Voce deve encontrar outra passagem... Dizem que eh possivel chegar ao outro lado da montanha passando pelo Caminho Das Arvores Douradas, por que voce nao tenta ir para la?", 8977},
    [4865] = {"Esta eh a famosa Floresta Sobre a Montanha! Nela que fica a Passagem Dos Cristais Vermelhos... Infelizmente a Passagem esta bloqueada por stalagmites, so eh possivel passar pelo caminho com uma dwarven pickaxe.", 8977},
    [4866] = {"Esta eh a entrada da quest do Um Anel! Parabens por ter chegado ate aqui! Para prosseguir, voce deve ter derrotado o antigo demonio Amon, que fica perto da Arvore Gigante na frente do templo da Baiak City. O portal para a quest aparece aqui quando o momento eh certo.", 8977},
    [4867] = {"Este jogo testa totalmente sua sorte! Voce aposta 1kk e, se os 3 monstros que nascerem forem iguais, vc ganha 5kk! Para jogar, basta puxar a alavanca!", 8977},
    [4868] = {"- Corrida de Monstros - \n\n A corrida acontece a cada 3 minutos. Para participar, voce deve entrar nesta arquibancada (piso preto) e esperar o inicio da corrida. 2 minutos antes da corrida comecar, 4 monstros nascem e voce deve apostar em um deles, usando !aposta 1 ou !aposta 2 ou !aposta 3 ou !aposta 4. Voce paga 5kk para apostar e, se ganhar, recebe o valor de todas as apostas juntas em kk. Exemplo: Se 4 pessoas participarem e somente vc ganhar a aposta, vc recebe 40 Mell Coin20kks. Participe!", 8977},
    [4869] = {"- Arena do Dado - \n\n Sao necessarios 3 jogadores para entrar na arena do dado. Dentro da arena tem um dado que cada jogador pode rodar uma vez. A cada vez que o dado eh rodado, um monstro nasce e quando vcs matarem o monstro, um premio aparece em cima do corpo dele! Quanto mais forte o monstro, melhor o premio! Para entrar na arena tem que pagar 2 Mell Coins. So pode entrar na arena uma vez por dia.", 8977},
    [15274] = {"Atualmente, a guild "..getGuildNameById(getGlobalStorageValue(123123)).." esta dominando o Castle 24hrs.", 8977},
    [15788] = {"Atualmente, a guild "..getGuildNameById(getGlobalStorageValue(1823999)).." esta dominando o Castle War.", 8977}    
}

local placas_ = {1431, 1432, 5360, 5361, 1810, 1434, 1815}

function onLook(cid, thing, position, lookDistance)
    if isInArray(placas_, thing.itemid) and placas[thing.actionid] then
        doShowTextDialog(cid, placas[thing.actionid][2], placas[thing.actionid][1])
        return false
    end
    return true
end

function onLogin(cid)
    registerCreatureEvent(cid, "lookPlaca")
    return true
end