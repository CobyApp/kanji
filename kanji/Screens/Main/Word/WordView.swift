//
//  WordView.swift
//  kanji
//
//  Created by Coby on 2/24/24.
//

import SwiftUI

struct WordView: View {

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(GradeType.allCases, id: \.self) { grade in
                    NavigationLink(value: grade) {
                        WordListItemView(grade: grade)
                    }
                }
                .navigationDestination(for: GradeType.self) { grade in
                    KoreanDetailView(grade: grade)
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
    WordView()
}
