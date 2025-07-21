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
    
    /// 扩展栏
    @Published var openExtend = false
    
    /// 表情栏
    @Published var openFace = false
    
}

extension ChatViewModel {
    
    /// 点击聊天记录内容
    func onTapContent(){
        cancelFocus()
        closeFace()
        closeExtend()
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
    
    /// 切换扩展栏
    func changeExtend(){
        closeFace()
        withAnimation {
            openExtend.toggle()
        }
    }
    
    /// 取消扩展栏
    func closeExtend(){
        withAnimation {
            if openExtend {
                openExtend.toggle()
            }
        }
    }
    
    /// 切换表情
    func changeFace(){
        closeExtend()
        withAnimation {
            openFace.toggle()
        }
    }
    
    /// 关闭表情栏
    func closeFace(){
        withAnimation {
            if openFace {
                openFace.toggle()
            }
        }
    }
}
