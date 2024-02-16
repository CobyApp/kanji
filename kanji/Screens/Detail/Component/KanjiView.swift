//
//  KanjiView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct KanjiView: View {
    
    @Binding var character: Character
    
    var body: some View {
        GeometryReader { geometry in
            Image("boardBg")
                .resizable()
                .scaledToFit()
                .frame(width: geometry.size.width)
        }
    }
}

#Preview {
    KanjiView(character: .constant(Character(
        grade: .two,
        kanji: "家",
        korean: "집 가",
        sounds: ["か", "け"],
        meanings: ["いえ", "や"]
    )))
}
