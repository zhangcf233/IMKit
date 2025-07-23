//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/23.
//

import SwiftUI

extension UIDevice {
    /// 顶部安全区高度
    public static func safeDistanceTop() -> CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let window = windowScene.windows.first else { return 0 }
            return window.safeAreaInsets.top
        } else{
            guard let window = UIApplication.shared.windows.first else { return 0 }
            return window.safeAreaInsets.top
        }
    }
    /// 底部安全区高度
    public static func safeDistanceBottom() -> CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let window = windowScene.windows.first else { return 0 }
            return window.safeAreaInsets.bottom
        } else {
            guard let window = UIApplication.shared.windows.first else { return 0 }
            return window.safeAreaInsets.bottom
        }
    }
    
    /// 顶部状态栏高度（包括安全区）
    public static func statusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let statusBarManager = windowScene.statusBarManager else { return 0 }
            statusBarHeight = statusBarManager.statusBarFrame.height
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }
    
    /// 导航栏高度
    public static func navigationBarHeight() -> CGFloat {
        return 44.0
    }
    
    /// 状态栏+导航栏的高度
    public static func navigationFullHeight() -> CGFloat {
        return UIDevice.statusBarHeight() + UIDevice.navigationBarHeight()
    }
    /// 底部导航栏高度
    public static func tabBarHeight() -> CGFloat {
        return 49.0
    }
    
    /// 底部导航栏高度（包括安全区）
    public static func tabBarFullHeight() -> CGFloat {
        return UIDevice.tabBarHeight() + UIDevice.safeDistanceBottom()
    }
    
    /// 屏幕宽度
    public static let screenWidth = UIScreen.main.bounds.size.width
    
    /// 屏幕高度
    public static let screenHeight = UIScreen.main.bounds.size.height
    
    /// 忽略上下安全区可视区域高度
    public static let screenIgnoreSafeDistanceHeight = UIScreen.main.bounds.size.height - UIDevice.safeDistanceTop() - UIDevice.safeDistanceBottom()
    
    /// 是否为刘海屏
    public static func isNotchScreen() -> Bool {
        // 获取主窗口的安全区域
        let keyWindow = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        
        // 判断安全区域的顶部和底部是否有大于 0 的 inset
        let topInset = keyWindow?.safeAreaInsets.top ?? 0
        let bottomInset = keyWindow?.safeAreaInsets.bottom ?? 0
        
        // 刘海屏设备通常顶部或底部的安全区域大于 20
        return topInset > 20 || bottomInset > 0
    }
}
