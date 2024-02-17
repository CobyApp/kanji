//
//  GalleryListItemView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct GalleryListItemView: View {
    
    private let kanji: String
    
    init(kanji: String) {
        self.kanji = kanji
    }
    
    var body: some View {
        GeometryReader { geometry in
            Text(self.kanji)
                .font(.system(size: geometry.size.width / 2))
                .foregroundColor(.black)
                .fixedSize()
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
    GalleryListItemView(kanji: "家")
}
