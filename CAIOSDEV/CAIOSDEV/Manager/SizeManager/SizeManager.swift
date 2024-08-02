//
//  SizeManager.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 07.05.2024.
//

import Foundation

enum SizeManager: String {
    case isIphone5 = "isIphone5"
    
    case isIphone6or7or8 = "isIphone6or7or8"
    
    case isIphone6or7or8Plus = "isIphone6or7or8Plus"
    
    case isIphoneXorLater = "isIphoneXorLater"
    
    case isIphoneXsMaxorLater = "isIphoneXsMaxorLater"
    
    var titleFontSize: Int {
        switch self {
        case .isIphone5:
            45
        case .isIphone6or7or8:
            50
        case .isIphone6or7or8Plus, .isIphoneXorLater, .isIphoneXsMaxorLater:
            60
        }
    }
    
    var subtitleFontSize: Int {
        switch self {
        case .isIphone5:
            18
        case .isIphone6or7or8, .isIphone6or7or8Plus, .isIphoneXorLater, .isIphoneXsMaxorLater:
            20
        }
    }
    
    var objectLabelFontSize: Int {
        switch self {
        case .isIphone5:
            12
        case .isIphone6or7or8, .isIphone6or7or8Plus, .isIphoneXorLater, .isIphoneXsMaxorLater:
            18
        }
    }
    
    
    
}
