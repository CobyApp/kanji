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
            Text(self.kanji)
                .font(.custom("JK-Maru-Gothic-M", fixedSize: geometry.size.width * 0.8))
                .foregroundColor(.black)
                .padding(geometry.size.width * 0.1)
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
            KanjiBoardView(kanji: "家")
                .frame(width: geometry.size.width * 0.4, height: geometry.size.width * 0.4)
        }
    }
}
