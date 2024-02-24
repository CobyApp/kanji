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
    
    
    func getCharactersByGrade(grade: GradeType) -> [Character] {
        self.characters.filter { $0.grade == grade }
    }
    
    func getRandomCharacters() -> [Character] {
        let shuffledCharacters = self.characters.shuffled()
        return Array(shuffledCharacters.prefix(3))
    }
    
    func getRandomKoreans(korean: String) -> [String] {
        var quizItems = self.getRandomCharacters().map { $0.korean }
        quizItems.append(korean)
        return quizItems.shuffled()
    }
    
    func getAllWordItems() -> [WordItem] {
        self.characters.flatMap { $0.words1 + $0.words2 }
    }
    
    func getWordsByGrade(grade: GradeType) -> [WordItem] {
        self.getCharactersByGrade(grade: grade).flatMap { $0.words1 + $0.words2 }
    }
    
    func getRandomWordItems() -> [WordItem] {
        let shuffledWords = self.getAllWordItems().shuffled()
        return Array(shuffledWords.prefix(3))
    }
    
    func getRandomWordMeans(mean: String) -> [String] {
        var quizItems = self.getRandomWordItems().map { $0.mean }
        quizItems.append(mean)
        return quizItems.shuffled()
    }
}
