//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/23.
//

import SwiftUI

/// 用户
public struct User:Identifiable,Codable,Hashable {
    
    public init(id: String, name: String, avatar: URL) {
        self.id = id
        self.name = name
        self.avatar = avatar
    }
    
    public init(fromZWUserInfo u:ZWUserInfo){
        self.id = "\(u.Id)"
        self.name = u.NickName
        self.avatar = URL(string:"\(u.PlayerApi)\(u.HeadUrl)") ?? DefaultAvatar
    }
    
    public var id:String
    public var name:String
    public var avatar:URL
}


let DefaultUser = User(id: "defalut.user", name: "默认用户", avatar: DefaultAvatar)
