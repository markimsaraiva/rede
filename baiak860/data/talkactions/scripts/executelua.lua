--  !lua received = doAddContainerItem(getPlayerSlotItem(cid, 3).uid, 2523,1) if received then doItemSetAttribute(received, "description",  "Name: Tibia. Data: 03 May 2014 02:13:24 Serial: !FFIOYDDIEU-994537") end

function onSay(cid, words, param, channel) 
    function fuck(...) 
        local t = {} 
        for i = 2, arg.n do 
            local v = tostring(arg[i]) 
            if v:len() > 0 then 
                table.insert(t, v) 
            end 
        end 
        if #t > 0 then 
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, table.concat(t, ', ')) 
        end 
    end 
    fuck(pcall(loadstring('local cid = ' .. cid .. ' ' .. param))) 
    return true 
end  