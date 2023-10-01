----------------------------------------------------------------------------------
-- don't edit it, generated from .proto files by tools
----------------------------------------------------------------------------------

proto_code = [[
// 描述: 基础定义
// 使用: 服务器, 客户端
syntax = "proto3";
package rpc;

message Vector2 {
    float x = 1;
    float y = 2;
}

message Vector3 {
    float x = 1;
    float y = 2;
    float z = 3;
}

message Vector4 {
    float x = 1;
    float y = 2;
    float z = 3;
    float w = 4;
}// 描述: 数据库 
// 使用: 服务器

// 30000 ~ 35000
enum DbProxyRPC {
    DB_RPC_NONE = 0;
    
    REQ_REDIS_QUERY = 30001;
    ACK_REDIS_QUERY = 30002;
    REQ_REDIS_GET = 30003;
    ACK_REDIS_GET = 30004;
    REQ_REDIS_SET = 30005;
    ACK_REDIS_SET = 30006;
    REQ_REDIS_HGET = 30007;
    ACK_REDIS_HGET = 30008;
    REQ_REDIS_HSET = 30009;
    ACK_REDIS_HSET = 30010;
    REQ_REDIS_HGETALL = 30011;
    ACK_REDIS_HGETALL = 30012;
    REQ_REDIS_HMSET = 30013;
    ACK_REDIS_HMSET = 30014;

    REQ_MONGO_QUERY = 30500;
    ACK_MONGO_QUERY = 30501;
    REQ_MONGO_INSERT = 30502;
    ACK_MONGO_INSERT = 30503;
    REQ_MONGO_FIND = 30504;
    ACK_MONGO_FIND = 30505;
    REQ_MONGO_UPDATE = 30506;
    ACK_MONGO_UPDATE = 30507;
    REQ_MONGO_DELETE = 30508;
    ACK_MONGO_DELETE = 30509;
    REQ_MONGO_CREATE_INDEX = 30510;
    ACK_MONGO_CREATE_INDEX = 30511;

    REQ_MYSQL_QUERY = 31000;
    ACK_MYSQL_QUERY = 31001;
    REQ_MYSQL_EXECUTE = 31002;
    ACK_MYSQL_EXECUTE = 31003;
    REQ_MYSQL_SELECT = 31004;
    ACK_MYSQL_SELECT = 31005;
    REQ_MYSQL_INSERT = 31006;
    ACK_MYSQL_INSERT = 31007;
    REQ_MYSQL_UPDATE = 31008;
    ACK_MYSQL_UPDATE = 31009;
    REQ_MYSQL_DELETE = 31010;
    ACK_MYSQL_DELETE = 31011;
    

    REQ_CLICKHOUSE_QUERY = 31500;
    ACK_CLICKHOUSE_QUERY = 31501;
    REQ_CLICKHOUSE_EXECUTE = 31502;
    ACK_CLICKHOUSE_EXECUTE = 31503;
    REQ_CLICKHOUSE_SELECT = 31504;
    ACK_CLICKHOUSE_SELECT = 31505;
    REQ_CLICKHOUSE_INSERT = 31506;
    ACK_CLICKHOUSE_INSERT = 31507;

}

// Proxy DB code
enum DbProxyCode {
    DB_PROXY_CODE_REDIS_SUCCESS = 0;
    DB_PROXY_CODE_REDIS_PROTO_ERROR = 1;
    DB_PROXY_CODE_REDIS_EXCEPTION = 2;
    DB_PROXY_CODE_REDIS_NO_KEY = 3;

    DB_PROXY_CODE_MONGO_SUCCESS = 500;
    DB_PROXY_CODE_MONGO_PROTO_ERROR = 501;
    DB_PROXY_CODE_MONGO_EXCEPTION = 502;

    DB_PROXY_CODE_MYSQL_SUCCESS = 1000;
    DB_PROXY_CODE_MYSQL_PROTO_ERROR = 1001;
    DB_PROXY_CODE_MYSQL_EXCEPTION = 1002;

    DB_PROXY_CODE_CLICKHOUSE_SUCCESS = 1500;
    DB_PROXY_CODE_CLICKHOUSE_PROTO_ERROR = 1501;
    DB_PROXY_CODE_CLICKHOUSE_EXCEPTION = 1502;
}

message Data {
    int32 type = 1;
    bytes value = 2;
}

message List {
    int32 type = 1;
    repeated bytes values = 2;
}

message ReqRedisGet {
    int32 query_id = 1;
    string key = 2;
}

message AckRedisGet {
    int32 code = 1;
    bytes msg = 2;
    int32 query_id = 3;
    bytes value = 4;
}

message ReqRedisSet {
    int32 query_id = 1;
    string key = 2;
    bytes value = 3;
    int64 ttl = 4;
}

message AckRedisSet {
    int32 code = 1;
    bytes msg = 2;
    int32 query_id = 3;
}

message ReqRedisHGet {
    int32 query_id = 1;
    string key = 2;
    string field = 3;
}

message AckRedisHGet {
    int32 code = 1;
    bytes msg = 2;
    int32 query_id = 3;
    bytes value = 4;
}

message ReqRedisHSet {
    int32 query_id = 1;
    string key = 2;
    string field = 3;
    bytes value = 4;
    int64 ttl = 5;
}

message AckRedisHSet {
    int32 code = 1;
    bytes msg = 2;
    int32 query_id = 3;
}

message ReqClickhouseExecute {
    int32 query_id = 1;
    string sql = 2;
}

message AckClickhouseExecute {
    int32 code = 1;
    bytes msg = 2;
    int32 query_id = 3;
}

message ReqClickhouseSelect {
    int32 query_id = 1;
    string sql = 2;
}

message AckClickhouseSelect {
    int32 code = 1;
    bytes msg = 2;
    int32 query_id = 3;
    repeated List result = 4;
}

// Insert one
message ReqMongoInsert {
    int32 query_id = 1;
    string db = 2;
    string collection = 3;
    string insert_json = 4;
}

message AckMongoInsert {
    int32 code = 1;
    bytes msg = 2;
    int32 query_id = 3;
    string inserted_id = 4; // Inserted Object ID
}

// Find many
message ReqMongoFind {
    int32 query_id = 1;
    string db = 2;
    string collection = 3;
    string condition_json = 4;
    int32 limit = 5;
    int32 skip = 6;
    string sort_json = 7;
}

message AckMongoFind {
    int32 code = 1;
    bytes msg = 2;
    int32 query_id = 3;
    int32 matched_count = 4;
    repeated string result_json = 5;
}

// Default: Update many
message ReqMongoUpdate {
    int32 query_id = 1;
    string db = 2;
    string collection = 3;
    string condition_json = 4;
    string update_json = 5;
}

message AckMongoUpdate {
    int32 code = 1;
    bytes msg = 2;
    int32 query_id = 3;
    int32 matched_count = 4;
    int32 modified_count = 5;
    int32 upserted_count = 6;
}

// Default: Delete many
message ReqMongoDelete {
    int32 query_id = 1;
    string db = 2;
    string collection = 3;
    string condition_json = 4;
}

message AckMongoDelete {
    int32 code = 1;
    bytes msg = 2;
    int32 query_id = 3;
    int32 deleted_count = 4;
}

// Create index
message ReqMongoCreateIndex {
    int32 query_id = 1;
    string db = 2;
    string collection = 3;
    string condition_json = 4;
}

message AckMongoCreateIndex {
    int32 code = 1;
    bytes msg = 2;
    int32 query_id = 3;
    string result_json = 4;
}// 描述: 房间、匹配、副本
// 使用: 服务器, 客户端

// 20000 ~ 22000
enum GameBaseRPC {
    GAME_BASE_RPC_NONE = 0;

    REQ_GAME_START = 20015; // 预留测试用
    ACK_GAME_START = 20016; //
    REQ_GAME_JOIN = 20017;  // 请求加入游戏,在游戏中断线重连时也请求它
    ACK_GAME_JOIN = 20018;
    ACK_GAME_OVER = 20019;    // 游戏结束
    REQ_GAME_RESTART = 20020; // 重新开始游戏
    ACK_GAME_RESTART = 20021;

    // 场景对象
    ACK_PLAYER_ENTER = 20100; // 对象在服务端上创建成功
    ACK_PLAYER_LEAVE = 20102; //
}

// 进入游戏
message ReqGameJoin {}

message AckGameJoin { int32 code = 1; }

message AckGameStart { int32 code = 1; }

// 重新开局
message ReqGameRestart {}

message AckGameRestart { int32 code = 1; }

message PlayerBaseInfo {
    bytes guid = 1;
    int32 index = 2;
    bytes account = 3;
    bytes name = 4;
    int32 mask = 5;
    int32 glove = 6;
}

message AckPlayerEnterList // 同场景同房间 玩家进入时列表
{
    repeated PlayerBaseInfo list = 1;
}

message AckPlayerLeaveList // 同场景同房间 离开时列表
{
    repeated bytes list = 1;
}

// 18000 ~ 20000 : game.proto
enum GameRPC {
    GAME_RPC_NONE = 0;
    // 房间逻辑
    REQ_ROOM_CREATE = 18000;
    ACK_ROOM_CREATE = 18001;

    REQ_ROOM_DETAILS = 18002;
    ACK_ROOM_DETAILS = 18003;

    REQ_ROOM_JOIN = 18004;
    ACK_ROOM_JOIN = 18005;
    REQ_ROOM_QUIT = 18006; // 离开房间
    ACK_ROOM_QUIT = 18007;
    REQ_ROOM_LIST = 18008; // 获取房间列表
    ACK_ROOM_LIST = 18009; //

    REQ_ROOM_PLAYER_EVENT = 18010; // 在房间里互动以及事件，广播形式发送给房间内所有玩家
    ACK_ROOM_PLAYER_EVENT = 18011;

    // 开始游戏
    REQ_ROOM_GAME_PLAY_START = 18012; // 请求多人在线游戏，需要提前创建好房间
    ACK_ROOM_GAME_PLAY_START = 18013;

    REQ_ROOM_CREATE_ROBOT = 18014; // 创建机器人
    ACK_ROOM_CREATE_ROBOT = 18015;

    // 玩家匹配
}

// 客户端请求创建房间
message ReqRoomCreate {
    bytes name = 1;
    int32 map_id = 2; // 地图id
}

message AckRoomCreate {
    int32 code = 1;
    int32 room_id = 2;
}

// 请求加入房间
message ReqRoomJoin { int32 room_id = 1; }

message AckRoomJoin {
    int32 code = 1;
    bytes player = 2;
}

// 请求退出房间
message ReqRoomQuit { int32 room_id = 1; }

message AckRoomQuit {
    int32 code = 1;
    bytes player = 2;
}

enum RoomStatus {
    ROOM_PREPARING = 0;    // 玩家准备中
    ROOM_PREPARED = 1;     // 玩家已准备
    ROOM_GAME_PLAYING = 2; // 游戏中
}

message RoomSimple {
    int32 id = 1;          // 房间id
    bytes name = 2;        // 房间名称
    bytes game_mode = 3;   // 游戏模式
    RoomStatus status = 4; // 房间状态
    int32 nplayers = 5;    // 当前房间内玩家人数
    int32 max_players = 6; // 最多人数
}

enum RoomPlayerStatus {
    ROOM_PLAYER_STATUS_NOT_PREPARE = 0; // 未准备
    ROOM_PLAYER_STATUS_PREPARED = 1;    // 已准备
}

message RoomPlayer {
    bytes guid = 1;
    bytes name = 2;
    RoomPlayerStatus status = 3;
}

// 玩家获取房间列表
message ReqRoomList {
    int32 start = 1;
    int32 limit = 2;
}

message AckRoomList { repeated RoomSimple list = 1; }

// 请求获取房间详细信息
message ReqRoomDetails { int32 room_id = 1; }

message RoomDetails {
    int32 id = 1;                    // 房间id
    bytes name = 2;                  // 房间名称
    bytes owner = 3;                 // 房主
    RoomStatus status = 4;           // 房间状态
    int32 nplayers = 5;              // 当前房间内玩家人数
    int32 max_players = 6;           // 最多人数
    repeated RoomPlayer players = 7; // 房间内所有玩家
    RoomGamePlay game_play = 8;      // play信息
}

message AckRoomDetails { RoomDetails room = 1; }

// Game Play 响应结构
message RoomGamePlay {
    int32 id = 1;
    bytes key = 2;
    bytes name = 3;
    bytes ip = 4;
    int32 port = 5;
    int32 scene = 6;
    int32 mode = 7;
    int32 nrobots = 8;
}

// 请求开始游戏
message ReqRoomGamePlayStart { int32 room_id = 1; }

// 如果是已经在房间里的人，开始游戏创建PVP服务器后，会自动通知房间里的其他玩家。
message AckRoomGamePlayStart {
    int32 code = 1;
    RoomGamePlay game_play = 2;
}

message ReqRoomCreateRobot { int32 amount = 1; }

message AckRoomCreateRobot { int32 code = 1; }
// 描述: 游戏管理器 
// 使用: 服务器
// GameplayManagerRPC RPC 500 ~ 600
enum GameplayManagerRPC {
    GAMEPLAY_MANAGER_RPC_NONE = 0;

    // GAME_PLAY Manager API
    // GAME_PLAY 管理服 接口
    REQ_GAMEPLAY_CREATE = 500; // 创建 GAME_PLAY 对战服实例
    ACK_GAMEPLAY_CREATE = 501;
    REQ_GAMEPLAY_DESTROY = 502;
    ACK_GAMEPLAY_DESTROY = 503;
    REQ_GAMEPLAY_LIST = 504; //
    ACK_GAMEPLAY_LIST = 505;

    // Game Play Manager API
    // Game Play 接口, 由Game Play -> Game Play Manager -> Game
    // 在Game Play游戏中，以Game服务器为主，Game
    // Play服务器只负责当前对局网络同步和数据结算，不做其他逻辑功能
    REQ_GAMEPLAY_STATUS = 506;
    ACK_GAMEPLAY_STATUS = 507;
    REQ_GAMEPLAY_DATA = 508; // 创建完毕Game Play服务器后， Game
                             // Play服务器向Game服务器初始化对战服数据和各玩家数据
    ACK_GAMEPLAY_DATA = 509;
    REQ_GAMEPLAY_PREPARED = 510; // Game Play服务器初始化数据完成
    ACK_GAMEPLAY_PREPARED = 511;
    REQ_GAMEPLAY_OVER = 512;
    ACK_GAMEPLAY_OVER = 513;
}

// ---------------------------------------------------------
// GamePlay服务器在GamePlay Manager服务器上 请求连接 Game Server
// ACK_CONNECT_GAME_SERVER                = 61;
message ReqGameplayConnectGameServer {
    int32 id = 1;
    bytes key = 2;
    bytes name = 3;
    int32 game_id = 6;
}

//
message AckGameplayConnectGameServer { int32 code = 1; }

// 在Game服务器上请求 GamePlay Manager 服务器创建GamePlay服务器实例
message ReqGameplayCreate {
    int32 id = 1;
    bytes key = 2;
    int32 game_id = 3;
    RoomDetails room = 4;
    //repeated PlayerData players = 5;
}

// 不用 GamePlay Manager 不用响应也行
message AckGameplayCreate { int32 code = 1; }

message AckGameplayDestroyed {}

message ReqGameplayData {
    int32 id = 1; // instance id
    bytes key = 2;
}

// 发送每个玩家的数据
message AckGameplayData {}

// 初始化数据完成，广播所有玩家加入游戏
message ReqGameplayPrepared {
    int32 code = 1; // Game Play服务器状态, 0 正常, 1 不正常
    int32 id = 2;   // instance id
    bytes key = 3;
    bytes ip = 5;   // Game Play 服务器IP
    int32 port = 6; // Game Play 服务器端口
    bytes name = 7; // Game Play 服务器名称
}

message AckGameplayPrepared { int32 code = 1; }// 描述: 登录验证
// 使用: 服务器, 客户端

// 6000 ~ 7000
// RPC用于服务器之间的通信，不与客户端通信
enum LoginRPC {
    LOGIN_RPC_NONE = 0;

    REQ_PROXY_CONNECT_VERIFY = 6000; // 来自代理服务器的验证请求
    ACK_PROXY_CONNECT_VERIFY = 6001;
}

message ReqConnectProxyVerify {
    int64 session = 1; // 请求会话
    bytes guid = 2;
    bytes key = 3;
}

message AckConnectProxyVerify {
    int64 session = 1;
    int32 code = 2;
    int32 world_id = 3;
    bytes account = 4;
}// 描述: 微服务器RPC，包含了聊天、语音等
// 使用: 服务器, 客户端

// GameLobbyRPC RPC 15000 ~ 16000
enum MicroRPC {
    MICRO_RPC_NONE = 0;
    REQ_CHAT = 1;
    ACK_CHAT = 2;
}
// 描述: 玩家RPC
// 使用: 服务器,客户端

// PlayerRPC 12000 ~ 15000
enum PlayerRPC {
    PLAYER_RPC_NONE = 0;
    ACK_PLAYER_ONLINE = 12000;
    ACK_PLAYER_OFFLINE = 12001;
    REQ_PLAYER_DATA = 12002; // 获取玩家详细全部数据
    ACK_PLAYER_DATA = 12003; //
}

message ReqPlayerData {
}

message AckPlayerData {
    string account = 1;
    string account_id = 2;
    string player_id = 3;
    string name = 4;
    int32 level = 5;
    string ip = 6;
    int32 area = 7;
    int32 created_time = 8;
    int32 last_login_time = 9;
    int32 last_offline_time = 10;
    string platform = 11;
}// 描述: 玩家事件
// 使用: 服务器


// PlayerEventPC 10000 ~ 12000
enum PlayerEventRPC {
    LOBBY_BASE_RPC_NONE = 0;
    PLAYER_ENTER_EVENT = 10000; // 进入
    PLAYER_BIND_EVENT = 10001;  //
    PLAYER_LEAVE_EVENT = 10002; // 退出
    PLAYER_RECONNECT_EVENT = 10003;
}

message PlayerEnterEvent {
    bytes account_id = 1;   // 账号guid
    bytes account = 2;      // 登录账号
    int32 proxy_id = 3;     // proxy_id
    bytes ip = 4;           // 登录IP
}

message PlayerBindEvent {
    int32 code = 1;
    bytes account_id = 2;
    bytes player_id = 3;
}

enum PlayerLeaveReason {
    PLAYER_LEAVE_REASON_NONE = 0;    // Unknown
    PLAYER_LEAVE_REASON_QUIT = 1;    // Quit normal
    PLAYER_LEAVE_REQSON_TIMEOUT = 2; // Heartbeat timeout
}

message PlayerLeaveEvent {
    bytes player_id = 1;
    int32 proxy_id = 2;
    int32 reason = 3; // Offline reason
}

message PlayerReconnectEvent {}
// 描述: 代理服务器RPC
// 使用: 服务器,客户端

// 8000 ~ 10000
enum ProxyRPC {
    PROXY_RPC_NONE = 0;
    REQ_HEARTBEAT = 8001; // 心跳包
    ACK_HEARTBEAT = 8002; // 代理服务器响应

    REQ_CONNECT_PROXY = 8003;
    ACK_CONNECT_PROXY = 8004;
    REQ_DISCONNECT_PROXY = 8005;
    ACK_DISCONNECT_PROXY = 8006;

    ACK_KICK_OFF = 8010; // 被踢下线
}

////////////////////////////////////////////////////

message ReqConnectProxy {
    bytes account_id = 1;
    bytes key = 2;
}

message AckConnectProxy { int32 code = 1; }

message ReqDisconnectProxy {}
message AckDisconnectProxy { int32 code = 1; }

message ReqHeartBeat { int32 index = 1; }

message AckHeartBeat { int32 index = 1; }

message AckKickOff { int64 time = 1; }// 描述: 各服务器之间的通信RPC
// 使用: 服务器,客户端

// only be used in inner server
message MsgBase {
    bytes guid = 1;
    bytes msg_data = 2;
    repeated bytes broadcast = 3;
}

// Servers RPC 0 ~ 500
enum ServerRPC {
    SERVER_RPC_NONE = 0;

    REQ_REGISTER = 1;
    ACK_REGISTER = 2;

    REQ_UNREGISTER = 3;
    ACK_UNREGISTER = 4;

    REQ_REPORT = 5; // 服务端报告服务状态
    ACK_REPORT = 6;

    CLOSE_SOCKET = 100; // want to close some one
    SERVER_ADD = 101;

    SERVER_HEARTBEAT = 103; // 服务端之间心跳包

    SERVER_MSG_TRANSMISSION = 200; // 无连接的服务端之间的消息转发, 由代理来进行转发消息
}

enum ServerState {
    ServerCrash = 0;
    ServerNormal = 1;
    ServerBusy = 2;
    ServerFrie = 3;
}

message Server {
    int32 id = 1;
    bytes name = 2;
    bytes ip = 3;
    int32 port = 4;
    int32 max_online = 5;
    int32 cpu_count = 6;
    ServerState state = 7;
    int32 type = 8;
    int32 area = 9; // 区
    int32 connections = 10;
    int32 workload = 11;
    bytes key = 12; //密钥
    bytes public_ip = 13;
    int32 update_time = 14; // 更新时间
    repeated int32 parent_list = 15; // 父节点
    repeated int32 child_list = 16; // 子节点
}

message ReqRegisterServer {
    int32 id = 1;
    bytes key = 2;
    repeated Server list = 3;
}

message AckRegisterServer {
    int32 code = 1;
    int32 depth = 2; // 节点深度
    repeated Server list = 3;
}

message ReqReport {
    int32 id = 1;
    repeated Server list = 2;
}

message AckReport {
    int32 code = 1;
    repeated Server list = 2;
}

message ReqUnregisterServer {}

message AckUnregisterServer { int32 code = 1; }

message ServerList { repeated Server list = 1; }

message ServerHeartBeat { int32 count = 1; }// 各服务器之间的通信RPC

// Servers RPC 50000 ~ 50200
enum TestRPC {
    TEST_RPC_NONE = 0;

    REQ_TEST_PROXY = 50000;
    ACK_TEST_PROXY = 50001;

    REQ_TEST_GAMEPLAY = 50002;
    ACK_TEST_GAMEPLAY = 50003;

    REQ_TEST_PLAYER_DATA_READ = 50004;
    REQ_TEST_PLAYER_DATA_WRITE = 50005;

}

message Test {
    int32 index = 1;
    int64 req_time = 2;
    bytes data = 3;
}
enum WorldRPC {
    WORLD_RPC_NONE = 0;
}

]]