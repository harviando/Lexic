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
    
    var clickSound:AVAudioPlayer?
    var refreshedAudio:Bool = false
    
    func playClickSound() {
        guard let url = Bundle.main.url(forResource: "selamat", withExtension: "m4a") else { return }
        
        do {
            clickSound = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.m4a.rawValue)
            
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
        kickstartAudio()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPemula(_ sender: Any) {
        self.performSegue(withIdentifier: "pemulaTapped", sender: nil)
        playClickSound()
    }
    
}

