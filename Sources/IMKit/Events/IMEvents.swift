//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/21.
//

import Foundation

extension Notification.Name{
    /// 登录成功
    public static let IM_OnLoginSuccess = Notification.Name("IM_OnLoginSuccess")
    
    /// 鉴权失败
    public static let IM_OnAuthFailed = Notification.Name("IM_OnAuthFailed")
    
    /// 链接成功
    public static let IM_OnConnected = Notification.Name("IM_OnConnected")
}
