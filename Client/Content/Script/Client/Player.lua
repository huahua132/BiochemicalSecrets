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
    local msg = 'Login success\n Account: ' .. ack.account
    .. "\nAccountID: " .. ack.account_id
    .. "\nPlayerID: " .. ack.player_id
    .. "\nName: " .. ack.name
    .. "\nLevel: " .. ack.level
    .. "\nIP: " .. ack.ip
    .. "\nArea: " .. ack.area
    .. "\nCreatedTime: " .. ack.created_time
    .. "\nLastLoginTime: " .. ack.last_login_time
    .. "\nLastOfflineTime: " .. ack.last_offline_time
    .. "\nPlatform: " .. ack.platform
    Screen.Print(msg)
end