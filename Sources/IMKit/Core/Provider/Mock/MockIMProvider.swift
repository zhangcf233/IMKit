//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/22.
//

import Foundation

/// 模拟供应商
public final class MockIMProvider:BaseViewModel,IMProvider {
    public init(_ config: IMConfig) {
        self.config = config
        self.name = "本地模拟"
        super.init()
        self.connect()
    }
    
    
    public init(_ config: IMConfig,name:String = "本地模拟") {
        self.config = config
        self.name = name
        super.init()
        self.connect()
    }
    
    @Published
    public var name: String
    
    public var config: IMConfig
    
    @Published
    public var status: IMStatus = .disconnected
    
    public func connect() {
        self.status = .success
//        setTimeOut(time: 3) {
//            self.status = .success
//        }
    }
    
    public  func disconnect() {
        self.status = .disconnected
    }
    
    public func getUserInfo()->User {
        return User(id: "1", name: "测试账号", avatar: DefaultAvatar4)
    }
    
    
}
