//
//  CloseButtonStyle.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct CloseButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .overlay(
                ZStack {
                    Circle()
                        .background(Circle().fill(Color.white.opacity(0.5)))
                        .frame(width: 50, height: 50)
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                }
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .padding(20)
    }
}
