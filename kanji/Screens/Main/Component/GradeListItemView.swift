//
//  GradeListItemView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct GradeListItemView: View {
    
    @State private var count: Int = 0
    
    private let grade: GradeType
    private let total: Int
    
    init(grade: GradeType) {
        self.grade = grade
        self.total = CharacterStorage.shared.characters.getCharactersByGrade(grade: grade).count
    }
    
    var body: some View {
        HStack {
            Text(self.grade.title)
            
            Spacer()
            
            Text("\(self.count + 1)/\(self.total)")
        }
        .font(.title3)
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            Capsule().fill(Color.black.opacity(0.75))
        )
        .onAppear {
            self.count = UserDefaults.standard.integer(forKey: self.grade.rawValue)
        }
    }
}

#Preview {
    GradeListItemView(grade: .two)
}
