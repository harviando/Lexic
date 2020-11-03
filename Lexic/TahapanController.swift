//
//  TahapanController.swift
//  Lexic
//
//  Created by Muhammad Harviando on 31/10/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class TahapanController:UIViewController {
    var clickSound:AVAudioPlayer?
    var refreshedAudio:Bool = false
    
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var info: UIImageView!
    
    var infoClicked:Bool = false
    
    var infoActivated = UIImage(named: "buttonInfoActive") as UIImage?
    var infoNormal = UIImage(named: "button info") as UIImage?
    
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
    
    func playMouseClickkSound() {
        guard let url = Bundle.main.url(forResource: "mouseClick", withExtension: "mp3") else { return }
        
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
        info.isHidden = true
        infoButton.setBackgroundImage(infoNormal, for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func infoTapped(_ sender: Any) {
        playMouseClickkSound()
        if (infoClicked == false){
            infoButton.setBackgroundImage(infoActivated, for: .normal)
            info.isHidden = false
            infoClicked = true
        }else{
            infoButton.setBackgroundImage(infoNormal, for: .normal)
            info.isHidden = true
            infoClicked = false
        }
        
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "tahapanBackTapped", sender: nil)
    }
    @IBAction func level1Tapped(_ sender: Any) {
        self.performSegue(withIdentifier: "1tapped", sender: nil)
        playClickSound()
    }
    @IBAction func level2Tapped(_ sender: Any) {
        self.performSegue(withIdentifier: "2tapped", sender: nil)
        playClickSound()
    }
    @IBAction func level3Tapped(_ sender: Any) {
        self.performSegue(withIdentifier: "3tapped", sender: nil)
        playClickSound()
    }
    @IBAction func level4Tapped(_ sender: Any) {
        self.performSegue(withIdentifier: "4tapped", sender: nil)
        playClickSound()
    }
    @IBAction func level5Tapped(_ sender: Any) {
        self.performSegue(withIdentifier: "5tapped", sender: nil)
        playClickSound()
    }
}
