//
//  GalleryItemView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct GalleryItemView: View {
    
    private let kanji: String
    
    init(kanji: String) {
        self.kanji = kanji
    }
    
    var body: some View {
        GeometryReader { geometry in
            Text(self.kanji)
                .font(.custom("JK-Maru-Gothic-M", fixedSize: geometry.size.width * 0.5))
                .foregroundColor(.black)
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
    GalleryItemView(kanji: "家")
}
