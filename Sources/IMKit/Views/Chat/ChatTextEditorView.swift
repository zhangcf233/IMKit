//
//  SwiftUIView.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import SwiftUI
import UIKit

/// MARK: 自动撑高的输入框
struct AutoGrowingField: View {
    
    typealias OnHeightChange = (_ defaultHeight:CGFloat,_ nowHeight:CGFloat)->Void
    
    init(
        _ text: Binding<String>,
        maxLines:Int = 4,
        onHeightChange:@escaping OnHeightChange = {_,_ in}
    ) {
        _text = Binding(projectedValue: text)
        _height = State(wrappedValue: defaultHeight)
        self.maxLines = maxLines
        self.onHeightChange = onHeightChange
    }
    
    
    @Binding var text: String
    
    var maxLines = 4
    
    var onHeightChange:OnHeightChange
    
    let defaultHeight = 20.0 // 初始为一行
    
    @State private var height: CGFloat
    
    var body: some View {
            AutoGrowingTextView(
                text: $text,
                dynamicHeight: $height,
                maxLines: maxLines
            )
            .frame(height: height)
            .onChange(of: height) { val in
                    print("高度变化 默认高度",defaultHeight)
                    print("高度变化 最新高度",val)
                    
                onHeightChange(defaultHeight,val)
            }
    }
}

/// MARK: 自动撑高的输入视图
struct AutoGrowingTextView: UIViewRepresentable {
    @Binding var text: String
    @Binding var dynamicHeight: CGFloat
    
    var maxLines: Int = 5
    var font: UIFont = .preferredFont(forTextStyle: .subheadline)
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = font
        textView.isScrollEnabled = true
        textView.backgroundColor = .clear
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.delegate = context.coordinator
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        if uiView.text != self.text {
            uiView.text = self.text
        }
        
        recalculateHeight(view: uiView)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text, height: $dynamicHeight, maxLines: maxLines, font: font)
    }
    
    private func recalculateHeight(view: UITextView) {
        let size = CGSize(width: view.bounds.width, height: .infinity)
        let estimatedSize = view.sizeThatFits(size)
        DispatchQueue.main.async {
            self.dynamicHeight = min(estimatedSize.height, CGFloat(maxLines) * font.lineHeight)
        }
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        @Binding var text: String
        @Binding var height: CGFloat
        var maxLines: Int
        var font: UIFont
        
        init(text: Binding<String>, height: Binding<CGFloat>, maxLines: Int, font: UIFont) {
            _text = text
            _height = height
            self.maxLines = maxLines
            self.font = font
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.text = textView.text
            let size = CGSize(width: textView.bounds.width, height: .infinity)
            let estimatedSize = textView.sizeThatFits(size)
            let maxHeight = CGFloat(maxLines) * font.lineHeight
            DispatchQueue.main.async {
                self.height = min(estimatedSize.height, maxHeight)
            }
        }
    }
}

#Preview {
    @State var text = ""
    AutoGrowingField($text)
}
