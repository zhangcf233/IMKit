//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/21.
//

import SwiftUI

struct ChatFaceView: View {
    init(_ open:Binding<Bool>){
        _open = Binding(projectedValue: open)
    }
    
    @Binding var open:Bool
    
    let height = 200.0
    
    var body: some View {
        ScrollView{
            ScrollView(.horizontal){
                HStack{
                    Text("分类1")
                    Text("分类1")
                    Text("分类1")
                }
            }
            
            VStack{
                Text("😀😃😄😁🤣🥲")
            }
        }
        .frame(height: open ? height : 0)
        .opacity(open ? 1 :0)
        .clipped()
    }
}
