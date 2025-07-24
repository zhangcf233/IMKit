//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import Foundation

public enum ConversationType:String,Codable {
    /// 单聊
    case single
    /// 群聊
    case group
}

public struct Conversation:Identifiable,Codable,Hashable {
    /// 会话唯一 ID
    public let id: String
    
    /// 会话类型
    public let type:ConversationType
    
    /// 会话名称（用户昵称 or 群名）
    public let name: String

    /// 头像 URL（用户 or 群组）
    public let avatar: URL

    /// 最近一条消息摘要
    public let lastMessage: String

    /// 最近消息的时间（用于排序）
    public let lastMessageTime: Date

    /// 未读消息数量
    public var unreadCount: Int

    /// 是否置顶
    public var isTop: Bool

    /// 草稿消息（未发送内容）
    public var draft: String?
    
    /// 聊天人数
    public var memberCount:Int
    
    /// 初始化方法
    public init(
        id: String,
        type: ConversationType,
        name: String,
        unreadCount: Int,
        avatar: URL,
        lastMessageTime: Date,
        lastMessage: String,
        isTop: Bool = false,
        draft: String? = nil,
        memberCount:Int = 1
    ) {
        self.id = id
        self.type = type
        self.name = name
        self.avatar = avatar
        self.lastMessage = lastMessage
        self.lastMessageTime = lastMessageTime
        self.unreadCount = unreadCount
        self.isTop = isTop
        self.draft = draft
        self.memberCount = memberCount
    }
    
}



/// 示例消息
let DefaultConversation = Conversation(
    id: "u_1",
    type: .single,
    name: "1号好友",
    unreadCount: 1,
    avatar: DefaultAvatar,
    lastMessageTime:Date(),
    lastMessage:  "这是一条很长很长很长很长很长很长很长很长很长很长的消息",
)

/// 置顶消息
let DefaultTopConversion = Conversation(
    id: "u_2",
    type: .single,
    name: "2号好友",
    unreadCount: 100,
    avatar: DefaultAvatar,
    lastMessageTime:Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
    lastMessage:  "这是一条昨天的消息",
    isTop: true
)

/// 置顶消息
let DefaultConversion2 = Conversation(
    id: "u_3",
    type: .single,
    name: "3号好友",
    unreadCount: 2,
    avatar: DefaultAvatar,
    lastMessageTime:Calendar.current.date(from: DateComponents(year: 2021, month: 1, day: 1, hour: 9, minute: 0))!,
    lastMessage:  "这是一条很长很长很长很长很长很长很长很长很长很长的消息",
    isTop: true
)

/// 置顶消息
let DefaultConversion3 = Conversation(
    id: "u_4",
    type: .single,
    name: "4号好友",
    unreadCount: 21,
    avatar: DefaultAvatar,
    lastMessageTime:Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
    lastMessage:  "这是一条很长很长很长很长很长很长很长很长很长很长的消息",
)

/// 群聊
let DefaultConversionGroup = Conversation(
    id: "g_4",
    type: .group,
    name: "4号群",
    unreadCount: 19923,
    avatar: DefaultAvatar,
    lastMessageTime:Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
    lastMessage:  "这是最新的一条消息",
    memberCount: 213
)

let DefaultConversions = [
    DefaultConversation,
    DefaultTopConversion,
    DefaultConversion2,
    DefaultConversion3,
    DefaultConversionGroup
]
