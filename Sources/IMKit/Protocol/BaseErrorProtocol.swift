//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/22.
//

import Foundation

/// 默认的异常信息协议
public protocol BaseErrorProtocol:ObservableObject{
    /// 异常消息
    var errorMessage:String? {get set}
    /// 设置消息
    func setError(_ :String)->Void
    /// 设置消息
    func setError(_ :Error)->Void
    /// 清除消息
    func clearError()->Void
}
