//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import SwiftUI
import Foundation

struct ChatBottomView: View {
    
    init(
        _ text:Binding<String>,
        _ isFocused: Binding<Bool>
    ) {
        _text = Binding(projectedValue: text)
        _isFocused = Binding(projectedValue: isFocused)
        
        self.openExtend = openExtend
    }
    
    @Binding var isFocused:Bool
    
    @Binding var text:String
    @State var openExtend = false
    
    var body: some View {
        VStack(spacing: 0){
            /// 输入框
            ChatInputView(
                $text,
                $isFocused,
                $openExtend
            )
            
            /// 扩展栏
            ChatExtendView($openExtend)
        }
        .onEvent(.IM_OnChangeExtend) { _ in
            changeExtend()
        }
        .onEvent(.IM_OnCloseExtend) { _ in
            closeExtend()
        }
    }
    
    /// 切换扩展栏
    func changeExtend(){
        withAnimation {
            openExtend.toggle()
            print(openExtend)
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
}
