//
//  GalleryView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct GalleryView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    private let grade: GradeType
    private let characters: [Character]
    
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    init(grade: GradeType) {
        self.grade = grade
        self.characters = CharacterStorage.shared.characters.getCharactersByGrade(grade: grade)
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("detailBg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .overlay(
                        Color.black.opacity(0.5)
                    )
            }
            .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                LazyVGrid(columns: self.columns, spacing: 10) {
                    ForEach(Array(self.characters.enumerated()), id: \.element) { index, character in
                        GalleryListItemView(kanji: character.kanji)
                            .scaledToFit()
                            .onTapGesture {
                                UserDefaults.standard.set(index, forKey: self.grade.rawValue)
                                self.dismiss()
                            }
                    }
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    GalleryView(grade: .all)
}
