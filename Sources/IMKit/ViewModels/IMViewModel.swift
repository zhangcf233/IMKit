//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

class IMViewModel<P:IMProvider>:BaseViewModel {
    
    init(_ provider:P){
        self.provider = provider
    }
    
    /// 搜索
    @Published var searchConversion = ""
    
    /// 会话列表
    @Published var conversions:[Conversation] = DefaultConversions

    /// 连接器
    @ObservedObject var provider:P
    
    /// 默认文案
    let defaultTitle = "消息"
}

extension IMViewModel{
    
    /// 连接状态文案
    var title:String {
        status.showStatusText ? status.name : defaultTitle
    }
    
    /// 连接器状态
    var status:IMStatus {
        return provider.status
    }
    
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
    
    /// 删除会话
    func onDeleteConversion(_ c:Conversation){
        
        conversions.removeAll { c2 in
            c2.id == c.id
        }
    }
    
    /// 切换置顶状态
    func onChangeTopConversion(_ c:Conversation){
        if let index = conversions.firstIndex(where: { $0.id == c.id }) {
            withAnimation {
                conversions[index].isTop.toggle()
            }
        }
    }
}
