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
    
    private func loadCharacters() {
        guard let path = Bundle.main.path(forResource: "characters", ofType: "json") else { return }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            self.characters = try JSONDecoder().decode([CharacterDTO].self, from: data).map { $0.toCharacter() }
        } catch {
            print("Error loading or decoding JSON: \(error)")
        }
    }
    
    func getRandomCharacters() -> [Character] {
        let shuffledCharacters = self.characters.shuffled()
        return Array(shuffledCharacters.prefix(3))
    }
    
    func getKoreanQuizItems(korean: String) -> [String] {
        var quizItems = self.getRandomCharacters().map { $0.korean }
        quizItems.append(korean)
        return quizItems.shuffled()
    }
}
