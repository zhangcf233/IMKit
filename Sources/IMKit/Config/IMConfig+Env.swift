//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

/// 自定义配置环境键
private struct IMConfigKey:EnvironmentKey {
    static let defaultValue:IMConfig = DefaultIMConfig
}

/// 扩展环境变量
extension EnvironmentValues {
    
    var imConfig:IMConfig {
        get {self[IMConfigKey.self]}
        set {self[IMConfigKey.self] = newValue}
    }
    
}
