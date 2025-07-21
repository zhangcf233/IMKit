//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import SwiftUI

struct ChatContentView: View {
    
    @Binding var messages:[Message]
    
    /// 向外暴露一个属性用户控制滚动到底部
    @Binding var isScrollToBottom:Bool
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack{
                    ForEach(messages){ m in
                        MessageView(m)
                            .id(m.id)
                    }
                    Spacer()
                }
                .padding(.top)
                .padding(.horizontal)
                .onChange(of: messages.count) { _ in
                    scrollToBottom(proxy)
                }
                .onChange(of: isScrollToBottom) { val in
                    if val {
                        scrollToBottom(proxy)
                        // 重置触发器（可选，看你是否要单次触发）
                        DispatchQueue.main.async {
                            isScrollToBottom = false
                        }
                    }
                }
            }
            .onAppear{
                if let last = messages.last {
                    proxy.scrollTo(last.id, anchor: .bottom)
                }
            }
        }
    }
    
    private func scrollToBottom(_ proxy:ScrollViewProxy){
        // 延迟确保消息已经插入布局中
        DispatchQueue.main.async {
            if let last = messages.last {
                withAnimation {
                    proxy.scrollTo(last.id, anchor: .bottom)
                }
            }
        }
    }
}
