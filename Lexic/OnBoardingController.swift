//
//  OnBoardingController.swift
//  Lexic
//
//  Created by Muhammad Harviando on 16/10/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class OnBoardingController:UIViewController {
    
    var clickSound:AVAudioPlayer?
    var refreshedAudio:Bool = false
    
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
        kickstartAudio()
        print("wowi")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func lewatiTapped(_ sender: Any) {
        playClickSound()
        self.performSegue(withIdentifier: "lewatiTapped", sender: nil)
    }
    @IBAction func nextTapped(_ sender: Any) {
        playClickSound()
        self.performSegue(withIdentifier: "onbNextTapped", sender: nil)
    }
    @IBAction func prevTapped(_ sender: Any) {
        playClickSound()
        self.performSegue(withIdentifier: "onbPrevTapped", sender: nil)
    }
    @IBAction func memulaiTapped(_ sender: Any) {
        playClickSound()
        self.performSegue(withIdentifier: "onbMemulaiTapped", sender: nil)
    }
}
