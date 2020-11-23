//
//  ViewController.swift
//  Lexic
//
//  Created by Muhammad Harviando on 08/10/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    var refreshedAudio:Bool = false
    var clickSound:AVAudioPlayer?
    
    override var shouldAutorotate: Bool{
        overrideAutoRotate()
    }
    
    func playClickSound() {
        guard let url = Bundle.main.url(forResource: "buttonClick", withExtension: "mp3") else { return }
        
        do {
            clickSound = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            clickSound?.play()
            
            if refreshedAudio == false {
                clickSound?.volume = 0.0
            } else if (refreshedAudio==true){
                clickSound?.volume = 0.8
            }
            
        } catch {
        }
    }
    
    func kickstartAudio(){
        playClickSound()
        refreshedAudio = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forceLandscape()
        kickstartAudio()
    }
    
    @IBAction func buttonPemula(_ sender: Any) {
        self.performSegue(withIdentifier: "pemulaTapped", sender: nil)
        playClickSound()
    }
    
    @IBAction func buttonMenengah(_ sender: Any) {
        self.performSegue(withIdentifier: "menengahTapped", sender: nil)
        playClickSound()
    }
    @IBAction func petunjukTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toPetunjuk", sender: nil)
        playClickSound()
    }
}

