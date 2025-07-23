//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/22.
//

import Foundation
import Combine

protocol IMProvider:BaseViewModel {
    
    init(_:IMConfig)
    
    /// 服务商名称
    var name:String { get }
    
    /// 配置
    var config:IMConfig { get }
    
    /// 连接状态
    var status: IMStatus {get}
    
    /// 发起连接
    func connect()
    
    /// 断开连接
    func disconnect()
    
    /// 获取用户信息
    func getUserInfo()->User
}
