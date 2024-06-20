//
//  QuizView.swift
//  kanji
//
//  Created by Coby on 6/21/24.
//

import SwiftUI

struct QuizView: View {
    
    private let count: Int
    private let index: Int
    private let total: Int
    private let quizItems: [String]
    private let quizAction: (String) -> Void
    
    init(
        count: Int,
        index: Int,
        total: Int,
        quizItems: [String],
        quizAction: @escaping (String) -> Void
    ) {
        self.count = count
        self.index = index
        self.total = total
        self.quizItems = quizItems
        self.quizAction = quizAction
    }
    
    private let columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 100, maximum: .infinity)), count: 2)
    
    var body: some View {
        VStack(spacing: 4) {
            QuizTitleView(
                count: self.count,
                index: self.index,
                total: self.total
            )
            
            GeometryReader { geometry in
                LazyVGrid(columns: self.columns, spacing: 4) {
                    ForEach(self.quizItems, id: \.self) { item in
                        QuizItemView(quiz: item)
                            .frame(width: (geometry.size.width - 4) / 2, height: (geometry.size.height - 4) / 2)
                            .onTapGesture {
                                self.quizAction(item)
                            }
                    }
                }
            }
        }
    }
}
