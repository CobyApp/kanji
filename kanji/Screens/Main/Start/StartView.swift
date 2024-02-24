//
//  StartView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI
import StoreKit

struct StartView: View {
    
    @Binding var state: StateType
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            
            Button("한자 공부하기") {
                self.state = .kanji
                
                if let scene = UIApplication.shared.connectedScenes
                    .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                    SKStoreReviewController.requestReview(in: scene)
                }
            }
            .buttonStyle(MainButtonStyle())
            
            Button("뜻음 퀴즈") {
                self.state = .korean
            }
            .buttonStyle(MainButtonStyle())
            
            Button("단어 퀴즈") {
                self.state = .korean
            }
            .buttonStyle(MainButtonStyle())
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    StartView(state: .constant(.start))
}
