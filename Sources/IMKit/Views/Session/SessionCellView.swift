//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

struct SessionCellView: View {
    
    init(_ session: Session) {
        self.session = session
    }
    
    var session:Session
    
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
            session.isTop
            ? Color(.systemGray).opacity(0.2)
            : Color(.systemBackground)
        )
    }
    
    var avatar:some View {
        onlineImg(session.avatar)
            .useAvatar()
            .useBadge(session.unreadCount)
    }
    
    var content:some View {
        VStack(alignment: .leading,spacing: 8) {
            HStack{
                // 名称
                Text(session.name)
                    .font(.headline)
                    .lineLimit(1)
                
                Spacer()
                
                // 时间
                Text(session.lastMessageTime.formattedDisplayTime())
                    .font(.footnote)
                    .opacity(0.3)
            }
            
            
            /// 消息内容
            Text(session.lastMessage)
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
