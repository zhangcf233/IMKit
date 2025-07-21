//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/21.
//

import SwiftUI

extension View {
    func simpleShadow() -> some View {
        self
            .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 4)
    }
}
