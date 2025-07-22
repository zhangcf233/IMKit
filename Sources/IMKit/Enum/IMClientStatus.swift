//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/22.
//

import Foundation

/// 连接状态
public enum IMClientStatus {
    case start
    case connected
    case fail
    case reconnect
    case success
    
    var name:String {
        switch self {
        case .start:
            "启动中..."
        case .connected:
            "连接中..."
        case .success:
            "连接成功"
        case .fail:
            "连接失败"
        case .reconnect:
            "重连中..."
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
