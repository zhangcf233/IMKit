//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/23.
//

import SwiftUI

/// 隐藏顶部空白区域
public struct HiddenNavigationBarModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
    }
}

extension View {
    /// 隐藏顶部空白区域
    public func hiddenNavigationBarSpace() -> some View {
        modifier( HiddenNavigationBarModifier() )
    }
}
