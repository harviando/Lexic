//
//  PetunjukController.swift
//  Lexic
//
//  Created by Muhammad Harviando on 16/10/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class PetunjukController: UIViewController {
    var clickSound:AVAudioPlayer?
    
    func playClickSound() {
        guard let url = Bundle.main.url(forResource: "buttonClick", withExtension: "mp3") else { return }
        
        do {
            clickSound = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            clickSound?.play()
            
        } catch {
        }
    }
    
    @IBAction func halamanUtamaTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "backToMain", sender: nil)
        //playClickSound()
    }
    
    @IBAction func prevTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "petunjukPrev", sender: nil)
        //playClickSound()
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "petunjukNext", sender: nil)
        //playClickSound()
    }
}
