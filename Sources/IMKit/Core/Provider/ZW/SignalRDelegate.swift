//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/23.
//

import Foundation
import SignalRClient

/// SignalR 代理
class SignalRDelegate: HubConnectionDelegate {
    
    init(_ app: ZWIMProvider) {
        self.app = app
    }
    
    var app:ZWIMProvider
    
    
    /// 连接成功
    func connectionDidOpen(hubConnection: SignalRClient.HubConnection) {
        debugPrint("连接成功")
        app.status = .success
    }
    
    /// 连接失败
    func connectionDidFailToOpen(error: any Error) {
        debugPrint("连接失败")
        app.status = .fail
    }
    
    /// 连接关闭
    func connectionDidClose(error: (any Error)?) {
        debugPrint("连接关闭")
        app.status = .disconnected
    }
    
}
