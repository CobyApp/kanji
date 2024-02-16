//
//  MainView.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

struct MainView: View {
    
    let characters = CharacterStorage.shared.characters
    
    var body: some View {
        Text("Main")
    }
}

#Preview {
    MainView()
}
