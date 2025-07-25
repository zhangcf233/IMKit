//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/22.
//

import Foundation
import Combine

public protocol IMProvider:BaseErrorProtocol{
    
    init(_:IMConfig)
    
    /// 服务商名称
    var name:String { get }
    
    /// 配置
    var config:IMConfig { get }
    
    /// 连接状态
    var status: IMStatus {get}
    
    /// 数据库服务
    var store:WCDBService {get}
    
    /// 自己的用户信息
    var mine:User {get}
    
    /// 发起连接
    func connect()
    
    /// 断开连接
    func disconnect()
    
    /// 重启
    func restart()
    
    /// 获取用户信息
    func getUserInfo() async -> User?

}
