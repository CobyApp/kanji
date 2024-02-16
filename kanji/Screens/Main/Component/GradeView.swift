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
            VStack(spacing: 10) {
                ForEach(GradeType.allCases, id: \.self) { grade in
                    NavigationLink(
                        destination: DetailView(grade: grade).navigationBarHidden(true)
                    ) {
                        GradeListItemView(grade: grade)
                    }
                }
            }
            
            Spacer()
            
            Button("메인으로 돌아가기") {
                self.state = .start
            }
            .buttonStyle(MainButtonStyle())
        }
    }
}

#Preview {
    GradeView(state: .constant(.grade))
}
