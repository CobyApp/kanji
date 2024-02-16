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
    
    private let total: Int
    
    init(grade: GradeType) {
        let characters = CharacterStorage.shared.characters.getCharactersByGrade(grade: grade)
        
        self._characters = State(wrappedValue: characters)
        self._index = State(wrappedValue: 0)
        self.total = characters.count
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
            
            VStack {
                TopAppbarView()
                
                KanjiView(character: self.$characters[self.index])
                
                Spacer()
                
                HStack(spacing: 10) {
                    Button("이전 한자") {
                        self.index = 0
                    }
                    .buttonStyle(MainButtonStyle())
                    
                    Button("다음 한자") {
                        self.index = self.characters.count - 1
                    }
                    .buttonStyle(MainButtonStyle())
                }
            }
            .padding()
        }
    }
    
    @ViewBuilder
    private func TopAppbarView() -> some View {
        HStack(alignment: .center) {
            Button {
                self.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
            }
            .frame(width: 50, height: 50)
            .background(Circle().fill(Color.black.opacity(0.75)))
            
            Spacer()
            
            Button("목록") {
            }
            .buttonStyle(MainButtonStyle())
            .frame(width: 80)
        }
    }
}

#Preview {
    DetailView(grade: .two)
}
