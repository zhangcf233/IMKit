//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import SwiftUI

struct ChatHeaderView: View {
    
    init(_ vm: ChatViewModel) {
        _vm = ObservedObject(wrappedValue: vm)
    }
    
    @ObservedObject var vm:ChatViewModel
    
    var session:Session{
        return vm.session
    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack(spacing:0){
            
            // 左侧
            left
            
            Spacer()
            
            // 右侧
            right
        }
        .padding(.vertical,5)
        
    }
    
    /// 左侧容器
    var left:some View {
        HStack(spacing: 0){
            
            backBtn
            
            onlineImg(session.avatar)
                .useAvatar(.mini)
            
            titleView
            
        }
    }
    
    /// 右侧容器
    var right:some View {
        HStack{
           infoBtn
        }
    }
    
    /// 聊天标题
    var titleView:some View {
        HStack(spacing: 0){
            Text(session.name)
                .padding(.horizontal,5)
                .lineLimit(1)
            
            if session.memberCount > 1 {
                Text("(\(session.memberCount))")
            }
        }
        .font(.subheadline)
    }
    
    /// 返回按钮
    var backBtn:some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundStyle(Color(.label))
        }
        .padding(.horizontal)
    }
    
    /// 信息按钮
    var infoBtn:some View {
        Button {
            
        } label: {
            Image(systemName: "ellipsis")
                .foregroundStyle(.black)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ChatHeaderView(ChatViewModel( DefaultSession2))
}
