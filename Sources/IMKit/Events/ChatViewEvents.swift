//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/21.
//

import Foundation

extension Notification.Name{
    
    /// 获取焦点
    public static let IM_OnFocused = Notification.Name("IM_OnFocused")
    
    /// 失去焦点
    public static let IM_OnCancelFocused = Notification.Name("IM_OnCancelFocused")
    
    /// 切换扩展栏
    public static let IM_OnChangeExtend = Notification.Name("IM_OnChangeExtend")
    
    /// 关闭扩展栏
    public static let IM_OnCloseExtend = Notification.Name("IM_OnCloseExtend")
    
    /// 切换表情栏
    public static let IM_OnChangeFace = Notification.Name("IM_OnChangeFace")
    
    /// 关闭表情栏
    public static let IM_OnCloseFace = Notification.Name("IM_OnCloseFace")
    
}
