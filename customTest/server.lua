local socket = require "socket"

-- 绑定端口
local server = socket.bind("127.0.0.1", 8080)
print("? 服务端已启动，等待客户端连接 (Ctrl+C 停止)")

-- 关键：无限循环等待客户端
while true do
    -- 阻塞等待客户端连接（不会自动退出）
    local client = server:accept()

    if client then
        print("\n? 客户端已连接！")

        -- 接收数据
        local data = client:receive("*a")

        -- Protobuf 解码
        local pb = require "pb"
        local protoc = require "protoc"
        protoc:load([[ message Msg { optional string cmd = 1; } ]])
        local msg = pb.decode("Msg", data)

        print("? 服务端收到：" .. msg.cmd)

        -- 回复
        local reply = pb.encode("Msg", { cmd = "server_ok" })
        client:send(reply)
        client:close()

        print("? 客户端已断开，继续等待新连接...\n")
    end
end