//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import SwiftUI

struct MessageView: View {
    init(_ message: Message) {
        self.message = message
    }
    
    let message:Message
    
    var isMine:Bool {
        return message.sender.type == .mine
    }
    
    var avatar:some View {
        
        onlineImg(message.sender.avatar)
            .useAvatar(.mini)
    }
    
    var body: some View {
        HStack(alignment: .top){
            if isMine {
                
                Spacer()
                
                center
                
            }else{
                
                avatar
                
                center
                
                Spacer()
                
            }
        }
    }
    
    var center:some View {
        VStack(alignment: isMine ? .trailing :.leading,spacing: 5) {
            
            if !isMine  {
                Text(message.sender.name)
                    .multilineTextAlignment(.leading)
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .lineLimit(1)
            }
            
            MessageBubbleView(message)
        }
    }
    
    
    
    /// 时间显示
    var time:some View {
        Text(message.createdAt.formattedDisplayTime())
            .font(.caption)
            .padding(.horizontal,4)
            .padding(.vertical,2)
            .background(.ultraThinMaterial)
            .cornerRadius(5)
            .padding(.vertical,4)
    }
    
    
    
    var placeholder:some View{
        Rectangle().frame(width: AvatarSize.mini.rawValue)
    }
}

#Preview {
    MessageView(msg1)
    
    MessageView(msg2)
    MessageView(msg1)
    
    MessageView(msgLong)
    
    MessageView(msgLongMine)
    
    MessageView(msgLongName)
}
