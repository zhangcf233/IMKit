//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/22.
//

import Foundation

/// 消息客户端
final class IMClient:BaseViewModel {
    
    init(_ config:IMConfig){
        self.config = config
        super.init()
        self.connect()
        
    }
    
    var config:IMConfig
    
    /// 连接状态
    @Published var status:IMClientStatus = .connected
    
    /// 连接方法
    func connect(){
        self.status = .connected
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.status = .success
            print("连接成功")
        }
    }
}
