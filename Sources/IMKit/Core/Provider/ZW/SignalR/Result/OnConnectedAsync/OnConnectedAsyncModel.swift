//
//  OnConnectedAsync.swift
//  little-store
//
//  Created by 张朝富 on 2023/10/31.
//

import Foundation
import KakaJSON

public struct OnConnectedAsyncDataModel: Convertible, Decodable {
    public init() {}
    /// 我的
    public  var mine = OnConnectedAsyncMine()
    /// 好友
    public var friend: [OnConnectedAsyncFriendGroup] = []
    /// 群
    public var group: [OnConnectedAsyncGroup] = []
}

/// 初始化消息 我的
public struct OnConnectedAsyncMine: Convertible, Decodable {
    public init() {}
    /// id
    public var id = 0
    /// 用户名
    public var username = Default.username
    /// 昵称
    public var nickname = Default.nickname
    /// 头像
    public var avatar = Default.avatar
    /// 添加好友方式
    public var addtype = ""
}

/// 初始化消息 好友分组
public struct OnConnectedAsyncFriendGroup: Convertible, Decodable {
    public init() {}
    /// id
    public var id = 0
    /// 排序
    public var sort = 0
    /// 分组名称
    public var groupname = "未知分组名"
    /// 好友列表
    public var list: [ChatFriend] = []
}

// 初始化消息 好友
public struct ChatFriend: Convertible, Decodable {
    public init() {}
    /// id
    public var id = 0
    /// 用户名
    public var username: String? = nil
    /// 昵称
    public var nickname: String? = nil
    /// 头像
    public  var avatar = Default.avatar
    /// 店主id 为0 则非店主
    public var agentid = 0
}

/// 初始化消息 群
public struct OnConnectedAsyncGroup: Convertible, Decodable {
    public init() {}
    /// id
    public var id = 0
    /// 禁言
    public var nospeak = false
    /// 群名称
    public var groupname = "默认群聊"
    /// 加群方式
    public  var addtype = ""
    /// 群头像
    public var avatar = Default.avatar
    /// 群公告
    public var notice: String? = nil
}
