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
        _ provider:P
    ){
        
        let client = IMClient(provider)
        
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
                    Text(vm.title)
                )
                .navigationBarTitleDisplayMode(.inline)
                .searchable(
                    text: $vm.searchConversion,
                    placement: .navigationBarDrawer
                )
                .toolbar {
                    Button {
                        vm.client.provider.disconnect()
                    } label: {
                        Text("断开")
                    }
                    
                    Button {
                        vm.client.provider.connect()
                    } label: {
                        Text("重连")
                    }

                }
        }
        .useRoute(flag)
    }

}

