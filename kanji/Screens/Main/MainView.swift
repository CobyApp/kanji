//
//  MainView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct MainView: View {
    
    let characters = CharacterStorage.shared.characters
    let audioPlayerManager = AudioPlayerManager.shared
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("mainBg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                
                VStack {
                    Spacer()
                    
                    Button("니코랑 공부하기") {
                        audioPlayerManager.playSound()
                    }
                    .buttonStyle(MainButtonStyle())
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    MainView()
}
