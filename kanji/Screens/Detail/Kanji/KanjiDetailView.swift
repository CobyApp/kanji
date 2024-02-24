//
//  KanjiDetailView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct KanjiDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var index: Int = 0
    
    private let characterStorage: CharacterStorage = CharacterStorage.shared
    private let tts: TextToSpeechConverter = TextToSpeechConverter.shared
    
    private let characters: [Character]
    private let grade: GradeType
    
    init(grade: GradeType) {
        self.grade = grade
        self.characters = characterStorage.getCharactersByGrade(grade: grade)
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
                    
                    KanjiBoardView(kanji: self.characters[self.index].kanji)
                        .frame(width: geometry.size.width * 0.4, height: geometry.size.width * 0.4)
                        .padding(.bottom)
                    
                    KanjiInfoView(
                        character: self.characters[self.index],
                        total: self.characters.count,
                        count: self.index + 1
                    )
                    
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
            self.index = UserDefaults.standard.object(forKey: grade.rawValue) as? Int ?? 0
            self.tts.speakKanji(sound: self.characters[index].fullSound, meaning: self.characters[index].fullMeaning)
        }
        .onDisappear {
            self.tts.stopSpeaking()
        }
        .onChange(of: self.index) {
            UserDefaults.standard.set(self.index, forKey: self.grade.rawValue)
            self.tts.speakKanji(sound: self.characters[index].fullSound, meaning: self.characters[index].fullMeaning)
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
                KanjiGalleryView(grade: grade)
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
            self.index = self.characters.count - 1
        } else {
            self.index -= 1
        }
    }
    
    func nextIndex() {
        if self.index == self.characters.count - 1 {
            self.index = 0
        } else {
            self.index += 1
        }
    }
}
