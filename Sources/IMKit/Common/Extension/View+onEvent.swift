//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/23.
//

import SwiftUI

/// 监听事件回调类型
public typealias OnEventsDoneType = (_:Notification) -> Void

/// 监听事件
public struct onEventsModifier:ViewModifier{
    
    public init(_ name: Notification.Name,_ done:@escaping OnEventsDoneType) {
        self.name = name
        self.done = done
    }
    
    var name:Notification.Name
    
    var done:OnEventsDoneType
    
    public func body(content: Content) -> some View {
        content
        .onReceive(NotificationCenter.default.publisher(for: name)){
            debugPrint($0.object ?? "")
            done($0)
        }
    }
}

extension View {
    /// 快速监听事件
    public func onEvent(_ name:Notification.Name,done:@escaping OnEventsDoneType)->some View{
        return self.modifier(onEventsModifier(name,done))
    }
}
