//
//  KanjiView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct KanjiView: View {
    
    private let kanji: String
    
    init(kanji: String) {
        self.kanji = kanji
    }
    
    var body: some View {
        Image("boardBg")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .overlay(
                GeometryReader { geometry in
                    Text(self.kanji)
                        .font(.system(size: (geometry.size.width / 4.4) - 5))
                        .fixedSize()
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height * 1.53
                        )
                }
            )
    }
}

#Preview {
    KanjiView(kanji: "家")
}
