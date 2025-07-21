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
    
    var isMine:Bool {
        return message.isMine
    }
    
    let message:Message
    
    var body: some View {
        Text(message.content)
            .padding(8)
            .foregroundStyle(isMine ? .white : .primary )
            .background(isMine ? .blue  : Color(.systemGray6) )
            .cornerRadius(10)
    }
    
}

#Preview {
    TextMessageView(msg1)
    
    TextMessageView(msg2)
    
    TextMessageView(msgLong)
    
    TextMessageView(msgLongMine)
}
