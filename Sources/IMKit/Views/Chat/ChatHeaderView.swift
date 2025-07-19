//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import SwiftUI
import CommonKit

struct ChatHeaderView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let avatar = getRandomAvatar()
    
    let name = "这个人的名字很长很长很长这个人的名字很长很长很长这个人的名字很长很长很长这个人的名字很长很长很长这个人的名字很长很长很长"
    
    let memberCount = 4
    
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
            
            onlineImg(avatar)
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
            Text(name)
                .padding(.horizontal,5)
                .lineLimit(1)
            
            Text("(\(memberCount))")
        }
        .font(.subheadline)
    }
    
    /// 返回按钮
    var backBtn:some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundStyle(.black)
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
    ChatHeaderView()
}
