//t
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
   
    override var shouldAutorotate: Bool{
        overrideAutoRotate()
    }
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        forceLandscape()
    }
    
    @IBAction func skipTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "skipTapped", sender: nil)
    }
    @IBAction func prevTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "prevTapped", sender: nil)
    }
    @IBAction func nextTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "nextTapped", sender: nil)
    }
    @IBAction func startTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "startTapped", sender: nil)
    }
}


extension UIViewController{
    func forceLandscape(){
        let value = UIDevice.current.value(forKey: "orientation")
        
        if value as! Int == UIInterfaceOrientation.portrait.rawValue || value as! Int == UIInterfaceOrientation.portraitUpsideDown.rawValue || value as! Int == 0 {
            //ini hanya ketriger saat ipad potrait
            let v = UIInterfaceOrientation.landscapeLeft.rawValue
            UIDevice.current.setValue(v, forKey: "orientation")
        }else {
            return
        }
    }
    
    func overrideAutoRotate()->Bool{
        switch UIDevice.current.orientation {
        case .portrait, .portraitUpsideDown, .unknown:
            return false
        default:
            return true
        }
    }
}
