//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/21.
//

import SwiftUI
import CommonKit

public class ChatViewModel:BaseViewModel{

    /// 输入框文本
    @Published var text = ""
    
    /// 焦点管理
    @Published var isFocused = false
    
}

extension ChatViewModel {
    
    /// 点击聊天记录内容
    func onTapContent(){
        callEvent(.IM_OnCancelFocused)
        callEvent(.IM_OnCloseExtend)
    }
    
    /// 切换焦点
    func changeFocus(){
        withAnimation {
            isFocused.toggle()
        }
    }
    
    /// 取消焦点
    func cancelFocus(){
        withAnimation {
            if isFocused {
                isFocused.toggle()
            }
        }
    }
}
