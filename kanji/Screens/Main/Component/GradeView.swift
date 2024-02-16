//
//  GradeView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct GradeView: View {
    
    @Binding var state: StateType
    
    let characters = CharacterStorage.shared.characters
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                ForEach(GradeType.allCases, id: \.self) { grade in
                    Button(grade.title) {
                        AudioPlayerManager.shared.playSound()
                    }
                    .buttonStyle(MainButtonStyle())
                }
            }
            
            Spacer()
            
            Button("메인으로 돌아가기") {
                self.state = .start
                AudioPlayerManager.shared.playSound()
            }
            .buttonStyle(MainButtonStyle())
        }
    }
}

#Preview {
    GradeView(state: .constant(.grade))
}
