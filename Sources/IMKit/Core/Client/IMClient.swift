//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/22.
//

import SwiftUI

/// 消息客户端
final class IMClient<P:IMProvider>:BaseViewModel {
    
    @ObservedObject var provider: P
    
    init(
        _ provider:P
    ){
        self.config = provider.config
        self.provider = provider
        super.init()
//        self.connect()
    }
    
    var config:IMConfig
    
    /// 连接状态
    var status:IMClientStatus{
        return provider.status
    }
    
    /// 连接方法
    func connect(){
        self.provider.connect()
    }
}
