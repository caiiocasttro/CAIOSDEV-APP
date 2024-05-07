//
//  ScreenSizeManager.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 08.11.2023.
//

import UIKit
/**
 Represents the screen size information.
 */
struct ScreenSize {
    
    /// The width of the screen in points.
    static let width = UIScreen.main.bounds.size.width
    
    /// The height of the screen in points.
    static let height = UIScreen.main.bounds.size.height
    
    /// The maximum value between width and height.
    static let maxHeight = max(width, height)
    
    /// The minimum value between width and height.
    static let minHeight = min(width, height)
}

/**
 Represent differents types of iOS Devices based on their screen sizes.
 */
struct DeviceType {
    
    /// A boolean indicating whether the device is an iPhone 5 or 5s
    static let isIphone5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight == 568.0
    /// A boolean indicating whether the device is an iPhone 6, 7 or 8
    static let isIphone6or7or8 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight == 667.0
    /// A boolean indicating whether the device is an iPhone 6 Plus, 7 Plus or 8 Plus
    static let isIphone6or7or8Plus = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight == 736.0
    /// A boolean indicating whether the device is an iPhone X or later, with a specific height range.
    static let isIphoneXorLater = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight >= 812.0 && ScreenSize.maxHeight <= 852.0
    /// A boolean indicating whether the device is an iPhone Xs Max or later, with a specific height range.
    static let isIphoneXsMaxorLater = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight >= 896.0 && ScreenSize.maxHeight <= 932.0
    
    static func deviceTypeAsString() -> String {
        if isIphone5 {
           return "isIphone5"
        } else if isIphone6or7or8 {
            return "isIphone6or7or8"
        } else if isIphone6or7or8Plus {
            return "isIphone6or7or8Plus"
        } else if isIphoneXorLater {
            return "isIphoneXorLater"
        } else if isIphoneXsMaxorLater {
            return "isIphoneXorLater"
        } else {
            return "Not possible to recognise device"
        }
    }
    
}
