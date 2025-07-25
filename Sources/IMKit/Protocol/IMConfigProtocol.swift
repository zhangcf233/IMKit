//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/22.
//

import Foundation

/// 配置协议
public protocol IMConfigProtocol {
    /// 请求地址
    var url:String {get}
    /// token
    var token:String {get}
    /// 路由标记
    var routeFlag:String {get}
}
