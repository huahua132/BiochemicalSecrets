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
    self.net:RegisteredDelegation(PlayerRPC.ACK_PLAYER_DATA, self.OnAckPlayerData, self)
end

-- 请求进入游戏
function Player:OnConnected()
    print("已连接成功")
end

function Player:OnPlayerOnline(data)
    print("玩家在线, 请求玩家数据中")
    local req = {}
    self.net:SendPB(PlayerRPC.REQ_PLAYER_DATA, "rpc.ReqPlayerData", req )
end

function Player:OnAckPlayerData(data)
    print("玩家数据...")
    local ack = assert(pb.decode("rpc.AckPlayerData", data))
    PrintTable(ack)
    GameInstance:LoadLevel("/Game/Maps/Lobby")
end