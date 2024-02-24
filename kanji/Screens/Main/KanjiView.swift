//
//  KanjiView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct KanjiView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(GradeType.allCases, id: \.self) { grade in
                    NavigationLink(value: grade) {
                        KanjiListItemView(grade: grade)
                    }
                }
                .navigationDestination(for: GradeType.self) { grade in
                    KanjiDetailView(grade: grade)
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
    KanjiView()
}
