//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

struct IMView: View {
    
    init(_ config:IMConfig) {
        _vm = StateObject(wrappedValue: IMViewModel(config))
    }
    
    @StateObject var vm:IMViewModel
    
    var body: some View {
        NavigationView {
            ConversitionView(vm.filteredConversations)
                .navigationBarTitle(Text("消息"))
                .navigationBarTitleDisplayMode(.inline)
                .searchable(
                    text: $vm.searchConversion,
                    placement: .navigationBarDrawer
                )
                
        }
        .useRoute(vm.config.routeFlag)
    }
}

