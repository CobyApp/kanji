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
            .font(.ownglyph(size: 20))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(
                Capsule().fill(Color.black.opacity(0.75))
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
