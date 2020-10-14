//
//  Pencil.swift
//  Lexic
//
//  Created by Muhammad Harviando on 14/10/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import Foundation
import UIKit

enum Pencil {
  case black
  case eraser
  
  init?(tag: Int) {
    switch tag {
    case 1:
      self = .black
    case 2:
      self = .eraser
    default:
      return nil
    }
  }
}
