//
//  AudioPlayerManager.swift
//  kanji
//
//  Created by Coby on 2/17/24.
//

import Foundation
import AVFoundation

final class AudioPlayerManager {
    
    static let shared = AudioPlayerManager()
    
    var audioPlayer: AVAudioPlayer?
    
    private init() {
        guard let url = Bundle.main.url(forResource: "main_nico", withExtension: "mp3") else { return }
        self.audioPlayer = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
    }
    
    func playSound() {
        self.audioPlayer?.play()
    }
}
