//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

struct SessionView<P:IMProvider>: View {
    
    typealias OnActionType = (_:Session)->Void
    
    init(
        _ sessions: Binding<[Session]>,
        onDelete:@escaping OnActionType,
        onChangeTop:@escaping OnActionType
    ) {
        _list = Binding(projectedValue: sessions)
        self.onDelete = onDelete
        self.onChangeTop = onChangeTop
    }
    
    @Environment(\.imConfig.routeFlag) var flag
    @Environment(\.navigationManager.wrappedValue) var route
    
    @Binding
    var list:[Session]
    
    var onDelete:OnActionType
    
    var onChangeTop:OnActionType
    
    var body: some View {
        List {
            
            ForEach(list,id: \.id){ c in
                
                SessionCellView(c)
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
                            onChangeTop(c)
                        } label: {
                            Label("置顶", systemImage: c.isTop ? "pin.slash.fill" : "pin")
                        }
                        .tint(.yellow)
                    }
            }
            
            
        }
        .listStyle(.plain)
    }
}
