//
//  circleView.swift
//  exerciseNine(Gesture)
//
//  Created by student on 2018/11/26.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit


@IBDesignable
class circleView: UIView {

    @IBInspectable var color:UIColor?
    
    func setup(){
        let penRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        self.addGestureRecognizer(penRecognizer)
        
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer:)))
        self.addGestureRecognizer(pinchRecognizer)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        self.addGestureRecognizer(tapRecognizer)
        tapRecognizer.numberOfTapsRequired = 2
        tapRecognizer.numberOfTouchesRequired = 1
    }
    
    @objc func pan(recognizer:UIPanGestureRecognizer){
        if recognizer.state == .changed || recognizer.state == .ended{
            let translation = recognizer.translation(in: self)
            self.center.x += translation.x
            self.center.y += translation.y
            recognizer.setTranslation(.zero, in: self)
        }
    }
    
    @objc func pinch(recognizer:UIPinchGestureRecognizer){
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            bounds.size = CGSize(width: bounds.width * recognizer.scale, height: bounds.height * recognizer.scale)
            recognizer.scale = 1
        default:
            break
        }
    }
    
    @objc func tap(recognizer:UITapGestureRecognizer){
        if recognizer.state == .recognized{
            print("tap recognizer")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn:rect)
        color?.setFill()
        path.fill()
    }

}
