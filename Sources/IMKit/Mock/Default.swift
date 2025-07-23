//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import Foundation

public let DefaultAvatarUrl = "https://dummyimage.com/100x100/000/fff&text=avatar"

public let DefaultAvatar = URL(string: DefaultAvatarUrl)!

public let DefaultAvatar2 = URL(string: "https://dummyimage.com/100x100/000/fff&text=user2")!
public let DefaultAvatar3 = URL(string: "https://dummyimage.com/100x100/000/fff&text=user3")!
let DefaultAvatar4 = URL(string: "https://dummyimage.com/100x100/000/fff&text=user4")!

let DefaultName = ""

public let DefaultNickname = "默认昵称"
public let DefaultUsername = "默认用户名"
public let DefaultDsc = "默认描述"
public let DefaultErrorMsg = "未知异常"

public struct DefaultDataModel {
    public var avatar: String
    public var nickname: String
    public var username: String
    public var dsc: String
    public var errorMsg: String
}

/// 默认配置
public let Default = DefaultDataModel(
    avatar: DefaultAvatarUrl,
    nickname: DefaultNickname,
    username: DefaultUsername,
    dsc: DefaultDsc,
    errorMsg: DefaultErrorMsg,
)
