//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

/// IMKit
public class IMKit {
    
    // MARK: 创建 IM 视图
    public static func create(_ config:IMConfig)-> some View{
         IMMainView()
            .environment(\.imConfig, config)
    }
}


/// 本地测试
struct Test: View {
    
    var body: some View {
        IMKit.create(DefaultDebugIMConfig)
    }
}

#Preview {
    Test()
}
