//
//  MainView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct MainView: View {
    
    let characters = CharacterStorage.shared.characters
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("full1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                
                VStack {
                    Spacer()
                    
                    Button(action: {
                        print("니코랑 한자 외우기")
                    }) {
                        Text("니코랑 공부하기")
                            .font(.title)
                            .padding()
                   
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
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
