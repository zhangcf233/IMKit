//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/22.
//

import Foundation

/// 配置协议
public protocol IMConfigProtocol {
    /// 域名
    var domain:String {get}
    /// 路由标记
    var routeFlag:String {get}
}
