-- 确保 luarocks 路径已加载（如果没配环境变量就加上）
-- package.path = "C:\\Users\\Administrator\\AppData\\Roaming\\luarocks\\share\\lua\\5.4\\?.lua;" .. package.path
-- package.cpath = "C:\\Users\\Administrator\\AppData\\Roaming\\luarocks\\lib\\lua\\5.4\\?.dll;" .. package.cpath

-- 加载根模块 pb（不是 pb.io）
local pb = require("pb")
print(" pb 模块加载成功！版本：", pb._VERSION)

-- 测试核心功能
print("pb 模块可用方法：", pb)


-- 加载并验证 luasocket
local socket = require("socket")
print(" luasocket 加载成功！版本：", socket._VERSION)

-- 测试核心功能
print(" 当前时间戳：", socket.gettime())

-- 测试 mime 模块
local mime = require("mime")
print(" mime 模块加载成功")