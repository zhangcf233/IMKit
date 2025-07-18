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
    public var isTop: Bool?

    /// 草稿消息（未发送内容）
    public var draft: String?
    
    /// 初始化方法
    public init(
        id: String,
        type: ConversationType,
        name: String,
        unreadCount: Int,
        avatar: URL,
        lastMessageTime: Date,
        lastMessage: String,
        isTop: Bool? = false,
        draft: String? = nil
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
    }
    
}



/// 示例消息
let DefaultConversation = Conversation(
    id: "u_2",
    type: .single,
    name: "王五",
    unreadCount: 2,
    avatar: DefaultAvatar,
    lastMessageTime:Date(),
    lastMessage:  "最近好吗？",
)

/// 置顶消息
let DefaultTopConversion = Conversation(
    id: "u_2",
    type: .single,
    name: "张三",
    unreadCount: 2,
    avatar: DefaultAvatar,
    lastMessageTime:Date(),
    lastMessage:  "最近好吗？",
    isTop: true
)

let DefaultConversions = [
    DefaultConversation,
    DefaultTopConversion
]
