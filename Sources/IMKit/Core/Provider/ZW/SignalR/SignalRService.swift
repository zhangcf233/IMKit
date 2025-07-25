//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/23.
//

import SwiftUI
import SignalRClient

public class SignalRService {
    
    /// 初始化
    public init(
        _ config:IMConfig,
        isDebug:Bool = false,
        delegate:any HubConnectionDelegate
    ) {
        
        let url = URL(string: "\(config.url)/chatHub?AppToken=\(config.token)")!
        
        /// 设置链接
        connection = HubConnectionBuilder(url: url)
            .withHubConnectionDelegate(delegate: delegate)
            .withLogging(minLogLevel: isDebug ?.debug : .error)
            .build()
            
        /// 开启监听
        openListen()
        
        /// 启动
        self.start()
    }
    
    /// 开启监听
    private func openListen(){
        connection.on(method: "ReceiveMessageAsync", callback:self.handleMessage)
    }
    
    /// 连接器
    private var connection: HubConnection
    
    /// 解析消息
    private func handleMessage(data:ArgumentExtractor) {
        
    }
    
    func start(){
        connection.start()
    }
    
    func stop(){
        connection.stop()
    }
}


extension SignalRService {
    
}
