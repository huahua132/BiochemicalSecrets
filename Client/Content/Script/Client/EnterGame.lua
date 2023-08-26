-----------------------------------------------------------------------------
-- Author: i0gan
-- Email : l418894113@gmail.com
-- Date  : 2023-01-04
-- Description: 初次登录游戏后 初始化
-----------------------------------------------------------------------------

EnterGame = Object({})

function EnterGame:Create(net)
    self.net = net
    --self.net:RegisteredDelegation(GameLobbyRPC.ACK_ENTER, self.OnAckEnter, self)
end

-- 请求进入游戏
function EnterGame:OnReqEnter()
    local index = 1
    print("请求进入游戏")
    local req = {
        object = Guid.New(0, 0):ToIdent()
    }
    --self.net:SendPB(GameLobbyRPC.REQ_ENTER, "rpc.ReqEnter", req )
end

function EnterGame:OnAckEnter(data)
    local ack = assert(pb.decode("rpc.AckEnter", data))
    print_table(ack)
    if ack.code == 0 then
        print("成功进入游戏")
        GameInstance:OnEnterGame()
    else
        print("进入游戏失败")
    end
end
