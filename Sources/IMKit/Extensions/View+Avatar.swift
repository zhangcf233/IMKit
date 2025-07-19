//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import SwiftUI



/// MARK: 头像修饰器
struct AvatarModifier: ViewModifier {

    init(_ size:CGFloat){
        self.size = size
    }
    
    var size:CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(width: size,height: size)
            .cornerRadius(size / 2)
    }
}

/// MARK: 头像尺寸
public enum AvatarSize:CGFloat {
    case mini = 28
    case base = 55
    case large = 70
}


extension View {
    
    /// MARK: 使用指定类型头像
    public func useAvatar(_ type:AvatarSize = .base) -> some View {
        return self.modifier(AvatarModifier(type.rawValue))
    }
    
    /// MARK: 自定义尺寸头像
    public func useCustomAvatar(_ size:CGFloat = AvatarSize.base.rawValue) -> some View {
        return self.modifier(AvatarModifier(size))
    }
}

