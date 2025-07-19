//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

struct ConversitionView: View {
    
    init(_ conversions: [Conversation]) {
        self.conversions = conversions
    }
    @Environment(\.imConfig.routeFlag) var flag
    @Environment(\.navigationManager.wrappedValue) var route
    
    var conversions:[Conversation]
    
    var body: some View {
        List {
            ForEach(conversions){ c in
                ConversionCellView(c)
                    .to {
                        ChatView()
                    }
            }
        }
        .listStyle(.plain)
    }
}
