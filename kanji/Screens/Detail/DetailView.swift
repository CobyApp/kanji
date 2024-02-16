//
//  DetailView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var characters: [Character]
    @State private var index: Int
    
    init(grade: GradeType) {
        self._characters = State(wrappedValue: CharacterStorage.shared.characters.getCharactersByGrade(grade: grade))
        self._index = State(wrappedValue: 0)
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("mainBg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .overlay(
                        Color.black.opacity(0.5)
                    )
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                KanjiView(character: self.$characters[self.index])
                
                Spacer()
                
                Button("공부 그만하기") {
                    self.dismiss()
                    AudioPlayerManager.shared.playSound()
                }
                .buttonStyle(MainButtonStyle())
            }
            .padding()
        }
    }
}

#Preview {
    DetailView(grade: .two)
}
