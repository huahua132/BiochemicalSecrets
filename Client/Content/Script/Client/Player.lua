-----------------------------------------------------------------------------
-- Author: i0gan
-- Email : l418894113@gmail.com
-- Date  : 2023-09-01
-- Description: 玩家信息
-----------------------------------------------------------------------------

Player = Object({})

function Player:Create(net)
    self.net = net
    --self.net:RegisteredDelegation(GameLobbyRPC.ACK_ENTER, self.OnAckEnter, self)
end

-- 请求进入游戏
function Player:OnEnter()
    local index = 1
    print("已连接成功")
    --self.net:SendPB(Player.REQ_ENTER, "rpc.ReqEnter", req )
end

function Player:OnAckEnter(data)
    local ack = assert(pb.decode("rpc.AckEnter", data))
    PrintTable(ack)
    if ack.code == 0 then
        print("成功进入游戏")
        GameInstance:OnEnterLobby()
    else
        print("进入游戏失败")
    end
end
