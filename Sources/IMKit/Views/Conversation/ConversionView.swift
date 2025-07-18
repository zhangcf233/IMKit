//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

struct ConversitionView: View {
    
    var conversions:[Conversation]
    
    var body: some View {
        List {
            ForEach(conversions){ conversion in
                ConversionCellView(conversion)
            }
        }
        .listStyle(.plain)
    }
}
