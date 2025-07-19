//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import SwiftUI

struct ChatContentView: View {
    var body: some View {
        ScrollView {
            VStack{
                ForEach(1...100,id:\.self){ _ in
                    HStack{
                        Spacer()
                        Text("这里有很多聊天记录")
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ChatContentView()
}
