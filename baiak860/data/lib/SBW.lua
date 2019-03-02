-- This script is part of Snow Ball War
-- Copyright (C) 2016 ChaitoSoft
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

-- //

-- POSIÇÕES IMPORTANTES
SBW_AREA = {{x = 1214, y = 1205, z = 7}, {x = 1251, y = 1242, z = 7}}-- AREA DO EVENTO | Canto superior esquerdo / inferior direito
SBW_WAITROOM = {{x = 1229, y = 1220, z = 6}, {x = 1235, y = 1226, z = 6}} -- AREA DE ESPERA | Canto superior esquerdo / inferior direito
SBW_TP = {x = 162, y = 52, z = 7} -- local onde teleport sera criado (entrada de jogadores)
SBW_TPGO = {x = 1232, y = 1223, z = 6} -- local onde teleport vai levar (saida de jogadores)
SBW_TPEND = {x = 155, y = 54, z = 7} -- local onde serao teleport ao final do evento
SBW_GERADOR = {x = 1232, y = 1223, z = 7} -- local onde gerador vai ficar

-- CONFIGURAÇÕES DO EVENTO
SBW_DAYS = {1,2,3,4,5,6,7} -- dias de semana que vai abrir
SBW_DURATION = 10 -- duração do evento em minutos
SBW_POINTSKILL = 1 -- pontos de jogo por morte
SBW_AMMOBUY = 20 -- quantia de munições compradas por cada ponto
SBW_MINAMMO = 50 -- munição inicial dos jogadores
SBW_TIMEWAIT = 3 -- tempo na sala de espera em minutos
SBW_AMMOINFI = false
SBW_LOSTSCORE = true
SBW_RANDOMIZE = true
SBW_RESETAMMO = true
SBW_STARTAUTO = true
SBW_USEWAIT = true

--PREMIO DO EVENTO
SBW_ADDREWARD = true
SBW_REWARDS = {
				{6527,150},
				{12695,10},
			}


-- // Não mexa daqui para baixo
SBW_TFS = "0.4" 

-- STORAGES
SBW_EXAUSTHED = 2455 
SBW_INEVENT = 2460 
SBW_SCORE = 2465
SBW_AMMO = 2400


SBW_WALLSID = {5324,7003,7021,6712,7023,7002,6713,6714,6869,6822,6823,6824,6825,6826,6827,6828,6829,6830,6831,6832,6833,6707,6708,6709,6710,6711,2698,2697,7020,6719,6720,6721,6722,6723,6724,6725,6726,6727,6761,6762,6768,6769,4608,4609,4610,4611,4612,4613,4614,4615,4616,4617,4618,4619,4620,4621,4622,4623,4624,4625,4664,4665,4666,7008,7009,7010,7011,8239,7004,7005,7006,7007,6627,6628,6629,6630,6631,6632,6633,6634,6635,6636,6637,6638,7022}
SBW_BALLSPEED = 150
SBW_SHOOTEXAUSTHED = 1000
SBW_SHOOTDIR = 0                             
SBW_STATUS = 'on' 

-- MENSAGENS
SBW_MSGWARNING = "[SNOWBALL WAR] Abriu o teleport de ingresso para o evento, para participar se dirija ate o templo do Ribeirot."
SBW_MSGSTART = "[SNOWBALL WAR] O teleport foi removido e o evento foi iniciado, boa sorte a todos participantes."

