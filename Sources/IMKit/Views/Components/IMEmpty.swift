//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/25.
//

import SwiftUI

/// 空状态占位图
public class IMEmpty {
   public static var list:some View{
       Image("list-empty",bundle: .module)
           .resizable()
           .scaledToFit()
    }
}

