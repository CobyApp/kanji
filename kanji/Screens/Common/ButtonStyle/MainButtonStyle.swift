//
//  MainButtonStyle.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title3)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Capsule().fill(Color.black.opacity(0.75))
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
