//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import Foundation
import WCDBSwift


public final class Session:TableCodable {
    
    /// 初始化方法
    public init(
        id: String,
        type: SessionType,
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
    
    /// 会话唯一 ID
    public var id: String = ""
    
    /// 会话类型
    public var type:SessionType = .single
    
    /// 会话名称（用户昵称 or 群名）
    public var name: String = "默认会话名称"

    /// 头像 URL（用户 or 群组）
    public var avatar: URL = DefaultAvatar

    /// 最近一条消息摘要
    public var lastMessage: String = "默认最新消息"

    /// 最近消息的时间（用于排序）
    public var lastMessageTime: Date = .now

    /// 未读消息数量
    public var unreadCount: Int = 1

    /// 是否置顶
    public var isTop: Bool = false

    /// 草稿消息（未发送内容）
    public var draft: String? = nil
    
    /// 聊天人数
    public var memberCount:Int = 1
    
    
    public enum CodingKeys:String,CodingTableKey {
        public typealias Root = Session
    
        case id
        case type
        case name
        case avatar
        case lastMessage
        case lastMessageTime
        case unreadCount
        case isTop
        case draft
        case memberCount
    
        
        public static let objectRelationalMapping = TableBinding(CodingKeys.self) {
            BindColumnConstraint(
                id,
                isPrimary: true, // 设为主键
                onConflict: .Replace, // 冲突时更新
                isNotNull: false, // 不可为空
                isUnique: true // 字段唯一
            )
        }
    }
}



/// 示例消息
let DefaultSession = Session(
    id: "u_1",
    type: .single,
    name: "1号好友",
    unreadCount: 1,
    avatar: DefaultAvatar,
    lastMessageTime:Date(),
    lastMessage:  "这是一条很长很长很长很长很长很长很长很长很长很长的消息",
)

/// 置顶消息
let DefaultTopSession = Session(
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
let DefaultSession2 = Session(
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
let DefaultSession3 = Session(
    id: "u_4",
    type: .single,
    name: "4号好友",
    unreadCount: 21,
    avatar: DefaultAvatar,
    lastMessageTime:Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
    lastMessage:  "这是一条很长很长很长很长很长很长很长很长很长很长的消息",
)

/// 群聊
let DefaultSessionGroup = Session(
    id: "g_4",
    type: .group,
    name: "4号群",
    unreadCount: 19923,
    avatar: DefaultAvatar,
    lastMessageTime:Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
    lastMessage:  "这是最新的一条消息",
    memberCount: 213
)

/// 群聊
let MockSessionGroup = Session(
    id: "g_4",
    type: .group,
    name: "4号群-Mock",
    unreadCount: 19923,
    avatar: DefaultAvatarMock,
    lastMessageTime:Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
    lastMessage:  "这是最新的一条消息",
    memberCount: 213
)

let MockSessions = [
    MockSessionGroup
]

let DefaultSessions = [
    DefaultSession,
    DefaultTopSession,
    DefaultSession2,
    DefaultSession3,
    DefaultSessionGroup
]
