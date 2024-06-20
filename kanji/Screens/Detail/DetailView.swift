//
//  DetailView.swift
//  kanji
//
//  Created by Coby on 6/21/24.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var index: Int = 0
    @State private var count: Int = 0
    @State private var quizItems: [String] = []
    
    private let learn: LearnType
    private let grade: GradeType
    private let characters: [Character]
    private let wordItems: [WordItem]
    
    var total: Int {
        self.learn.getTotalIndex(self.grade)
    }
    
    private let tts: TextToSpeechConverter = TextToSpeechConverter.shared
    
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
            
            VStack(spacing: 16) {
                TopAppbarView()
            
                BoardView()
                
                InfoView()
                
                ArrowsView()
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .onAppear {
            self.index = self.learn.getLearnedIndex(self.grade)
            self.count = self.learn.getCount(self.grade)
            self.quizItems = self.learn.getQuizItems(self.grade)
            
            if self.learn == .kanji {
                self.tts.speakKanji(
                    sound: self.characters[index].fullSound,
                    meaning: self.characters[index].fullMeaning
                )
            }
        }
        .onDisappear {
            if self.learn == .kanji {
                self.tts.stopSpeaking()
            }
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
                GalleryView(
                    learn: self.learn,
                    grade: self.grade
                )
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
    
    @ViewBuilder
    private func BoardView() -> some View {
        switch self.learn {
        case .kanji, .korean:
            KanjiBoardView(kanji: self.characters[self.index].kanji)
        case .word:
            WordBoardView(
                kanji: self.wordItems[self.index].wordKanji,
                mean: self.wordItems[self.index].mean
            )
        }
    }
    
    @ViewBuilder
    private func InfoView() -> some View {
        switch self.learn {
        case .kanji:
            KanjiInfoView(
                character: self.characters[self.index],
                total: self.characters.count,
                count: self.index + 1
            )
        case .korean, .word:
            QuizView(
                count: self.count,
                index: self.index,
                total: self.total,
                quizItems: self.quizItems,
                quizAction: { item in
                    if item == self.characters[self.index].korean {
                        self.index = self.learn.nextIndex(self.grade)
                        self.count = self.learn.getCount(self.grade)
                        self.quizItems = self.learn.getQuizItems(self.grade)
                    } else {
                        self.quizItems = self.learn.getQuizItems(self.grade)
                        self.count = self.learn.addCount(self.grade)
                    }
                }
            )
        }
    }
    
    @ViewBuilder
    private func ArrowsView() -> some View {
        HStack {
            Button {
                self.index = self.learn.beforeIndex(self.grade)
            } label: {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(Circle().fill(Color.black.opacity(0.8)))
            }
            
            Spacer()
            
            Button {
                self.index = self.learn.nextIndex(self.grade)
            } label: {
                Image(systemName: "arrow.right")
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(Circle().fill(Color.black.opacity(0.8)))
            }
        }
    }
}

#Preview {
    DetailView(learn: .kanji, grade: .one)
}
