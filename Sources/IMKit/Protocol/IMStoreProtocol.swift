//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/24.
//

import Foundation

/// IM 存储协议
public protocol IMStoreProtocol:BaseErrorProtocol {
    
    /// 新增或更新
    func addOrUpdate(_:[User])
    
}
