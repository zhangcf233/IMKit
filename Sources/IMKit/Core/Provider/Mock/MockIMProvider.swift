//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/22.
//

import Foundation

/// 模拟供应商
final class MockIMProvider:BaseViewModel,IMProvider {
    
    init(_ config: IMConfig) {
        self.config = config
        super.init()
        self.connect()
    }
    
    var name: String = "本地模拟"
    
    var config: IMConfig
    
    @Published
    var status: IMStatus = .disconnected
    
    func connect() {
        self.status = .success
//        setTimeOut(time: 3) {
//            self.status = .success
//        }
    }
    
    func disconnect() {
        self.status = .disconnected
    }
    
    func getUserInfo()->User {
        return User(id: "1", name: "测试账号", avatar: DefaultAvatar4)
    }
    
    
}
