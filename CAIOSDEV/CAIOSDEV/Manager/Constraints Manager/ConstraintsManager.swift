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

public enum DeviceIdentifier: String {
    
    case isIphone5 = "isIphone5"
    case isIphone6or7or8 = "isIphone6or7or8"
    case isIphone6or7or8Plus = "isIphone6or7or8Plus"
    case isIphoneXorLater = "isIphoneXorLater"
    case isIphoneXsMaxorLater = "isIphoneXsMaxorLater"
    
    var sidesSpace: Double {
        
        switch self {
        case .isIphone5:
            15
        case .isIphone6or7or8:
            15
        case .isIphone6or7or8Plus:
            15
        case .isIphoneXorLater:
            15
        case .isIphoneXsMaxorLater:
            15
        }
    }
    
    var test: String {
        switch self {
        case .isIphone5:
            "5"
        case .isIphone6or7or8:
            "6, 7, or 8"
        case .isIphone6or7or8Plus:
            "6, 7, or 8Plus"
        case .isIphoneXorLater:
            "X or later"
        case .isIphoneXsMaxorLater:
            "XS max or Later"
        }
    }
    
    
}
