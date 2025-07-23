//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/22.
//

import Foundation
import SignalRClient
import SwiftUI

final class ZWIMProvider:BaseViewModel,IMProvider{
    
    public init(_ config:IMConfig){
        
        self.config = config
        
        super.init()
        
        /// 初始化代理
        signalRDelegate = SignalRDelegate(self)
        
        /// 组装连接
        let url = URL(string: config.url)!
        
        /// 初始化服务
        self.service = SignalRService(
            url:url,
            isDebug: config.isDebug,
            delegate:signalRDelegate!
        )
    }
    
    /// 代理
    private var signalRDelegate:SignalRDelegate?
    
    /// 连接设置
    var config: IMConfig
    
    /// 服务商名称
    let name = "正万"
    
    /// IM 服务
    private  var service:SignalRService?
    
    /// 连接状态
    @Published var status: IMClientStatus = .disconnected
    
    
    /// 发起连接
    func connect() {
        service?.start()
    }
    
    /// 断开链接
    func disconnect() {
        service?.stop()
    }
    
    func getUserInfo() {
        
    }
    
    
}
