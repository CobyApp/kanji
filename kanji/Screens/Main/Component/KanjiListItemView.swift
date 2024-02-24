//
//  KanjiListItemView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct KanjiListItemView: View {
    
    @State private var index: Int = 0
    
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
            
            Text("\(self.index + 1)/\(self.total)")
        }
        .font(.ownglyph(size: 20))
        .foregroundColor(.white)
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(
            Capsule().fill(Color.black.opacity(0.75))
        )
        .onAppear {
            self.index = UserDefaults.standard.object(forKey: grade.rawValue) as? Int ?? 0
        }
    }
}

#Preview {
    KanjiListItemView(grade: .two)
}
