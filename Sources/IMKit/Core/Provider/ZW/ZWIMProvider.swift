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
    
    public func onLoginSuccess(_ config: IMConfig) {
        Task{
            await self.start(config)
        }
    }
    
    
   public  var store: WCDBService?
    
    var http: ZWHttpService
    
    
    public init(_ config:IMConfig){
        
        self.config = config
        
        /// 初始化请求服务
        self.http = ZWHttpService(config)
        
        super.init()
        
        self.onLoginSuccess(config)
    }
    
    /// 代理
    private var signalRDelegate:SignalRDelegate?
    
    /// 连接设置
    public var config: IMConfig
    
    /// 服务商名称
    public let name = "正万"
    
    /// IM 服务
    public var service:SignalRService?
    
    /// 连接状态
    @Published public
    var status: IMStatus = .disconnected
    
    /// 自己的用户信息
    @Published
    public var mine:User = DefaultUser
    
    /// 启动
    public func start(_ config:IMConfig) async {
        self.config = config
        
        /// 初始化代理
        signalRDelegate = SignalRDelegate(self)
        
        /// 初始化服务
        self.service = SignalRService( 
            provider: self,
            isDebug: config.isDebug,
            delegate:signalRDelegate!
        )
        
        /// 获取用户信息 用于启动数据库
        guard let user = await self.getUserInfo() else {
            return
        }
        
        mine = user
        
        store = WCDBService(user.id)
        
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

    public func getUserInfo () async ->  User?  {
        var mine:User? = nil
        
        await http.send(.getUserInfo) { (result: Result<ZWUserInfo, RequestError>) in
            switch result {
            case .success(let user):
                mine = User(fromZWUserInfo: user)
            case .failure(let err):
                switch err{
                case .authFailed :
                    self.status = .authFailed
                default:
                    self.status = .fail
                    self.setError(err.errorDescription)
                }
            }
        }
        
        return mine
        
    }
    
    public func getSession() -> [Session] {
        return DefaultSessions
    }
}
