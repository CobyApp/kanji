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
    
    private init() {
        self.configureAudioSession()
    }
    
    private func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.defaultToSpeaker, .mixWithOthers])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("오디오 세션 설정 실패: \(error)")
        }
    }
    
    func speak(text: String) {
        if UserDefaults.standard.object(forKey: "isSpeakerOn") as? Bool ?? true {
            let speechUtterance = AVSpeechUtterance(string: text)
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
            speechUtterance.rate = 0.3
            speechSynthesizer.speak(speechUtterance)
        }
    }
    
    func stopSpeaking() {
        speechSynthesizer.stopSpeaking(at: .immediate)
    }
    
    func speakKanji(sound: String, meaning: String) {
        self.stopSpeaking()
        self.speak(text: sound)
        self.speak(text: meaning)
    }
}
