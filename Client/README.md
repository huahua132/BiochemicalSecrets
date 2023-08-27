# 生化密码客户端代码

## 介绍

采用UE4引擎打造，包含客户端代码以及专用服务器代码，使用了腾讯Unlua框架，逻辑全采用蓝图和Lua来进行编写。

协议走http+json和tcp+protobuf



## 目录

Docs: 文档

Excel: 策划数据配置表

Tools: 工具



### 支持多平台

#### 已打包测试平台

##### 客户端

Mobile: Android、IOS

PC: Windows、Linux

##### 服务端

WindowsGUI(开发用)、LinuxGUI(开发用)、Linux(Linux专用服务器，部署用)





## 服务端打包与启动流程

### 打包

打包服务器前，先禁用掉PicoXR 相关的插件。

#### 有渲染测试服务器打包

设置Blueprints/G_Instance 中的PlatformGroup变量为Server, ServerPlatform为 WindowsGUI或LinuxGUI

BuildTarget选择Action

将Game的启动场景设置为 Maps/Server

打包为Windows或Linux



#### 无渲染专用服务器打包

设置Blueprints/G_Instance 中的PlatformGroup变量为Server, ServerPlatform为 Windows或Linux

BuildTarget选择ActionServer

将Server的启动场景设置为 Maps/Server

采用源码版UE4进行打包为Windows或者Linux



## 启动场景

客户端入口场景： Maps/Splash

服务端入口场景：Maps/Server



## UE4插件

### Unlua

版本号：v2.3.2

[下载](https://img.shields.io/github/v/release/Tencent/UnLua)

#### 介绍

本项目集成了 Unlua 系列的插件，方便开发者使用lua脚本进行Protobuf + Socket的包自定义交互协议。

Lua与蓝图、C++互相调用，请参考：https://github.com/Tencent/UnLua

Unlua也接入了常使用的基本网络库，在Plugins/UnLuaExtensions/下，分别为 LuaProtobuf、LuaRapidjson、LuaSocket，但没有提供相关学习例子，我进行了部分整理，如下：

LuaProtobuf序列化反序列化如何使用，请参考： https://github.com/starwing/lua-protobuf

LuaSocket如何使用，请参考：https://github.com/lunarmodules/luasocket

LuaRapidjson如何使用，请参考：https://github.com/xpol/lua-rapidjson
