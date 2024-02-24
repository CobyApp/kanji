//
//  QuizTitleView.swift
//  kanji
//
//  Created by Coby on 2/24/24.
//

import SwiftUI

struct QuizTitleView: View {
    
    private let count: Int
    private let index: Int
    private let total: Int
    
    init(
        count: Int,
        index: Int,
        total: Int
    ) {
        self.count = count
        self.index = index
        self.total = total
    }
    
    var body: some View {
        HStack {
            Text("오답횟수 \(self.count)")
            
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
    QuizTitleView(count: 0, index: 0, total: 100)
}
