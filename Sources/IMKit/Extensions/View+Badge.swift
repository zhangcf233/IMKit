//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import SwiftUI

extension View {
    /// 小红点
    public func useBadge(_ count: Int? = 0) -> some View {
        /// 默认红圈直径
        let defaultDotDiameter = 10.0

        /// 默认红点直径
        let defaultCircleDiameter = 22.0

        /// 是否为点
        var isDot: Bool {
            return count == 1
        }

        /// 红点直径
        var diameter: CGFloat {
            return isDot ? defaultDotDiameter : defaultCircleDiameter
        }
        /// 显示内容
        var content: String {
            let _count = count ?? 0
            if isDot {
                return ""
            } else if _count <= 99 {
                return "\(_count)"
            } else {
                return "..."
            }
        }

        return overlay(alignment: .topTrailing, content: {
            if count != 0 {
                ZStack {
                    Circle().fill(Color.red)
                    Text(content)
                }
                .foregroundColor(.white)
                .font(.system(size: 12, weight: .bold))
                .frame(width: diameter, height: diameter)
            }
        })
    }
}
