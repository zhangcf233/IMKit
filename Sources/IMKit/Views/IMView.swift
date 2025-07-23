//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

struct IMView<P:IMProvider>: View {
    
    @Environment(\.imConfig.routeFlag) var flag
    
    init(
        _ config:IMConfig,
        _ provider:P
    ){
        
        let client = IMClient(config,provider)
        
        _provider = StateObject(wrappedValue: provider )
        
        _client = StateObject(wrappedValue: client)
        
        _vm = StateObject(wrappedValue: IMViewModel(client))
    }
    
    @StateObject var vm:IMViewModel<P>
    
    @StateObject var client:IMClient<P>
    
    @StateObject var provider:P
    
    
    var body: some View {
        NavigationView {
            ConversitionView(vm.filteredConversations)
                .navigationBarTitle(
                    Text( vm.title + vm.client.provider.name)
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

