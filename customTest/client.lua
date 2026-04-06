local socket = require "socket"
local pb = require "pb"
local protoc = require "protoc"

protoc:load([[ message Msg { optional string cmd = 1; } ]])

-- 连接
local skt = socket.connect("127.0.0.1", 8080)
if not skt then
    print("? 连接失败")
    return
end

print("? 已连接服务端")

-- 发送
local bytes = pb.encode("Msg", { cmd = "hello_lua" })
skt:send(bytes)
skt:close()

print("? 发送完成，客户端退出")