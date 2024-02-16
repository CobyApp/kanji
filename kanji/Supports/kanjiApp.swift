//
//  kanjiApp.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import SwiftUI

@main
struct kanjiApp: App {
    
    @State private var isShowingLaunchScreen = true
    
    var body: some Scene {
        WindowGroup {
            if isShowingLaunchScreen {
                LaunchView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isShowingLaunchScreen = false
                        }
                    }
            } else {
                MainView()
            }
        }
    }
}
