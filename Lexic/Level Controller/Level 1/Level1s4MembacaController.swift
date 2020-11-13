//
//  Level1Controller.swift
//  Lexic
//
//  Created by Muhammad Harviando on 02/11/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Level1s4MembacaController: UIViewController {
    var clickSound:AVAudioPlayer?
    var refreshedAudio:Bool = false
    
    var pencilActivated = UIImage(named: "toolPencilActive") as UIImage?
    var pencilNormal = UIImage(named: "toolPencil") as UIImage?
    
    var eraserActivated = UIImage(named: "toolEraserActive") as UIImage?
    var eraserNormal = UIImage(named: "toolEraser") as UIImage?
    
    var resetDisabled = UIImage(named: "toolResetDisabled") as UIImage?
    var resetNormal = UIImage(named: "toolReset") as UIImage?
    
    
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
    }
    
    func playSpeech() {
        guard let url = Bundle.main.url(forResource: "ban", withExtension: "mp3") else { return }
        
        do {
            clickSound = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            clickSound?.play()
            clickSound?.volume = 2
            
        } catch {
        }
    }
    @IBAction func speechTapped(_ sender: Any) {
        playSpeech()
    }
    @IBAction func backToMainTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "backTapped", sender: nil)
        playClickSound()
    }
    @IBAction func toCanvasTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toCanvas", sender: nil)
        playClickSound()
    }
    @IBAction func homeTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toHome", sender: nil)
        playClickSound()
    }
}
