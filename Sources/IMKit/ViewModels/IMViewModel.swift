//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

class IMViewModel<P:IMProvider>:BaseViewModel {
    
    init(_ client:IMClient<P>){
        self.client = client
    }
      
    /// 连接器
    @ObservedObject var client:IMClient<P>
    
    /// 默认文案
    var defaultTitle = "消息"
    
    /// 连接状态文案
    var title:String {
        clientStatus.showStatusText ? clientStatus.name : defaultTitle
    }
    
    /// 连接器状态
    var clientStatus:IMClientStatus {
        return client.status
    }
    
    /// 搜索
    @Published var searchConversion = ""
    
    /// 会话列表
    @Published var conversions:[Conversation] = DefaultConversions
    
    /// 过滤搜索内容
    var filteredConversations: [Conversation] {
        
        let result = searchConversion.isEmpty ? conversions : filterSearch()
        
        return result.sorted { a, b in
            // 优先排置顶数据
            if a.isTop != b.isTop {
                return a.isTop && !b.isTop
            }else {
                // 再按时间排序
                return a.lastMessageTime > b.lastMessageTime
            }
    }
    }
    
    /// 搜索过滤方法
    func filterSearch()->[Conversation]{
        return conversions.filter {
            $0.name // 搜索名称
                .lowercased()
                .contains(searchConversion.lowercased())
        }
    }
}
