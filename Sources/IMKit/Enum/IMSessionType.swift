//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/24.
//

import Foundation
import WCDBSwift

/// 会话类型
public enum SessionType:String,Codable {
    /// 单聊
    case single
    /// 群聊
    case group
}

/// 扩展会话类型以满足数据库保存要求
extension SessionType: ColumnCodable {
    public init?(with value: WCDBSwift.Value) {
        let string = value.stringValue
        self.init(rawValue: string)
    }
    
    public func archivedValue() -> WCDBSwift.Value {
        // 将 enum 转成数据库可识别的值（字符串）
        return WCDBSwift.Value(self.rawValue)
    }
    
    public static var columnType: WCDBSwift.ColumnType {
        return .text
    }
}
