require "pubnub"

--
-- GET YOUR PUBNUB KEYS HERE:
-- http://www.pubnub.com/account
--
multiplayer = pubnub.new({
    publish_key   = "demo",             -- YOUR PUBLISH KEY
    subscribe_key = "demo",             -- YOUR SUBSCRIBE KEY
    secret_key    = nil,                -- YOUR SECRET KEY
    ssl           = nil,                -- ENABLE SSL?
    origin        = "pubsub.pubnub.com" -- PUBNUB CLOUD ORIGIN
})

--
-- PUBNUB SERVER TIME
--
multiplayer:time({
    callback = function(time)
        print("PUBNUB SERVER TIME: " .. time)
    end
})

--
-- PUBNUB PUBLISH MESSAGE (SEND A MESSAGE)
--
multiplayer:publish({
    channel  = "lua-corona-demo-channel",
    message  = { "1234", 2, 3, 4 },
    callback = function(info)

        -- WAS MESSAGE DELIVERED?
        if info[1] then
            print("MESSAGE DELIVERED SUCCESSFULLY!")
        else
            print("MESSAGE FAILED BECAUSE -> " .. info[2])
        end

    end
})


--
-- PUBNUB SUBSCRIBE CHANNEL (RECEIVE MESSAGES)
--
multiplayer:subscribe({
    channel  = "lua-corona-demo-channel",
    callback = function(message)
        print(Json.Encode(message))
    end,
    errorback = function()
        print("Network Connection Lost")
    end
})

--
-- PUBNUB LOAD MESSAGE HISTORY
--
multiplayer:history({
    channel  = "lua-corona-demo-channel",
    limit    = 10,
    callback = function(messages)
        if not messages then
            return print("ERROR LOADING HISTORY")
        end

        -- NO HISTORY?
        if not (#messages > 0) then
            return print("NO HISTORY YET")
        end

        -- LOOP THROUGH MESSAGE HISTORY
        for i, message in ipairs(messages) do
            print(message)
        end
    end
})

local screenW, screenH = display.contentWidth, display.contentHeight

local ball = display.newCircle( 0, 0, 40 )
ball:setFillColor(255, 255, 255, 255)
ball.x = screenW * 0.5
ball.y = ball.height


