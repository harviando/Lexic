//
//  RewardController.swift
//  Lexic
//
//  Created by Muhammad Harviando on 16/10/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class RewardController: UIViewController {
    var player: AVPlayer?
    var isPlayed:Bool = false

    @IBOutlet weak var videoViewContainer: UIView!
    
    @IBOutlet weak var quitButtonOutlet: UIButton!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    @IBOutlet weak var giftButton: UIButton!
    @IBOutlet weak var instructionImage: UIImageView!
    
    var clickSound:AVAudioPlayer?
    
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
        initializeVideoPlayerWithVideo()
        UIDevice.current.setValue(value, forKey: "orientation")
        giftButton.isHidden = false
        instructionImage.isHidden = false
//        UIView.animate(withDuration: 1, animations: {
//            self.giftButton.frame.origin.x -= 10
//        }, completion:nil)
    }
    
    func initializeVideoPlayerWithVideo() {

        // get the path string for the video from assets
        let videoString:String? = Bundle.main.path(forResource: "Reward Popup 1", ofType: "mp4")
        guard let unwrappedVideoPath = videoString else {return}

        // convert the path string to a url
        let videoUrl = URL(fileURLWithPath: unwrappedVideoPath)

        // initialize the video player with the url
        self.player = AVPlayer(url: videoUrl)
        self.player?.automaticallyWaitsToMinimizeStalling = false

        // create a video layer for the player
        let layer: AVPlayerLayer = AVPlayerLayer(player: player)

        // make the layer the same size as the container view
        layer.frame = videoViewContainer.bounds

        // make the video fill the layer as much as possible while keeping its aspect size
        layer.videoGravity = AVLayerVideoGravity.resizeAspectFill

        // add the layer to the container view
        videoViewContainer.layer.addSublayer(layer)
        
    }
    
    func playClickSound() {
        guard let url = Bundle.main.url(forResource: "buttonClick", withExtension: "mp3") else { return }
        
        do {
            clickSound = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            clickSound?.play()
        } catch {
        }
    }
    
    @IBAction func quitTapped(_ sender: Any) {
        player?.pause()
        player?.replaceCurrentItem(with: nil)
        self.performSegue(withIdentifier: "quitPopup", sender: nil)
    }
    @IBAction func giftTapped(_ sender: Any) {
        player?.play()
        quitButtonOutlet.isHidden = false
        nextButtonOutlet.isHidden = false
        giftButton.isHidden = true
        instructionImage.isHidden = true
        playClickSound()
    }
    @IBAction func nextTapped(_ sender: Any) {
        player?.pause()
        player?.replaceCurrentItem(with: nil)
        self.performSegue(withIdentifier: "lanjutkan", sender: nil)
        playClickSound()
    }
    @IBAction func tahapanTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toTahapan", sender: nil)
        playClickSound()
    }
}
