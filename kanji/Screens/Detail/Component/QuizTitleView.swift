//
//  QuizTitleView.swift
//  kanji
//
//  Created by Coby on 2/24/24.
//

import SwiftUI

struct QuizTitleView: View {
    
    private let index: Int
    private let total: Int
    
    init(index: Int, total: Int) {
        self.index = index
        self.total = total
    }
    
    var body: some View {
        HStack {
            Text("문제 \(self.index + 1)")
            
            Spacer()
            
            Text("\(self.index + 1)/\(self.total)")
        }
        .font(.ownglyph(size: 20))
        .foregroundColor(.white)
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black.opacity(0.8))
        )
    }
}

#Preview {
    QuizTitleView(index: 0, total: 100)
}
