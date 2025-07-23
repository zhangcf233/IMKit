//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/22.
//

import Foundation
import SignalRClient

final class ZWIMProvider:BaseViewModel,IMProvider{
    
    public init(_ config:IMConfig){
        
        
        self.config = config
        
        let url = URL(string: config.url)!
        
        connection = HubConnectionBuilder(url: url)
            .withLogging(minLogLevel: .debug)
            .build()
        
        super.init()
        
        connection.on(method: "ReceiveMessageAsync"){
            self.status = .success
        }
    }
    
    var config: IMConfig
    
    let name = "正万"
    
    /// 连接器
    private var connection:HubConnection
    
    /// 连接状态
    @Published var status: IMClientStatus = .disconnected
    
    func connect() {
        status = .connected
        connection.start()
    }
    
    func disconnect() {
        status = .disconnected
        connection.stop()
    }
    
    func getUserInfo() {
        
    }
}
