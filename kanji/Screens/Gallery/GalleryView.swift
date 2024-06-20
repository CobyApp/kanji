//
//  GalleryView.swift
//  kanji
//
//  Created by Coby on 6/21/24.
//

import SwiftUI

struct GalleryView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var index: Int = 0
    @State private var count: Int = 0
    
    private let learn: LearnType
    private let grade: GradeType
    private let characters: [Character]
    private let wordItems: [WordItem]
    
    var total: Int {
        self.learn.getTotalIndex(self.grade)
    }
    
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    init(
        learn: LearnType,
        grade: GradeType
    ) {
        self.learn = learn
        self.grade = grade
        self.characters = CharacterStorage.shared.getCharactersByGrade(grade: grade)
        self.wordItems = CharacterStorage.shared.getWordsByGrade(grade: grade)
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
            
            if self.learn == .word {
                WordGalleryView()
            } else {
                KanjiGalleryView()
            }
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
            
            Text("\(self.grade.title) - 총 \(self.learn == .word ? "\(self.wordItems.count)단어" : "\(self.characters.count)자"))")
                .font(.ownglyph(size: 20))
                .foregroundColor(.white)
                .padding(.horizontal)
                .frame(height: 50)
                .background(
                    Capsule().fill(Color.black.opacity(0.8))
                )
        }
    }
    
    @ViewBuilder
    private func KanjiGalleryView() -> some View {
        ScrollView {
            ScrollViewReader { value in
                VStack {
                    LazyVGrid(columns: self.columns, spacing: 10) {
                        ForEach(Array(self.characters.enumerated()), id: \.element) { index, character in
                            GalleryItemView(kanji: character.kanji)
                                .overlay(
                                    Color.black.opacity(index <= self.index ? 0.3 : 0)
                                )
                                .scaledToFit()
                                .onTapGesture {
                                    UserDefaults.standard.set(index, forKey: self.learn.rawValue + self.grade.rawValue)
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
                    self.index = self.learn.getLearnedIndex(self.grade)
                    value.scrollTo(self.index, anchor: .init(x: 0.0, y: 0.2))
                }
            }
        }
        .frame(maxWidth: .infinity)
        .zIndex(0)
    }
    
    @ViewBuilder
    private func WordGalleryView() -> some View {
        ScrollView {
            ScrollViewReader { value in
                VStack {
                    LazyVGrid(columns: self.columns, spacing: 10) {
                        ForEach(Array(self.wordItems.enumerated()), id: \.element) { index, wordItem in
                            WordGalleryItemView(kanji: wordItem.wordKanji)
                                .overlay(
                                    Color.black.opacity(index <= self.index ? 0.3 : 0)
                                )
                                .scaledToFit()
                                .onTapGesture {
                                    UserDefaults.standard.set(index, forKey: self.learn.rawValue + self.grade.rawValue)
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
                    self.index = self.learn.getLearnedIndex(self.grade)
                    value.scrollTo(self.index, anchor: .init(x: 0.0, y: 0.2))
                }
            }
        }
        .frame(maxWidth: .infinity)
        .zIndex(0)
    }
}
