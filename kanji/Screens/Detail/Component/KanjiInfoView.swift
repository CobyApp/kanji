//
//  KanjiInfoView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct KanjiInfoView: View {
    
    private let character: Character
    private let total: Int
    private let count: Int
    
    init(character: Character, total: Int, count: Int) {
        self.character = character
        self.total = total
        self.count = count
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 14) {
                HStack {
                    Text(self.character.korean)
                        .font(.ownglyph(size: 21))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("\(self.count)/\(self.total)")
                        .font(.ownglyph(size: 20))
                        .foregroundColor(.white)
                }
                
                Divider()
                    .background(Color.white)
                
                VStack(spacing: 10) {
                    if self.character.fullSound != "" {
                        HStack(spacing: 10) {
                            Text("음")
                                .font(.ownglyph(size: 17))
                                .foregroundColor(.black)
                                .frame(width: 24, height: 24)
                                .background(Circle().fill(Color.white.opacity(0.9)))
                            
                            Text(self.character.fullSound)
                                .font(.jkMaru(size: 18))
                                .foregroundColor(.white)
                                .lineSpacing(6)
                            
                            Spacer()
                        }
                    }
                    
                    if self.character.fullMeaning != "" {
                        HStack(spacing: 10) {
                            Text("훈")
                                .font(.ownglyph(size: 17))
                                .foregroundColor(.black)
                                .frame(width: 24, height: 24)
                                .background(Circle().fill(Color.white.opacity(0.9)))
                            
                            Text(self.character.fullMeaning)
                                .font(.jkMaru(size: 18))
                                .foregroundColor(.white)
                                .lineSpacing(6)
                            
                            Spacer()
                        }
                    }
                }
                
                Divider()
                    .background(Color.white)
                
                VStack(spacing: 8) {
                    ForEach(self.character.words1, id: \.self) { wordItem in
                        HStack(spacing: 8) {
                            Text(wordItem.word)
                                .font(.jkMaru(size: 17))
                                .foregroundColor(.white)
                                .lineSpacing(6)
                            
                            Text(wordItem.mean)
                                .font(.ownglyph(size: 17))
                                .foregroundColor(.white)
                                .lineSpacing(6)
                                .padding(.top, 2)
                            
                            Spacer()
                        }
                    }
                    
                    ForEach(self.character.words2, id: \.self) { wordItem in
                        HStack(spacing: 8) {
                            Text(wordItem.word)
                                .font(.jkMaru(size: 17))
                                .foregroundColor(.white)
                                .lineSpacing(6)
                            
                            Text(wordItem.mean)
                                .font(.ownglyph(size: 17))
                                .foregroundColor(.white)
                                .lineSpacing(6)
                                .padding(.top, 2)
                            
                            Spacer()
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.vertical, 20)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black.opacity(0.8))
        )
    }
}
