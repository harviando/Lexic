//
//  ViewController.swift
//  Lexic
//
//  Created by Muhammad Harviando on 08/10/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPemula(_ sender: Any) {
        self.performSegue(withIdentifier: "pemulaTapped", sender: nil)
    }
    
}

