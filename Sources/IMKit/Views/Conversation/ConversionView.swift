//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

struct ConversitionView<P:IMProvider>: View {
    
    typealias OnActionType = (_:Conversation)->Void
    
    init(
        _ conversions: [Conversation],
        onDelete:@escaping OnActionType,
        onTop:@escaping OnActionType
    ) {
        self.conversions = conversions
        self.onDelete = onDelete
        self.onTop = onTop
    }
    
    @Environment(\.imConfig.routeFlag) var flag
    @Environment(\.navigationManager.wrappedValue) var route
    
    var conversions:[Conversation]
    
    var onDelete:OnActionType
    
    var onTop:OnActionType
    
    var body: some View {
        List {
            ForEach(conversions){ c in
                
                ConversionCellView(c)
                    .to {
                        ChatView(c)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            onDelete(c)
                        } label: {
                            Label("删除", systemImage: "trash")
                        }

                        Button {
                            onTop(c)
                        } label: {
                            Label("置顶", systemImage: "pin")
                        }
                        .tint(.yellow)
                    }
            }
            
            
        }
        .listStyle(.plain)
    }
}
