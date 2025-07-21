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
            /// 焦点管理
            .onEvent(.IM_OnCancelFocused) { _ in
                vm.cancelFocus()
            }
            /// 表情栏
            .onEvent(.IM_OnCloseFace) { _ in
                vm.closeFace()
            }
            .onEvent(.IM_OnChangeFace) { _ in
                vm.changeFace()
            }
            /// 扩展栏
            .onEvent(.IM_OnCloseExtend) { _ in
                vm.closeExtend()
            }
            .onEvent(.IM_OnChangeExtend) { _ in
                vm.changeExtend()
            }
    }
}

extension View {
    /// MARK: 统一监听事件
    public func useChatViewListeners(_ vm:ChatViewModel) -> some View {
        return self.modifier(ChatViewListenersModifier(vm))
    }
}
