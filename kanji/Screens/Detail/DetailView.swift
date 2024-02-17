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
    @State private var index: Int = 0
    
    private let grade: GradeType
    private let total: Int
    
    init(grade: GradeType) {
        let characters = CharacterStorage.shared.characters.getCharactersByGrade(grade: grade)
        self._characters = State(wrappedValue: characters)
        self.grade = grade
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
            
            VStack(spacing: 0) {
                TopAppbarView()
                    .zIndex(1)
                
                KanjiView(kanji: self.characters[self.index].kanji)
                    .padding([.top, .horizontal], -60)
                    .zIndex(0)
                
                CharacterInfoView()
                
                HStack(spacing: 10) {
                    Button("이전") {
                        if self.index == 0 {
                            self.index = self.characters.count - 1
                        } else {
                            self.index -= 1
                        }
                        
                        UserDefaults.standard.set(self.index, forKey: self.grade.rawValue)
                    }
                    .buttonStyle(MainButtonStyle())
                    
                    Button("다음") {
                        if self.index == self.characters.count - 1 {
                            self.index = 0
                        } else {
                            self.index += 1
                        }
                        
                        UserDefaults.standard.set(self.index, forKey: self.grade.rawValue)
                    }
                    .buttonStyle(MainButtonStyle())
                }
                .padding(.top)
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .onAppear {
            self.index = UserDefaults.standard.integer(forKey: grade.rawValue)
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
            
            NavigationLink {
                GalleryView(grade: grade, index: self.index)
                    .navigationBarHidden(true)
            } label: {
                Text("목록")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .frame(width: 80, height: 50)
                    .background(
                        Capsule().fill(Color.black.opacity(0.75))
                    )
            }
        }
    }
    
    @ViewBuilder
    private func CharacterInfoView() -> some View {
        VStack(spacing: 24) {
            VStack(spacing: 12) {
                HStack {
                    Text(self.characters[self.index].korean)
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("\(self.index + 1)/\(self.total)")
                        .font(.title3)
                        .foregroundColor(.white)
                }
                
                Divider()
                    .background(Color.white)
            }
            
            VStack(spacing: 20) {
                if self.characters[self.index].fullSound != "" {
                    HStack(spacing: 12) {
                        Text("음")
                            .font(.title3)
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                            .background(Circle().fill(Color.white.opacity(0.9)))
                        
                        Text(self.characters[self.index].fullSound)
                            .font(.title3)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                }
                
                if self.characters[self.index].fullMeaning != "" {
                    HStack(spacing: 12) {
                        Text("훈")
                            .font(.title3)
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                            .background(Circle().fill(Color.white.opacity(0.9)))
                        
                        Text(self.characters[self.index].fullMeaning)
                            .font(.title3)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                }
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black.opacity(0.8))
        )
    }
}

#Preview {
    DetailView(grade: .two)
}
