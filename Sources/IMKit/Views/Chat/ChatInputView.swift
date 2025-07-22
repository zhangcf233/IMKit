//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import SwiftUI
import CommonKit

struct ChatInputView:View {
    
    init(_ vm: ChatViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }
    
    @StateObject var vm:ChatViewModel
    
    /// 是否要底部对齐
    @State var needAlignmentBottom = false
    
    
    var body: some View {
        HStack(alignment:needAlignmentBottom ?.bottom : .center,spacing: 0) {
            
            /// 拍照按钮
            cameraBtn
            
            /// 输入框
            AutoGrowingField($vm.text,$vm.isFocused){ old,new in
                needAlignmentBottom = old != new
            }
            
            /// 右侧功能视图
            rightView
        }
        .font(.title)
        .padding(4)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .padding(8)
    }
    
    
    
    /// 右侧功能视图
    var rightView:some View {
        HStack(spacing: 5) {
            /// 语音
//            voiceView
            /// 表情
            faceView
            
            /// 发送按钮
            if vm.isShowSendBtn {
                sendBtn
            } else {
                /// 扩展功能
                extendView
            }
            
        }
        .foregroundStyle(.primary)
    }
    
    /// 相机按钮
    var cameraBtn: some View {
        Button {
            onTapCamera()
        } label: {
            Image(systemName: "camera.circle.fill")
                .foregroundStyle(.blue)
        }
    }
    
    /// 语音按钮
    var voiceView:some View {
        Button {
            onTapVoice()
        } label: {
            Image(systemName: "wifi.circle")
                .rotationEffect(Angle.degrees(90))
        }
    }
    
    /// 表情按钮
    var faceView:some View {
        Button {
            vm.changeFace()
        } label: {
            Image("face", bundle: .module)
                .resizable()
                .scaledToFit()
                .frame(width: 30)
        }
    }
    
    /// 扩展按钮
    var extendView:some View {
        Button {
            vm.changeExtend()
        } label: {
            Image(systemName: "plus.circle")
                .rotationEffect(Angle.degrees(vm.isOpenExtend ? 45 : 0))
        }
    }
    
    /// 发送消息按钮
    var sendBtn:some View {
        Button {
            vm.onSendText()
        } label: {
            
            ZStack{
                Image(systemName: "paperplane.fill")
                    .foregroundStyle(.white)
                    .font(.system(size: 20))
                    .rotationEffect(Angle(degrees: 15))
            }
            .frame(width: vm.isShowSendBtn ? 30 : 0,height: 30)
                .padding(.horizontal,vm.isShowSendBtn ? 10 : 0)
                .background(.pink)
                .cornerRadius(50)
                .clipped()
            
        }
    }
    
    /// 点击语音按钮
    func onTapVoice(){
        
    }
    
    /// 点击相机按钮
    func onTapCamera(){
        
    }
    
}

#Preview {
    @StateObject var vm = ChatViewModel()
    ChatInputView(vm)
}
