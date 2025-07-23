//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/22.
//

import Foundation

final class MockIMProvider:BaseViewModel,IMProvider{
    
    let name = "模拟"
    
    @Published var status: IMClientStatus = .disconnected
    
    func connect() {
        status = .connected
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.status = .success
            print("MockIMProvider 已连接")
        }
    }
    
    func disconnect() {
        status = .disconnected
    }
    
    
}
