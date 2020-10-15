//
//  Canvas.swift
//  Lexic
//
//  Created by Muhammad Harviando on 14/10/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import Foundation
import UIKit

class Canvas: UIImageView {
    
    var learning:PemulaController!
    var currentTouchPosition: CGPoint?
    var pencil:Bool = true
    
    func pencilMode(){
        pencil = true
    }
    
    func eraserMode(){
        pencil = false
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
        image = renderer.image { ctx in
            image?.draw(in: bounds)
            if pencil {
                ctx.cgContext.setStrokeColor(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1))
                ctx.cgContext.setLineWidth(5)
            }else{
                ctx.cgContext.setStrokeColor(#colorLiteral(red: 0.9685532451, green: 0.9686692357, blue: 0.968513906, alpha: 1))
                ctx.cgContext.setLineWidth(40)
            }
            
            ctx.cgContext.setLineCap(.round)
            ctx.cgContext.move(to: previousTouchPoint)
            ctx.cgContext.addLine(to: newTouchPoint)
            ctx.cgContext.strokePath()
        }
        currentTouchPosition = newTouchPoint
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentTouchPosition = nil
    }
}
