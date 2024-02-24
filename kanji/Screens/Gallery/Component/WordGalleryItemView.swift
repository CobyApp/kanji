//
//  WordGalleryItemView.swift
//  kanji
//
//  Created by Coby on 2/24/24.
//

import SwiftUI

struct WordGalleryItemView: View {
    
    private let kanji: String
    
    init(kanji: String) {
        self.kanji = kanji
    }
    
    var body: some View {
        GeometryReader { geometry in
            Text(self.kanji)
                .font(.jkMaru(size: geometry.size.width * 0.2))
                .foregroundColor(.black)
                .padding()
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.height
                )
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.8))
                )
        }
    }
}

#Preview {
    VStack {
        GeometryReader { geometry in
            WordGalleryItemView(kanji: "家家家家家")
                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
        }
    }
}
