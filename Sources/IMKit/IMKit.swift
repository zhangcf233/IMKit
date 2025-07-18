//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/18.
//

import SwiftUI

/// IMKit
public class IMKit {
    
    // MARK: 创建 IM 视图
    public static func create(_ config:IMConfig)-> some View{
         IMView(config)
    }
}
