//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI



public struct IMView<P:IMProvider>: View {
    
   public init(
        _ provider:P
    ){
        
        _provider = StateObject(wrappedValue: provider)
        
        _vm = StateObject(wrappedValue: IMViewModel(provider))
    }
    
    @StateObject var vm:IMViewModel<P>
    
    @StateObject var provider: P
    
    var config:IMConfig {
        return provider.config
    }
    
    public var body: some View {
        NavigationView{
            switch vm.status {
                
            case .success:
                if #available(iOS 16.0, *){
                    ios16PlusView()
                }else{
                    ios15View()
                }
                
            default:
                otherView
            }
        }
        .useRoute(config.routeFlag)
    }
    
    /// ios15 视图
    @ViewBuilder
    func ios15View()->some View {
        let titleBarHeight = 50.0
        let paddingTopHeight = titleBarHeight + UIDevice.safeDistanceTop()
        VStack(spacing: 0){
            ZStack{
                successView
                    .padding(.top,paddingTopHeight)
            }
            .overlay(alignment:.top) {
                VStack(spacing: 0){
                    HStack{
                        Spacer()
                        titleView()
                            .font(.headline)
                        Spacer()
                    }
                }
                .frame(height: paddingTopHeight)
                .background(.ultraThinMaterial)
            }
        }
        .hiddenNavigationBarSpace()
        .ignoresSafeArea(edges:.top)
    }
    
    /// ios16 以上视图
    @ViewBuilder
    func ios16PlusView()->some View{
        successView
            .navigationBarTitle(
                titleView()
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
    
    /// 标题视图
    @ViewBuilder
    func titleView()->Text{
        Text(vm.title)
    }
    
    /// 连接成功
    var successView:some View {
        
        VStack{
            Button("新增"){
                vm.addSession()
            }
            
            
            SessionView<P>(vm)
        }
        
        
    }
    
    /// 其他场景页面
    var otherView:some View{
        VStack{
            switch vm.status{
            case .connecting:
                ProgressView(vm.status.name)
            case .disconnected,.fail,.reconnect:
                reconnectView
            default:
                EmptyView()
            }
            
        }
    }
    
    /// 重连按钮
    var reconnectView:some View {
        VStack{
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 100))
                .foregroundStyle(.red)
            
            Text(vm.status.name)
            
            Button("重新连接") {
                vm.provider.connect()
            }
            .buttonStyle(.bordered)
        }
    }
    
    /// 调试菜单
    var debugMenuView:some View {
        Menu {
            
            if vm.status == .success {
                Button(role: .destructive){
                    vm.provider.disconnect()
                } label: {
                    Label {
                        Text("断开")
                    } icon: {
                        Image(systemName: "personalhotspot.slash")
                    }
                }
            }
            
            if vm.status == .disconnected {
                Button {
                    vm.provider.connect()
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

