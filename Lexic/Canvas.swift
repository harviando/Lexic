//
//  Canvas.swift
//  Lexic
//
//  Created by Muhammad Harviando on 14/10/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import Foundation
import UIKit

class FreedrawingImageViewCG: UIImageView {
    
var currentTouchPosition: CGPoint?
var pencil:Bool = false
var eraser:Bool = true

func pencilMode(){
    pencil = true
    eraser = false
}
    
func eraserMode(){
    pencil = false
    eraser = true
}

override func layoutSubviews() {
super.layoutSubviews()
        isUserInteractionEnabled = true
    }
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
super.touchesBegan(touches, with: event)
guard let newTouchPoint = touches.first?.location(in: self) else { return }
        currentTouchPosition = newTouchPoint
    }
override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
guard let newTouchPoint = touches.first?.location(in: self) else { return }
guard let previousTouchPoint = currentTouchPosition else { return }
let renderer = UIGraphicsImageRenderer(size: bounds.size)
    if (pencil == true){
        image = renderer.image { ctx in
        image?.draw(in: bounds)
        UIColor.black.setStroke()
        ctx.cgContext.setLineCap(.round)
        ctx.cgContext.setLineWidth(5)
        ctx.cgContext.move(to: previousTouchPoint)
        ctx.cgContext.addLine(to: newTouchPoint)
        ctx.cgContext.strokePath()
        }
    }else if (eraser == true){
        image = renderer.image { ctx in
        image?.draw(in: bounds)
        UIColor.white.setStroke()
        ctx.cgContext.setLineCap(.round)
        ctx.cgContext.setLineWidth(15)
        ctx.cgContext.move(to: previousTouchPoint)
        ctx.cgContext.addLine(to: newTouchPoint)
        ctx.cgContext.strokePath()
        }
    }
        
        currentTouchPosition = newTouchPoint
    }
override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentTouchPosition = nil
    }
}
