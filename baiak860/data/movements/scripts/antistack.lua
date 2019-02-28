local positions = {
{x = 155, y = 53, z = 7}, -- aqui vc coloca a posição pra onde ele vão
{x = 154, y = 54, z = 7}, 
{x = 155, y = 55, z = 7},
{x = 154, y = 55, z = 7},
{x = 155, y = 53, z = 7}, 
{x = 156, y = 54, z = 7},
{x = 156, y = 53, z = 7},
{x = 154, y = 53, z = 7}
}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
doTeleportThing(cid, positions[math.random(1, #positions)])
return true
end