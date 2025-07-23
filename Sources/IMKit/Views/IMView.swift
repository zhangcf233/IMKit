//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

struct IMView<P:IMProvider>: View {
    
    @Environment(\.imConfig) var config
    
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
                    if config.isDebug {
                        debugMenuView
                    }
                }
        }
        .useRoute(config.routeFlag)
    }

    
    var debugMenuView:some View {
        Menu {
            
            if vm.client.status == .success {
                Button(role: .destructive){
                    vm.client.provider.disconnect()
                } label: {
                    Label {
                        Text("断开")
                    } icon: {
                        Image(systemName: "personalhotspot.slash")
                    }
                }
            }
            
            if vm.client.status == .disconnected {
                Button {
                    vm.client.provider.connect()
                } label: {
                    Label {
                        Text("重连")
                    } icon: {
                        Image(systemName: "personalhotspot")
                    }
                }
            }
            
        } label: {
                Image(systemName: "ladybug")
            
        }
    }
}

