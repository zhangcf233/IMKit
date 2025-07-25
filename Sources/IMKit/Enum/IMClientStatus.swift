//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/22.
//

import Foundation

/// 连接状态
public enum IMStatus {
    /// 未连接
    case disconnected
    /// 载入用户信息
    case loadingUserInfo
    /// 聊天连接中
    case connecting
    /// 聊天连接失败
    case fail
    /// 聊天重连中
    case reconnect
    /// 连接成功
    case success
    /// 认证失败
    case authFailed
    
    var name:String {
        switch self {
        case .disconnected:
            "未连接"
        case .loadingUserInfo:
            "载入用户信息..."
        case .connecting:
            "连接中..."
        case .success:
            "连接成功"
        case .fail:
            "连接失败"
        case .reconnect:
            "重连中..."
        case .authFailed:"登录失效,请重新登录"
        }
    }
    
    /// 是否需要展示连接状态文案
    var showStatusText:Bool {
        switch self {
        case .success:
            false
        default:
            true
        }
    }
}
