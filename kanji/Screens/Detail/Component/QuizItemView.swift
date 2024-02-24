//
//  QuizItemView.swift
//  kanji
//
//  Created by Coby on 2/24/24.
//

import SwiftUI

struct QuizItemView: View {
    
    private let quiz: String
    
    init(quiz: String) {
        self.quiz = quiz
    }
    
    var body: some View {
        GeometryReader { geometry in
            Text(self.makeTwoLines(koreans: self.quiz))
                .font(.ownglyph(size: geometry.size.width / 8))
                .foregroundColor(.white)
                .padding()
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.height
                )
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.black.opacity(0.8))
                )
        }
    }
    
    private func makeTwoLines(koreans: String) -> String {
        let koreans = koreans.components(separatedBy: " / ")
        return koreans.joined(separator: "\n")
    }
}

#Preview {
    QuizItemView(quiz: "수레 차")
}
