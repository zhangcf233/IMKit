//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

struct SessionCellView: View {
    
    init(_ conversion: Session) {
        self.conversion = conversion
    }
    
    var conversion:Session
    
    let avatarSize = 50.0
    
    var body: some View {
        
        HStack {
            // 头像
            avatar
            // 右侧内容
            content
        }
        .padding(.horizontal)
        .padding(.vertical,5)
        .listRowInsets(EdgeInsets())
        .listRowSeparator(.hidden)
        .contentShape(Rectangle())
        .background(
            conversion.isTop
            ? Color(.systemGray).opacity(0.2)
            : Color(.systemBackground)
        )
    }
    
    var avatar:some View {
        onlineImg(conversion.avatar)
            .useAvatar()
            .useBadge(conversion.unreadCount)
    }
    
    var content:some View {
        VStack(alignment: .leading,spacing: 8) {
            HStack{
                // 名称
                Text(conversion.name)
                    .font(.headline)
                    .lineLimit(1)
                
                Spacer()
                
                // 时间
                Text(conversion.lastMessageTime.formattedDisplayTime())
                    .font(.footnote)
                    .opacity(0.3)
            }
            
            
            /// 消息内容
            Text(conversion.lastMessage)
                .font(.subheadline)
                .opacity(0.6)
                .lineLimit(1)
        }
    }
}

#Preview {
    SessionCellView(
        DefaultSession
    )
}
