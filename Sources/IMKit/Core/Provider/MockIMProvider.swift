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
    }
    
    var name: String = "本地模拟"
    
    var config: IMConfig
    
    var status: IMClientStatus = .disconnected
    
    func connect() {
        
    }
    
    func disconnect() {
        
    }
    
    func getUserInfo() {
        
    }
    
    
}
