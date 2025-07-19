//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI
import NavigationViewKit

/// MARK:  点击跳转修饰器
struct toModifier<V: View>: ViewModifier {
    let destination: () -> V

    @Environment(\.navigationManager.wrappedValue) var nm
    @Environment(\.imConfig.routeFlag) var tag
    
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                nm.pushView(tag: tag){
                    destination()
                }
            }
            
    }
}

// 默认的返回根路由方法
public func defaultAfterBackDo (){}

// 返回根路由方法类型
public typealias AfterBackDo = () -> Void

// 路由修饰器
struct useRouteModifier:ViewModifier {
    
    init(
        _ flag: String,
        _ afterBackDo: @escaping AfterBackDo
    ) {
        self.flag = flag
        self.afterBackDo = afterBackDo
    }
    
    var flag:String
    
    var afterBackDo:()->Void
    
    public func body(content: Content) -> some View {
        content
            
            .navigationViewManager(for: flag, afterBackDo:afterBackDo)
    }
}


extension View {

    /// MARK:  便捷跳转路由
    public func to<V: View>(@ViewBuilder _ view: @escaping () -> V) -> some View {
            self.modifier(toModifier(destination: view))
        }
    
    /// MARK:  使用路由修饰器
    /// > 你可能猜到，我写过 Vue 3,所以是 `useRoute` 而不是 `attachNavigation` 🤓
    public func useRoute(
        _ flag:String,
        _ afterBackDo: @escaping AfterBackDo =  defaultAfterBackDo
    ) -> some View{
        return self.modifier(useRouteModifier(flag, afterBackDo))
    }
}
