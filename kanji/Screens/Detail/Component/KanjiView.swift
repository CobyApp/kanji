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
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                Image("boardBg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width)
                
                Text(self.kanji)
                    .font(.system(size: geometry.size.width / 2.8))
                    .fixedSize()
                    .padding(.bottom, geometry.size.width * 0.025)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    KanjiView(kanji: "家")
}
