//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import Foundation
import KakaJSON

/// MARK:  消息类型
public enum MessageType:String,Codable,Hashable {
    case text
}

/// MARK: 消息内容
public enum MessageContent:String,ConvertibleEnum {
    case text = ""
}

/// MARK:  消息状态
public enum MessageStatus:String,Codable,Hashable {
    case sending // 发送中
    case sent // 发送成功
    case failed // 发送失败
    case received // 接收成功
    case read // 已读
}

/// 发送者类型
public enum SenderType:String,Codable,Hashable {
    case mine
    case other
}

/// MARK:  发送者信息
public struct Sender:Codable,Hashable {
    public let id:String
    public let name:String
    public let avatar:URL
    public let type:SenderType
    
    public init(id: String, name: String, avatar: URL,type:SenderType = .other) {
        self.id = id
        self.name = name
        self.avatar = avatar
        self.type = type
    }
}

let sender1 = Sender(id: "u_1", name: "张三", avatar: DefaultAvatar2,type: .mine)
let sender2 = Sender(id: "u_2", name: "李四", avatar: DefaultAvatar3)
let sender3 = Sender(id: "u_3", name: "王二", avatar: DefaultAvatar4)
let senderLongName = Sender(id: "u_3", name: "王二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二", avatar: DefaultAvatar4)

/// 聊天消息
public struct Message:Identifiable,Codable,Hashable {
    
    /// 消息编号
    public var id:String { serverMessageId ?? clientMessageId }
    /// 原始 id
    public let clientMessageId:String
    /// 服务端分配 id
    public let serverMessageId:String?
    /// 消息类型
    public let type:MessageType
    /// 消息内容
    public var content:String
    /// 创建时间
    public var createdAt:Date
    /// 发送者信息
    public var sender:Sender
    /// 消息状态
    public var status:MessageStatus
    
    var isMine:Bool {
        return sender.type == .mine
    }
    
    public init(
        type: MessageType = .text,
        content: String,
        createdAt: Date = .now,
        sender: Sender,
        status: MessageStatus = .sent,
    ) {
        self.clientMessageId = UUID().uuidString
        self.serverMessageId = nil
        self.type = type
        self.content = content
        self.createdAt = createdAt
        self.sender = sender
        self.status = status
    }
    
}


let msg1 = Message(content: "这是一条测试消息", sender:sender1)

let msg2 = Message(content: "这是第二条测试消息", sender:sender2)

let msgLongName = Message(content: "这是第二条测试消息", sender:senderLongName)

let msgLast = Message(content: "这是最后一条测试消息", sender:sender2)

let msgLong = Message(content: "这是一条收到的很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的测试消息", sender:sender2)

let msgLongMine = Message(content: "这是一条自己发送的很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的测试消息", sender:sender1)

let defalutMessages = [
    msg1,
    msg2,
    msgLongName,
    msg1,
    msg2,
    msgLongName,
    msg1,
    msgLong,
    msg2,
    msgLongName,
    msg1,
    msgLong,
    msg2,
    msgLongName,
    msg1,
    msgLong,
    msg2,
    msgLongName,
    msg1,
    msg2,
    msgLongName,
    msg1,
    msg2,
    msgLongName,
    msg1,
    msg2,
    msgLast
]
