//
//  CharacterStorage.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import Foundation

final class CharacterStorage {
    
    static let shared = CharacterStorage()
    
    var characters: [Character] = []
    
    private init() {
        self.loadCharacters()
    }
    
    func loadCharacters() {
        do {
            guard let path = Bundle.main.path(forResource: "characters", ofType: "json") else { return }
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            self.characters = try JSONDecoder().decode([CharacterDTO].self, from: data).map { $0.toCharacter() }
        } catch {
            print("Error loading or decoding JSON: \(error)")
        }
    }
}
