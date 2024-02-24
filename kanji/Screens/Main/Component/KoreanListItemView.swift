//
//  KoreanListItemView.swift
//  kanji
//
//  Created by Coby on 2/24/24.
//

import SwiftUI

struct KoreanListItemView: View {
    
    @State private var index: Int = 0
    
    private let grade: GradeType
    private let total: Int
    
    init(grade: GradeType) {
        self.grade = grade
        self.total = CharacterStorage.shared.getCharactersByGrade(grade: grade).count
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
        .frame(height: 60)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black.opacity(0.8))
        )
        .onAppear {
            self.index = UserDefaults.standard.object(forKey: "korean" + grade.rawValue) as? Int ?? 0
        }
    }
}

#Preview {
    KoreanListItemView(grade: .three)
}
