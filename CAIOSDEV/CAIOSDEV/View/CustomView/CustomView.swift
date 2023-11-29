//
//  CustomView.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 10.10.2023.
//

import UIKit
/**
 `CustomView` is a subclass of `UIView` that provides a view with rounded corners on the top-left and top-right.

  ## Properties
  - `roundedCorner`: A private property representing the radius of the rounded corners. Default value is set to 15.0.

  ## Methods
  - `draw(_:)`: Overrides the `draw(_:)` method of `UIView` to create a Bezier path for rounded corners and apply it as a mask to the view.

  ### Usage
 ```
 let customView = CustomView()
 customView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
 // Additional configuration...
 parentView.addSubview(customView)
 
 ```
 */
class CustomView: UIView {
    
    // Properties
    /// A private property representing the radius of the rounded corners. Default value is set to 15.0.
    private var roundedCorner: CGFloat = 15.0
    
    // Methods
    /**
    Overrides the draw(_:) method of UIView to create a Bezier path for rounded corners and apply it as a mask to the view.
    Parameter rect: The portion of the view's bounds that needs to be redrawn.
    */
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //Creating a Bezier path for rounded corner
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: roundedCorner, height: roundedCorner))
        
        // Creating a shape with the mask path
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
        
    }

}
