//
//  LearnType.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import Foundation

enum LearnType: String, CaseIterable {
    case kanji, korean, word
    
    var title: String {
        switch self {
        case .kanji:
            "한자 공부하기"
        case .korean:
            "뜻음 퀴즈"
        case .word:
            "단어 퀴즈"
        }
    }
    
    func getTotalIndex(_ grade: GradeType) -> Int {
        switch self {
        case .kanji:
            CharacterStorage.shared.getCharactersByGrade(grade: grade).count
        case .korean:
            CharacterStorage.shared.getCharactersByGrade(grade: grade).count
        case .word:
            CharacterStorage.shared.getWordsByGrade(grade: grade).count
        }
    }
    
    func getLearnedIndex(_ grade: GradeType) -> Int {
        switch self {
        case .kanji:
            UserDefaults.standard.object(forKey: self.rawValue + grade.rawValue) as? Int ?? 0
        case .korean:
            UserDefaults.standard.object(forKey: self.rawValue + grade.rawValue) as? Int ?? 0
        case .word:
            UserDefaults.standard.object(forKey: self.rawValue + grade.rawValue) as? Int ?? 0
        }
    }
    
    func beforeIndex(_ grade: GradeType) -> Int {
        if self.getLearnedIndex(grade) == 0 {
            UserDefaults.standard.set(self.getTotalIndex(grade) - 1, forKey: self.rawValue + grade.rawValue)
        } else {
            UserDefaults.standard.set(self.getLearnedIndex(grade) - 1, forKey: self.rawValue + grade.rawValue)
        }
        
        return self.getLearnedIndex(grade)
    }
    
    func nextIndex(_ grade: GradeType) -> Int {
        if self.getLearnedIndex(grade) == self.getTotalIndex(grade) - 1 {
            UserDefaults.standard.set(0, forKey: self.rawValue + grade.rawValue)
        } else {
            UserDefaults.standard.set(self.getLearnedIndex(grade) + 1, forKey: self.rawValue + grade.rawValue)
        }
        
        return self.getLearnedIndex(grade)
    }
    
    func getCount(_ grade: GradeType) -> Int {
        switch self {
        case .kanji:
            UserDefaults.standard.object(forKey: self.rawValue + CharacterStorage.shared.getCharactersByGrade(grade: grade)[self.getLearnedIndex(grade)].kanji) as? Int ?? 0
        case .korean:
            UserDefaults.standard.object(forKey: self.rawValue + CharacterStorage.shared.getCharactersByGrade(grade: grade)[self.getLearnedIndex(grade)].kanji) as? Int ?? 0
        case .word:
            UserDefaults.standard.object(forKey: self.rawValue + CharacterStorage.shared.getWordsByGrade(grade: grade)[self.getLearnedIndex(grade)].wordKanji) as? Int ?? 0
        }
    }
    
    func addCount(_ grade: GradeType) -> Int {
        switch self {
        case .kanji:
            UserDefaults.standard.set(self.getCount(grade) + 1, forKey: self.rawValue + CharacterStorage.shared.getCharactersByGrade(grade: grade)[self.getLearnedIndex(grade)].kanji)
        case .korean:
            UserDefaults.standard.set(self.getCount(grade) + 1, forKey: self.rawValue + CharacterStorage.shared.getCharactersByGrade(grade: grade)[self.getLearnedIndex(grade)].kanji)
        case .word:
            UserDefaults.standard.set(self.getCount(grade) + 1, forKey: self.rawValue + CharacterStorage.shared.getWordsByGrade(grade: grade)[self.getLearnedIndex(grade)].wordKanji)
        }
        
        return self.getCount(grade)
    }
    
    func getQuizItems(_ grade: GradeType) -> [String] {
        switch self {
        case .kanji:
            CharacterStorage.shared.getRandomKoreans(korean: CharacterStorage.shared.getCharactersByGrade(grade: grade)[self.getLearnedIndex(grade)].korean)
        case .korean:
            CharacterStorage.shared.getRandomKoreans(korean: CharacterStorage.shared.getCharactersByGrade(grade: grade)[self.getLearnedIndex(grade)].korean)
        case .word:
            CharacterStorage.shared.getRandomWordSounds(wordSound: CharacterStorage.shared.getWordsByGrade(grade: grade)[self.getLearnedIndex(grade)].wordSound)
        }
    }
}
