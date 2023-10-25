//
//  CustombubbleView.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 24.10.2023.
//

import UIKit

class CustombubbleViewRight: UIView {

    //Properties
    private var roundedCorner: CGFloat = 15.0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //Creating a Bezier path for rounded corner
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft, .topRight, .bottomRight, .bottomLeft], cornerRadii: CGSize(width: roundedCorner, height: roundedCorner))
        
        // Creating a shape with the mask path
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
        
    }

}
