//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/23.
//

import Foundation
import SignalRClient
/// signalR 服务
public  class SignalRService {
    private var connection:HubConnection
    
    public init(_ url:URL){
        connection = HubConnectionBuilder(url: url)
            .withLogging(minLogLevel: .error)
            .build()
        
        connection.on(method: "ReceiveMessageAsync"){
            
        }
    }
    
    /// 消息监听方法
    
}
