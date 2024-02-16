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
            
            VStack(spacing: 0) {
                TopAppbarView()
                
                KanjiView(kanji: self.characters[self.index].kanji)
                
                CharacterInfoView()
                
                HStack(spacing: 10) {
                    Button("이전") {
                        if self.index == 0 {
                            self.index = self.characters.count - 1
                        } else {
                            self.index -= 1
                        }
                    }
                    .buttonStyle(MainButtonStyle())
                    
                    Button("다음") {
                        if self.index == self.characters.count - 1 {
                            self.index = 0
                        } else {
                            self.index += 1
                        }
                    }
                    .buttonStyle(MainButtonStyle())
                }
                .padding(.top)
            }
            .frame(maxWidth: .infinity)
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
    
    @ViewBuilder
    private func CharacterInfoView() -> some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                VStack(spacing: 12) {
                    HStack {
                        Text(self.characters[self.index].korean)
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text("\(self.index)/\(self.total)")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                        .background(Color.white)
                }
                
                VStack(spacing: 20) {
                    HStack(spacing: 12) {
                        Text("음")
                            .font(.title3)
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                            .background(Circle().fill(Color.white.opacity(0.75)))
                        
                        Text(self.characters[self.index].fullSound)
                            .font(.title3)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    
                    HStack(spacing: 12) {
                        Text("훈")
                            .font(.title3)
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                            .background(Circle().fill(Color.white.opacity(0.75)))
                        
                        Text(self.characters[self.index].fullMeaning)
                            .font(.title3)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black.opacity(0.75))
        )
    }
}

#Preview {
    DetailView(grade: .two)
}
