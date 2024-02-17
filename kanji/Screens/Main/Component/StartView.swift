//
//  StartView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct StartView: View {
    
    @Binding var state: StateType
    
    var body: some View {
        VStack {
            Spacer()
            
            Button("니코랑 공부하기") {
                self.state = .grade
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
