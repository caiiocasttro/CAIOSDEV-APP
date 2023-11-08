//
//  ScreenSizeManager.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 08.11.2023.
//

import UIKit

enum UIUserInterfaceIdiom: Int {
    case undefined
    case phone
}

struct ScreenSize {
    
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let maxHeight = max(width, height)
    static let minHeight = min(width, height)
}

struct DeviceType {
    
    static let isIphone5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight == 568.0
    static let isIphone6or7or8 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight == 667.0
    static let isIphone6or7or8Plus = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight == 736.0
    static let isIphoneXorLater = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight >= 812.0
    
}
