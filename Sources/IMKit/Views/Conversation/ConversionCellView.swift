//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI
import CommonKit

struct ConversionCellView: View {
    
    init(_ conversion: Conversation) {
        self.conversion = conversion
    }
    
    var conversion:Conversation
    var body: some View {
        
        HStack {
            // 头像
            avatar
            // 右侧内容
        }
        
    }
    
    var avatar:some View {
        onlineImg(conversion.avatar)
            .frame(width: 55,height: 55)
            .cornerRadius(55)
    }
    
    var content:some View {
        VStack(alignment: .leading) {
            HStack{
                // 名称
                
                // 时间
            }
        }
    }
}

#Preview {
    ConversionCellView(
        DefaultConversation
    )
}
