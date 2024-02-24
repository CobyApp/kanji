//
//  KanjiGalleryView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct KanjiGalleryView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var index: Int = 0
    
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
            
            VStack {
                TopAppbarView()
                
                Spacer()
            }
            .padding()
            .zIndex(1)
            
            ScrollView {
                ScrollViewReader { value in
                    VStack {
                        LazyVGrid(columns: self.columns, spacing: 10) {
                            ForEach(Array(self.characters.enumerated()), id: \.element) { index, character in
                                GalleryListItemView(kanji: character.kanji)
                                    .overlay(
                                        Color.black.opacity(index <= self.index ? 0.3 : 0)
                                    )
                                    .scaledToFit()
                                    .onTapGesture {
                                        UserDefaults.standard.set(index, forKey: self.grade.rawValue)
                                        self.dismiss()
                                    }
                                    .id(index)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 80)
                        .padding(.bottom)
                    }
                    .onAppear {
                        self.index = UserDefaults.standard.object(forKey: grade.rawValue) as? Int ?? 0
                        value.scrollTo(self.index, anchor: .init(x: 0.0, y: 0.2))
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .zIndex(0)
        }
    }
    
    @ViewBuilder
    private func TopAppbarView() -> some View {
        HStack(alignment: .center) {
            Button {
                self.dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(Circle().fill(Color.black.opacity(0.8)))
            }
            
            Spacer()
            
            Text("\(self.grade.title) - 총 \(self.characters.count)자")
                .font(.ownglyph(size: 20))
                .foregroundColor(.white)
                .padding(.horizontal)
                .frame(height: 50)
                .background(
                    Capsule().fill(Color.black.opacity(0.8))
                )
        }
    }
}
