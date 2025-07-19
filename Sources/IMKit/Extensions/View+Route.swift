//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI
import NavigationViewKit

struct NavigationModifier<V: View>: ViewModifier {
    let destination: () -> V

    @Environment(\.navigationManager) var nm
    @Environment(\.imConfig) var imConfig

    func body(content: Content) -> some View {
        content.onTapGesture {
            nm.wrappedValue.pushView(tag: imConfig.routeFlag, view: destination)
        }
    }
}

extension View {

    func to<V: View>(@ViewBuilder _ view: @escaping () -> V) -> some View {
            self.modifier(NavigationModifier(destination: view))
        }
}
