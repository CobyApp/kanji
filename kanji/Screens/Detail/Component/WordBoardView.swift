//
//  WordBoardView.swift
//  kanji
//
//  Created by Coby on 2/24/24.
//

import SwiftUI

struct WordBoardView: View {
    
    private let kanji: String
    private let mean: String
    
    init(kanji: String, mean: String) {
        self.kanji = kanji
        self.mean = mean
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20) {
                Text(self.kanji)
                    .font(.custom("JK-Maru-Gothic-M", fixedSize: geometry.size.width * 0.2))
                    .multilineTextAlignment(.center)
                
                Text(self.mean)
                    .font(.custom("Ownglyph_meetme-Rg", fixedSize: geometry.size.width * 0.1))
                    .multilineTextAlignment(.center)
            }
            .padding(geometry.size.width * 0.02)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .stroke(Color.black, lineWidth: 20)
            )
        }
    }
}

#Preview {
    VStack {
        GeometryReader { geometry in
            WordBoardView(kanji: "家家家家家", mean: "집이라고한다이라고한다이라고한다이라고한다이라고한다이라고한다")
                .frame(width: geometry.size.width * 0.9, height: geometry.size.width * 0.6)
        }
    }
}
