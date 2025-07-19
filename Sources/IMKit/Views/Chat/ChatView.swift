//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI
import CommonKit

struct ChatView:View {
    
    @State var text = ""
    @State var isFocused = false
    
    var body:some View {
        VStack(spacing:0){
            ChatHeaderView()
            
            Divider()
            
            ChatContentView()
                .onTapGesture {
                    isFocused = false
                }
            
            ChatInputView(
                $text,
                $isFocused
            )
        }
        .hiddenNavigationBarSpace()
    }
}

#Preview {
    ChatView()
}
