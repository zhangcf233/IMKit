//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

struct ChatView:View {
    
    init(_ session:Session) {
        
        _vm = StateObject(wrappedValue: ChatViewModel(session))
    }
    
    @StateObject var vm:ChatViewModel
    
    var body:some View {
        VStack(spacing:0){
            ChatHeaderView(vm)
            
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
    let c = DefaultSession2
    ChatView(c)
}
