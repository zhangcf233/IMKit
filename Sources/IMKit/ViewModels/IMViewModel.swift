//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI
import WCDBSwift

class IMViewModel<P:IMProvider>:BaseViewModel {
    
    init(_ provider:P){
        self.provider = provider
        
        super.init()
    }
    
    /// 自己的用户信息
    var mine:User{
        return provider.mine
    }
    
    /// 搜索
    @Published var searchConversion = ""
    
    /// 会话列表
    @Published var sessions:[Session] = []

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
    var filteredSessions: [Session] {
        
        let result = searchConversion.isEmpty ? sessions : filterSearch()
        
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
    func filterSearch()->[Session]{
        return sessions.filter {
            $0.name // 搜索名称
                .lowercased()
                .contains(searchConversion.lowercased())
        }
    }
    
    /// 删除会话
    func onDeleteSession(_ c:Session){
        sessions.removeAll { c2 in
            c2.id == c.id
        }
        
        
        provider.store.remove(.session,where: Session.Properties.id == c.id)
        
        print("删除会话",sessions.count)
        
    }
    
    /// 切换置顶状态
    func onChangeTopSession(_ c:Session){
        if let index = sessions.firstIndex(where: { $0.id == c.id }) {
            withAnimation {
                sessions[index].isTop.toggle()
            }
        }
    }
    
    /// 更新会话列表
    func loadSessions(){
        self.sessions = provider.store.getObjects(.session) ?? []
        print("查询结果数量",sessions.count)
        
    }
    
    func addSession(){
        var c = DefaultSession2
        c.id = UUID().uuidString
        c.name = "这是第\(sessions.count)条会话"
        sessions.append(c)
        provider.store.addOrUpdate(.session, sessions)
    }
}
