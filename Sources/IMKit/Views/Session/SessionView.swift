//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

struct SessionView<P:IMProvider>: View {
    
    init(
        _ vm:IMViewModel<P>
    ) {
        _vm = ObservedObject(wrappedValue: vm)
    }
    
    @Environment(\.imConfig.routeFlag) var flag
    @Environment(\.navigationManager.wrappedValue) var route
    
    @ObservedObject var vm:IMViewModel<P>

    
    var body: some View {
        List {
            
            ForEach(vm.filteredSessions,id: \.id){ item in
                
                SessionCellView(item)
                    .to {
                        ChatView(item)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            vm.onDeleteSession(item)
                        } label: {
                            Label("删除", systemImage: "trash")
                        }

                        Button {
                            vm.onChangeTopSession(item)
                        } label: {
                            Label("置顶", systemImage: item.isTop ? "pin.slash.fill" : "pin")
                        }
                        .tint(.yellow)
                    }
            }
            
            
        }
        .listStyle(.plain)
    }
}
