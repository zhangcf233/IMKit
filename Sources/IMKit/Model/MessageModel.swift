//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import Foundation

/// MARK:  消息类型
public enum MessageType:String,Codable,Hashable {
    case text
}

/// MARK:  消息状态
public enum MessageStatus:String,Codable,Hashable {
    case sending // 发送中
    case sent // 发送成功
    case failed // 发送失败
    case received // 接收成功
    case read // 已读
}

/// MARK:  发送者信息
public struct Sender:Codable,Hashable {
    public let id:String
    public let name:String
    public let avatar:URL
    
    public init(id: String, name: String, avatar: URL) {
        self.id = id
        self.name = name
        self.avatar = avatar
    }
}

let sender1 = Sender(id: "u_1", name: "张三", avatar: DefaultAvatar2)
let sender2 = Sender(id: "u_2", name: "李四", avatar: DefaultAvatar3)
let sender3 = Sender(id: "u_3", name: "王二", avatar: DefaultAvatar4)
let senderLongName = Sender(id: "u_3", name: "王二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二", avatar: DefaultAvatar4)

/// 聊天消息
public struct Message:Identifiable,Codable,Hashable {
    
    public let id:String
    public let type:MessageType
    public var content:String
    public var createdAt:Date
    public var sender:Sender
    public var status:MessageStatus
    public let isSender:Bool
    
    public init(
        id: String = UUID().uuidString,
        type: MessageType = .text,
        content: String,
        createdAt: Date = .now,
        sender: Sender,
        status: MessageStatus = .sent,
        isSender:Bool
    ) {
        self.id = id
        self.type = type
        self.content = content
        self.createdAt = createdAt
        self.sender = sender
        self.status = status
        self.isSender = isSender
    }
    
}


let msg1 = Message(content: "这是一条测试消息", sender:sender1,isSender: false)

let msg2 = Message(content: "这是第二条测试消息", sender:sender2,isSender: true)

let msgLongName = Message(content: "这是第二条测试消息", sender:senderLongName,isSender: true)

let msgLong = Message(content: "这是一条收到的很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的测试消息", sender:sender2,isSender: false)

let msgLongMine = Message(content: "这是一条自己发送的很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的测试消息", sender:sender2,isSender: true)

let messages = [
    msg1,msg2,msgLongName,msgLong,msgLongMine
]
