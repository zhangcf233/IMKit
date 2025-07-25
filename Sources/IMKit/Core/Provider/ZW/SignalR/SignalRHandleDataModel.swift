//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/23.
//

import Foundation
import KakaJSON

/// 消息 arguments
struct Arguments<T:Decodable>:Convertible,Decodable {
    var code = 0
    var msg = ""
    var type = ""
    var data:T? = nil
}

/// 消息参数基础数据
struct ArgumentsData: Convertible,Decodable{
    
    //MARK: 初始化
    /// 初始化 我的数据
    var mine:OnConnectedAsyncMine? = nil
    /// 初始化 好友分组数据
    var friend:[OnConnectedAsyncFriendGroup]? = []
    /// 初始化 群数据
    var group:[OnConnectedAsyncGroup]? = []
    
    //MARK: 收到好友验证消息
    /// 申请好友 类型 user ｜ from  创建群聊 type mine  ｜ from
    var type:String? = nil
    /// 申请好友id
    var playerId:Int? = nil
    /// 记录id
    var logId:Int? = nil
    /// 分组id
    var friendGroupId:Int? = nil
    
    //MARK: 同意好友消息
    var friendId:Int? = nil
    
    //MARK: 创建群聊
    /// 群id
    var groupId:Int? = nil
    /// 群成员id
    var friendIds:[Int]? = nil
    
    //MARK: 踢出群聊
    /// 管理员id
    var adminId:Int? = nil
    /// 踢出的成员列表
    var playerIds:[Int]? = nil
    
    //MARK: 验证进群
    /// 被邀请信息
    var toPlayerId:Int? = nil
    var toHeadUrl:String? = nil
    var toNickName:String? = nil
    /// 邀请者信息
    var fromPlayerId:Int? = nil
    var fromHeadUrl:String? = nil
    var fromNickName:String? = nil
    
    //MARK: 撤回消息
    /// 被撤回的消息 id
    var id:Int? = nil
    
}

/// 接收消息结构
struct SendMessageAsyncData:Convertible,Decodable {
    //MARK: 收到消息
    // 系统消息
    var system:Bool? = nil
    // 类型
    var type:String? = nil
    // 消息编号
    var cid:Int? = nil
    // 发送者id
    var fromid:Int? = nil
    // 时间戳
    var timestamp:Int? = nil
    // 是否自己发的
    var mine:Bool? = nil
    // 内容
    var content:String? = nil
    // id 接收方
    var id:Int? = nil
    // 用户名
    var username:String? = nil
    // 头像
    var avatar:String? = nil
}

/// 发送内容结构
struct ChatSendContent:Convertible{
    /// 消息类型
    var msgType = "text"
    /// 内容
    var content:String? = nil
    /// 图片地址
    var url:String? = nil
    /// 图片宽度
    var width:Int? = nil
    /// 图片高度
    var height:Int? = nil
}

/// 发送组图内容结构
struct ChatSendMultipleImageContent:Convertible{
    /// 消息类型
    var msgType = "multiple-pictures"
    /// 图片列表
    var imgs:[ChatSendMultipleImage] = []
}

/// 组图单张图片结构
struct ChatSendMultipleImage:Convertible{
    /// 图片地址
    var url = ""
    /// 图片宽度
    var width = 0
    /// 图片高度
    var height = 0
}
