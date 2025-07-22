//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

struct IMView: View {
    
    init(_ client:IMClient){
        
       _client = StateObject(wrappedValue: client)
        
       _vm = StateObject(wrappedValue: IMViewModel(client))
    }
    
    @Environment(\.imConfig.routeFlag) var flag
    
    @StateObject var vm:IMViewModel
    
    @StateObject var client:IMClient
    
    
    var body: some View {
        NavigationView {
            ConversitionView(vm.filteredConversations)
                .navigationBarTitle(
                    Text(vm.title)
                )
                .navigationBarTitleDisplayMode(.inline)
                .searchable(
                    text: $vm.searchConversion,
                    placement: .navigationBarDrawer
                )
        }
        .useRoute(flag)
    }

}

