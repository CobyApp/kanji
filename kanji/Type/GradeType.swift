//
//  GradeType.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import Foundation

enum GradeType {
    case one, two, three, four, five, six, mid
    
    var title: String {
        switch self {
        case .one:
            return "초등학교 1학년"
        case .two:
            return "초등학교 2학년"
        case .three:
            return "초등학교 3학년"
        case .four:
            return "초등학교 4학년"
        case .five:
            return "초등학교 5학년"
        case .six:
            return "초등학교 6학년"
        case .mid:
            return "중학교"
        }
    }
}
