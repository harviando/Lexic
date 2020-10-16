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
    override func viewDidLoad() {
        initializeVideoPlayerWithVideo()
        quitButtonOutlet.isHidden = true
        nextButtonOutlet.isHidden = true
        giftButton.isHidden = false
    }
    
    func initializeVideoPlayerWithVideo() {

        // get the path string for the video from assets
        let videoString:String? = Bundle.main.path(forResource: "popupRewardVid", ofType: "mp4")
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
        print ("adasda")
        
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
    }
    @IBAction func nextTapped(_ sender: Any) {
        player?.pause()
        player?.replaceCurrentItem(with: nil)
        self.performSegue(withIdentifier: "Lanjutkan", sender: nil)
    }
}
