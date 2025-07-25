//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/22.
//

import Foundation
import SignalRClient
import SwiftUI

public final class ZWIMProvider:BaseViewModel,IMProvider{
    
    /// 初始化
    public init(_ config:IMConfig) {
        
        self.config = config
        
        /// 初始化请求服务
        self.http = ZWHttpService(config)
        
        super.init()
        
        self.onLoginSuccess()
    }
    
    /// 数据库
    public var store = WCDBService()
    
    /// 网络请求
    public var http: ZWHttpService
    
    /// 长链接代理
    private var signalRDelegate:SignalRDelegate?
    
    /// 连接设置
    public var config: IMConfig
    
    /// 服务商名称
    public let name = "正万"
    
    /// 长链接
    public var service:SignalRService?
    
    /// 连接状态
    @Published
    public var status: IMStatus = .disconnected
    
    /// 自己的用户信息
    @Published
    public var mine:User = DefaultUser
    
}

extension ZWIMProvider {
    
    /// 启动
    public func start() async {
        
        debugPrint("*** 1. 启动",config.token)
        /// 切换状态
        self.status = .loadingUserInfo
        debugPrint("*** 2. 获取用户信息",config)
        
        /// 获取用户信息 用于启动数据库
        guard let _ = await self.getUserInfo() else {
            return
        }
        
        debugPrint("*** 3. 更新用户信息成功",mine)
        
        /// 初始化数据库
        store.initTable(mine.id)
        
        debugPrint("*** 4. 切换数据库",store.dbName)
        
        /// 初始化代理
        signalRDelegate = SignalRDelegate(self)
        
        /// 初始化服务
        self.service = SignalRService(
            provider: self,
            isDebug: config.isDebug,
            delegate:signalRDelegate!
        )
    }
    
    /// 发起连接
    public func connect() {
        self.status = .connecting
        service?.start()
        
    }
    
    /// 断开链接
    public func disconnect() {
        service?.stop()
    }
    
    /// 获取用户信息
    public func getUserInfo () async ->  User?  {
        var mine:User? = nil
        
        await http.send(.getUserInfo) { (result: Result<ZWUserInfo, RequestError>) in
            switch result {
            case .success(let user):
                self.mine = User(fromZWUserInfo: user)
                mine = self.mine
            case .failure(_):
                self.status = .authFailed
            }
        }
        
        return mine
        
    }
    
    /// 获取会话列表
    public func getSession() -> [Session] {
        debugPrint("*** 获取会话列表",store.dbName)
        return store.getObjects(.session) ?? []
    }
    
    /// 登录成功钩子
    public func onLoginSuccess() {
        Task{
            await self.start()
        }
    }
}
