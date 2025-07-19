//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

struct ChatView:View {
    var body:some View {
        VStack(spacing:0){
            ChatHeaderView()
            Divider()
            ChatContentView()
            
            ChatInputView()
        }
    }
}

#Preview {
    ChatView()
}
