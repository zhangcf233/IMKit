//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

/// 本地测试
struct Test: View {
    
    @State var select = 1
    
    
    let mockProvider = MockIMProvider(DefaultIMConfig)
    
    let zwProvider = ZWIMProvider(DefaultIMConfig)
    
    let zwAuthFailedProvider = ZWIMProvider(DefaultIMConfigAuthFailed)
    
    var body: some View {
        NavigationView {
            TabView(selection: $select){
                Text("首页")
                    .tag(0)
                    .tabItem{
                        Image(systemName: "house")
                        Text("首页")
                    }

//                IMView(zwProvider)
                IMView(zwProvider)
                    .tag(1)
                    .tabItem{
                        Image(systemName: "text.bubble")
                        Text("消息")
                    }
            }
            .onEvent(.IM_OnAuthFailed){ _ in
                print("监听到登录失败 模拟重新登录")
                zwAuthFailedProvider.config.token = token
                zwAuthFailedProvider.restart()
            }
        }
    }
}

#Preview {
    Test()
}

