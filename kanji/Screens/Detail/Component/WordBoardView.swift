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
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .strokeBorder(Color.black, lineWidth: 10)
                .overlay {
                    VStack(spacing: 20) {
                        Text(self.kanji)
                            .font(.custom("JK-Maru-Gothic-M", fixedSize: geometry.size.width * 0.15))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                        
                        Text(self.mean)
                            .font(.custom("Ownglyph_meetme-Rg", fixedSize: geometry.size.width * 0.09))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .padding(40)
                }
        }
    }
}

#Preview {
    VStack {
        GeometryReader { geometry in
            WordBoardView(kanji: "家家家家", mean: "집이라고한다이라집이라고한다이라")
                .frame(width: geometry.size.width, height: geometry.size.width)
        }
    }
}
