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
    
    
    let provider = MockIMProvider(DefaultIMConfig)
    
    var body: some View {
        NavigationView {
            TabView(selection: $select){
                Text("首页")
                    .tag(0)
                    .tabItem{
                        Image(systemName: "house")
                        Text("首页")
                    }

                
                IMView(provider)
                    .tag(1)
                    .tabItem{
                        Image(systemName: "bubble")
                        Text("消息")
                    }
                
            }
        }
    }
}

#Preview {
    Test()
}

