//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import SwiftUI
import CommonKit

struct ChatContentView: View {
    
    @Binding var messages:[Message]
    
    /// 向外暴露一个属性用户控制滚动到底部
    @Binding var isScrollToBottom:Bool
    
    /// 是否显示滚动到底部提示器
    @State var isShowScrollToBottomTips = false
    
    /// 原始距离
    @State var originalDistance = CGFloat.zero
    
    /// 滚动距离
    @State private var offset = CGFloat.zero
    
    /// 坐标空间名称
    let coordinateSpaceName = "IM_CHAT_SPACE"
    
    /// 需要显示提示器的滚动距离 默认为一屏高度
    let needShowTipsDistance = UIDevice.screenHeight
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                content(proxy)
            }
            .coordinateSpace(name: coordinateSpaceName)
            .overlay(alignment:.bottomTrailing){
                /// 滚动提示器
                scrollToBottomTipsView(proxy)
            }
            .onAppear{
                /// 无动画滚动到底部
                scrollToBottomWithoutAnimation(proxy)
                /// 记录原始偏移量并重置相对偏移量
                saveOriginalDistance()
            }
        }
    }
    
    /// 主体内容
    @ViewBuilder
    private func content(_ proxy:ScrollViewProxy)->some View {
        VStack{
            
            /// 遍历消息列表
            ForEach(messages){ m in
                MessageView(m)
                    .id(m.id)
            }
            
            /// 滚动距离测量视图
            scrollDistanceGaugeView()
        }
        .padding(.top)
        .padding(.horizontal)
        /// 监听滚动事件
        .onPreferenceChange(ViewOffsetKey.self) {
            onScroll($0)
        }
        /// 监听消息数量变化
        .onChange(of: messages.count) {
            onMessageCountChange($0,proxy)
        }
        /// 监听是否需要滚动到底部
        .onChange(of: isScrollToBottom) {
            onIsScrollToBottomChange($0,proxy)
        }
    }
    
    /// 滚动提示器
    @ViewBuilder
    func scrollToBottomTipsView(_ proxy:ScrollViewProxy)->some View {
        Button{
            scrollToBottom(proxy)
        }label: {
            Image(systemName: "chevron.down.2")
                .foregroundStyle(Color(.systemGray))
                .padding(8)
                .background(.ultraThinMaterial)
                .cornerRadius(50)
        }
        .opacity(isShowScrollToBottomTips ? 1 :0)
        .clipped()
        .offset(x:-15,y:-20)
    }
    
    /// 顶部滚动距离占位视图
    @ViewBuilder
    func scrollDistanceGaugeView()->some View {
        GeometryReader {
            Color.clear.preference(
                key: ViewOffsetKey.self,
                value: $0.frame(in: .named(coordinateSpaceName)).origin.y
            )
        }
    }
}

/// 滚动偏好标识
struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}


extension ChatContentView {
    
    /// 消息数量变化事件
    func onMessageCountChange(_ val:Int,_ proxy:ScrollViewProxy){
        /// 当滚动提示器出现时不进行滚动到底部处理
        if !isShowScrollToBottomTips {
            scrollToBottom(proxy)
        }
    }
    
    /// 滚动事件
    private func onScroll(_ val:CGFloat){
        /// 计算相对滚动距离
        offset = val - originalDistance
        
        if offset > needShowTipsDistance {
            showScrollToBottomTips()
        }else {
            closeScrollToBottomTips()
        }
    }
    
    /// 显示滚动提示器
    private func showScrollToBottomTips(){
        if !isShowScrollToBottomTips{
            withAnimation {
                isShowScrollToBottomTips.toggle()
            }
        }
    }
    
    /// 显示滚动提示器
    private func closeScrollToBottomTips(){
        if isShowScrollToBottomTips{
            withAnimation {
                isShowScrollToBottomTips.toggle()
            }
        }
    }
    
    /// 延时校准底部偏移量
    private func saveOriginalDistance(){
        DispatchQueue.main.async {
            // 延时记录下当前基准偏移量
            originalDistance = offset
            offset = .zero
        }
    }
    
    /// 无动画效果的滚动到底部
    private func scrollToBottomWithoutAnimation(_ proxy:ScrollViewProxy){
        if let last = messages.last {
            proxy.scrollTo(last.id, anchor: .bottom)
        }
    }
    
    /// 带动画效果的滚动到底部
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
    
    /// 滚动到底属性监听方法
    private func onIsScrollToBottomChange(_ val:Bool,_ proxy:ScrollViewProxy){
        if val {
            scrollToBottom(proxy)
            // 重置触发器（可选，看你是否要单次触发）
            DispatchQueue.main.async {
                isScrollToBottom = false
            }
        }
    }
    
    
}


