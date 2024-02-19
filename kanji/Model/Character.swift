//
//  Character.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import Foundation

struct Character: Hashable {
    let grade: GradeType
    let kanji: String
    let korean: String
    let sounds: [String]
    let meanings: [String]
    let words1: [WordItem]
    let words2: [WordItem]
}

extension Character {
    var fullSound: String {
        self.sounds.joined(separator: ", ")
    }
    
    var fullMeaning: String {
        self.meanings.joined(separator: ", ")
    }
}

extension [Character] {
    func getCharactersByGrade(grade: GradeType) -> [Character] {
        self.filter { $0.grade == grade }
    }
}

struct WordItem: Hashable {
    let word: String
    let mean: String
}
