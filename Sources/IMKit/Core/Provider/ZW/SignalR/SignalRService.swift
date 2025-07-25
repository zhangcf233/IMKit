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
        provider:ZWIMProvider,
        isDebug:Bool = false,
        delegate:any HubConnectionDelegate
    ) {
        
        self.provider = provider
        
        let url = URL(string: "\(provider.config.url)/chatHub?AppToken=\(provider.config.token)")!
        print("长链接地址",url)
        /// 设置链接
        connection = HubConnectionBuilder(url: url)
            .withHubConnectionDelegate(delegate: delegate)
            .withLogging(minLogLevel: isDebug ? .error : .error)
            .build()
            
        /// 开启监听
        openListen()
        
        /// 启动
        self.start()
    }
    
    public var provider:ZWIMProvider
    
    /// 开启监听
    private func openListen(){
        connection.on(method: "ReceiveMessageAsync", callback:self.handleMessage)
    }
    
    /// 连接器
    private var connection: HubConnection
    
    /// 解析消息
    private func handleMessage(data:ArgumentExtractor) {
        provider.status = .success
    }
    
    func start(){
        provider.status = .connecting
        connection.start()
    }
    
    func stop(){
        connection.stop()
    }
}


extension SignalRService {
    
}
