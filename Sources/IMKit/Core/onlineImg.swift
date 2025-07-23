//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/23.
//

import SwiftUI
import Kingfisher

/// 获取网络图片
public func onlineImg(_ url:URL,_ placeholderName:String = "image") -> some View {
    return  KFAnimatedImage(url)
        .placeholder{
            Image(placeholderName,bundle: .module)
                .resizable()
        }
        .fade(duration: 0.3)
        .scaledToFit()
}
