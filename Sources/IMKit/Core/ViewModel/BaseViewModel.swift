//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import Foundation
import Combine

/// 所有 IM ViewModel 的基类
open class BaseViewModel: ObservableObject {
    
    /// 当前错误信息（用于绑定 UI 提示）
    @Published public private(set) var errorMessage: String? = nil

    /// 设置错误信息（支持 Error 类型）
    public func setError(_ error: Error) {
        self.errorMessage = error.localizedDescription
    }

    /// 设置错误信息（自定义文本）
    public func setError(_ message: String) {
        self.errorMessage = message
    }

    /// 清除错误信息
    public func clearError() {
        self.errorMessage = nil
    }
}
