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
    
    var currentTouchPosition: CGPoint?
    var pencil:Bool?
    var eraser:Bool?
    
    func pencilMode(){
        pencil = true
        eraser = false
        print(pencil)
    }
    
    func eraserMode(){
        pencil = false
        eraser = true
        print(pencil)
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
//            UIColor.black.setStroke()
            var a = self.pencil
            print(a)
            if  a == nil{
                pencil = true
                a = true
            }
            
            if a ?? false {
                ctx.cgContext.setStrokeColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            }else{
                ctx.cgContext.setStrokeColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            }
            
            ctx.cgContext.setLineCap(.round)
            ctx.cgContext.setLineWidth(5)
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
