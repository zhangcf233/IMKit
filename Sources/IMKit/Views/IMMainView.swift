//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

struct IMMainView: View {
    @Environment(\.imConfig) var config
    
    var body: some View {
        Text("Hello, IM! \(config.domain)")
    }
}

#Preview {
    IMMainView()
}
