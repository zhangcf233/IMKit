//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/24.
//

import SwiftUI
import UIKit

/// 修复 隐藏导航栏后无法侧滑返回
extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
