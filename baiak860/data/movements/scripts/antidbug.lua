local positions = {
{x = 159, y = 52, z = 7}, -- aqui vc coloca a posição pra onde ele vão
{x = 160, y = 52, z = 7}, 
{x = 161, y = 52, z = 7}, 
{x = 159, y = 53, z = 7}, 
{x = 161, y = 53, z = 7},
{x = 159, y = 54, z = 7},
{x = 160, y = 54, z = 7},
{x = 161, y = 54, z = 7}
}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
doTeleportThing(cid, positions[math.random(1, #positions)])
return true
end