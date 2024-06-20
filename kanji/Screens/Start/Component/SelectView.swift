//
//  SelectView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI
import StoreKit

struct SelectView: View {
    
    @Binding var learn: LearnType?
    
    @State private var isSpearkOn: Bool = true
    
    var body: some View {
        VStack {
            TopAppbarView()
            
            Spacer()
            
            SelectListView()
        }
        .onAppear {
            self.isSpearkOn = UserDefaults.standard.object(forKey: "isSpeakerOn") as? Bool ?? true
        }
    }
    
    @ViewBuilder
    private func TopAppbarView() -> some View {
        HStack(alignment: .center) {
            Image(systemName: self.isSpearkOn ? "speaker.fill" : "speaker.slash.fill")
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(Circle().fill(Color.black.opacity(0.8)))
                .onTapGesture {
                    self.isSpearkOn.toggle()
                    UserDefaults.standard.set(self.isSpearkOn, forKey: "isSpeakerOn")
                }
            
            Spacer()
        }
        .padding()
    }
    
    @ViewBuilder
    private func SelectListView() -> some View {
        VStack(spacing: 10) {
            Spacer()
            
            ForEach(LearnType.allCases, id: \.self) { learnType in
                Button(learnType.title) {
                    self.learn = learnType
                }
                .buttonStyle(MainButtonStyle())
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SelectView(learn: .constant(.kanji))
}
