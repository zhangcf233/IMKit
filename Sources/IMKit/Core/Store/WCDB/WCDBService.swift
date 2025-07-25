//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/24.
//

import Foundation
import SwiftUI
import WCDBSwift

public final class WCDBService:BaseViewModel {
    
    init(_ dbName: String = "defalut") {
        self.dbName = dbName
        super.init()
    }
    
    /// 数据库
    var db:Database?
    
    /// 数据库名称
    var dbName:String
    
    /// 连接数据库
    func connectDB(){
        guard let fileURL = try?FileManager.default.url(
                for:.applicationSupportDirectory,
                in:.userDomainMask,
                appropriateFor: nil,
                create: true
            ).appendingPathComponent("\(dbName).sqlite") else {
            
            self.setError("创建数据库路径失败")
            return
        }
        
        print("数据库路径",fileURL)
        
        db = Database(at: fileURL)
        
        /// 建表
        createTable()
    }
    
    /// 建表
    func createTable(){
        
        /// 会话表
        try? db?.create(
            table:IMTable.session.rawValue,
            of: Session.self
        )
    }
    
    /// 初始化表
    public func initTable(_ dbName:String){
        self.dbName = dbName
        self.connectDB()
    }
}


extension WCDBService {
    /// 查找对象数组
    func getObjects<T: TableCodable>(
        _ tableName: IMTable,
        where condition: Condition? = nil,
        orderBy orderList: [OrderBy]? = nil,
        limit: Limit? = nil,
        offset: Offset? = nil
    ) -> [T]? {
        let objects: [T]? = try? db?.getObjects(fromTable: tableName.rawValue, where: condition, orderBy: orderList, limit: limit, offset: offset)
        return objects
    }
    
    /// 新增或者更新
    func addOrUpdate<T:TableCodable>(_ table:IMTable, _ conversions:[T]){
        try? db?.insertOrReplace(conversions, intoTable: table.rawValue)
    }
    
    /// 删
    func remove(
        _ table: IMTable, // 表名
        where condition: Condition? = nil, // 符合删除的条件
        orderBy orderList: [OrderBy]? = nil, // 排序的方式
        limit: Limit? = nil, // 删除的个数
        offset: Offset? = nil // 从第几个开始删除
    ) {
        try? db?.delete(
            fromTable: table.rawValue,
            where: condition,
            orderBy: orderList,
            limit: limit,
            offset: offset
        )
    }
}
