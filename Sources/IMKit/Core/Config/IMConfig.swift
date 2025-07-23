//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import Foundation

/// IMKit 启动配置
/// - Parameters:
///   - domain: IM 服务地址（如 https://im.example.com）
///   - token: 用户身份令牌，IMKit 内部将通过 token 自动拉取用户信息
///   - enableDebugLog: 开启调试模式 将打印完整 log
final class IMConfig:IMConfigProtocol{
    
    
    // MARK: 初始化
    public init(
        _ url:String,
        isDebug:Bool = false
    ){
        self.url = url
        self.isDebug = isDebug
    }
    
    /// MARK: 请求地址
    public let url:String
    
    
    /// MARK: 路由标记
    public let routeFlag:String = UUID().uuidString
    
    /// 调试模式
    public var isDebug:Bool
    
}


let url = "https://player.srzw123.com/chatHub"

let token = "CfDJ8KmyT1KtGIxHjS-9anRiBrFEa4mob1Z360tsvcoCba68W_SsfTG1jECvNQnWyp4C8YSrzNJ4aZJLV4ZcsREgjWw0YizIhjphTZib3hRlmNmHHBhwuikVPTtQ7ErZx1zhxgreW8hqURYCGL0wXnd9Y35qER4g_6ZRTJP-z1DYxdNT"

/// 默认配置
 let DefaultIMConfig = IMConfig("\(url)?AppToken=\(token)",isDebug: true)

