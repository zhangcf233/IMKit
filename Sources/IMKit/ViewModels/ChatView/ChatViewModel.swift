//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/21.
//

import SwiftUI

public class ChatViewModel:BaseViewModel{
    
    init(_ conversion: Conversation) {
        self.conversion = conversion
    }
    
    var conversion:Conversation

    /// 输入框文本
    @Published var text = ""
    
    /// 焦点管理
    @Published var isFocused = false
    
    /// 扩展栏
    @Published var isOpenExtend = false
    
    /// 表情栏
    @Published var isOpenFace = false
    
    /// 发送按钮
    @Published var isShowSendBtn = false
    
    /// 聊天记录滚动到底部状态
    @Published var isScrollToBottom = false
    
    /// 聊天记录
    @Published var messages:[Message] = defalutMessages
    
    
}

extension ChatViewModel {
    
    /// 输入文字
    func onInput(val:String){
        if val.isEmpty{
            closeSendBtn()
        }else {
            showSendBtn()
        }
        
    }
    
    /// 发送消息
    func onSendText(){
        withAnimation {
            
            messages.append(Message(content: text, sender: sender1))
            
            
            text = ""
        }
        
    }
    
    /// 显示消息按钮
    func showSendBtn(){
        withAnimation {
            if !isShowSendBtn {
                isShowSendBtn.toggle()
            }
        }
    }
    
    /// 隐藏消息按钮
    func closeSendBtn(){
        withAnimation {
            if isShowSendBtn {
                isShowSendBtn.toggle()
            }
        }
    }
    
    /// 点击聊天记录内容
    func onTapContent(){
        cancelFocus()
        closeFace()
        closeExtend()
    }
    
    /// 焦点变化钩子
    func onFocusChange(_ val:Bool){
        if val {
            closeFace()
            closeExtend()
            scrollToBottom()
        }
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
            isOpenExtend.toggle()
            if isOpenExtend {
                setTimeOut {
                    self.scrollToBottom()
                    self.cancelFocus()
                }
            }
        }
    }
    
    /// 取消扩展栏
    func closeExtend(){
        withAnimation {
            if isOpenExtend {
                isOpenExtend.toggle()
            }
        }
    }
    
    /// 切换表情
    func changeFace(){
        closeExtend()
        withAnimation {
            isOpenFace.toggle()
            
            if isOpenFace {
                setTimeOut{
                    self.scrollToBottom()
                    self.cancelFocus()
                }
            }
        }
    }
    
    /// 关闭表情栏
    func closeFace(){
        withAnimation {
            if isOpenFace {
                isOpenFace.toggle()
            }
        }
    }
    
    /// 聊天记录滚动到底部
    func scrollToBottom(){
        print("聊天记录滚动到底部",isScrollToBottom)
        if !isScrollToBottom {
            isScrollToBottom.toggle()
        }
    }
}
