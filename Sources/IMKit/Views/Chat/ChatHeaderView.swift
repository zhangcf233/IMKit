//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import SwiftUI
import CommonKit

struct ChatHeaderView: View {
    
    let avatar = DefaultAvatar
    
    var body: some View {
        HStack{
            // 返回
            
            // 左侧
            
            // 右侧
        }
    }
    
    var left:some View {
        HStack{
            onlineImg(avatar)
        }
    }
}

#Preview {
    ChatHeaderView()
}
