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
        VStack {
            Spacer()
            
            Button("니코짱과 공부하기") {
                self.state = .grade
                
                if let scene = UIApplication.shared.connectedScenes
                    .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                    SKStoreReviewController.requestReview(in: scene)
                }
            }
            .buttonStyle(MainButtonStyle())
            .padding()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    StartView(state: .constant(.start))
}
