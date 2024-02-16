//
//  MainView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var state: StateType = .start
    
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
                Group {
                    switch self.state {
                    case .start:
                        StartView(state: self.$state)
                    case .grade:
                        GradeView(state: self.$state)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    MainView()
}
