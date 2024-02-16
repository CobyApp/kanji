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
    let sound: String
    let meaning: String
}

extension CharacterDTO {
    func toCharacter() -> Character {
        Character(
            grade: self.gradeType,
            kanji: self.kanji,
            korean: self.korean,
            sounds: self.sound.components(separatedBy: ","),
            meanings: self.meaning.components(separatedBy: ",")
        )
    }
    
    var gradeType: GradeType {
        switch self.grade {
        case "소학교1학년":
            return .one
        case "소학교2학년":
            return .two
        case "소학교3학년":
            return .three
        case "소학교4학년":
            return .four
        case "소학교5학년":
            return .five
        case "소학교6학년":
            return .six
        default:
            return .mid
        }
    }
}