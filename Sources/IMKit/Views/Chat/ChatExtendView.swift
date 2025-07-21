//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/21.
//

import SwiftUI

struct ChatExtendView: View {
    
    init(_ open: Binding<Bool>) {
        _open = Binding(projectedValue: open)
    }
    
    @Binding var open:Bool
    
    /// 四列两行
    
    var body: some View {
        VStack(spacing:0){
            
        }
        .frame(height: open ? 100 :0)
    }
}
