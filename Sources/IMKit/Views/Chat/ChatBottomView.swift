//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import SwiftUI
import Foundation

struct ChatBottomView: View {
    
    @StateObject var vm:ChatViewModel
    
    var body: some View {
        VStack(spacing: 0){
            /// 输入框
            ChatInputView(vm)
            
            /// 扩展栏
            ChatExtendView($vm.isOpenExtend)
            
            /// 表情栏
            ChatFaceView($vm.isOpenFace)
        }
    }
}
