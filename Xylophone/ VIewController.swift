//
//  ViewController.swift
//  Xylophone
//

//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    var audioPlayer: AVAudioPlayer?
    
    
    
    let soundArray = ["note1","note2","note3","note4","note5","note6","note7"]

   

    @IBAction func notePressed(_ sender: UIButton) {
    
        /* sender.tag for pick the particular sound from the sound array*/
        playSound(selectedSoundTypeName: soundArray[sender.tag - 1] )
    
    }
    
    func playSound(selectedSoundTypeName: String ){
        
        guard let url = Bundle.main.url(forResource: selectedSoundTypeName, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly */
            
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            
            guard let audioPlayer =  audioPlayer else { return }
            
            audioPlayer.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }

}

