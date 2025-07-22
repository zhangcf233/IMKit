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
open class IMConfig:IMConfigProtocol{
    
    
    // MARK: 初始化
    public init(
        _ domain:String,
        _ token:String,
    ){
        self.domain = domain
        self.token = token
    }
    
    // MARK: 域名配置
    public let domain:String
    
    // MARK: token
    public let token:String
    
    // MARK: 路由标记
    public let routeFlag:String = UUID().uuidString
}


let domain = "https://player.srzw123.com"

let token = "CfDJ8KmyT1KtGIxHjS-9anRiBrHf0i1q_0EUte0ZI6hZ1oJ-iq2K0fJ5ikxSEoeC4Q8D8jaM9wnIzHC2hAhZDRxiua5xmRCJC9KJdtWsSXQcfKj3SGv8bJqrVDkmcS6Dqg6WXEBslWaYSm9SWpVliD0AGUsSwDd3g0dfAWpZYqDV9rYm"

/// 默认配置
public let DefaultIMConfig = IMConfig(domain,token)

/// 默认配置
public let DefaultDebugIMConfig = IMConfig(domain,token)
