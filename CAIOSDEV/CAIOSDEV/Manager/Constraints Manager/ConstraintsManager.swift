//
//  ConstraintsManager.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 25.10.2023.
//
import UIKit

// ConstraintsManager is a utility class that provides information about the main screen dimensions for managing constraints in iOS Application

// To use it you can call ConstraintsManager.width or Constraints.Height
class ConstraintsManager {
    
    // Dictionary that maps iPhone models to their PPI values
    class var width: CGFloat {
        ///Returns the main screen width size in points.
        return UIScreen.main.bounds.width
    }
    
    class var height: CGFloat {
        ///Returns the main screen height size in points.
        return UIScreen.main.bounds.height
    }

}
