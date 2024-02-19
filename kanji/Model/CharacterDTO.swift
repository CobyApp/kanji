//
//  CharacterDTO.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import Foundation

struct CharacterDTO: Decodable {
    let grade: String
    let kanji: String
    let korean: String
    let sound: String?
    let meaning: String?
    let word1: String?
    let word2: String?
}

extension CharacterDTO {
    func toCharacter() -> Character {
        Character(
            grade: self.gradeType,
            kanji: self.kanji,
            korean: self.korean,
            sounds: self.sounds,
            meanings: self.meanings,
            words1: self.words1,
            words2: self.words2
        )
    }
    
    var gradeType: GradeType {
        switch self.grade {
        case "초등학교 1학년":
            return .one
        case "초등학교 2학년":
            return .two
        case "초등학교 3학년":
            return .three
        case "초등학교 4학년":
            return .four
        case "초등학교 5학년":
            return .five
        case "초등학교 6학년":
            return .six
        default:
            return .mid
        }
    }
    
    var sounds: [String] {
        guard let sound = self.sound else { return [] }
        return sound.components(separatedBy: ",")
    }
    
    var meanings: [String] {
        guard let meaning = self.meaning else { return [] }
        return meaning.components(separatedBy: ",")
    }
    
    var word1s: [String] {
        guard let word1 = self.word1 else { return [] }
        return word1.components(separatedBy: "&")
    }
    
    var word2s: [String] {
        guard let word1 = self.word2 else { return [] }
        return word1.components(separatedBy: "&")
    }
    
    var words1: [WordItem] {
        self.word1s.map {
            let words = $0.components(separatedBy: "] ")
            return WordItem(
                word: "\(words.first ?? "")]",
                mean: "\(words.last ?? "")"
            )
        }
    }
    
    var words2: [WordItem] {
        self.word2s.map {
            let words = $0.components(separatedBy: "] ")
            return WordItem(
                word: "\(words.first ?? "")]",
                mean: "\(words.last ?? "")"
            )
        }
    }
}
