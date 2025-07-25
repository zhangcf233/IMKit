//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/25.
//

import Foundation

public enum RequestError: LocalizedError {
    case unowned(_:Error)
    case tokenNull
    case invalidURL
    case modelFailed
    case jsonFailed
    case authFailed

    var errorDescription: String {
        switch self {
        case .unowned(let e): "未知异常:\(e.localizedDescription)"
        case .tokenNull:"用户令牌为空"
        case .invalidURL: "URL 拼接异常"
        case .modelFailed: "数据解析失败"
        case .jsonFailed: "Json解析异常"
        case .authFailed:"登录失效,请重新登录"
        }
    }
}
