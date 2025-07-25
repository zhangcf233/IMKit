//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/25.
//

import Foundation
import KakaJSON

/// 登录失效
public struct ZWAuthFailed:Convertible {
    
    public init(){
        
    }
    
    var Status = false
    var Message = ""
    var Data = 401
}

/// 用户信息
public struct ZWUserInfo:Convertible {
    
    public init(){
        
    }
    
    var Id = 0
    var NickName = "默认昵称"
    var HeadUrl = ""
    var PlayerApi = ""
}



