//
//  pemulaController.swift
//  Lexic
//
//  Created by Muhammad Harviando on 14/10/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import Foundation
import UIKit

class PemulaController: UIViewController {

    
    var lastPoint = CGPoint.zero
    var color = UIColor.black
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var swiped = false
    
    @IBOutlet weak var CanvasImage: Canvas!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        self.performSegue(withIdentifier: "backTapped", sender: nil)
    }

    @IBAction func pencilTapped(_ sender: Any) {
        Canvas().pencilMode()
    }
    @IBAction func eraserTapped(_ sender: Any) {
        Canvas().eraserMode()
    }
    @IBAction func resetTapped(_ sender: Any) {
        CanvasImage.image = nil
    }
    @IBAction func selesaiTapped(_ sender: Any) {
    }
}
