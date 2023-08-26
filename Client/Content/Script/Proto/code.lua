----------------------------------------------------------------------------------
-- don't edit it, generated from .proto files by tools
----------------------------------------------------------------------------------

proto_code = [[
// 基础定义

syntax = "proto3";
package rpc;

message Ident {
    int64 svrid = 1;
    int64 index = 2;
}

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
}

///////////////////////////////////////////////////////////////////
// only be used between proxy-server and game-server
message MsgBase {
    Ident player_id = 1;
    bytes msg_data = 2;
    repeated Ident player_client_list = 3;
    Ident hash_ident = 4;
}// 数据库 RPC

message PropertyInt {
    bytes property_name = 1;
    int64 data = 2;
    int64 reason = 3;
}

message PropertyFloat {
    bytes property_name = 1;
    float data = 2;
    int64 reason = 3;
}

message PropertyString {
    bytes property_name = 1;
    bytes data = 2;
    int64 reason = 3;
}

message PropertyObject {
    bytes property_name = 1;
    Ident data = 2;
    int64 reason = 3;
}

message PropertyVector2 {
    bytes property_name = 1;
    Vector2 data = 2;
    int64 reason = 3;
}

message PropertyVector3 {
    bytes property_name = 1;
    Vector3 data = 2;
    int64 reason = 3;
}

///////////////////////////////////////////////

message RecordInt {
    int32 row = 1;
    int32 col = 2;
    int64 data = 3;
}

message RecordFloat {
    int32 row = 1;
    int32 col = 2;
    float data = 3;
}

message RecordString {
    int32 row = 1;
    int32 col = 2;
    bytes data = 3;
}

message RecordObject {
    int32 row = 1;
    int32 col = 2;
    Ident data = 3;
}

message RecordVector2 {
    int32 row = 1;
    int32 col = 2;
    Vector2 data = 3;
}

message RecordVector3 {
    int32 row = 1;
    int32 col = 2;
    Vector3 data = 3;
}

message RecordAddRowStruct {
    int32 row = 1;
    repeated RecordInt record_int_list = 2;
    repeated RecordFloat record_float_list = 3;
    repeated RecordString record_string_list = 4;
    repeated RecordObject record_object_list = 5;
    repeated RecordVector2 record_vector2_list = 6;
    repeated RecordVector3 record_vector3_list = 7;
}
message ObjectRecordBase {
    bytes record_name = 1;
    repeated RecordAddRowStruct row_struct = 2;
}

/////////////////////////////////////////////////

message ObjectPropertyInt {
    Ident player_id = 1;
    repeated PropertyInt property_list = 2;
}

message ObjectPropertyFloat {
    Ident player_id = 1;
    repeated PropertyFloat property_list = 2;
}

message ObjectPropertyString {
    Ident player_id = 1;
    repeated PropertyString property_list = 2;
}

message ObjectPropertyObject {
    Ident player_id = 1;
    repeated PropertyObject property_list = 2;
}

message ObjectPropertyVector2 {
    Ident player_id = 1;
    repeated PropertyVector2 property_list = 2;
}

message ObjectPropertyVector3 {
    Ident player_id = 1;
    repeated PropertyVector3 property_list = 2;
}

message ObjectRecordInt {
    Ident player_id = 1;
    bytes record_name = 2;
    repeated RecordInt property_list = 3;
}

message ObjectRecordFloat {
    Ident player_id = 1;
    bytes record_name = 2;
    repeated RecordFloat property_list = 3;
}

message ObjectRecordString {
    Ident player_id = 1;
    bytes record_name = 2;
    repeated RecordString property_list = 3;
}

message ObjectRecordObject {
    Ident player_id = 1;
    bytes record_name = 2;
    repeated RecordObject property_list = 3;
}

message ObjectRecordVector2 {
    Ident player_id = 1;
    bytes record_name = 2;
    repeated RecordVector2 property_list = 3;
}

message ObjectRecordVector3 {
    Ident player_id = 1;
    bytes record_name = 2;
    repeated RecordVector3 property_list = 3;
}

message ObjectRecordSwap {
    Ident player_id = 1;
    bytes origin_record_name = 2;
    bytes target_record_name = 3;
    int32 row_origin = 4;
    int32 row_target = 5;
}

message ObjectRecordAddRow {
    Ident player_id = 1;
    bytes record_name = 2;
    repeated RecordAddRowStruct row_data = 3;
}

message ObjectRecordRemove {
    Ident player_id = 1;
    bytes record_name = 2;
    repeated int32 remove_row = 3;
}

///////////////////////////////////////////////////////////////////
// send all properties as a pack when client log in or log off
message ObjectPropertyList {
    Ident player_id = 1;
    repeated PropertyInt property_int_list = 2;
    repeated PropertyFloat property_float_list = 3;
    repeated PropertyString property_string_list = 4;
    repeated PropertyObject property_object_list = 5;
    repeated PropertyVector2 property_vector2_list = 6;
    repeated PropertyVector3 property_vector3_list = 7;
}

message MultiObjectPropertyList { repeated ObjectPropertyList multi_player_property = 1; }

message ObjectRecordList {
    Ident player_id = 1;
    repeated ObjectRecordBase record_list = 2;
}

message MultiObjectRecordList { repeated ObjectRecordList multi_player_record = 1; }


// 30000 ~ 35000
enum DbProxyRPC {
    DB_RPC_NONE = 0;

    REQ_PLAYER_LIST = 30000;
    ACK_PLAYER_LIST = 30001;
    REQ_PLAYER_CREATE = 30002;
    REQ_PLAYER_DELETE = 30003;

    REQ_PLAYER_DATA_LOAD = 30004; // 加载玩家数据
    ACK_PLAYER_DATA_LOAD = 30005; //
    REQ_PLAYER_DATA_SAVE = 30006; // 请求保存玩家数据
    ACK_PLAYER_DATA_SAVE = 30007; //
}

enum DbType {
    DB_TYPE_NONE = 0;
    MYSQL = 1;
    MONGO = 2;
    REDIS = 3;
}

message DbPlayerData {
    Ident object = 1;
    Ident guid = 2;
    bytes account = 3;
    ObjectPropertyList property = 4;
    ObjectRecordList record = 5;
}

enum DbCMD {
    DB_CMD_NONE = 0;
    DB_QUERY = 1;
    DB_INSERT = 2;
    DB_UPDATE = 3;
    DB_DELETE = 4;
}

message ReqDbQuery {
    int32 query_id = 1;
    DbCMD cmd = 2;
    bytes db = 3;
    bytes args = 4;
}


message Col {
}

message Row {
    repeated Col d = 1;
}


message AckDbQuery {
    int32 query_id = 1;
    DbCMD cmd = 2;
    bytes db = 3;
    map<int32, bytes> result = 4;
}
// 房间、匹配、副本


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
    Ident player = 2;
}

// 请求退出房间
message ReqRoomQuit { int32 room_id = 1; }

message AckRoomQuit {
    int32 code = 1;
    Ident player = 2;
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
    Ident guid = 1;
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
    Ident owner = 3;                 // 房主
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
// 游戏玩法基本RPC

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
    Ident guid = 1;
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
    repeated Ident list = 1;
}
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
    repeated PlayerData players = 5;
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

message AckGameplayPrepared { int32 code = 1; }// 大厅RPC

// GameLobbyRPC RPC 10000 ~ 12000
enum LobbyBaseRPC {
    // 进入游戏前的RPC  ////////////////////////////
    LOBBY_BASE_RPC_NONE = 0;

    REQ_BASIC_PLAYER_DATA = 10000; // 进入服务器之前获取基本游戏信息
    ACK_BASIC_PLAYER_DATA = 10001;

    REQ_NEW_PLAYER = 10002; // 创建新玩家
    ACK_NEW_PLAYER = 10003;

    REQ_ENTER = 10100; // 进入游戏大厅
    ACK_ENTER = 10101; //

    REQ_RECONNECT = 10102;
    ACK_RECONNECT = 10103;

    // 进入游戏后的 RPC ////////////////////////////
    REQ_LEAVE = 10110; // 退出
    ACK_LEAVE = 10111; //
}

message ReqEnter {
    Ident object = 1;  // 游戏对象guid
    Ident guid = 2;    // 账号guid
    bytes account = 3; // 登录账号
}

message AckEnter {
    int32 code = 1;
    Ident guid = 2;
    Ident object = 3; // 相当于是一个Player
}

message ReqLeave {}
message AckLeave {}

message ReqReconnect {}
message AckReconnect {}

// proxy或客户端告知game服务器的
message AckPlayerOffline {
    Ident self = 1;
    Ident object = 2;
    int32 game = 3;
    int32 proxy = 4;
}// 玩家RPC

// LobbyPlayerRPC 12000 ~ 15000
enum LobbyPlayerRPC {
    LOBBY_PLAYER_RPC_NONE = 0;

    REQ_PLAYER_DATA = 12000; // 获取玩家详细全部数据
    ACK_PLAYER_DATA = 12001;

    REQ_PLAYER_PUBLIC_DATA = 12002; // 获取玩家公有数据, 查看其他玩家的数据或游戏开局使用
    ACK_PLAYER_PUBLIC_DATA = 12003;

    REQ_PLAYER_EQUIPMENT = 12004; // 玩家的装备信息
    ACK_PLAYER_EQUIPMENT = 12005;
}

message BasicPlayerData {
    Ident object = 1;
    bytes name = 2;
}

message ReqBasicPlayerData {}

message AckBasicPlayerData { repeated BasicPlayerData list = 1; }

message ReqNewPlayer { bytes name = 1; }

message AckNewPlayer {
    int32 code = 1;
    Ident object = 2;
}

message ReqPlayerData {}

message PlayerData {
    int32 room = 2;
    int32 gameplay = 3;

    int32 mask = 4;
    repeated int32 masks = 5;
    int32 glove = 6;
    repeated int32 gloves = 7;
}


message AckPlayerData {
    int32 code = 1;
    PlayerData data = 2;
}

// REQ_PLAYER_PUBLIC_DATA
message ReqPlayerPublicData { Ident guid = 1; }

message AckPlayerPublicData {
    int32 code = 1;
    Ident guid = 2;
    repeated int32 masks = 3;
    repeated int32 gloves = 4;
}

message ReqPlayerEquipment { Ident guid = 1; }


message AckPlayerEquipment {
    int32 code = 1;
    Ident guid = 2;
    int32 mask = 3;
    int32 glove = 4;
}


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
}// 微服务器RPC，包含了聊天、语音等

// GameLobbyRPC RPC 15000 ~ 16000
enum MicroRPC {
    MICRO_RPC_NONE = 0;
    REQ_CHAT = 1;
    ACK_CHAT = 2;
}
// 代理服务器RPC

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
    Ident guid = 1; // account的guid
    bytes key = 2;
}

message AckConnectProxy { int32 code = 1; }

message ReqDisconnectProxy {}
message AckDisconnectProxy { int32 code = 1; }

message ReqHeartBeat { int32 index = 1; }

message AckHeartBeat { int32 index = 1; }

message AckKickOff { int64 time = 1; }// 各服务器之间的通信RPC

// Servers RPC 0 ~ 500
enum ServerRPC {
    SERVER_RPC_NONE = 0;

    REQ_REGISTER = 1;
    ACK_REGISTER = 2;

    REQ_UNREGISTER = 3;
    ACK_UNREGISTER = 4;

    REQ_REPORT = 5; // 服务端报告服务状态
    ACK_REPORT = 6;

    PLAYER_ENETER = 10;
    PLAYER_LEAVE = 11;
    PLAYER_OFFLINE = 12;

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

// 玩家在线
message PlayerEneter {
    Ident guid = 1;
    bytes name = 2;
    bytes account = 3;
    int32 world_id = 4;
    int32 game_id = 5;
    int32 micro_id = 6;
    int32 lobby_id = 7;
    int32 gameplay_manager_id = 8;
}

// 玩家离线
message PlayerLeave { Ident guid = 1; }

message ServerList { repeated Server list = 1; }

message ServerHeartBeat { int32 count = 1; }


// Game command
message ReqServerCommand {
    enum EGameCommandType {
        EGCT_MODIY_PROPERTY = 0; //[property_name,value]
        EGCT_MODIY_ITEM = 1;     //[item_id,count]
        EGCT_CREATE_OBJECT = 2;  //[object_index,count]
        EGCT_ADD_ROLE_EXP = 3;   //
    }
    Ident control_id = 1;
    EGameCommandType command_id = 2;
    bytes command_str_value = 3;
    int64 command_value_int = 4;
    double command_value_float = 5;
    bytes command_value_str = 6;
    Ident command_value_object = 7;
    int32 row = 8;
    int32 col = 9;
}
// 各服务器之间的通信RPC

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