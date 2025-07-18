//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

class IMViewModel:BaseViewModel {
    
    init(_ config:IMConfig) {
        self.config = config
    }
    
    /// 配置
    var config:IMConfig
    
    /// 搜索
    @Published var searchConversion = ""
    
    /// 会话列表
    @Published var conversions:[Conversation] = DefaultConversions
    
    /// 过滤搜索内容
    var filteredConversations: [Conversation] {
        if searchConversion.isEmpty {
            return conversions
        } else {
            return filterSearch()
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
