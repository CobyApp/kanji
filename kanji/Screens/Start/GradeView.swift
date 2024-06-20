//
//  GradeView.swift
//  kanji
//
//  Created by Coby on 6/21/24.
//

import SwiftUI

struct GradeView: View {
    
    @Binding var learn: LearnType?
    
    var body: some View {
        VStack {
            TopAppbarView()
            
            if let learn = self.learn {
                GradeListView(learn: learn)
            }
        }
    }
    
    @ViewBuilder
    private func TopAppbarView() -> some View {
        HStack(alignment: .center) {
            Image(systemName: "chevron.left")
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(Circle().fill(Color.black.opacity(0.8)))
                .onTapGesture {
                    self.learn = nil
                }
            
            Spacer()
        }
        .padding()
    }
    
    @ViewBuilder
    private func GradeListView(learn: LearnType) -> some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(GradeType.allCases, id: \.self) { grade in
                    NavigationLink(value: grade) {
                        GradeListItemView(
                            learn: learn,
                            grade: grade
                        )
                    }
                }
                .navigationDestination(for: GradeType.self) { grade in
                    DetailView(
                        learn: learn,
                        grade: grade
                    )
                    .navigationBarHidden(true)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    GradeView(learn: .constant(.kanji))
}
