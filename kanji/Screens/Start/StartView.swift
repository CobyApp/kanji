//
//  StartView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct StartView: View {
    
    @State private var learn: LearnType? = nil
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("mainBg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .overlay(
                        Color.black.opacity(self.learn == nil ? 0 : 0.5)
                    )
            }
            .edgesIgnoringSafeArea(.all)
            
            if self.learn == nil {
                SelectView(learn: self.$learn)
            } else {
                GradeView(learn: self.$learn)
            }
        }
    }
}

#Preview {
    StartView()
}
