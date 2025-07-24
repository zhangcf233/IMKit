//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/23.
//

import Foundation

/// 延时操作
public func setTimeOut(time:Double = 0,callback:@escaping VoidCallback){
    DispatchQueue.main.asyncAfter(deadline: .now() + time) {
        callback()
    }
}
