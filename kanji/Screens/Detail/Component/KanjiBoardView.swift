//
//  KanjiBoardView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct KanjiBoardView: View {
    
    private let kanji: String
    
    init(kanji: String) {
        self.kanji = kanji
    }
    
    var body: some View {
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .strokeBorder(Color.black, lineWidth: 10)
                .overlay {
                    Text(self.kanji)
                        .font(.custom("JK-Maru-Gothic-M", fixedSize: geometry.size.width * 0.6))
                        .foregroundColor(.black)
                }
        }
    }
}

#Preview {
    VStack {
        GeometryReader { geometry in
            KanjiBoardView(kanji: "家")
                .frame(width: geometry.size.width, height: geometry.size.width)
        }
    }
}
