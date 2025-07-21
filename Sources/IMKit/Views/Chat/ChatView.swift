//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI
import CommonKit

struct ChatView:View {
    
    @StateObject var vm = ChatViewModel()
    
    var body:some View {
        VStack(spacing:0){
            ChatHeaderView()
            
            Divider()
            
            ChatContentView(
                messages: $vm.messages,
                isScrollToBottom: $vm.isScrollToBottom
            )
                .onTapGesture {
                    vm.onTapContent()
                }
            
            ChatBottomView(vm:vm)
        }
        .hiddenNavigationBarSpace()
        .useChatViewListeners(vm)
    }
}

#Preview {
    ChatView()
}
