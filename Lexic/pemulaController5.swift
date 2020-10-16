//
//  pemulaController.swift
//  Lexic
//
//  Created by Muhammad Harviando on 14/10/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class PemulaController5: UIViewController {

    var swiped = false
    
    var pencilActivated = UIImage(named: "toolPencilActive") as UIImage?
    var pencilNormal = UIImage(named: "toolPencil") as UIImage?
    
    var eraserActivated = UIImage(named: "toolEraserActive") as UIImage?
    var eraserNormal = UIImage(named: "toolEraser") as UIImage?
    
    var resetDisabled = UIImage(named: "toolResetDisabled") as UIImage?
    var resetNormal = UIImage(named: "toolReset") as UIImage?
    
    @IBOutlet weak var pencilButton: UIButton!
    @IBOutlet weak var eraserButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var canvasImage: Canvas!
    
    var clickSound:AVAudioPlayer?
    
    func playClickSound() {
        guard let url = Bundle.main.url(forResource: "buttonClick", withExtension: "mp3") else { return }
        
        do {
            clickSound = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            clickSound?.play()
            
        } catch {
        }
    }
    
    func playSpeech() {
        guard let url = Bundle.main.url(forResource: "cat", withExtension: "m4a") else { return }
        
        do {
            clickSound = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.m4a.rawValue)
            
            clickSound?.play()
            clickSound?.volume = 2
            
            
        } catch {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvasImage.layer.cornerRadius = 30
        pencilButton.setBackgroundImage(pencilActivated, for: .normal)
        eraserButton.setBackgroundImage(eraserNormal, for: .normal)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        self.performSegue(withIdentifier: "backTapped", sender: nil)
    }

    @IBAction func pencilTapped(_ sender: Any) {
        canvasImage.pencilMode()
        pencilButton.setBackgroundImage(pencilActivated, for: .normal)
        eraserButton.setBackgroundImage(eraserNormal, for: .normal)
    }
    
    @IBAction func eraserTapped(_ sender: Any) {
        canvasImage.eraserMode()
        pencilButton.setBackgroundImage(pencilNormal, for: .normal)
        eraserButton.setBackgroundImage(eraserActivated, for: .normal)
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        canvasImage.image = nil
    }
    
    @IBAction func speechTapped(_ sender: Any) {
        playSpeech()
    }
    
    @IBAction func selesaiTapped(_ sender: Any) {
        playClickSound()
        self.performSegue(withIdentifier: "selesaiTapped", sender: nil)
    }
}
