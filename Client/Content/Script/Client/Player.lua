-----------------------------------------------------------------------------
-- Author: i0gan
-- Email : l418894113@gmail.com
-- Date  : 2023-09-01
-- Description: 玩家信息
-----------------------------------------------------------------------------

Player = Object({})

function Player:Create(net)
    self.net = net
    self.net:RegisteredDelegation(PlayerRPC.ACK_PLAYER_ONLINE, self.OnPlayerOnline, self)
end

-- 请求进入游戏
function Player:OnConnected()
    local index = 1
    print("已连接成功")
end

function Player:OnPlayerOnline(data)
    print("玩家在线...")
end
