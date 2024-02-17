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
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                HStack {
                    Text(self.character.korean)
                        .font(.ownglyph(size: 24))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("\(self.count)/\(self.total)")
                        .font(.ownglyph(size: 20))
                        .foregroundColor(.white)
                }
                
                Divider()
                    .background(Color.white)
            }
            
            VStack(spacing: 14) {
                if self.character.fullSound != "" {
                    HStack(spacing: 12) {
                        Text("음")
                            .font(.ownglyph(size: 18))
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                            .background(Circle().fill(Color.white.opacity(0.9)))
                        
                        Text(self.character.fullSound)
                            .font(.jkMaru(size: 21))
                            .foregroundColor(.white)
                            .lineSpacing(6)
                        
                        Spacer()
                    }
                }
                
                if self.character.fullMeaning != "" {
                    HStack(spacing: 12) {
                        Text("훈")
                            .font(.ownglyph(size: 18))
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                            .background(Circle().fill(Color.white.opacity(0.9)))
                        
                        Text(self.character.fullMeaning)
                            .font(.jkMaru(size: 21))
                            .foregroundColor(.white)
                            .lineSpacing(6)
                        
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
