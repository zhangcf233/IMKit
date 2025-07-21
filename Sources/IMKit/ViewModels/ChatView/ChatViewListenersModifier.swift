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
            /// 焦点变化
            .onReceive(vm.$isFocused) { val in
                print("焦点变化",val)
                vm.onFocusChange(val)
            }
            /// 文本输入
            .onReceive(vm.$text) { val in
                print("文本输入",val)
                vm.onInput(val:val)
            }
    }
}

extension View {
    /// MARK: 统一监听事件
    public func useChatViewListeners(_ vm:ChatViewModel) -> some View {
        return self.modifier(ChatViewListenersModifier(vm))
    }
}
