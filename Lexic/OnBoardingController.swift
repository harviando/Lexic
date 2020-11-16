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
    let value = UIInterfaceOrientation.landscapeLeft.rawValue
   
    override var shouldAutorotate: Bool{
        switch UIDevice.current.orientation {
        case .portrait, .portraitUpsideDown, .unknown:
            return false
        default:
            return true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIDevice.current.setValue(value, forKey: "orientation")
//        let value = UIInterfaceOrientation.landscapeLeft.rawValue
//        UIDevice.current.setValue(value, forKey: "orientation")
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            func supportedInterfaceOrientations() -> Int{
//                return UIInterfaceOrientation.landscapeLeft.rawValue
//            }
//            
//            func shouldAutorotate() -> Bool{
//                return false
//            }
//        }
    }

//    override var shouldAutorotate: Bool {
//        return true
//    }
    
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
