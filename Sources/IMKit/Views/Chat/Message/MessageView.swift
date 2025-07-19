//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import SwiftUI
import CommonKit

struct MessageView: View {
    init(_ message: Message) {
        self.message = message
    }
    
    let message:Message
    
    var isSender:Bool {
        return message.isSender
    }
    
    var avatar:some View {
        
        onlineImg(message.sender.avatar)
            .useAvatar(.mini)
    }
    
    var body: some View {
        VStack(spacing:0){
            
            time
            
            content
            
        }
        .padding(.vertical,4)
    }
    
    var center:some View {
        VStack(alignment: isSender ? .trailing :.leading,spacing: 5) {
            Text(message.sender.name)
                .multilineTextAlignment(.leading)
                .font(.footnote)
                .foregroundStyle(.gray)
                .lineLimit(1)
            
            MessageBubbleView(message)
        }
    }
    
    var content: some View {
        HStack(alignment: .top){
            if isSender {
                
                Spacer()
                
                center
                
                avatar
            }else{
                
                avatar
                
                center
                
                Spacer()
                
            }
        }
    }
    
    /// 时间显示
    var time:some View {
        Text(message.createdAt.formattedDisplayTime())
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
