//
//  GradeListItemView.swift
//  kanji
//
//  Created by Coby on 6/21/24.
//

import SwiftUI

struct GradeListItemView: View {
    
    @State private var index: Int = 0
    
    private let learn: LearnType
    private let grade: GradeType
    
    init(
        learn: LearnType,
        grade: GradeType
    ) {
        self.learn = learn
        self.grade = grade
    }
    
    var body: some View {
        HStack {
            Text(self.grade.title)
            
            Spacer()
            
            Text("\(self.index + 1)/\(self.learn.getTotalIndex(grade))")
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
        .onAppear {
            self.index = self.learn.getLearnedIndex(grade)
        }
    }
}

#Preview {
    GradeListItemView(learn: .kanji, grade: .two)
}
