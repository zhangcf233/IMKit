//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import SwiftUI

struct ChatInputView:View {
    
    init(
        _ text:Binding<String>,
        _ isFocused:Binding<Bool>,
        
    ) {
        _text = Binding(projectedValue: text)
        _isFocused = Binding(projectedValue: isFocused)
        
    }
    /// 文本内容
    @Binding var text:String
    
    /// 焦点控制
    @Binding var isFocused:Bool
    
    /// 是否要底部对齐
    @State var needAlignmentBottom = false
    
    
    var body: some View {
        HStack(alignment:needAlignmentBottom ?.bottom : .center,spacing: 0) {
            
            /// 拍照按钮
            cameraBtn
            
            /// 输入框
            AutoGrowingField($text,$isFocused){ old,new in
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
    
    /// 相机按钮
    var cameraBtn: some View {
        Button {
            onTapCamera()
        } label: {
            Image(systemName: "camera.circle.fill")
                .foregroundStyle(.blue)
        }
    }
    
    /// 右侧功能视图
    var rightView:some View {
        HStack(spacing: 5) {
            /// 语音
            voiceView
            /// 表情
            faceView
            /// 扩展功能
            extendView
        }
        .foregroundStyle(.black)
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
            onTapFace()
        } label: {
            Image(systemName: "face.smiling")
        }
    }
    
    /// 扩展按钮
    var extendView:some View {
        Button {
            onTapExtend()
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    /// 点击表情按钮
    func onTapFace(){
        
    }
    
    /// 点击语音按钮
    func onTapVoice(){
        
    }
    
    /// 点击相机按钮
    func onTapCamera(){
        
    }
    
    /// 点击扩展按钮
    func onTapExtend(){
        
    }
}

#Preview {
    @State var text = ""
    @State var isFocused  = false
    ChatInputView(
        $text,
        $isFocused
    )
}
