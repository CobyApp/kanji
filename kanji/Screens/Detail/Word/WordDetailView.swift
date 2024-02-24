//
//  WordDetailView.swift
//  kanji
//
//  Created by Coby on 2/24/24.
//

import SwiftUI

struct WordDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var index: Int = 0
    @State private var count: Int = 0
    @State private var wordSounds: [String] = []
    
    private let characterStorage: CharacterStorage = CharacterStorage.shared
    private let columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 100, maximum: .infinity)), count: 2)
    
    private let wordItems: [WordItem]
    private let grade: GradeType
    
    init(grade: GradeType) {
        self.grade = grade
        self.wordItems = characterStorage.getWordsByGrade(grade: grade)
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
            
            GeometryReader { geometry in
                VStack(spacing: 16) {
                    TopAppbarView()
                    
                    KanjiBoardView(kanji: self.wordItems[self.index].wordKanji)
                        .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6)
                        .padding(.bottom)
                    
                    VStack(spacing: 4) {
                        QuizTitleView(
                            count: self.count,
                            index: self.index,
                            total: self.wordItems.count
                        )
                        
                        GeometryReader { geometry in
                            LazyVGrid(columns: self.columns, spacing: 4) {
                                ForEach(self.wordSounds, id: \.self) { wordSound in
                                    QuizItemView(quiz: wordSound)
                                        .frame(width: (geometry.size.width - 4) / 2, height: (geometry.size.height - 4) / 2)
                                        .onTapGesture {
                                            if wordSound == self.wordItems[self.index].wordSound {
                                                self.nextIndex()
                                            } else {
                                                self.wordSounds = self.characterStorage.getRandomWordSounds(wordSound: self.wordItems[self.index].wordSound)
                                                self.count += 1
                                                UserDefaults.standard.set(self.count, forKey: "word" + self.wordItems[self.index].wordKanji)
                                            }
                                        }
                                }
                            }
                        }
                    }
                    
                    HStack(spacing: 10) {
                        Button("이전") {
                            self.beforeIndex()
                        }
                        .buttonStyle(MainButtonStyle())
                        
                        Button("다음") {
                            self.nextIndex()
                        }
                        .buttonStyle(MainButtonStyle())
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
        }
        .onAppear {
            self.index = UserDefaults.standard.object(forKey: "word" + grade.rawValue) as? Int ?? 0
            self.count = UserDefaults.standard.object(forKey: "word" + self.wordItems[self.index].wordKanji) as? Int ?? 0
            self.wordSounds = self.characterStorage.getRandomWordSounds(wordSound: self.wordItems[self.index].wordSound)
        }
        .onChange(of: self.index) {
            UserDefaults.standard.set(self.index, forKey: "word" + self.grade.rawValue)
            self.count = UserDefaults.standard.object(forKey: "word" + self.wordItems[self.index].wordKanji) as? Int ?? 0
            self.wordSounds = self.characterStorage.getRandomWordSounds(wordSound: self.wordItems[self.index].wordSound)
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
                    .frame(width: 50, height: 50)
                    .background(Circle().fill(Color.black.opacity(0.8)))
            }
            
            Spacer()
            
            NavigationLink {
                KoreanGalleryView(grade: grade)
                    .navigationBarHidden(true)
            } label: {
                Text("목록")
                    .font(.ownglyph(size: 20))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .frame(width: 80, height: 50)
                    .background(
                        Capsule().fill(Color.black.opacity(0.8))
                    )
            }
        }
    }
    
    func beforeIndex() {
        if self.index == 0 {
            self.index = self.wordItems.count - 1
        } else {
            self.index -= 1
        }
    }
    
    func nextIndex() {
        if self.index == self.wordItems.count - 1 {
            self.index = 0
        } else {
            self.index += 1
        }
    }
}
