//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import SwiftUI

struct MessageBubbleView: View {
    init(_ message: Message) {
        self.message = message
    }
    let message:Message
    var body: some View {
        switch message.type {
        case .text:
            TextMessageView(message)
        }
    }
}

#Preview {
    MessageBubbleView(msg1)
}
