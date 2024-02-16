//
//  GradeListItemView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct GradeListItemView: View {
    
    private let title: String
    private let count: Int
    
    init(grade: GradeType) {
        let characters = CharacterStorage.shared.characters.getCharactersByGrade(grade: grade)
        self.title = grade.title
        self.count = characters.count
    }
    
    var body: some View {
        HStack {
            Text(title)
            
            Spacer()
            
            Text("\(self.count)개")
        }
        .font(.title3)
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            Capsule().fill(Color.black.opacity(0.75))
        )
    }
}

#Preview {
    GradeListItemView(grade: .two)
}
