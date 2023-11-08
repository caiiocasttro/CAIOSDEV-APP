//
//  ConstraintsManager.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 25.10.2023.
//

import UIKit

class ConstraintsManager {
    
    // Dictionary that maps iPhone models to their PPI values
    
    
    class var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    class var height: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    class var screenSize: CGFloat {
        
        let iPhonePPIs: [String: CGFloat] = [
            "iPhone SE (2nd generation)": 326,
            "iPhone 6, 6s, 7, 8": 326,
            "iPhone 6 Plus, 6s Plus, 7 Plus, 8 Plus": 401,
            "iPhone X, XS, 11 Pro": 458,
            "iPhone XR, 11": 326,
            "iPhone XS Max, 11 Pro Max": 458,
            "iPhone 12, 13, 13 Pro": 460,
            "iPhone 12 mini, 13 mini": 476,
            "iPhone 12 Pro Max, 13 Pro Max": 458,
            // Add more iPhone models and their PPI values as needed
        ]
        
        let model = UIDevice.current.localizedModel
        
        print(model)
        
        guard let ppi = iPhonePPIs[model] else { return 0.0 }
            let screenWidth = UIScreen.main.nativeBounds.width / UIScreen.main.nativeScale
            let screenHeight = UIScreen.main.nativeBounds.height / UIScreen.main.nativeScale
            let diagonalSize = sqrt(pow(screenWidth, 2) + pow(screenHeight, 2))
            
            //Calculating the screen size inch based on the standard PPI (Pixel per inch)
            
            let screenSizeInch = diagonalSize / ppi
            
            return screenSizeInch
        
    }

}
