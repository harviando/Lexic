//
//  Level1MenulisController.swift
//  Lexic
//
//  Created by Muhammad Harviando on 03/11/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Level2MenulisController: UIViewController {
    var clickSound:AVAudioPlayer?
    var refreshedAudio:Bool = false
    
    @IBOutlet weak var canvasImage1: Canvas!
    @IBOutlet weak var canvasImage2: Canvas!
    @IBOutlet weak var canvasImage3: Canvas!
    @IBOutlet weak var canvasImage4: Canvas!
    
    
    @IBOutlet weak var pencilButton: UIButton!
    @IBOutlet weak var eraserButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var pencilActivated = UIImage(named: "toolPencilActive") as UIImage?
    var pencilNormal = UIImage(named: "toolPencil") as UIImage?
    
    var eraserActivated = UIImage(named: "toolEraserActive") as UIImage?
    var eraserNormal = UIImage(named: "toolEraser") as UIImage?
    
    var resetDisabled = UIImage(named: "toolResetDisabled") as UIImage?
    var resetNormal = UIImage(named: "toolReset") as UIImage?
    
    let value = UIInterfaceOrientation.landscapeLeft.rawValue
    
     override var shouldAutorotate: Bool{
         switch UIDevice.current.orientation {
         case .portrait, .portraitUpsideDown, .unknown:
             return false
         default:
             return true
         }
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
        UIDevice.current.setValue(value, forKey: "orientation")
        kickstartAudio()
        
        pencilButton.setBackgroundImage(pencilActivated, for: .normal)
        
        canvasImage1.layer.cornerRadius = 20
        canvasImage2.layer.cornerRadius = 20
        canvasImage3.layer.cornerRadius = 20
        canvasImage4.layer.cornerRadius = 20
        
    }
    
    @IBAction func toReadingTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toReading", sender: nil)
        playClickSound()
    }
    
    @IBAction func pencilTapped(_ sender: Any) {
        canvasImage1.pencilMode()
        canvasImage2.pencilMode()
        canvasImage3.pencilMode()
        canvasImage4.pencilMode()
        pencilButton.setBackgroundImage(pencilActivated, for: .normal)
        eraserButton.setBackgroundImage(eraserNormal, for: .normal)
    }
    @IBAction func eraserTapped(_ sender: Any) {
        canvasImage1.eraserMode()
        canvasImage2.eraserMode()
        canvasImage3.eraserMode()
        canvasImage4.eraserMode()
        pencilButton.setBackgroundImage(pencilNormal, for: .normal)
        eraserButton.setBackgroundImage(eraserActivated, for: .normal)
    }
    @IBAction func resetTapped(_ sender: Any) {
        canvasImage1.image = nil
        canvasImage2.image = nil
        canvasImage3.image = nil
        canvasImage4.image = nil
        
    }
    
    @IBAction func finishTapped(_ sender: Any) {
        playClickSound()
        self.performSegue(withIdentifier: "toReward", sender: nil)
    }
    
}
