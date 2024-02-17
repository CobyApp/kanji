//
//  GradeView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct GradeView: View {
    
    @Binding var state: StateType
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(GradeType.allCases, id: \.self) { grade in
                        NavigationLink(value: grade) {
                            GradeListItemView(grade: grade)
                        }
                    }
                    .navigationDestination(for: GradeType.self) { grade in
                        DetailView(grade: grade)
                            .navigationBarHidden(true)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            
            Button("메인으로 돌아가기") {
                self.state = .start
            }
            .buttonStyle(MainButtonStyle())
            .padding()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    GradeView(state: .constant(.grade))
}
