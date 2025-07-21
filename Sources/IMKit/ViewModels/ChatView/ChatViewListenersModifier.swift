//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/21.
//

import SwiftUI

/// 统一监听
public struct ChatViewListenersModifier:ViewModifier {
    
    public init(_ vm: ChatViewModel) {
        self.vm = vm
    }
    
    var vm:ChatViewModel
    
    public func body(content: Content) -> some View {
        content
            .onEvent(.IM_OnCancelFocused) { _ in
                vm.cancelFocus()
            }
    }
}

extension View {
    /// MARK: 统一监听事件
    public func useChatViewListeners(_ vm:ChatViewModel) -> some View {
        return self.modifier(ChatViewListenersModifier(vm))
    }
}
