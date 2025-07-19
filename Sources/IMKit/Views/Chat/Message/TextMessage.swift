//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import SwiftUI

/// MARK: 文字类型消息
struct TextMessageView: View {
    init(_ message: Message) {
        self.message = message
    }
    
    var isSender:Bool {
        return message.isSender
    }
    
    let message:Message
    
    var body: some View {
        Text(message.content)
            .padding(5)
            .foregroundStyle(isSender ? .white : .black )
            .background(isSender ? .blue  : .gray.opacity(0.2) )
            .cornerRadius(10)
    }
    
}

#Preview {
    TextMessageView(msg1)
    
    TextMessageView(msg2)
    
    TextMessageView(msgLong)
    
    TextMessageView(msgLongMine)
}
