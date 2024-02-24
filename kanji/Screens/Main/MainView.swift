//
//  MainView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var state: StateType = .start
    @State private var isSpearkOn: Bool = true
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("mainBg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .overlay(
                        Color.black.opacity(self.state == .start ? 0 : 0.5)
                    )
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                TopAppbarView()
                
                Spacer()
            }
            .padding()
            .zIndex(1)
            
            Group {
                switch self.state {
                case .start:
                    StartView(state: self.$state)
                case .kanji:
                    KanjiView()
                case .korean:
                    KoreanView()
                case .word:
                    WordView()
                }
            }
            .zIndex(0)
        }
        .onAppear {
            self.isSpearkOn = UserDefaults.standard.object(forKey: "isSpeakerOn") as? Bool ?? true
            let _ = TextToSpeechConverter.shared
            let _ = CharacterStorage.shared
        }
    }
    
    @ViewBuilder
    private func TopAppbarView() -> some View {
        HStack(alignment: .center) {
            switch self.state {
            case .start:
                Button {
                    self.isSpearkOn.toggle()
                    UserDefaults.standard.set(self.isSpearkOn, forKey: "isSpeakerOn")
                } label: {
                    Image(systemName: self.isSpearkOn ? "speaker.fill" : "speaker.slash.fill")
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(Circle().fill(Color.black.opacity(0.8)))
                }
            default:
                Button {
                    self.state = .start
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(Circle().fill(Color.black.opacity(0.8)))
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    MainView()
}
