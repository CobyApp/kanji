//
//  GradeView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct GradeView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(GradeType.allCases, id: \.self) { grade in
                    NavigationLink(value: grade) {
                        GradeListItemView(grade: grade)
                    }
                }
                .navigationDestination(for: GradeType.self) { grade in
                    DetailView(grade: grade, index: UserDefaults.standard.object(forKey: grade.rawValue) as? Int ?? 0)
                        .navigationBarHidden(true)
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 80)
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    GradeView()
}
