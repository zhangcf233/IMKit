//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

/// IMKit
final class IMKit {
    
    static var config:IMConfig = DefaultIMConfig
    
    init(_ config: IMConfig) {
        IMKit.config = config
        self.client = IMClient(config)
    }
    
    var client:IMClient
    
    // MARK: 创建 IM 视图
    public static func create(_ client:IMClient)-> some View{
        IMView(client).environment(\.imConfig, config)
    }
}
