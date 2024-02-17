//
//  TextToSpeechConverter.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import AVFoundation

class TextToSpeechConverter {
    
    static let shared = TextToSpeechConverter()
    
    private let speechSynthesizer = AVSpeechSynthesizer()
    
    private init() {}
    
    func speak(text: String) {
        if UserDefaults.standard.object(forKey: "isSpeakerOn") as? Bool ?? true {
            let speechUtterance = AVSpeechUtterance(string: text)
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
            speechUtterance.rate = 0.3
            speechSynthesizer.speak(speechUtterance)
        }
    }
}
