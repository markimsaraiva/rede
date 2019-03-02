local config = {
positions = {
["Dl 1"] = { x = 324, y = 295, z = 7 },
["Dl 2"] = { x = 322, y = 295, z = 7 },
["Dl 3"] = { x = 320, y = 295, z = 7 },
["Dl 4"] = { x = 318, y = 295, z = 7 },
["Dl 5"] = { x = 316, y = 295, z = 7 },
["Dl 6"] = { x = 314, y = 295, z = 7 },
["Dl 7"] = { x = 312, y = 295, z = 7 },
["Dragon 1"] = { x = 328, y = 295, z = 7 },
["Dragon 2"] = { x = 326, y = 295, z = 7 },
["Grim 1"] = { x = 347, y = 295, z = 7 },
["Grim 2"] = { x = 349, y = 295, z = 7 },
["Grim 3"] = { x = 351, y = 295, z = 7 },
["Grim 4"] = { x = 353, y = 295, z = 7 },
["Grim 5"] = { x = 355, y = 295, z = 7 },
["Grim 6"] = { x = 357, y = 295, z = 7 },
["Grim 7"] = { x = 359, y = 295, z = 7 },
["Grim 8"] = { x = 361, y = 295, z = 7 },
["Grim 9"] = { x = 363, y = 295, z = 7 },
["Grim 10"] = { x = 365, y = 295, z = 7 },
["Grim 11"] = { x = 367, y = 295, z = 7 },
["Warlock 1"] = { x = 347, y = 301, z = 7 },
["Warlock 2"] = { x = 349, y = 301, z = 7 },
["Warlock 3"] = { x = 351, y = 301, z = 7 },
["Warlock 4"] = { x = 353, y = 301, z = 7 },
["Warlock 5"] = { x = 355, y = 301, z = 7 },
["Warlock 6"] = { x = 357, y = 301, z = 7 },
["Warlock 7"] = { x = 359, y = 301, z = 7 },
["Warlock 8"] = { x = 361, y = 301, z = 7 },
["Warlock 9"] = { x = 363, y = 301, z = 7 },
["Warlock 10 "] = { x = 365, y = 301, z = 7 },
["Warlock 11 "] = { x = 367, y = 301, z = 7 },
["Hydra 1"] = { x = 330, y = 301, z = 7 },
["Hydra 2"] = { x = 328, y = 301, z = 7 },
["Behe 1"] = { x = 326, y = 301, z = 7 },
["Behe 2"] = { x = 324, y = 301, z = 7 },
["Medusa 1"] = { x = 322, y = 301, z = 7 },
["Medusa 2"] = { x = 320, y = 301, z = 7 },
["Frost 1"] = { x = 318, y = 301, z = 7 },
["Frost 2"] = { x = 316, y = 301, z = 7 },
["Frost 3"] = { x = 314, y = 301, z = 7 },
["Demon 1"] = { x = 333, y = 304, z = 7 },
["Demon 2"] = { x = 333, y = 306, z = 7 },
["Demon 3"] = { x = 333, y = 308, z = 7 },
["Demon 4"] = { x = 333, y = 310, z = 7 },
["Demon 5"] = { x = 333, y = 312, z = 7 },
["Demon 6"] = { x = 333, y = 314, z = 7 },
["Demon 7"] = { x = 333, y = 316, z = 7 },
["Demon 8"] = { x = 337, y = 316, z = 7 },
["Demon 9"] = { x = 339, y = 316, z = 7 },
["Demon 10"] = { x = 341, y = 316, z = 7 },
["Demon 11"] = { x = 344, y = 303, z = 7 },
["Demon 12"] = { x = 344, y = 305, z = 7 },
["Demon 13"] = { x = 344, y = 307, z = 7 },
["Demon 14"] = { x = 344, y = 309, z = 7 },
["Demon 15"] = { x = 344, y = 311, z = 7 },
["Demon 16"] = { x = 344, y = 313, z = 7 },
["Demon 17"] = { x = 344, y = 315, z = 7 },
["Demon 18"] = { x = 344, y = 317, z = 7 },
["Cyclop 1"] = { x = 330, y = 295, z = 7 },

}
}

function onThink(cid, interval, lastExecution)
for text, pos in pairs(config.positions) do
doSendAnimatedText(pos, text, 200)
end

return TRUE
end 

