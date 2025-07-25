//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/25.
//

import Foundation
import KakaJSON


/// 请求的方法
public enum ZWApi {
    
    /// 获取用户信息
    case getUserInfo
    
}


extension ZWApi {
    /// 请求路径
    var path:String {
        switch self {
        case .getUserInfo: "/PlayerUser/GetUserInfo"
            
        }
    }
    
    /// 返回值类型
    var responseType:Convertible{
        switch self {
        case .getUserInfo: ZWUserInfo.self as! Convertible
            
        }
    }
}
