//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/23.
//

import Foundation

/// 用户
public struct User:Identifiable,Codable,Hashable {
    public var id:String
    public var name:String
    public var avatar:URL
}
