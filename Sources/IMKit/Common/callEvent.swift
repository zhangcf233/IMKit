//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/23.
//

import Foundation

/// 快速触发事件
public func callEvent(_ name:Notification.Name,object anObject: Any? = nil)->Void{
    /// 广播
    NotificationCenter.default.post(
        name:name,
        object:anObject
    )
}
