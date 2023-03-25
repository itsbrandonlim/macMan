//
//  Backsound.swift
//  mac-man
//
//  Created by Femi Rachma Pertiwi on 25/03/23.
//

import Foundation
import AVFoundation

class MusicPlayer {
    
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer?
    
    func startBackgroundMusic() {
        if let bundle = Bundle.main.path(forResource: "Dresden_The_Flamingo_A_Tasty_Treat_instrumental_3_22", ofType: "mp3") {
            let backgroundMusic = NSURL(fileURLWithPath:bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            }
            catch {
                print(error)
            }
            }
        }
    }
