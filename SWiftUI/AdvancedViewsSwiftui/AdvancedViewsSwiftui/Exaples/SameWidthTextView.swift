//
//  SameWidthTextView.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 10/08/2024.
//

import SwiftUI

import SwiftUI

struct SameWidthTextView: View {
    let texts: [String] = ["Helleeeeeeeeeeeeeeeeeeeeeeo", "SwiftUI", "Welcome", "To", "VStack", "Same Width"]

    @State private var maxWidth: CGFloat = 30

    var body: some View {
        VStack {
            ForEach(texts, id: \.self) { text in
                Text(text)
                    .getSize(size: { vale in
                        let _ = print(vale.width)
                        maxWidth = max(maxWidth, vale.width)
                    })
//                    .frame(width: maxWidth, alignment: .leading)
                    .background(Color.yellow)
            }
        }
        .onAppear {
            // Ensure the maxWidth is set after the views are laid out
//            DispatchQueue.main.async {
//                maxWidth = texts.map { $0.widthOfString(usingFont: .systemFont(ofSize: 17)) }.max() ?? 0
//            }
        }
    }
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}



#Preview {
    SameWidthTextView()
}
